import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_orb.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/reveal.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => getIt<AuthBloc>(),
      child: const VerifyEmailScaffold(),
    );
  }
}

class VerifyEmailScaffold extends StatelessWidget {
  const VerifyEmailScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        final AuthBloc bloc = context.read<AuthBloc>();

        return MiaScaffold(
          title: 'Check your inbox',
          overline: 'Step 2 of 2',
          mood: AuroraMood.ember,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Verify and continue',
              isEnabled: state.code.length >= 6,
              onTap: () => context.router.push(const BiometricSetupRoute()),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                withScale: true,
                child: const Center(
                  child: MiaOrb(size: 120, speed: 1.4, showSatellites: false),
                ),
              ),
              verticalSpace(24),
              Reveal(
                index: 1,
                child: BaseText(
                  'We sent a six digit code to your email.',
                  fontSize: 15,
                  textAlign: TextAlign.center,
                  textColor: AppColors.mist,
                  height: 1.5,
                ),
              ),
              verticalSpace(24),
              Reveal(
                index: 2,
                child: MiaFormField(
                  hint: '000000',
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  fontSize: 28,
                  onChanged: (String value) =>
                      bloc.add(AuthEvent.codeChanged(value)),
                ),
              ),
              verticalSpace(16),
              Reveal(
                index: 3,
                child: Center(
                  child: MiaTextAction(
                    label: 'Resend code',
                    color: AppColors.ember,
                    onTap: () {
                      // Clearing the field is the honest part of resending:
                      // the code already typed is no longer the current one.
                      bloc.add(const AuthEvent.codeChanged(''));
                      showMiaToast(
                        context,
                        message:
                            'A new code is on its way. The previous one no longer works.',
                        icon: Icons.mark_email_read_rounded,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
