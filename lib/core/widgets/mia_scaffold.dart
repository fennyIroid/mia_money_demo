import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_gradients.dart';
import '../theme/app_shapes.dart';
import '../theme/app_typography.dart';
import '../utils/color_utils.dart';
import '../utils/math_utils.dart';
import '../utils/spacing_utils.dart';
import 'aurora_background.dart';
import 'base_text.dart';
import 'mia_button.dart';

/// Every screen in the product is built on this shell: living aurora canvas, a
/// floating frosted header that blurs content passing beneath it, and a bottom
/// fade so scrolled content dissolves into the ink instead of being cut off.
class MiaScaffold extends StatelessWidget {
  const MiaScaffold({
    super.key,
    required this.child,
    this.title,
    this.overline,
    this.showBack = true,
    this.actions,
    this.mood = AuroraMood.balanced,
    this.bottomBar,
    this.floatingAction,
    this.scrollable = true,
    this.padding,
    this.header,
    this.animateAurora = true,
    this.extendBehindHeader = true,
    this.onBack,
    this.bottomFade = true,
  });

  final Widget child;
  final String? title;
  final String? overline;
  final bool showBack;
  final List<Widget>? actions;
  final AuroraMood mood;
  final Widget? bottomBar;
  final Widget? floatingAction;
  final bool scrollable;
  final EdgeInsetsGeometry? padding;

  /// Large custom header rendered under the compact bar (hero figures, filters).
  final Widget? header;
  final bool animateAurora;
  final bool extendBehindHeader;
  final VoidCallback? onBack;
  final bool bottomFade;

  @override
  Widget build(BuildContext context) {
    final EdgeInsetsGeometry contentPadding =
        padding ?? EdgeInsets.symmetric(horizontal: getSize(20));

    final Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ?header,
        Padding(padding: contentPadding, child: child),
      ],
    );

    return Scaffold(
      backgroundColor: AppColors.ink,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AuroraBackground(
        mood: mood,
        animate: animateAurora,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: scrollable
                  ? CustomScrollView(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics(),
                      ),
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: verticalSpace(extendBehindHeader ? 108 : 20),
                        ),
                        SliverToBoxAdapter(child: body),
                        SliverToBoxAdapter(
                          child: verticalSpace(bottomBar != null ? 140 : 60),
                        ),
                      ],
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        top: getSize(extendBehindHeader ? 108 : 20),
                        bottom: getSize(bottomBar != null ? 110 : 0),
                      ),
                      child: body,
                    ),
            ),
            if (bottomFade)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: getSize(120),
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(gradient: AppGradients.fadeToInk),
                  ),
                ),
              ),
            if (title != null || showBack || actions != null)
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: MiaHeaderBar(
                  title: title,
                  overline: overline,
                  showBack: showBack,
                  actions: actions,
                  onBack: onBack,
                ),
              ),
            if (bottomBar != null)
              Positioned(left: 0, right: 0, bottom: 0, child: bottomBar!),
            if (floatingAction != null)
              Positioned(
                right: getSize(20),
                bottom: getSize(bottomBar != null ? 120 : 32),
                child: floatingAction!,
              ),
          ],
        ),
      ),
    );
  }
}

/// Compact frosted header. Content scrolls beneath it and is blurred by it,
/// which is the iOS large-title behaviour translated to this design language.
class MiaHeaderBar extends StatelessWidget {
  const MiaHeaderBar({
    super.key,
    this.title,
    this.overline,
    this.showBack = true,
    this.actions,
    this.onBack,
  });

  final String? title;
  final String? overline;
  final bool showBack;
  final List<Widget>? actions;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final double topInset = MediaQuery.paddingOf(context).top;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: AppBlur.panel, sigmaY: AppBlur.panel),
        child: Container(
          padding: EdgeInsets.only(
            top: topInset + getSize(8),
            bottom: getSize(12),
            left: getSize(16),
            right: getSize(16),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                withCustomOpacity(AppColors.ink, 0.72),
                withCustomOpacity(AppColors.ink, 0.18),
              ],
            ),
          ),
          child: Row(
            children: <Widget>[
              if (showBack)
                GlassIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  iconSize: 15,
                  semanticLabel: 'Back',
                  onTap: onBack ?? () => context.router.maybePop(),
                )
              else
                SizedBox(width: getSize(44)),
              Expanded(
                child: Column(
                  children: <Widget>[
                    if (overline != null)
                      BaseText(
                        overline!,
                        fontSize: 9,
                        textStyle: AppTypography.overline,
                        textColor: AppColors.ember,
                      ),
                    if (title != null)
                      BaseText(
                        title!,
                        fontSize: 17,
                        textStyle: AppTypography.titleSmall,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
              if (actions != null && actions!.isNotEmpty)
                Row(mainAxisSize: MainAxisSize.min, children: actions!)
              else
                SizedBox(width: getSize(44)),
            ],
          ),
        ),
      ),
    );
  }
}

/// Sticky frosted footer for primary screen actions.
class MiaBottomBar extends StatelessWidget {
  const MiaBottomBar({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: AppBlur.heavy, sigmaY: AppBlur.heavy),
        child: Container(
          padding:
              padding ??
              EdgeInsets.only(
                left: getSize(20),
                right: getSize(20),
                top: getSize(14),
                bottom: MediaQuery.paddingOf(context).bottom + getSize(14),
              ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                withCustomOpacity(AppColors.ink, 0.2),
                withCustomOpacity(AppColors.ink, 0.92),
              ],
            ),
            border: Border(top: BorderSide(color: AppColors.glassBorderSoft)),
          ),
          child: child,
        ),
      ),
    );
  }
}
