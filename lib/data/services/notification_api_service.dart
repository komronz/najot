import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:najot/data/utils/app_validations.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationApiService {
  static final BehaviorSubject onNotification = BehaviorSubject<String?>();
  static late final FlutterLocalNotificationsPlugin _notifications;

  static Future requestPermissions() async {
    await _notifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    await _notifications
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: "channel description",
        importance: Importance.max,
        fullScreenIntent: true,
        autoCancel: true,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future init({bool initScheduled = true}) async {
    _notifications = FlutterLocalNotificationsPlugin();
    final AndroidInitializationSettings android =
        AndroidInitializationSettings("@drawable/najot_logo");
    final DarwinInitializationSettings iOS = DarwinInitializationSettings();
    final InitializationSettings setting =
        InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(setting,
        onDidReceiveNotificationResponse: (payload) async {
      onNotification.add(payload);
    });
    if (initScheduled) {
      tz.initializeTimeZones();
      // final String locationName = await FlutterNativeTimezone.getLocalTimezone();
      // tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future showNotification({
    DateTime? scheduledDate,
    int? id,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.zonedSchedule(
        createUniqueId(),
        title,
        body,
        _scheduleDaily(scheduledDate!),
        await notificationDetails(),
        payload: payload,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dateAndTime,
        // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        // days: [DateTime.monday,DateTime.sunday]),
      );

  static tz.TZDateTime _scheduleDaily(DateTime time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(tz.local, time.year, time.month,
        time.day, time.hour, time.minute, time.second);
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(seconds: 0))
        : scheduledDate;
  }

  static Future<void> cancelNotification() async {
    await _notifications.cancel(createUniqueId());
  }

  static void cancelAll(int id) => _notifications.cancelAll();

  ///Change later
  ///
// static tz.TZDateTime _scheduleWeekly(DateTime time, {required List<int> days}){
//   tz.TZDateTime scheduledDate=_scheduleDaily(time);
//   while(!days.contains(scheduledDate.weekday)){
//     scheduledDate=scheduledDate.add(Duration(days: 1));
//   }
//   return scheduledDate;
//   }
}
