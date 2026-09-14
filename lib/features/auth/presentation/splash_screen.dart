import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/hodi_colors.dart';

/// What the app shows while it finds out whether anybody is signed in.
///
/// ## Why it exists at all
///
/// The router used to decide on an `isAuthenticated` that was still false, because `checkAuth` had
/// not finished reading the keystore. So somebody with a live session was sent to the login screen
/// and pulled back to the dashboard a beat later — a flash of the wrong screen on every cold start.
/// This is what the app waits on instead, and it ends when the answer arrives rather than on a timer.
///
/// ## Why it looks like the login screen
///
/// Because the next thing on screen usually is the login screen, and a splash in different colours
/// makes the app appear to start twice. It was a flat panel of #667EEA — the indigo that was never
/// HODI's — so the sequence ran purple, then a photograph, then the dashboard.
///
/// Same photograph, same scrim, same treatment. When the splash gives way the background does not
/// move at all; only the card arrives on top of it.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);

    /*
     * Breathing, not pulsing.
     *
     * 0.92 to 1.06 either side of full size, eased at both ends so it slows as it turns rather than
     * snapping. A loader that is also the logo has to stay legible as a logo: a wider swing reads as
     * something being wrong, and a linear curve reads as a machine rather than as waiting.
     */
    _scale = Tween<double>(begin: 0.92, end: 1.06).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // The login screen's photograph, clean, exactly as it is there.
          Image.asset('assets/images/login-bg.png', fit: BoxFit.cover),

          // And its scrim: the bottom 45% only, so the room stays a room.
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  HodiColors.inkDeep.withValues(alpha: 0.55),
                ],
                stops: const [0.0, 0.55, 1.0],
              ),
            ),
          ),

          Center(
            child: ScaleTransition(
              scale: _scale,
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                height: 96,
                // In its own colours. Tinted white it would need something dark behind it, which is
                // the panel of colour this screen exists to get rid of.
              ),
            ),
          ),
        ],
      ),
    );
  }
}
