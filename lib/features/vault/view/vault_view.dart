import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/currency_utils.dart';
import '../../../core/utils/date_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/bento_tile.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/mia_sheet.dart';
import '../../../core/widgets/mia_states.dart';
import '../../../core/widgets/reveal.dart';
import '../../../core/widgets/status_pill.dart';
import '../../../core/widgets/value_ticker.dart';
import '../../../data/models/admin_models.dart';
import '../bloc/vault_bloc.dart';

@RoutePage()
class VaultView extends StatelessWidget {
  const VaultView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VaultBloc>(
      create: (BuildContext context) =>
          getIt<VaultBloc>()..add(const VaultEvent.load()),
      child: const VaultScaffold(),
    );
  }
}

class VaultScaffold extends StatelessWidget {
  const VaultScaffold({super.key});

  static const List<WarrantyStatus?> filters = <WarrantyStatus?>[
    null,
    WarrantyStatus.active,
    WarrantyStatus.expiring,
    WarrantyStatus.expired,
    WarrantyStatus.issueNoted,
    WarrantyStatus.disposed,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VaultBloc, VaultState>(
      builder: (BuildContext context, VaultState state) {
        final VaultBloc bloc = context.read<VaultBloc>();

        return MiaScaffold(
          title: 'Purchases & warranty',
          overline: 'The vault',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Add a purchase',
              leadingIcon: Icons.add_rounded,
              onTap: () async {
                final PurchaseRecord? created = await context.router
                    .push<PurchaseRecord>(const PurchaseEditorRoute());
                if (created == null || !context.mounted) return;
                bloc.add(const VaultEvent.load());
                showMiaToast(
                  context,
                  message: created.warrantyEnd == null
                      ? '${created.itemName} added to the vault.'
                      : '${created.itemName} added. Written warranty ends ${formatDayMonth(created.warrantyEnd!)}.',
                  icon: Icons.inventory_2_rounded,
                );
              },
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: BentoTile(
                        label: 'Under warranty',
                        icon: Icons.shield_rounded,
                        accent: AppColors.positive,
                        height: getSize(140),
                        figure: ValueTicker(
                          value: state.activeWarrantyCount.toDouble(),
                          format: TickerFormat.integer,
                          fontSize: 28,
                        ),
                        caption: 'items with written cover',
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: BentoTile(
                        label: 'Ending soon',
                        icon: Icons.timelapse_rounded,
                        accent: AppColors.caution,
                        height: getSize(140),
                        figure: ValueTicker(
                          value: state.expiringSoonCount.toDouble(),
                          format: TickerFormat.integer,
                          fontSize: 28,
                        ),
                        caption: 'inside six months',
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(14),
              Reveal(
                index: 1,
                child: MiaSearchField(
                  initialValue: state.query,
                  hint: 'Item, brand, model, serial',
                  onChanged: (String value) =>
                      bloc.add(VaultEvent.queryChanged(value)),
                ),
              ),
              verticalSpace(14),
              Reveal(
                index: 2,
                child: MiaChipRow(
                  padding: EdgeInsets.zero,
                  labels: filters
                      .map((WarrantyStatus? s) => s?.label ?? 'All')
                      .toList(),
                  selectedIndex: filters.indexOf(state.warrantyFilter),
                  onChanged: (int i) =>
                      bloc.add(VaultEvent.warrantyFilterChanged(filters[i])),
                ),
              ),
              verticalSpace(16),
              Reveal(
                index: 3,
                child: MiaNoticeStrip(
                  message:
                      'Mia tracks the written warranty only. Australian Consumer Law rights can last longer.',
                  icon: Icons.gavel_rounded,
                  accent: AppColors.violetHaze,
                ),
              ),
              verticalSpace(16),
              if (!state.isReady)
                const SkeletonTileList(count: 5, tileHeight: 120)
              else if (state.visiblePurchases.isEmpty)
                const MiaStateView(kind: MiaStateKind.empty)
              else
                ...List<Widget>.generate(state.visiblePurchases.length, (
                  int i,
                ) {
                  final PurchaseRecord purchase = state.visiblePurchases[i];
                  return Padding(
                    padding: EdgeInsets.only(bottom: getSize(10)),
                    child: Reveal(
                      index: i.clamp(0, 8),
                      child: PurchaseCard(
                        purchase: purchase,
                        onTap: () async {
                          await context.router.push(
                            PurchaseDetailRoute(purchase: purchase),
                          );
                          bloc.add(const VaultEvent.load());
                        },
                      ),
                    ),
                  );
                }),
            ],
          ),
        );
      },
    );
  }
}

class PurchaseCard extends StatelessWidget {
  const PurchaseCard({super.key, required this.purchase, required this.onTap});

  final PurchaseRecord purchase;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final int? days = purchase.daysRemaining;

    return GlassPanel(
      onTap: onTap,
      tone: GlassTone.soft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: getSize(42),
                height: getSize(42),
                decoration: BoxDecoration(
                  color: withCustomOpacity(purchase.status.color, 0.14),
                  borderRadius: AppRadii.rSm,
                  border: Border.all(
                    color: withCustomOpacity(purchase.status.color, 0.26),
                  ),
                ),
                child: Icon(
                  Icons.inventory_2_rounded,
                  size: getFontSize(19),
                  color: purchase.status.color,
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(
                      purchase.itemName,
                      fontSize: 14.5,
                      textStyle: AppTypography.titleSmall,
                      maxLines: 2,
                    ),
                    verticalSpace(3),
                    BaseText(
                      '${purchase.retailer} · ${formatDayMonth(purchase.purchaseDate)}',
                      fontSize: 11.5,
                      textColor: AppColors.muted,
                    ),
                  ],
                ),
              ),
              if (purchase.amount != null)
                BaseText(
                  formatCurrency(purchase.amount!, decimals: 0),
                  fontSize: 15,
                  textStyle: AppTypography.figureMedium,
                ),
            ],
          ),
          verticalSpace(10),
          Wrap(
            spacing: getSize(6),
            runSpacing: getSize(6),
            children: <Widget>[
              StatusPill(
                label: purchase.status.label,
                color: purchase.status.color,
                icon: Icons.shield_rounded,
                dense: true,
              ),
              if (days != null && days > 0)
                StatusPill(
                  label: '$days days left',
                  color: days < 90 ? AppColors.caution : AppColors.muted,
                  icon: Icons.schedule_rounded,
                  dense: true,
                ),
              if (purchase.extendedWarrantyEnd != null)
                const StatusPill(
                  label: 'Extended cover',
                  color: AppColors.lagoon,
                  icon: Icons.add_moderator_rounded,
                  dense: true,
                ),
              if (purchase.receiptId != null)
                const StatusPill(
                  label: 'Receipt attached',
                  color: AppColors.glacier,
                  icon: Icons.receipt_rounded,
                  dense: true,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
