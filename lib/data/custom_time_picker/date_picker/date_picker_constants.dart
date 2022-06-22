/// Selected value of DatePicker.
typedef DateValueCallback = dynamic Function(
    DateTime dateTime, List<int> selectedIndex);

/// Pressed cancel callback.
typedef DateVoidCallback = void Function();

/// Default value of minimum datetime.
const String datePickerMinDatetime = "1900-01-01 00:00:00";

/// Default value of maximum datetime.
const String datePickerMaxDatetime = "2100-12-31 23:59:59";

/// Default value of date format
const String datetimePickerDateFormat = 'yyyy-MMM-dd';

/// Default value of time format
const String datetimePickerTimeFormat = 'HH:mm:ss';

/// Default value of datetime format
const String datetimePickerDatetimeFormat = 'yyyyMMdd HH:mm:ss';
