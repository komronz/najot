import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:najot/data/model/volunteering_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

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
        playSound: true

      ),
      iOS: IOSNotificationDetails(),
    );
  }
  static Future init({bool initScheduled=true}) async{
    final android =AndroidInitializationSettings("@drawable/najot_logo");
    final iOS =IOSInitializationSettings();
    final setting = InitializationSettings(android: android, iOS: iOS);

    await _notifications.initialize(
      setting,
      onSelectNotification: (payload) async {
        onNotification.add(payload);
      }
    );
    if(initScheduled){
      tz.initializeTimeZones();
      final locationName=await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));

    }

  }

  static Future showNotification({
    // required DateTime scheduledDate,
    int id=0,
    String? title,
    String? body,
    String? payload,
}) async => _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      // _scheduleDaily(Time(5, 01, 30)),
      // days: [DateTime.monday,DateTime.sunday]),
      await _notificationDetails(),
    payload: payload,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,

  );
  // static tz.TZDateTime _scheduleDaily(Time time){
  //   final now =tz.TZDateTime.now(tz.local);
  //   final scheduledDate=tz.TZDateTime(tz.local, now.year, now.month, now.day,
  //       time.hour, time.minute, time.second);
  //   return //scheduledDate.isBefore(now) ?
  //   scheduledDate.add(Duration(minutes: 1),);
  //   //: scheduledDate;
  // }
  // static tz.TZDateTime _scheduleWeekly(Time time,{required List<int> days}){
  //   tz.TZDateTime scheduledDate=_scheduleDaily(time);
  //   while(!days.contains(scheduledDate.weekday)){
  //     scheduledDate=scheduledDate.add(Duration(days: 1));
  //
  //   }
  //   return scheduledDate;
  //   }


}