import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/theme/hodi_border_radius.dart';
import '../../../../core/theme/hodi_colors.dart';
import '../../../../core/theme/hodi_text_styles.dart';
import '../../../../core/widgets/hodi_app_bar.dart';
import '../../../../core/widgets/hodi_gradient_button.dart';
import '../../domain/pass_code.dart';
import '../../domain/pass_model.dart';
import '../../providers/visit_providers.dart';
import 'pass_widgets.dart';

/// The host's pass: the QR to send, the code to read out, and Share.
///
/// Share sends the QR as an image with a line of text through whatever the phone offers —
/// WhatsApp, SMS, email. HODI sends nothing itself: the host knows how their visitor is reached.
class PassScreen extends ConsumerStatefulWidget {
  final PassModel pass;

  const PassScreen({super.key, required this.pass});

  @override
  ConsumerState<PassScreen> createState() => _PassScreenState();
}

class _PassScreenState extends ConsumerState<PassScreen> {
  late PassModel _pass = widget.pass;
  bool _sharing = false;
  bool _cancelling = false;

  String get _message {
    final where = _pass.where.isEmpty ? 'my place' : _pass.where;
    return 'Hi ${_pass.visitorName}, you are expected at $where on ${passDays(_pass)}. '
        'Show this QR code at the gate, or give them the code ${_pass.passCode}.';
  }

  /// The QR as a PNG on disk, white behind it so it scans from a dark chat background too.
  Future<File> _qrFile() async {
    final qr = QrImage(QrCode.fromData(
      data: passQrData(_pass.passCode),
      errorCorrectLevel: QrErrorCorrectLevel.M,
    ));
    final image = await qr.toImage(
      size: 720,
      decoration: const PrettyQrDecoration(
        background: Colors.white,
        quietZone: PrettyQrQuietZone.modules(4),
      ),
    );
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/hodi-pass-${_pass.passCode}.png');
    await file.writeAsBytes(bytes!.buffer.asUint8List(), flush: true);
    return file;
  }

  Future<void> _share() async {
    setState(() => _sharing = true);
    try {
      final file = await _qrFile();
      await SharePlus.instance.share(ShareParams(
        text: _message,
        subject: 'Your gate pass',
        files: [XFile(file.path, mimeType: 'image/png')],
      ));
    } catch (_) {
      if (!mounted) return;
      // The image is the convenience; the code is what matters. Send that if the image fails.
      await SharePlus.instance.share(ShareParams(text: _message));
    } finally {
      if (mounted) setState(() => _sharing = false);
    }
  }

  Future<void> _cancel() async {
    final sure = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel this pass?'),
        content: Text('${_pass.visitorName} will not be let in on it.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Keep it')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Cancel pass', style: TextStyle(color: HodiColors.errorEnd)),
          ),
        ],
      ),
    );
    if (sure != true) return;
    setState(() => _cancelling = true);
    final response = await ref.read(visitRepositoryProvider).cancelPass(_pass.id);
    if (!mounted) return;
    setState(() => _cancelling = false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(response.message.isNotEmpty ? response.message : 'Cancelled.'),
      backgroundColor: response.isSuccess ? HodiColors.successStart : HodiColors.errorStart,
    ));
    if (response.isSuccess && response.data != null) {
      setState(() => _pass = response.data!);
      ref.invalidate(myPassesProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    final live = _pass.current;
    return Scaffold(
      backgroundColor: HodiColors.background,
      appBar: const HodiAppBar(title: 'Gate pass'),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
          children: [
            PassStateBanner(pass: _pass),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: HodiColors.cardBackground,
                borderRadius: HodiBorderRadius.card,
              ),
              child: Column(
                children: [
                  Opacity(
                    opacity: live ? 1 : 0.25,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: SizedBox.square(
                        dimension: 220,
                        child: PrettyQrView.data(
                          data: passQrData(_pass.passCode),
                          errorCorrectLevel: QrErrorCorrectLevel.M,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SelectableText(
                    _pass.passCode,
                    style: HodiTextStyles.heading2.copyWith(letterSpacing: 3),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'The gate scans this, or types the code.',
                    style: HodiTextStyles.bodySmall.copyWith(color: HodiColors.textLight),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            PassFact(icon: Icons.person_outline, label: 'Visitor', value: _pass.visitorName),
            PassFact(icon: Icons.event, label: 'When', value: passDays(_pass)),
            if (_pass.where.isNotEmpty)
              PassFact(icon: Icons.home_outlined, label: 'Where', value: _pass.where),
            PassFact(
              icon: Icons.groups_outlined,
              label: 'People',
              value: _pass.visitorCount == 1 ? 'Just them' : '${_pass.visitorCount} people',
            ),
            if (_pass.vehicleReg != null && _pass.vehicleReg!.isNotEmpty)
              PassFact(icon: Icons.directions_car_outlined, label: 'Vehicle', value: _pass.vehicleReg!),
            if (_pass.visitorPhone != null && _pass.visitorPhone!.isNotEmpty)
              PassFact(icon: Icons.phone_outlined, label: 'Phone', value: _pass.visitorPhone!),
            if (_pass.admissions > 0)
              PassFact(
                icon: Icons.login,
                label: 'Used',
                value: _pass.admissions == 1 ? 'Once' : '${_pass.admissions} times',
              ),
            const SizedBox(height: 24),
            if (live) ...[
              HodiGradientButton(
                text: 'Share pass',
                icon: Icons.share,
                isLoading: _sharing,
                onPressed: _sharing ? null : _share,
              ),
              const SizedBox(height: 8),
              if (!_pass.cancelled)
                Center(
                  child: TextButton(
                    onPressed: _cancelling ? null : _cancel,
                    child: Text(
                      'Cancel pass',
                      style: HodiTextStyles.bodyMedium.copyWith(color: HodiColors.errorEnd),
                    ),
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
