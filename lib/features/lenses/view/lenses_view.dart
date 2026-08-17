import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/value_ticker.dart';

@RoutePage()
class LensesView extends StatelessWidget {
  const LensesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ink,
      extendBody: true,
      body: AuroraBackground(
        mood: AuroraMood.ember,
        child: SafeArea(
          bottom: false,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: getSize(20),
              right: getSize(20),
              bottom: getSize(160),
            ),
            children: <Widget>[
              verticalSpace(10),
              Reveal(
                child: BaseText(
                  'Lenses',
                  fontSize: 30,
                  textStyle: AppTypography.titleLarge,
                ),
              ),
              verticalSpace(4),
              Reveal(
                index: 1,
                child: BaseText(
                  'Deterministic comparisons run on your own authorised evidence. Comparison only — Mia never switches or applies.',
                  fontSize: 13,
                  textColor: AppColors.muted,
                  height: 1.5,
                ),
              ),
              verticalSpace(22),
              Reveal(
                index: 2,
                withScale: true,
                child: BentoHeroTile(
                  label: 'Power Lens',
                  icon: Icons.bolt_rounded,
                  accent: AppColors.amberGlow,
                  onTap: () => context.router.push(const PowerLensRoute()),
                  figure: const ValueTicker(
                    value: 378.40,
                    fontSize: 42,
                    showSign: true,
                  ),
                  caption:
                      'Estimated difference a year on your last complete 12 months of usage.',
                  footer: BaseText(
                    'Tap to see all compared plans, assumptions and coverage',
                    fontSize: 11.5,
                    textColor: AppColors.mist,
                  ),
                ),
              ),
              verticalSpace(12),
              Reveal(
                index: 3,
                withScale: true,
                child: BentoHeroTile(
                  label: 'Loan Lens',
                  icon: Icons.balance_rounded,
                  accent: AppColors.glacier,
                  onTap: () => context.router.push(const LoanLensRoute()),
                  figure: const ValueTicker(
                    value: 5.74,
                    format: TickerFormat.percent,
                    fontSize: 42,
                    decimals: 2,
                  ),
                  caption:
                      'Lowest advertised variable rate among the products you chose to compare.',
                  footer: BaseText(
                    'Factual comparison. No recommendation, no serviceability, no leads.',
                    fontSize: 11.5,
                    textColor: AppColors.mist,
                  ),
                ),
              ),
              verticalSpace(24),
              Reveal(
                index: 4,
                child: GlassPanel(
                  tone: GlassTone.soft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText(
                        'What a Lens will never do',
                        fontSize: 10,
                        textStyle: AppTypography.overline,
                      ),
                      verticalSpace(8),
                      const EvidenceRow(
                        label: 'Switch your energy retailer',
                        value: 'Never',
                        valueColor: AppColors.negative,
                      ),
                      const EvidenceRow(
                        label: 'Submit an application',
                        value: 'Never',
                        valueColor: AppColors.negative,
                      ),
                      const EvidenceRow(
                        label: 'Assess serviceability or suitability',
                        value: 'Never',
                        valueColor: AppColors.negative,
                      ),
                      const EvidenceRow(
                        label: 'Let paid placement change the order',
                        value: 'Never',
                        valueColor: AppColors.negative,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
