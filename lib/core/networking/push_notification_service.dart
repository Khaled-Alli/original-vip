import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {

  static Future<Map<String, dynamic>> loadServiceAccountFromAssets() async {
    final jsonStr = await rootBundle.loadString('assets/credentials/service_account.json');
    return json.decode(jsonStr);
  }

  static Future<String> getAccessToken() async {
      final serverAccessToken = await loadServiceAccountFromAssets();
      List<String> scopes = [
      'https://www.googleapis.com/auth/firebase.messaging',
      'https://www.googleapis.com/auth/cloud-platform'
    ];
      http.Client client =  await auth.clientViaServiceAccount(auth.ServiceAccountCredentials.fromJson(serverAccessToken), scopes,);
      auth.AccessCredentials credentials = await auth.obtainAccessCredentialsViaServiceAccount(auth.ServiceAccountCredentials.fromJson(serverAccessToken), scopes, client,);
      client.close();
     return credentials.accessToken.data;

  }

  static Future<void> sendNotificationToAdmins() async {
    final String serverAccessToken = await getAccessToken();
    final String url = 'https://fcm.googleapis.com/v1/projects/original-vip/messages:send';

    final Map<String, dynamic> notification = {
      'message': {
        'topic': 'admin',
        'notification': {
          'title': "طلب جديد",
          'body': "لديك طلب جديد معلق",
        },
      },
    };

     await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $serverAccessToken',
      },
      body: jsonEncode(notification),
    );

  }

}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> setupNotificationChannel() async {
  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'default_channel', // id
    'Default Notifications', // name
    description: 'This channel is used for default notifications',
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
}