import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/utils/image_helper.dart';
import '../../../../core/utils/ocr_helper.dart';
import '../../../../core/widgets/hodi_text_field.dart';
import '../../../../core/widgets/hodi_gradient_button.dart';
import '../../domain/metre_model.dart';
import '../../providers/metre_providers.dart';

class UpdateReadingSheet extends ConsumerStatefulWidget {
  final MetreModel metre;

  const UpdateReadingSheet({super.key, required this.metre});

  @override
  ConsumerState<UpdateReadingSheet> createState() => _UpdateReadingSheetState();
}

class _UpdateReadingSheetState extends ConsumerState<UpdateReadingSheet> {
  final _readingController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  File? _capturedImage;
  bool _isProcessingImage = false;

  double get _newReading => double.tryParse(_readingController.text) ?? 0;
  double get _consumedUnits =>
      _newReading > widget.metre.currentReading ? _newReading - widget.metre.currentReading : 0;
  double get _totalAmount => _consumedUnits * widget.metre.charge;

  @override
  void dispose() {
    _readingController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _captureImage() async {
    final file = await ImageHelper.captureFromCamera();
    if (file == null) return;

    setState(() {
      _capturedImage = file;
      _isProcessingImage = true;
    });

    try {
      // OCR only. The photograph used to be base64-encoded here in parallel and posted with the
      // reading; there is nowhere to send it now, and encoding it was the expensive half — a third
      // again on the wire and a third copy of the image in memory. The capture stays on screen so
      // the dial can be checked against what was recognised, and is discarded with the sheet.
      final ocrText = await OcrHelper.recognizeText(file);

      if (!mounted) return;

      setState(() => _isProcessingImage = false);

      if (ocrText != null) {
        final reading = OcrHelper.extractReading(ocrText, widget.metre.currentReading);
        if (reading != null) {
          _readingController.text = reading;
          setState(() {});
        } else {
          _showToast('Could not detect reading from image');
        }
      } else {
        _showToast('Could not detect reading from image');
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _isProcessingImage = false);
      _showToast('Failed to process image');
    }
  }

  void _removeImage() {
    setState(() => _capturedImage = null);
  }

  void _showToast(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final repository = ref.read(metreRepositoryProvider);
    final response = await repository.updateReading(
      metreId: widget.metre.id!,
      currentReading: _readingController.text,
      note: _descriptionController.text,
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (response.isSuccess) {
      // Refresh history and list
      ref.read(metreHistoryProvider.notifier).refresh();
      ref.read(metreListProvider.notifier).refresh();

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message.isNotEmpty ? response.message : 'Reading updated'),
            backgroundColor: HodiColors.successStart,
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.message.isNotEmpty ? response.message : 'Failed to update reading'),
            backgroundColor: HodiColors.errorStart,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: HodiColors.divider,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: Text('Update Reading', style: HodiTextStyles.heading3),
              ),
              const SizedBox(height: 24),
              _ReadOnlyField(label: 'Metre No', value: widget.metre.metreNo ?? '-'),
              const SizedBox(height: 16),
              _ReadOnlyField(
                label: 'Previous Reading',
                value: widget.metre.currentReading.toString(),
              ),
              const SizedBox(height: 16),
              _ReadOnlyField(
                label: 'Charge/Unit',
                value: widget.metre.charge.toString(),
              ),
              const SizedBox(height: 16),
              HodiTextField(
                controller: _readingController,
                labelText: 'New Reading',
                hintText: 'Enter new reading',
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                suffixIcon: _isProcessingImage
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      )
                    : IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        color: HodiColors.primaryStart,
                        onPressed: _captureImage,
                        tooltip: 'Capture metre photo',
                      ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Reading is required';
                  final reading = double.tryParse(value);
                  if (reading == null) return 'Enter a valid number';
                  if (reading < widget.metre.currentReading) {
                    return 'Must be >= ${widget.metre.currentReading}';
                  }
                  return null;
                },
                onChanged: (_) => setState(() {}),
              ),
              if (_capturedImage != null) ...[
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    _capturedImage!,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: _isProcessingImage ? null : _captureImage,
                      icon: const Icon(Icons.camera_alt, size: 16),
                      label: const Text('Retake'),
                    ),
                    TextButton.icon(
                      onPressed: _isProcessingImage ? null : _removeImage,
                      icon: const Icon(Icons.close, size: 16),
                      label: const Text('Remove'),
                      style: TextButton.styleFrom(
                        foregroundColor: HodiColors.errorStart,
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _ReadOnlyField(
                      label: 'Units Consumed',
                      value: _consumedUnits.toStringAsFixed(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ReadOnlyField(
                      label: 'Total (KES)',
                      value: _totalAmount.toStringAsFixed(2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              HodiTextField(
                controller: _descriptionController,
                labelText: 'Description (optional)',
                hintText: 'Enter description',
                maxLines: 2,
              ),
              const SizedBox(height: 24),
              HodiGradientButton(
                text: 'Submit',
                isLoading: _isLoading,
                onPressed: _newReading > 0 && _newReading >= widget.metre.currentReading
                    ? _submit
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;

  const _ReadOnlyField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: HodiTextStyles.label),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: HodiColors.surfaceLight,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            value,
            style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textDark),
          ),
        ),
      ],
    );
  }
}
