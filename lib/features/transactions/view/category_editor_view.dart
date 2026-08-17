import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/di/injection.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_shapes.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/color_utils.dart';
import '../../../core/utils/math_utils.dart';
import '../../../core/utils/spacing_utils.dart';
import '../../../core/widgets/aurora_background.dart';
import '../../../core/widgets/base_text.dart';
import '../../../core/widgets/glass_panel.dart';
import '../../../core/widgets/mia_button.dart';
import '../../../core/widgets/mia_inputs.dart';
import '../../../core/widgets/mia_list_row.dart';
import '../../../core/widgets/mia_scaffold.dart';
import '../../../core/widgets/pressable.dart';
import '../../../core/widgets/reveal.dart';
import '../../../data/models/money_models.dart';
import '../bloc/transactions_bloc.dart';

/// Creates a customer-facing category. Provider codes keep mapping onto
/// whatever exists here, so a new category never rewrites the evidence beneath
/// past transactions.
@RoutePage()
class CategoryEditorView extends StatelessWidget {
  const CategoryEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (BuildContext context) => getIt<TransactionsBloc>()
        ..add(const TransactionsEvent.load())
        ..add(const TransactionsEvent.categoryDraftStarted()),
      child: const CategoryEditorScaffold(),
    );
  }
}

class CategoryEditorScaffold extends StatelessWidget {
  const CategoryEditorScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionsBloc, TransactionsState>(
      listenWhen: (TransactionsState p, TransactionsState c) =>
          p.createdCategory != c.createdCategory,
      listener: (BuildContext context, TransactionsState state) {
        final MiaCategory? created = state.createdCategory;
        if (created != null) {
          context.router.maybePop<MiaCategory>(created);
        }
      },
      builder: (BuildContext context, TransactionsState state) {
        final TransactionsBloc bloc = context.read<TransactionsBloc>();
        final Color colour =
            AppColors.dataSpectrum[state.categoryDraftColourIndex];
        final IconData icon =
            TransactionsBloc.categoryIcons[state.categoryDraftIconIndex];

        return MiaScaffold(
          title: 'New category',
          overline: 'Customer-facing, not a provider code',
          mood: AuroraMood.calm,
          bottomBar: MiaBottomBar(
            child: MiaButton(
              label: 'Create category',
              leadingIcon: Icons.add_rounded,
              isEnabled: state.canCreateCategory,
              onTap: () =>
                  bloc.add(const TransactionsEvent.categoryDraftSubmitted()),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Reveal(
                child: CategoryPreview(
                  name: state.categoryDraftName.trim().isEmpty
                      ? 'Your category'
                      : state.categoryDraftName.trim(),
                  parentName: state.categoryDraftParentId == null
                      ? null
                      : state.categoryById(state.categoryDraftParentId!)?.name,
                  colour: colour,
                  icon: icon,
                ),
              ),
              verticalSpace(18),
              Reveal(
                index: 1,
                child: MiaFormField(
                  label: 'Name',
                  hint: 'School fees',
                  autofocus: true,
                  prefixIcon: Icons.label_outline_rounded,
                  onChanged: (String value) => bloc.add(
                    TransactionsEvent.categoryDraftChanged(name: value),
                  ),
                ),
              ),
              verticalSpace(20),
              Reveal(
                index: 2,
                child: SwatchPicker(
                  label: 'Colour',
                  selectedIndex: state.categoryDraftColourIndex,
                  onChanged: (int index) => bloc.add(
                    TransactionsEvent.categoryDraftChanged(colourIndex: index),
                  ),
                ),
              ),
              verticalSpace(20),
              Reveal(
                index: 3,
                child: GlyphPicker(
                  selectedIndex: state.categoryDraftIconIndex,
                  colour: colour,
                  onChanged: (int index) => bloc.add(
                    TransactionsEvent.categoryDraftChanged(iconIndex: index),
                  ),
                ),
              ),
              verticalSpace(20),
              Reveal(
                index: 4,
                child: ParentCategoryPicker(
                  parents: state.parentCategories,
                  selectedId: state.categoryDraftParentId,
                  onChanged: (String? id) => bloc.add(
                    TransactionsEvent.categoryDraftChanged(
                      parentId: id,
                      clearParent: id == null,
                    ),
                  ),
                ),
              ),
              verticalSpace(20),
              Reveal(
                index: 5,
                child: MiaGroupedCard(
                  title: 'What creating this does',
                  footnote:
                      'Nothing is recategorised automatically. Existing transactions keep the category they already have until you or a rule moves them.',
                  children: const <Widget>[
                    EvidenceRow(
                      label: 'Provider codes',
                      value: 'Still map to their current category',
                    ),
                    EvidenceRow(
                      label: 'Reports',
                      value: 'Include it from the next transaction on',
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

/// Shows the category exactly as it will read in the list once created.
class CategoryPreview extends StatelessWidget {
  const CategoryPreview({
    super.key,
    required this.name,
    required this.colour,
    required this.icon,
    this.parentName,
  });

  final String name;
  final Color colour;
  final IconData icon;
  final String? parentName;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      tone: GlassTone.soft,
      child: Row(
        children: <Widget>[
          Container(
            width: getSize(40),
            height: getSize(40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: withCustomOpacity(colour, 0.16),
              borderRadius: AppRadii.rSm,
            ),
            child: Icon(icon, size: getFontSize(18), color: colour),
          ),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText(
                  name,
                  fontSize: 15,
                  textStyle: AppTypography.titleSmall,
                  maxLines: 1,
                ),
                verticalSpace(3),
                BaseText(
                  parentName == null
                      ? 'Top-level category'
                      : 'Inside $parentName',
                  fontSize: 11.5,
                  textColor: AppColors.faint,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SwatchPicker extends StatelessWidget {
  const SwatchPicker({
    super.key,
    required this.label,
    required this.selectedIndex,
    required this.onChanged,
  });

  final String label;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          label,
          fontSize: 10,
          textStyle: AppTypography.overline,
          textColor: AppColors.muted,
        ),
        verticalSpace(10),
        Wrap(
          spacing: getSize(10),
          runSpacing: getSize(10),
          children: List<Widget>.generate(AppColors.dataSpectrum.length, (
            int i,
          ) {
            final Color colour = AppColors.dataSpectrum[i];
            final bool selected = i == selectedIndex;
            return Pressable(
              onTap: () => onChanged(i),
              pressedScale: 0.9,
              child: Container(
                width: getSize(38),
                height: getSize(38),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: withCustomOpacity(colour, selected ? 0.34 : 0.16),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: selected ? colour : AppColors.transparent,
                    width: 2,
                  ),
                ),
                child: selected
                    ? Icon(
                        Icons.check_rounded,
                        size: getFontSize(16),
                        color: colour,
                      )
                    : null,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class GlyphPicker extends StatelessWidget {
  const GlyphPicker({
    super.key,
    required this.selectedIndex,
    required this.colour,
    required this.onChanged,
  });

  final int selectedIndex;
  final Color colour;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Glyph',
          fontSize: 10,
          textStyle: AppTypography.overline,
          textColor: AppColors.muted,
        ),
        verticalSpace(10),
        Wrap(
          spacing: getSize(10),
          runSpacing: getSize(10),
          children: List<Widget>.generate(
            TransactionsBloc.categoryIcons.length,
            (int i) {
              final bool selected = i == selectedIndex;
              return Pressable(
                onTap: () => onChanged(i),
                pressedScale: 0.9,
                child: Container(
                  width: getSize(44),
                  height: getSize(44),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selected
                        ? withCustomOpacity(colour, 0.18)
                        : AppColors.glassFillSoft,
                    borderRadius: AppRadii.rSm,
                    border: Border.all(
                      color: selected ? colour : AppColors.glassBorderSoft,
                    ),
                  ),
                  child: Icon(
                    TransactionsBloc.categoryIcons[i],
                    size: getFontSize(18),
                    color: selected ? colour : AppColors.mist,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ParentCategoryPicker extends StatelessWidget {
  const ParentCategoryPicker({
    super.key,
    required this.parents,
    required this.selectedId,
    required this.onChanged,
  });

  final List<MiaCategory> parents;
  final String? selectedId;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    final List<String> labels = <String>[
      'Top level',
      ...parents.map((MiaCategory c) => c.name),
    ];
    final int selectedIndex = selectedId == null
        ? 0
        : parents.indexWhere((MiaCategory c) => c.id == selectedId) + 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Sits under',
          fontSize: 10,
          textStyle: AppTypography.overline,
          textColor: AppColors.muted,
        ),
        verticalSpace(10),
        MiaChipRow(
          padding: EdgeInsets.zero,
          labels: labels,
          selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
          onChanged: (int index) =>
              onChanged(index == 0 ? null : parents[index - 1].id),
        ),
      ],
    );
  }
}
