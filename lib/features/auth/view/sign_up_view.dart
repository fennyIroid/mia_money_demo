import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/reveal.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => getIt<AuthBloc>(),
      child: const SignUpScaffold(),
    );
  }
}

class SignUpScaffold extends StatelessWidget {
  const SignUpScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (AuthState p, AuthState c) =>
          p.isAuthenticated != c.isAuthenticated,
      listener: (BuildContext context, AuthState state) {
        if (state.isAuthenticated) {
          context.router.push(const VerifyEmailRoute());
        }
      },
      builder: (BuildContext context, AuthState state) {
        final AuthBloc bloc = context.read<AuthBloc>();

        return MiaScaffold(
          title: 'Create account',
          overline: 'Step 1 of 2',
          mood: AuroraMood.ember,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Create account',
              isEnabled: state.canSubmit && state.passwordsMatch,
              onTap: () => bloc.add(const AuthEvent.submitted()),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: BaseText(
                  'Email first.\nConnections come later.',
                  fontSize: 28,
                  textStyle: AppTypography.titleLarge,
                  height: 1.15,
                ),
              ),
              verticalSpace(24),
              Reveal(
                index: 1,
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
                index: 2,
                child: MiaFormField(
                  label: 'Password',
                  hint: 'At least 10 characters',
                  obscureText: true,
                  prefixIcon: Icons.lock_outline_rounded,
                  onChanged: (String value) =>
                      bloc.add(AuthEvent.passwordChanged(value)),
                ),
              ),
              verticalSpace(14),
              Reveal(
                index: 3,
                child: MiaFormField(
                  label: 'Confirm password',
                  obscureText: true,
                  prefixIcon: Icons.lock_reset_rounded,
                  errorText:
                      state.confirmPassword.isEmpty || state.passwordsMatch
                      ? null
                      : 'Passwords do not match',
                  onChanged: (String value) =>
                      bloc.add(AuthEvent.confirmPasswordChanged(value)),
                ),
              ),
              verticalSpace(20),
              Reveal(
                index: 4,
                child: MiaGroupedCard(
                  title: 'Before you continue',
                  footnote:
                      'Bank credentials, CDR consent and documents are only collected after you subscribe and consent.',
                  children: const <Widget>[
                    EvidenceRow(
                      label: 'Data residency',
                      value: 'Australia',
                      icon: Icons.public_rounded,
                    ),
                    EvidenceRow(
                      label: 'AI training on your data',
                      value: 'Never',
                      icon: Icons.smart_toy_rounded,
                      valueColor: AppColors.positive,
                    ),
                    EvidenceRow(
                      label: 'Household visibility',
                      value: 'Private by default',
                      icon: Icons.lock_rounded,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
