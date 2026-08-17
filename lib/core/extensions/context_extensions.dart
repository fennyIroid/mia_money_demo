import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';

extension BuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get screenHeight => MediaQuery.sizeOf(this).height;

  EdgeInsets get safeArea => MediaQuery.paddingOf(this);

  bool get prefersReducedMotion => MediaQuery.disableAnimationsOf(this);

  ThemeData get theme => Theme.of(this);
}
