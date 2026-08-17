import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/reveal.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => getIt<AuthBloc>(),
      child: const ResetPasswordScaffold(),
    );
  }
}

class ResetPasswordScaffold extends StatelessWidget {
  const ResetPasswordScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        final AuthBloc bloc = context.read<AuthBloc>();

        return MiaScaffold(
          title: 'Reset password',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Send reset link',
              isEnabled: state.isEmailValid,
              onTap: () {
                showMiaToast(
                  context,
                  message: 'If that email exists, a reset link is on its way.',
                );
                context.router.maybePop();
              },
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: BaseText(
                  'We will email you a secure, single-use reset link.',
                  fontSize: 15,
                  textColor: AppColors.mist,
                  height: 1.5,
                ),
              ),
              verticalSpace(22),
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
              verticalSpace(16),
              Reveal(
                index: 2,
                child: BaseText(
                  'For your safety Mia gives the same response whether or not the email is registered.',
                  fontSize: 11.5,
                  textColor: AppColors.faint,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
