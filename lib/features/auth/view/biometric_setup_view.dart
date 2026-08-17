import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/reveal.dart';
import '../bloc/auth_bloc.dart';

@RoutePage()
class BiometricSetupView extends StatelessWidget {
  const BiometricSetupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (BuildContext context) => getIt<AuthBloc>(),
      child: const BiometricSetupScaffold(),
    );
  }
}

class BiometricSetupScaffold extends StatelessWidget {
  const BiometricSetupScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        final AuthBloc bloc = context.read<AuthBloc>();

        return MiaScaffold(
          title: 'Secure this device',
          overline: 'Recommended',
          mood: AuroraMood.balanced,
          showBack: false,
          bottomBar: MiaBottomBar(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MiaButton(
                  label: state.biometricEnabled
                      ? 'Continue'
                      : 'Enable biometric unlock',
                  onTap: () {
                    if (state.biometricEnabled) {
                      context.router.replaceAll(<PageRouteInfo<dynamic>>[
                        const ShellRoute(),
                      ]);
                    } else {
                      bloc.add(const AuthEvent.biometricEnabled());
                    }
                  },
                ),
                verticalSpace(6),
                MiaTextAction(
                  label: 'Not now',
                  onTap: () => context.router.replaceAll(
                    <PageRouteInfo<dynamic>>[const ShellRoute()],
                  ),
                ),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                withScale: true,
                child: Center(
                  child: Container(
                    width: getSize(120),
                    height: getSize(120),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: withCustomOpacity(AppColors.ember, 0.12),
                      border: Border.all(
                        color: withCustomOpacity(AppColors.ember, 0.36),
                      ),
                      boxShadow: AppShadows.glow(AppColors.ember),
                    ),
                    child: Icon(
                      state.biometricEnabled
                          ? Icons.verified_rounded
                          : Icons.fingerprint_rounded,
                      size: getFontSize(52),
                      color: AppColors.ember,
                    ),
                  ),
                ),
              ),
              verticalSpace(24),
              Reveal(
                index: 1,
                child: BaseText(
                  state.biometricEnabled
                      ? 'Biometric unlock is on'
                      : 'Unlock with Face ID',
                  fontSize: 26,
                  textStyle: AppTypography.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
              verticalSpace(10),
              Reveal(
                index: 2,
                child: BaseText(
                  'The fastest way back in. Session tokens stay in secure platform storage, and you can turn this off any time.',
                  fontSize: 13,
                  textAlign: TextAlign.center,
                  textColor: AppColors.muted,
                  height: 1.55,
                ),
              ),
              verticalSpace(26),
              Reveal(
                index: 3,
                child: MiaGroupedCard(
                  title: 'Also protecting you',
                  children: const <Widget>[
                    EvidenceRow(
                      label: 'Failed login protection',
                      value: 'Rate limited and locked out',
                    ),
                    EvidenceRow(label: 'New session alerts', value: 'On'),
                    EvidenceRow(
                      label: 'Sensitive operations',
                      value: 'Re-verify before applying',
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
