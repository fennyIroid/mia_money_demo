import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_orb.dart';
import '../../../core/widgets/reveal.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => getIt<AuthBloc>(),
      child: const SignInScaffold(),
    );
  }
}

class SignInScaffold extends StatelessWidget {
  const SignInScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (AuthState p, AuthState c) =>
          p.isAuthenticated != c.isAuthenticated,
      listener: (BuildContext context, AuthState state) {
        if (state.isAuthenticated) {
          context.router.replaceAll(<PageRouteInfo<dynamic>>[
            const ShellRoute(),
          ]);
        }
      },
      builder: (BuildContext context, AuthState state) {
        final AuthBloc bloc = context.read<AuthBloc>();

        return Scaffold(
          backgroundColor: AppColors.ink,
          body: AuroraBackground(
            mood: AuroraMood.balanced,
            child: SafeArea(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: getSize(24)),
                children: <Widget>[
                  verticalSpace(30),
                  Reveal(
                    withScale: true,
                    child: const Center(child: MiaOrb(size: 120, speed: 0.8)),
                  ),
                  verticalSpace(26),
                  Reveal(
                    index: 1,
                    child: BaseText(
                      'Welcome back',
                      fontSize: 34,
                      textStyle: AppTypography.editorialDisplay,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  verticalSpace(8),
                  Reveal(
                    index: 2,
                    child: BaseText(
                      'Your evidence is exactly where you left it.',
                      fontSize: 13,
                      textAlign: TextAlign.center,
                      textColor: withCustomOpacity(AppColors.mist, 0.8),
                    ),
                  ),
                  verticalSpace(30),
                  Reveal(
                    index: 3,
                    child: MiaFormField(
                      label: 'Email',
                      hint: 'you@example.com.au',
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.none,
                      prefixIcon: Icons.mail_outline_rounded,
                      onChanged: (String value) =>
                          bloc.add(AuthEvent.emailChanged(value)),
                    ),
                  ),
                  verticalSpace(14),
                  Reveal(
                    index: 4,
                    child: MiaFormField(
                      label: 'Password',
                      hint: 'At least 10 characters',
                      obscureText: true,
                      prefixIcon: Icons.lock_outline_rounded,
                      onChanged: (String value) =>
                          bloc.add(AuthEvent.passwordChanged(value)),
                      errorText: state.failure,
                    ),
                  ),
                  verticalSpace(10),
                  Reveal(
                    index: 5,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: MiaTextAction(
                        label: 'Forgot password?',
                        onTap: () =>
                            context.router.push(const ResetPasswordRoute()),
                      ),
                    ),
                  ),
                  verticalSpace(18),
                  Reveal(
                    index: 6,
                    child: MiaButton(
                      label: 'Sign in',
                      isEnabled: state.canSubmit,
                      onTap: () => bloc.add(const AuthEvent.submitted()),
                    ),
                  ),
                  verticalSpace(14),
                  Reveal(
                    index: 7,
                    child: MiaButton(
                      label: 'Continue with Apple',
                      variant: MiaButtonVariant.ghost,
                      leadingIcon: Icons.apple_rounded,
                      onTap: () => bloc.add(const AuthEvent.submitted()),
                    ),
                  ),
                  verticalSpace(10),
                  Reveal(
                    index: 8,
                    child: MiaButton(
                      label: 'Continue with Google',
                      variant: MiaButtonVariant.ghost,
                      leadingIcon: Icons.g_mobiledata_rounded,
                      onTap: () => bloc.add(const AuthEvent.submitted()),
                    ),
                  ),
                  verticalSpace(22),
                  Reveal(
                    index: 9,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          BaseText(
                            'No account yet?',
                            fontSize: 13,
                            textColor: AppColors.muted,
                            maxLines: 1,
                          ),
                          MiaTextAction(
                            label: 'Create one',
                            color: AppColors.ember,
                            onTap: () =>
                                context.router.push(const SignUpRoute()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
