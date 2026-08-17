import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/widgets/mia_list_row.dart';

class MoneyShortcuts extends StatelessWidget {
  const MoneyShortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MiaGroupedCard(
          children: <Widget>[
            MiaSettingsRow(
              title: 'Transactions',
              subtitle: 'Search, correct, split and reconcile',
              icon: Icons.swap_horiz_rounded,
              accent: AppColors.ember,
              onTap: () => context.router.push(const TransactionsRoute()),
            ),
            MiaSettingsRow(
              title: 'Accounts, assets & liabilities',
              subtitle: 'Balances with dated history and freshness',
              icon: Icons.account_balance_rounded,
              onTap: () => context.router.push(const AccountsRoute()),
            ),
            MiaSettingsRow(
              title: 'Budgets',
              subtitle: 'Tracking, flex, category or detailed planning',
              icon: Icons.pie_chart_rounded,
              accent: AppColors.violetHaze,
              onTap: () => context.router.push(const BudgetsRoute()),
            ),
            MiaSettingsRow(
              title: 'Reports & exports',
              subtitle: 'Cash flow, categories, merchants, CSV and PDF',
              icon: Icons.insights_rounded,
              accent: AppColors.lagoon,
              onTap: () => context.router.push(const ReportsRoute()),
            ),
          ],
        ),
        SizedBox(height: getSize(12)),
        MiaGroupedCard(
          children: <Widget>[
            MiaSettingsRow(
              title: 'Goals & sinking funds',
              subtitle: 'Trajectories and deterministic scenarios',
              icon: Icons.flag_rounded,
              accent: AppColors.ember,
              onTap: () => context.router.push(const GoalsRoute()),
            ),
            MiaSettingsRow(
              title: 'Bills & obligations',
              subtitle: 'Recurring commitments and renewals',
              icon: Icons.receipt_long_rounded,
              accent: AppColors.amberGlow,
              onTap: () => context.router.push(const BillsRoute()),
            ),
            MiaSettingsRow(
              title: 'Expected money',
              subtitle: 'Refunds, claims and shared costs owed to you',
              icon: Icons.hourglass_bottom_rounded,
              accent: AppColors.lagoon,
              onTap: () => context.router.push(const ExpectedMoneyRoute()),
            ),
            MiaSettingsRow(
              title: 'Categories',
              subtitle: 'Rename, merge, archive and re-parent',
              icon: Icons.label_rounded,
              accent: AppColors.positive,
              onTap: () => context.router.push(const CategoriesRoute()),
            ),
          ],
        ),
        SizedBox(height: getSize(12)),
        MiaGroupedCard(
          children: <Widget>[
            MiaSettingsRow(
              title: 'True cost of life',
              subtitle: 'Recurring plus annualised irregular commitments',
              icon: Icons.public_rounded,
              accent: AppColors.violetHaze,
              onTap: () => context.router.push(const TrueCostOfLifeRoute()),
            ),
            MiaSettingsRow(
              title: 'Available after obligations',
              subtitle: 'What is genuinely spendable',
              icon: Icons.savings_rounded,
              accent: AppColors.positive,
              onTap: () =>
                  context.router.push(const AvailableAfterObligationsRoute()),
            ),
          ],
        ),
      ],
    );
  }
}
