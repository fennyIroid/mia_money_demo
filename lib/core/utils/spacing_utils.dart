import 'package:flutter/widgets.dart';

import 'math_utils.dart';

/// Vertical gap. Replaces every `SizedBox(height: ...)` in the app.
Widget verticalSpace(num value) => SizedBox(height: getSize(value));

/// Horizontal gap. Replaces every `SizedBox(width: ...)` in the app.
Widget horizontalSpace(num value) => SizedBox(width: getSize(value));

const Widget emptySpace = SizedBox.shrink();
