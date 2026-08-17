import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_motion.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/mia_orb.dart';
import '../bloc/splash_bloc.dart';
import '../widgets/splash_boot_line.dart';
import '../widgets/splash_wordmark.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (BuildContext context) =>
          getIt<SplashBloc>()..add(const SplashEvent.started()),
      child: const SplashScaffold(),
    );
  }
}

class SplashScaffold extends StatelessWidget {
  const SplashScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listenWhen: (SplashState previous, SplashState current) =>
          previous.destination != current.destination,
      listener: (BuildContext context, SplashState state) {
        if (state.destination == SplashDestination.onboarding) {
          context.router.replaceAll(<PageRouteInfo<dynamic>>[
            const OnboardingRoute(),
          ]);
        } else if (state.destination == SplashDestination.home) {
          context.router.replaceAll(<PageRouteInfo<dynamic>>[
            const ShellRoute(),
          ]);
        }
      },
      builder: (BuildContext context, SplashState state) {
        final bool lit = state.phase != SplashPhase.igniting;

        return Scaffold(
          backgroundColor: AppColors.ink,
          body: AuroraBackground(
            mood: AuroraMood.balanced,
            intensity: lit ? 1.0 : 0.55,
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  const Spacer(flex: 3),
                  MiaOrb(
                        size: 268,
                        speed: state.phase == SplashPhase.ready ? 1.5 : 1.0,
                        energy: lit ? 1.0 : 0.5,
                      )
                      .animate()
                      .fadeIn(
                        duration: AppMotion.cinematic,
                        curve: AppMotion.enter,
                      )
                      .scaleXY(
                        begin: 0.62,
                        end: 1,
                        duration: const Duration(milliseconds: 1500),
                        curve: AppMotion.enter,
                      )
                      .blurXY(
                        begin: 18,
                        end: 0,
                        duration: AppMotion.cinematic,
                        curve: AppMotion.enter,
                      ),
                  verticalSpace(28),
                  const SplashWordmark(),
                  const Spacer(flex: 2),
                  SplashBootLine(
                    message: state.bootMessage,
                    phase: state.phase,
                  ),
                  verticalSpace(44),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
