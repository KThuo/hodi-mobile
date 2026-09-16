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
import 'reading_frame_screen.dart';

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
  double get _totalAmount => _consumedUnits * widget.metre.rate;

  @override
  void dispose() {
    _readingController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /*
   * Two different pictures, and they were the same one before.
   *
   * The photograph is the evidence: the whole meter, its number, where it is. That is what gets
   * attached to the reading and what somebody looks at in six months to settle an argument.
   *
   * What is *recognised* is a band the person frames over the dials on the next screen. It used to
   * be the whole photograph, and the recogniser would return the longest run of digits in it —
   * which on a meter is as likely to be the serial number beside the dials as the reading itself.
   * That is why the number that came back did not match the number being looked at.
   *
   * Framing is offered, not compelled. Backing out of it keeps the photograph and leaves the
   * reading to be typed, which is what somebody does when the light is bad anyway.
   */
  Future<void> _captureImage() async {
    final file = await ImageHelper.captureFromCamera();
    if (file == null || !mounted) return;

    setState(() => _capturedImage = file);

    final crop = await Navigator.of(context).push<File>(
      MaterialPageRoute(
        builder: (_) => ReadingFrameScreen(photo: file),
        fullscreenDialog: true,
      ),
    );
    if (!mounted || crop == null) return;

    setState(() => _isProcessingImage = true);

    try {
      final ocrText = await OcrHelper.recognizeText(crop);

      if (!mounted) return;

      setState(() => _isProcessingImage = false);

      if (ocrText != null) {
        final reading = OcrHelper.extractReading(ocrText, widget.metre.currentReading);
        if (reading != null) {
          _readingController.text = reading;
          setState(() {});
        } else {
          _showToast('No number in the frame. Try framing just the dials.');
        }
      } else {
        _showToast('No number in the frame. Try framing just the dials.');
      }
    } catch (_) {
      if (!mounted) return;
      setState(() => _isProcessingImage = false);
      _showToast('Failed to process image');
    } finally {
      // The crop exists only to be read. The photograph is what is kept.
      try {
        await crop.delete();
      } catch (_) {}
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

    if (response.isSuccess) {
      /*
       * The photograph follows, and the reading is already safe.
       *
       * This is the whole reason it is a second request. A failure here loses the picture and
       * nothing else — the number is written, and the person at the meter does not have to type it
       * again because a photograph would not upload in a stairwell.
       *
       * So it is reported quietly rather than as a failed reading. Saying "Failed to update reading"
       * over a reading that was in fact recorded is how somebody comes to enter it twice.
       */
      final readingId = response.data?.id;
      var photoFailed = false;
      if (_capturedImage != null && readingId != null) {
        final upload = await repository.attachPhoto(
          readingId: readingId,
          photo: _capturedImage!,
        );
        photoFailed = !upload.isSuccess;
      }

      if (!mounted) return;
      setState(() => _isLoading = false);

      ref.read(metreHistoryProvider.notifier).refresh();
      ref.read(metreListProvider.notifier).refresh();

      if (mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(photoFailed
                ? 'Reading saved. The photograph did not upload.'
                : (response.message.isNotEmpty ? response.message : 'Reading updated')),
            backgroundColor:
                photoFailed ? HodiColors.warningStart : HodiColors.successStart,
          ),
        );
      }
    } else {
      setState(() => _isLoading = false);
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
              _ReadOnlyField(label: 'Metre No', value: widget.metre.meterNo ?? '-'),
              const SizedBox(height: 16),
              _ReadOnlyField(
                label: 'Previous Reading',
                value: widget.metre.currentReading.toString(),
              ),
              const SizedBox(height: 16),
              _ReadOnlyField(
                label: 'Charge/Unit',
                value: widget.metre.rate.toString(),
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
