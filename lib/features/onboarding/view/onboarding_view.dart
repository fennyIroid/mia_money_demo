import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/onboarding_footer.dart';
import '../widgets/onboarding_progress.dart';
import '../widgets/onboarding_step_content.dart';

@RoutePage()
class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingBloc>(
      create: (BuildContext context) => getIt<OnboardingBloc>(),
      child: const OnboardingScaffold(),
    );
  }
}

class OnboardingScaffold extends StatelessWidget {
  const OnboardingScaffold({super.key});

  /// Each step gets its own atmosphere so moving through the flow feels like
  /// walking through rooms rather than paging a slideshow.
  AuroraMood _moodFor(OnboardingStep step) {
    switch (step) {
      case OnboardingStep.welcome:
      case OnboardingStep.ready:
        return AuroraMood.balanced;
      case OnboardingStep.name:
      case OnboardingStep.household:
      case OnboardingStep.pains:
        return AuroraMood.ember;
      case OnboardingStep.payCycle:
      case OnboardingStep.budgetStyle:
      case OnboardingStep.reviewCadence:
        return AuroraMood.glacier;
      case OnboardingStep.loop:
      case OnboardingStep.evidence:
        return AuroraMood.ember;
      case OnboardingStep.privacy:
      case OnboardingStep.residency:
      case OnboardingStep.sources:
        return AuroraMood.calm;
      case OnboardingStep.recap:
        return AuroraMood.balanced;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (BuildContext context, OnboardingState state) {
        final OnboardingBloc bloc = context.read<OnboardingBloc>();

        return Scaffold(
          backgroundColor: AppColors.ink,
          resizeToAvoidBottomInset: false,
          body: AuroraBackground(
            mood: _moodFor(state.step),
            child: SafeArea(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onHorizontalDragEnd: (DragEndDetails details) {
                  final double velocity = details.velocity.pixelsPerSecond.dx;
                  if (velocity < -220) {
                    bloc.add(const OnboardingEvent.advance());
                  } else if (velocity > 220) {
                    bloc.add(const OnboardingEvent.goBack());
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getSize(22)),
                  child: Column(
                    children: <Widget>[
                      verticalSpace(10),
                      OnboardingProgress(
                        step: state.step,
                        onBack: () => bloc.add(const OnboardingEvent.goBack()),
                        onSkip: state.step == OnboardingStep.ready
                            ? null
                            : () => bloc.add(
                                const OnboardingEvent.jumpTo(
                                  OnboardingStep.ready,
                                ),
                              ),
                      ),
                      verticalSpace(18),
                      Expanded(
                        child: KeyedSubtree(
                          key: ValueKey<OnboardingStep>(state.step),
                          child: OnboardingStepContent(state: state),
                        ),
                      ),
                      verticalSpace(14),
                      OnboardingFooter(
                        step: state.step,
                        canAdvance: state.canAdvance,
                        onAdvance: () =>
                            bloc.add(const OnboardingEvent.advance()),
                        onFinish: () =>
                            context.router.push(const PaywallRoute()),
                      ),
                      verticalSpace(12),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
