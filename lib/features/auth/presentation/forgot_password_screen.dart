import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/auth/providers/auth_provider.dart';
import '../../../core/theme/hodi_colors.dart';
import '../../../core/theme/hodi_gradients.dart';
import '../../../core/theme/hodi_text_styles.dart';
import '../../../core/theme/hodi_shadows.dart';
import '../../../core/theme/hodi_border_radius.dart';
import '../../../core/widgets/hodi_gradient_button.dart';
import '../../../core/widgets/hodi_text_field.dart';
import '../../../core/utils/validators.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;
  String? _error;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    final repository = ref.read(authRepositoryProvider);
    final response =
        await repository.forgotPassword(_emailController.text.trim());

    if (!mounted) return;

    if (response.isSuccess) {
      setState(() {
        _isLoading = false;
        _emailSent = true;
      });
    } else {
      setState(() {
        _isLoading = false;
        _error = response.message.isNotEmpty
            ? response.message
            : 'Failed to send reset link. Please try again.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background gradient
          Container(
            decoration:
                BoxDecoration(gradient: HodiGradients.primary),
          ),

          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/login-bg.png',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.15),
            ),
          ),

          // Content
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Container(
                      width: 72,
                      height: 72,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: HodiColors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/logo.svg',
                        colorFilter: const ColorFilter.mode(
                          HodiColors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'HODI',
                      style: HodiTextStyles.heading1
                          .copyWith(color: HodiColors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Property Management',
                      style: HodiTextStyles.bodyMedium.copyWith(
                        color: HodiColors.white.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Card
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: HodiColors.white.withValues(alpha: 0.95),
                        borderRadius: HodiBorderRadius.card,
                        boxShadow: HodiShadows.card,
                      ),
                      child: _emailSent
                          ? _buildSuccessContent()
                          : _buildFormContent(),
                    ),
                    const SizedBox(height: 24),

                    // Back to login
                    TextButton.icon(
                      onPressed: () => context.go('/login'),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: HodiColors.white,
                        size: 18,
                      ),
                      label: Text(
                        'Back to Sign In',
                        style: HodiTextStyles.bodyMedium.copyWith(
                          color: HodiColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormContent() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Forgot Password', style: HodiTextStyles.heading2),
          const SizedBox(height: 8),
          Text(
            'Enter your email address and we\'ll send you a link to reset your password.',
            style: HodiTextStyles.bodyMedium,
          ),
          const SizedBox(height: 24),

          // Error message
          if (_error != null) ...[
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: HodiColors.errorStart.withValues(alpha: 0.1),
                borderRadius: HodiBorderRadius.small,
                border: Border.all(
                  color: HodiColors.errorStart.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: HodiColors.errorStart,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _error!,
                      style: HodiTextStyles.bodySmall
                          .copyWith(color: HodiColors.errorStart),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],

          // Email field
          HodiTextField(
            controller: _emailController,
            hintText: 'Email address',
            prefixIcon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleSubmit(),
            validator: Validators.email,
          ),
          const SizedBox(height: 24),

          // Submit button
          HodiGradientButton(
            text: 'Send Reset Link',
            onPressed: _handleSubmit,
            isLoading: _isLoading,
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessContent() {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: HodiColors.successStart.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.mark_email_read_outlined,
            color: HodiColors.successStart,
            size: 32,
          ),
        ),
        const SizedBox(height: 20),
        Text('Check Your Email', style: HodiTextStyles.heading2),
        const SizedBox(height: 12),
        Text(
          'We\'ve sent a password reset link to:',
          style: HodiTextStyles.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          _emailController.text.trim(),
          style: HodiTextStyles.bodyMedium.copyWith(
            fontWeight: FontWeight.w600,
            color: HodiColors.primaryStart,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Text(
          'Open the link in your browser to reset your password, then come back here to sign in.',
          style: HodiTextStyles.bodySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),

        // Back to sign in button
        HodiGradientButton(
          text: 'Back to Sign In',
          icon: Icons.login,
          onPressed: () => context.go('/login'),
        ),
        const SizedBox(height: 12),

        // Resend button
        TextButton(
          onPressed: _isLoading ? null : _handleSubmit,
          child: _isLoading
              ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(
                  'Didn\'t receive it? Resend Email',
                  style: HodiTextStyles.bodyMedium.copyWith(
                    color: HodiColors.primaryStart,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ],
    );
  }
}
