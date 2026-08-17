import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_avatar.dart';
import '../../../core/widgets/mia_charts.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_orb.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import 'loop_diagram.dart';
import 'onboarding_step_frame.dart';

class OnboardingWelcomeStep extends StatelessWidget {
  const OnboardingWelcomeStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Mia Money',
      title: 'Money admin,\nminus the admin',
      useEditorialTitle: true,
      titleFontSize: 42,
      body:
          'Mia collects the evidence, works out what changed, and only asks you when a human call is needed.',
      heroFlex: 5,
      contentFlex: 4,
      hero: const MiaOrb(size: 220),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const OnboardingPromiseRow(
            icon: Icons.account_balance_rounded,
            label: 'Connected banking and energy through the CDR',
          ),
          verticalSpace(10),
          const OnboardingPromiseRow(
            icon: Icons.functions_rounded,
            label: 'Every figure calculated, versioned and traceable',
          ),
          verticalSpace(10),
          const OnboardingPromiseRow(
            icon: Icons.lock_rounded,
            label: 'Private by default, stored onshore in Australia',
          ),
        ],
      ),
    );
  }
}

class OnboardingPromiseRow extends StatelessWidget {
  const OnboardingPromiseRow({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: getSize(30),
          height: getSize(30),
          decoration: BoxDecoration(
            color: withCustomOpacity(AppColors.amberGlow, 0.12),
            borderRadius: AppRadii.rXs,
            border: Border.all(
              color: withCustomOpacity(AppColors.amberGlow, 0.26),
            ),
          ),
          child: Icon(icon, size: getFontSize(14), color: AppColors.amberGlow),
        ),
        horizontalSpace(12),
        Expanded(
          child: BaseText(
            label,
            fontSize: 13,
            textColor: AppColors.mist,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}

class OnboardingLoopStep extends StatelessWidget {
  const OnboardingLoopStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'How Mia works',
      title: 'One loop, seven moves',
      body:
          'Collect, understand, ask, correct, remember, act, recheck. Every feature either feeds this loop or shows its result.',
      heroFlex: 7,
      contentFlex: 2,
      hero: const LoopDiagram(size: 320),
      content: GlassPanel(
        tone: GlassTone.soft,
        padding: EdgeInsets.all(getSize(14)),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.auto_awesome_rounded,
              size: getFontSize(16),
              color: AppColors.lagoon,
            ),
            horizontalSpace(10),
            Expanded(
              child: BaseText(
                'A correction you make once updates every budget, report, alert and answer that used it.',
                fontSize: 12.5,
                textColor: AppColors.mist,
                height: 1.45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingEvidenceStep extends StatelessWidget {
  const OnboardingEvidenceStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Trust',
      title: 'Mia never invents\na number',
      titleFontSize: 30,
      body:
          'Tap any figure and you get its sources, its date range, what was excluded and what is still missing.',
      heroFlex: 0,
      contentFlex: 10,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BentoHeroTile(
            label: 'Available after obligations',
            icon: Icons.savings_rounded,
            accent: AppColors.ember,
            trailing: const StatusPill(
              label: 'Calculated',
              color: AppColors.lagoon,
              icon: Icons.functions_rounded,
            ),
            figure: const ValueTicker(value: 1862.44, fontSize: 44),
            caption: 'Today – 30 June · 18 records · mostly complete',
            footer: Wrap(
              spacing: getSize(6),
              runSpacing: getSize(6),
              children: const <Widget>[
                SourceBadge(
                  label: 'CDR banking',
                  icon: Icons.account_balance_rounded,
                ),
                SourceBadge(
                  label: 'Your corrections',
                  icon: Icons.verified_rounded,
                  color: AppColors.positive,
                ),
                SourceBadge(
                  label: 'calc-2026.06.3',
                  icon: Icons.tag_rounded,
                  color: AppColors.violetHaze,
                ),
              ],
            ),
          ),
          verticalSpace(12),
          GlassPanel(
            tone: GlassTone.soft,
            child: Column(
              children: const <Widget>[
                EvidenceRow(
                  label: 'Excluded',
                  value: 'Internal transfers, card repayment',
                ),
                EvidenceRow(
                  label: 'Missing',
                  value: 'ANZ 12 Feb – 26 Mar',
                  valueColor: AppColors.caution,
                ),
                EvidenceRow(label: 'As of', value: '46 minutes ago'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPrivacyStep extends StatelessWidget {
  const OnboardingPrivacyStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Household',
      title: 'Private by default',
      body:
          'Joining a household grants nothing on its own. You choose what is shared, and totals never leak what is not.',
      heroFlex: 0,
      contentFlex: 10,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: BentoTile(
                  label: 'Mine',
                  icon: Icons.lock_rounded,
                  accent: AppColors.violetHaze,
                  height: getSize(134),
                  caption: 'Your accounts, documents and conversations',
                  figure: BaseText(
                    'Private',
                    fontSize: 20,
                    textStyle: AppTypography.figureMedium,
                  ),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: BentoTile(
                  label: 'Ours',
                  icon: Icons.groups_rounded,
                  accent: AppColors.positive,
                  height: getSize(134),
                  caption: 'Only what each member chooses to share',
                  figure: MiaAvatarStack(
                    names: const <String>['Amara W', 'Dev W', 'Tilly W'],
                    size: 26,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(12),
          GlassPanel(
            tone: GlassTone.soft,
            child: Column(
              children: const <Widget>[
                EvidenceRow(
                  label: 'CDR consent',
                  value: 'Belongs to whoever gave it',
                  icon: Icons.verified_user_rounded,
                ),
                EvidenceRow(
                  label: 'Household owner',
                  value: 'Manages membership, not private records',
                  icon: Icons.admin_panel_settings_rounded,
                ),
                EvidenceRow(
                  label: 'Search & exports',
                  value: 'Same permissions as the screens',
                  icon: Icons.search_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingResidencyStep extends StatelessWidget {
  const OnboardingResidencyStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Where it lives',
      title: 'Stored onshore\nin Australia',
      body:
          'Databases, files, search indexes, queues and backups all sit in Australian infrastructure.',
      heroFlex: 5,
      contentFlex: 5,
      hero: Floating(
        amplitude: 6,
        child: Container(
          width: getSize(148),
          height: getSize(148),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: <Color>[
                withCustomOpacity(AppColors.lagoon, 0.34),
                withCustomOpacity(AppColors.glacierDeep, 0.12),
                AppColors.transparent,
              ],
            ),
            border: Border.all(color: withCustomOpacity(AppColors.lagoon, 0.4)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.public_rounded,
                size: getFontSize(34),
                color: AppColors.lagoon,
              ),
              verticalSpace(8),
              BaseText(
                'ap-southeast-2',
                fontSize: 11,
                textStyle: AppTypography.overline,
                textColor: AppColors.mist,
              ),
              verticalSpace(2),
              BaseText(
                'Sydney',
                fontSize: 13,
                fontWeight: FontWeight.w600,
                textColor: AppColors.frost,
              ),
            ],
          ),
        ),
      ),
      content: GlassPanel(
        tone: GlassTone.soft,
        child: Column(
          children: const <Widget>[
            EvidenceRow(label: 'Database & files', value: 'Australia'),
            EvidenceRow(
              label: 'Backups & DR copies',
              value: 'Australia, encrypted',
            ),
            EvidenceRow(
              label: 'AI / document processing',
              value: 'Only with your consent',
              valueColor: AppColors.caution,
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingSourcesStep extends StatelessWidget {
  const OnboardingSourcesStep({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Evidence Mia can use',
      title: 'Four ways in',
      body:
          'Connect what you want, upload the rest. Nothing is collected until you subscribe and consent.',
      heroFlex: 0,
      contentFlex: 10,
      content: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: getSize(10),
        mainAxisSpacing: getSize(10),
        childAspectRatio: 0.98,
        children: <Widget>[
          BentoTile(
            label: 'Open Banking',
            icon: Icons.account_balance_rounded,
            accent: AppColors.amberGlow,
            caption: 'Up to 24 months of history',
            figure: BaseText(
              'CDR',
              fontSize: 26,
              textStyle: AppTypography.figureMedium,
            ),
            visual: const Sparkline(
              values: <double>[3, 5, 4, 7, 6, 9, 8],
              color: AppColors.amberGlow,
              width: 52,
              height: 22,
            ),
          ),
          BentoTile(
            label: 'Energy',
            icon: Icons.bolt_rounded,
            accent: AppColors.ember,
            caption: 'Usage, bills, plan and solar',
            figure: BaseText(
              'kWh',
              fontSize: 26,
              textStyle: AppTypography.figureMedium,
            ),
            visual: const BarSpark(
              values: <double>[4, 6, 3, 7, 5, 8],
              color: AppColors.ember,
              width: 48,
              height: 22,
            ),
          ),
          BentoTile(
            label: 'Receipts & documents',
            icon: Icons.receipt_long_rounded,
            accent: AppColors.glacier,
            caption: 'Totals, GST and due dates read for you',
            figure: BaseText(
              'OCR',
              fontSize: 26,
              textStyle: AppTypography.figureMedium,
            ),
          ),
          BentoTile(
            label: 'Bill email',
            icon: Icons.alternate_email_rounded,
            accent: AppColors.violetHaze,
            caption: 'A private forwarding address, or chosen labels only',
            figure: BaseText(
              'Opt-in',
              fontSize: 22,
              textStyle: AppTypography.figureMedium,
            ),
          ),
        ],
      ),
    );
  }
}

/// Personalised recap assembled from the answers given, in the bento language
/// the rest of the product uses.
class OnboardingRecapStep extends StatelessWidget {
  const OnboardingRecapStep({
    super.key,
    required this.name,
    required this.pains,
    required this.cadenceLabel,
    required this.budgetLabel,
    required this.householdLabel,
  });

  final String name;
  final Set<String> pains;
  final String cadenceLabel;
  final String budgetLabel;
  final String householdLabel;

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Built from your answers',
      title: 'Here is what Mia\nwill do for you',
      titleFontSize: 28,
      heroFlex: 0,
      contentFlex: 10,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BentoHeroTile(
            label: 'Your Home, $name',
            icon: Icons.auto_awesome_rounded,
            accent: AppColors.ember,
            figure: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const ValueTicker(
                  value: 5,
                  format: TickerFormat.integer,
                  fontSize: 46,
                ),
                horizontalSpace(8),
                Padding(
                  padding: EdgeInsets.only(bottom: getSize(8)),
                  child: BaseText(
                    'things worth\nyour attention',
                    fontSize: 12,
                    textColor: AppColors.mist,
                    height: 1.3,
                  ),
                ),
              ],
            ),
            caption:
                'Not a dashboard. Three to five items, then a clear "you are caught up".',
          ),
          verticalSpace(10),
          Row(
            children: <Widget>[
              Expanded(
                child: BentoTile(
                  label: 'Review rhythm',
                  icon: Icons.restart_alt_rounded,
                  accent: AppColors.violetHaze,
                  height: getSize(120),
                  figure: BaseText(
                    cadenceLabel,
                    fontSize: 19,
                    textStyle: AppTypography.figureMedium,
                  ),
                  caption: '2–5 minutes',
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: BentoTile(
                  label: 'Budget style',
                  icon: Icons.dashboard_customize_rounded,
                  accent: AppColors.lagoon,
                  height: getSize(120),
                  figure: BaseText(
                    budgetLabel,
                    fontSize: 17,
                    textStyle: AppTypography.figureMedium,
                    maxLines: 2,
                  ),
                  caption: 'Change any time',
                ),
              ),
            ],
          ),
          verticalSpace(10),
          BentoTile(
            label: 'Set up for $householdLabel',
            icon: Icons.groups_rounded,
            accent: AppColors.positive,
            height: getSize(112),
            figure: BaseText(
              'Private by default',
              fontSize: 19,
              textStyle: AppTypography.figureMedium,
            ),
            caption: 'Share only what you choose, member by member',
          ),
          if (pains.isNotEmpty) ...<Widget>[
            verticalSpace(10),
            GlassPanel(
              tone: GlassTone.soft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BaseText(
                    'First on your Home',
                    fontSize: 10,
                    textStyle: AppTypography.overline,
                  ),
                  verticalSpace(10),
                  ...pains.map((String pain) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: getSize(8)),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.check_circle_rounded,
                            size: getFontSize(14),
                            color: AppColors.positive,
                          ),
                          horizontalSpace(8),
                          Expanded(
                            child: BaseText(
                              pain,
                              fontSize: 12.5,
                              textColor: AppColors.mist,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class OnboardingReadyStep extends StatelessWidget {
  const OnboardingReadyStep({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return OnboardingStepFrame(
      overline: 'Ready when you are',
      title: 'Let\'s get you\ncaught up, $name',
      useEditorialTitle: true,
      titleFontSize: 38,
      body:
          'Choose a plan next. Bank credentials, CDR consent and documents are only collected afterwards, with your explicit permission.',
      heroFlex: 6,
      contentFlex: 3,
      hero: const MiaOrb(size: 200, speed: 1.4),
      content: GlassPanel(
        tone: GlassTone.soft,
        child: Column(
          children: const <Widget>[
            EvidenceRow(
              label: 'Collected before you subscribe',
              value: 'Nothing financial',
              valueColor: AppColors.positive,
              icon: Icons.shield_rounded,
            ),
            EvidenceRow(
              label: 'Cancel',
              value: 'Any time, through your app store',
              icon: Icons.replay_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
