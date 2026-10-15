import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_app_bar.dart';
import '../../domain/pass_code.dart';
import '../../domain/pass_model.dart';
import '../../providers/visit_providers.dart';
import 'pass_widgets.dart';

/// The gate reads a pass: by camera, or by what the visitor has with them.
///
/// The camera only acts on a HODI pass — anything else it sees (a payment QR, a URL) is said to be
/// the wrong kind, once every few seconds rather than on every frame. Below it, one box takes a
/// number plate, a phone number, an ID number or the code typed in, for the visitor whose phone
/// is flat or who never got the QR.
class ScanPassScreen extends ConsumerStatefulWidget {
  const ScanPassScreen({super.key});

  @override
  ConsumerState<ScanPassScreen> createState() => _ScanPassScreenState();
}

class _ScanPassScreenState extends ConsumerState<ScanPassScreen> {
  final _camera = MobileScannerController(formats: const [BarcodeFormat.qrCode]);
  final _query = TextEditingController();

  bool _handling = false;
  bool _searching = false;
  List<PassModel>? _results;
  DateTime _lastWarning = DateTime.fromMillisecondsSinceEpoch(0);

  @override
  void dispose() {
    _camera.dispose();
    _query.dispose();
    super.dispose();
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (_handling) return;
    final raw = capture.barcodes.isEmpty ? null : capture.barcodes.first.rawValue;
    final code = passCodeFromScan(raw);
    if (code == null) {
      final now = DateTime.now();
      if (now.difference(_lastWarning).inSeconds >= 3) {
        _lastWarning = now;
        _say('That is not a HODI pass.');
      }
      return;
    }

    _handling = true;
    await _camera.stop();
    final response = await ref.read(visitRepositoryProvider).passByCode(code);
    if (!mounted) return;
    if (response.isSuccess && response.data != null) {
      await context.push('/more/visitors/gate-pass', extra: response.data);
    } else {
      _say(response.message.isNotEmpty ? response.message : 'That pass could not be read.');
    }
    if (!mounted) return;
    _handling = false;
    await _camera.start();
  }

  Future<void> _search() async {
    final q = _query.text.trim();
    if (q.length < 3) {
      _say('Type a number plate, phone or ID number.');
      return;
    }
    FocusScope.of(context).unfocus();
    setState(() => _searching = true);
    final response = await ref.read(visitRepositoryProvider).findPasses(q);
    if (!mounted) return;
    setState(() {
      _searching = false;
      _results = response.isSuccess ? (response.data ?? const []) : null;
    });
    if (!response.isSuccess) {
      _say(response.message.isNotEmpty ? response.message : 'The search did not go through.');
    }
  }

  void _say(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message), backgroundColor: HodiColors.errorStart));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Check a pass'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          children: [
            ClipRRect(
              borderRadius: HodiBorderRadius.card,
              child: SizedBox(
                height: 280,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    MobileScanner(
                      controller: _camera,
                      onDetect: _onDetect,
                      errorBuilder: (context, error) => Container(
                        color: HodiColors.surfaceInset,
                        padding: const EdgeInsets.all(24),
                        alignment: Alignment.center,
                        child: Text(
                          error.errorCode == MobileScannerErrorCode.permissionDenied
                              ? 'The camera is not allowed. Turn it on for HODI in Settings, or search below.'
                              : 'The camera could not start. Search below instead.',
                          textAlign: TextAlign.center,
                          style: HodiTextStyles.bodyMedium,
                        ),
                      ),
                    ),
                    // The frame says where to hold the code, which is most of what makes a scanner
                    // usable by somebody who has not used one.
                    Center(
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 3),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Hold the visitor\'s QR code inside the square.',
              textAlign: TextAlign.center,
              style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
            ),
            const SizedBox(height: 20),
            Text('No QR? Find the pass', style: HodiTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _query,
                    textInputAction: TextInputAction.search,
                    textCapitalization: TextCapitalization.characters,
                    onSubmitted: (_) => _search(),
                    decoration: InputDecoration(
                      hintText: 'Plate, phone, ID number or code',
                      filled: true,
                      fillColor: HodiColors.cardBackground,
                      border: OutlineInputBorder(
                        borderRadius: HodiBorderRadius.card,
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _searching ? null : _search,
                  icon: _searching
                      ? const SizedBox.square(dimension: 18, child: CircularProgressIndicator(strokeWidth: 2))
                      : const Icon(Icons.search),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (_results != null && _results!.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'No pass for today matches that.',
                  textAlign: TextAlign.center,
                  style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.textMedium),
                ),
              ),
            for (final pass in _results ?? const <PassModel>[]) ...[
              _ResultTile(
                pass: pass,
                onTap: () => context.push('/more/visitors/gate-pass', extra: pass),
              ),
              const SizedBox(height: 8),
            ],
          ],
        ),
      ),
    );
  }
}

class _ResultTile extends StatelessWidget {
  final PassModel pass;
  final VoidCallback onTap;

  const _ResultTile({required this.pass, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: HodiColors.cardBackground,
      borderRadius: HodiBorderRadius.card,
      child: InkWell(
        borderRadius: HodiBorderRadius.card,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pass.visitorName, style: HodiTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 4),
              Text(
                [
                  if (pass.where.isNotEmpty) pass.where,
                  if (pass.vehicleReg != null && pass.vehicleReg!.isNotEmpty) pass.vehicleReg!,
                ].join(' · '),
                style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textMedium),
              ),
              const SizedBox(height: 8),
              PassStateBanner(pass: pass),
            ],
          ),
        ),
      ),
    );
  }
}
