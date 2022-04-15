import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationApi{
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotification = BehaviorSubject<String?>();


  static Future _notificationDetails() async{
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: "channel description",
        importance: Importance.max,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
  static Future init({bool initScheduled=false}) async{
    final android =AndroidInitializationSettings("@drawable/najot_logo");
    final iOS =IOSInitializationSettings();
    final setting = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(
      setting,
      onSelectNotification: (payload) async {
        onNotification.add(payload);

      }

    );

  }

  static Future showNotification({
    required DateTime scheduledDate,
    int id=0,
    String? title,
    String? body,
    String? payload,
}) async => _notifications.zonedSchedule(
      id,
      title,
      body,
      _scheduleDaily(Time(8)),
      await _notificationDetails(),
    payload: payload,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time
  );
  static tz.TZDateTime _scheduleDaily(Time time){
    final now =tz.TZDateTime.now(tz.local);
    final scheduleDate=tz.TZDateTime(tz.local, now.year, now.month, now.day,
        time.hour, time.minute, time.second);
    return scheduleDate.isBefore(now) ? scheduleDate.add(Duration(days: 1)): scheduleDate;


  }
}