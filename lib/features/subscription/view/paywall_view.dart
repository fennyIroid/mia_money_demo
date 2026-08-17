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
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_orb.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/user_models.dart';
import '../bloc/subscription_bloc.dart';
import '../widgets/plan_card.dart';

@RoutePage()
class PaywallView extends StatelessWidget {
  const PaywallView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubscriptionBloc>(
      create: (BuildContext context) =>
          getIt<SubscriptionBloc>()..add(const SubscriptionEvent.loadPlans()),
      child: const PaywallScaffold(),
    );
  }
}

class PaywallScaffold extends StatelessWidget {
  const PaywallScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubscriptionBloc, SubscriptionScreenState>(
      listenWhen: (SubscriptionScreenState p, SubscriptionScreenState c) =>
          p.isPurchased != c.isPurchased,
      listener: (BuildContext context, SubscriptionScreenState state) {
        if (state.isPurchased) {
          context.router.replaceAll(<PageRouteInfo<dynamic>>[
            const ShellRoute(),
          ]);
        }
      },
      builder: (BuildContext context, SubscriptionScreenState state) {
        final SubscriptionBloc bloc = context.read<SubscriptionBloc>();
        final SubscriptionPlan? plan = state.selectedPlan;

        return Scaffold(
          backgroundColor: AppColors.ink,
          body: AuroraBackground(
            mood: AuroraMood.ember,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getSize(16)),
                    child: Row(
                      children: <Widget>[
                        GlassIconButton(
                          icon: Icons.arrow_back_ios_new_rounded,
                          iconSize: 14,
                          diameter: 38,
                          onTap: () => context.router.maybePop(),
                        ),
                        const Spacer(),
                        MiaTextAction(
                          label: 'Restore purchase',
                          onTap: () =>
                              bloc.add(const SubscriptionEvent.restore()),
                          fontSize: 12.5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: getSize(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Reveal(
                            withScale: true,
                            child: Center(child: MiaOrb(size: 130, speed: 1.2)),
                          ),
                          verticalSpace(18),
                          Reveal(
                            index: 1,
                            child: BaseText(
                              'Choose your plan',
                              fontSize: 34,
                              textStyle: AppTypography.editorialDisplay,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          verticalSpace(8),
                          Reveal(
                            index: 2,
                            child: BaseText(
                              'Bank credentials, CDR consent and documents are only collected after you subscribe.',
                              fontSize: 13,
                              textAlign: TextAlign.center,
                              textColor: withCustomOpacity(AppColors.mist, 0.8),
                              height: 1.5,
                            ),
                          ),
                          verticalSpace(24),
                          Reveal(
                            index: 3,
                            child: MiaSegmentedControl(
                              segments: const <String>[
                                'Individual',
                                'Household',
                              ],
                              selectedIndex:
                                  state.selectedKind == PlanKind.individual
                                  ? 0
                                  : 1,
                              onChanged: (int i) => bloc.add(
                                SubscriptionEvent.kindSelected(
                                  i == 0
                                      ? PlanKind.individual
                                      : PlanKind.household,
                                ),
                              ),
                            ),
                          ),
                          verticalSpace(16),
                          ...List<Widget>.generate(state.plansForKind.length, (
                            int i,
                          ) {
                            final SubscriptionPlan p = state.plansForKind[i];
                            return Padding(
                              padding: EdgeInsets.only(bottom: getSize(10)),
                              child: Reveal(
                                index: 4 + i,
                                child: PlanCard(
                                  plan: p,
                                  selected: p.term == state.selectedTerm,
                                  onTap: () => bloc.add(
                                    SubscriptionEvent.termSelected(p.term),
                                  ),
                                ),
                              ),
                            );
                          }),
                          verticalSpace(10),
                          Reveal(
                            index: 6,
                            child: GlassPanel(
                              tone: GlassTone.soft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  BaseText(
                                    'What you get',
                                    fontSize: 10,
                                    textStyle: AppTypography.overline,
                                  ),
                                  verticalSpace(8),
                                  const PlanEntitlementRow(
                                    label: 'Connected banking and energy',
                                    icon: Icons.account_balance_rounded,
                                    detail:
                                        'Up to 24 months of history where your bank supplies it',
                                  ),
                                  const PlanEntitlementRow(
                                    label: 'Financial admin inbox and rules',
                                    icon: Icons.inbox_rounded,
                                    detail:
                                        'Corrections you approve are reused transparently',
                                  ),
                                  const PlanEntitlementRow(
                                    label: 'Power Lens and Loan Lens',
                                    icon: Icons.balance_rounded,
                                    detail:
                                        'Deterministic comparisons on your own evidence',
                                  ),
                                  const PlanEntitlementRow(
                                    label: 'Ask Mia with cited evidence',
                                    icon: Icons.auto_awesome_rounded,
                                  ),
                                  PlanEntitlementRow(
                                    label:
                                        state.selectedKind == PlanKind.household
                                        ? 'Up to 5 members, private by default'
                                        : 'Single member',
                                    icon: Icons.groups_rounded,
                                    included:
                                        state.selectedKind ==
                                        PlanKind.household,
                                    detail:
                                        state.selectedKind == PlanKind.household
                                        ? 'Each member keeps their own login and consents'
                                        : 'Upgrade to Household to add members',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpace(120),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: MiaBottomBar(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MiaButton(
                  label: plan == null
                      ? 'Continue'
                      : 'Start ${plan.title} ${plan.term == PlanTerm.annual ? 'annual' : 'monthly'}',
                  onTap: () => bloc.add(const SubscriptionEvent.purchase()),
                ),
                verticalSpace(10),
                BaseText(
                  'Billed through your app store in AUD. Prices are a working baseline and are configured remotely.',
                  fontSize: 10.5,
                  textAlign: TextAlign.center,
                  textColor: AppColors.faint,
                  height: 1.45,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
