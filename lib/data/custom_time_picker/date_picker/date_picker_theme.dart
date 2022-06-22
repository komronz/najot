import 'package:flutter/material.dart';

/// Default value of DatePicker's background color.
const datetimePickerBackgroundColor = Colors.white;

/// Default value of whether show title widgets or not.
const datetimePickerShowTitleDefault = true;

/// Default value of DatePicker's height.
const double datetimePickerHeight = 160.0;

/// Default value of DatePicker's title height.
const double datetimePickerTitleHeight = 36.0;

/// Default value of DatePicker's column height.
const double datetimePickerItemHeight = 36.0;

/// Default value of DatePicker's item [TextStyle].
const TextStyle datetimePickerItemTextStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

const Color datetimePickerItemTextColor = Colors.black;
const double datetimePickerItemTextSizeSmall = 15;
const double datetimePickerItemTextSizeBig = 17;

/// To support both stable and beta channels until
/// 'DiagnosticableMixin' is officially deprecated.
class DateTimePickerTheme {
  final cancelDefault = const Text('OK');

  /// DateTimePicker theme.
  ///
  /// [backgroundColor] DatePicker's background color.
  /// [cancelTextStyle] Default cancel widgets's [TextStyle].
  /// [confirmTextStyle] Default confirm widgets's [TextStyle].
  /// [cancel] Custom cancel widgets.
  /// [confirm] Custom confirm widgets.
  /// [title] Custom title widgets. If specify a title widgets, the cancel and confirm widgets will not display. Must set [titleHeight] value for custom title widgets.
  /// [showTitle] Whether display title widgets or not. If set false, the default cancel and confirm widgets will not display, but the custom title widgets will display if had specified one custom title widgets.
  /// [pickerHeight] The value of DatePicker's height.
  /// [titleHeight] The value of DatePicker's title height.
  /// [itemHeight] The value of DatePicker's column height.
  /// [itemTextStyle] The value of DatePicker's column [TextStyle].
  const DateTimePickerTheme({
    this.backgroundColor = datetimePickerBackgroundColor,
    this.cancelTextStyle,
    this.confirmTextStyle,
    this.cancel,
    this.confirm,
    this.title,
    this.showTitle = datetimePickerShowTitleDefault,
    this.pickerHeight = datetimePickerHeight,
    this.titleHeight = datetimePickerTitleHeight,
    this.itemHeight = datetimePickerItemHeight,
    this.itemTextStyle = datetimePickerItemTextStyle,
    this.dividerColor,
  });

  static const DateTimePickerTheme defaultT = DateTimePickerTheme();

  /// DatePicker's background color.
  final Color backgroundColor;

  /// Default cancel widgets's [TextStyle].
  final TextStyle? cancelTextStyle;

  /// Default confirm widgets's [TextStyle].
  final TextStyle? confirmTextStyle;

  /// Custom cancel [Widget].
  final Widget? cancel;

  /// Custom confirm [Widget].
  final Widget? confirm;

  /// Custom title [Widget]. If specify a title widgets, the cancel and confirm widgets will not display.
  final Widget? title;

  /// Whether display title widgets or not. If set false, the default cancel and confirm widgets will not display, but the custom title widgets will display if had specified one custom title widgets.
  final bool showTitle;

  /// The value of DatePicker's height.
  final double pickerHeight;

  /// The value of DatePicker's title height.
  final double titleHeight;

  /// The value of DatePicker's column height.
  final double itemHeight;

  /// The value of DatePicker's column [TextStyle].
  final TextStyle itemTextStyle;

  /// The value of DatePicker's Divider Color [TextStyle].
  final Color? dividerColor;
}
