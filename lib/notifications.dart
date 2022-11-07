import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  //объект уведомления - экземпляр
  late FlutterLocalNotificationsPlugin localNotifications;

//инициализация
  @override
  void initState() {
    super.initState();
    //объект для Android настроек
    const androidInitialize = AndroidInitializationSettings('ic_launcher');
    //объект для IOS настроек
    const iOSInitialize = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    // общая инициализация
    const initializationSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

    //мы создаем локальное уведомление
    localNotifications = FlutterLocalNotificationsPlugin();
    localNotifications.initialize(initializationSettings);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Нажми на кнопку, чтобы получить уведомление'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.notifications),
      ),
    );
  }
}
