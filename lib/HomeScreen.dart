import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedButtonIndex = -1;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    await requestNotificationPermission();
  }


  Future<void> requestNotificationPermission() async {
    final status = await Permission.notification.request();
    if (status.isDenied) {
      throw 'Permission to access notifications is required';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Image.asset(
                    'assets/bajheader.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 10,
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 110,
                  child: Text(
                    '  ԱՄՈՌԵ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                children: [
                  buildButton(
                    index: 0,
                    title: 'Դիզայներական նյութեր',
                    onPressed: () {
                      Navigator.pushNamed(context, '/Դիզայներական նյութեր');
                    },
                  ),
                  SizedBox(height: 10),
                  buildButton(
                    index: 1,
                    title: 'Պայուսակներ',
                    onPressed: () {
                      Navigator.pushNamed(context, '/Պայուսակներ');
                    },
                  ),
                  SizedBox(height: 10),
                  buildButton(
                    index: 2,
                    title: 'Հագուստ',
                    onPressed: () {
                      Navigator.pushNamed(context, '/Հագուստ');
                    },
                  ),
                  SizedBox(height: 10),
                  buildButton(
                    index: 3,
                    title: 'Կոշիկներ',
                    onPressed: () {
                      Navigator.pushNamed(context, '/Կոշիկներ');
                    },
                  ),
                  SizedBox(height: 10),
                  buildButton(
                    index: 4,
                    title: 'Նորություններ',
                    onPressed: () {
                      Navigator.pushNamed(context, '/Նորություններ');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 410,
              height: 200,
              child: Image.asset(
                'assets/mainseconpic.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.grey[200],
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'ԿԱՊ ՄԵԶ ՀԵՏ',
                      style: TextStyle(
                        color: Color(0xFFD83232),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          launchWhatsApp('1234567890');
                        },
                        icon: Image.asset(
                          'assets/whatsapp.png',
                          height: 350,
                          width: 350,
                        ),
                        color: Colors.green,
                      ),
                      IconButton(
                        onPressed: () {
                          launchViber('1234567890');
                        },
                        icon: Image.asset(
                          'assets/viber.png',
                          height: 120,
                          width: 120,
                        ),
                        color: Colors.green,
                      ),
                      IconButton(
                        onPressed: () {
                          launchPhoneCall('1234567890');
                        },
                        icon: Image.asset(
                          'assets/call.png',
                          height: 220,
                          width: 220,
                        ),
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Address: 123 Medical Center Street, City',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      launchWebsite('https://www.medicalcenter.com');
                    },
                    child: Text(
                      'Website: www.medicalcenter.com',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  InkWell(
                    onTap: () {
                      launchEmail('medicalcenter@gmail.com');
                    },
                    child: Text(
                      'Email: medicalcenter@gmail.com',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton({
    required int index,
    required String title,
    required VoidCallback onPressed,
  }) {
    final isSelected = index == selectedButtonIndex;

    return MouseRegion(
      onHover: (_) {
        if (!isSelected) {
          setState(() {
            selectedButtonIndex = index;
          });
        }
      },
      onExit: (_) {
        if (!isSelected) {
          setState(() {
            selectedButtonIndex = -1;
          });
        }
      },
      child: SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            primary: isSelected ? Color(0xFFD83232) : Colors.white,
            shape: RoundedRectangleBorder(),
          ),
          onPressed: () {
            setState(() {
              selectedButtonIndex = index;
            });
            onPressed();
          },
        ),
      ),
    );
  }

  Future<void> sendNotificationBasedOnLocation(
      double userLat, double userLong) async {
    // Specify the target location coordinates
    double targetLat = 40.393299;
    double targetLong = 44.672329;

    // Calculate the distance between user and target location
    double distanceInMeters = await Geolocator.distanceBetween(
      userLat,
      userLong,
      targetLat,
      targetLong,
    );

    // Set a range (for example, 1000 meters) to trigger the notification
    double notificationRangeInMeters = 1000;

    if (distanceInMeters <= notificationRangeInMeters) {
      // Show a notification when the user is within the specified range
      await _showNotification();
    }
  }

  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',

      importance: Importance.high,
      priority: Priority.high,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'You are near the target location!',
      'Tap to open the app and check out the details.',
      platformChannelSpecifics,
      payload: 'notification_payload',
    );
  }





  void launchWhatsApp(String phoneNumber) async {
    // Your existing WhatsApp launching code...
    // ...

    // Send location-based notification
    Position userPosition = await Geolocator.getCurrentPosition();
    await sendNotificationBasedOnLocation(
      userPosition.latitude,
      userPosition.longitude,
    );
  }

  void launchPhoneCall(String phoneNumber) async {
    // Your existing phone call launching code...
    // ...

    // Send location-based notification
    Position userPosition = await Geolocator.getCurrentPosition();
    await sendNotificationBasedOnLocation(
      userPosition.latitude,
      userPosition.longitude,
    );
  }

  void launchWebsite(String url) async {
    // Your existing website launching code...
    // ...

    // Send location-based notification
    Position userPosition = await Geolocator.getCurrentPosition();
    await sendNotificationBasedOnLocation(
      userPosition.latitude,
      userPosition.longitude,
    );
  }

  void launchViber(String phoneNumber) async {
    // Your existing Viber launching code...
    // ...

    // Send location-based notification
    Position userPosition = await Geolocator.getCurrentPosition();
    await sendNotificationBasedOnLocation(
      userPosition.latitude,
      userPosition.longitude,
    );
  }

  void launchEmail(String email) async {
    // Your existing email launching code...
    // ...

    // Send location-based notification
    Position userPosition = await Geolocator.getCurrentPosition();
    await sendNotificationBasedOnLocation(
      userPosition.latitude,
      userPosition.longitude,
    );
  }
}
