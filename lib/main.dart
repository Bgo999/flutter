import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SplashScreen.dart';
import 'HomeScreen.dart';

import '/Դիզայներական նյութեր.dart';
import '/Պայուսակներ.dart';
import '/Հագուստ.dart';
import '/Կոշիկներ.dart';
import '/Նորություններ.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:SplashPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/Դիզայներական նյութեր': (context) => DesignPage(),
        '/Պայուսակներ': (context) => ShoesPage(),
        '/Հագուստ': (context) => ClothesPage(),
        '/Կոշիկներ': (context) => AccessoriesPage(),
       '/Նորություններ': (context) => NewsPage(),

      },
    );
  }
}



// class SplashPage extends StatefulWidget {
//   @override
//   _SplashPageState createState() => _SplashPageState();
// }
//
// class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds:5),
//     );
//     _animationController.repeat(reverse: true);
//     // Simulate a delay to show the splash page for a few seconds
//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, '/home');
//     });
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/main_background.jpg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextLiquidFill(
//                 text: 'Welcome to Aramyanc Medical Center',
//                 waveColor: Colors.blue,
//                 boxBackgroundColor: Colors.white70,
//                 textStyle: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 boxHeight: 100,
//                 boxWidth: 300,
//               ),
//               SizedBox(height: 20),
//               RotationTransition(
//                 turns: Tween(begin: 0.0, end: 3.0).animate(_animationController),
//                 child: Icon(
//                   Icons.favorite,
//                   color: Colors.red,
//                   size: 50,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.5,
//             width:MediaQuery.of(context).size.width,
//             child: Image.asset(
//               'assets/headerpic_main.jpg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text("Find what you need"),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     child: Text('Doctors'),
//                     style: ElevatedButton.styleFrom(shape: StadiumBorder()),
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/doctors');
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     child: Text('News'),
//                     style: ElevatedButton.styleFrom(shape: StadiumBorder()),
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/news');
//                     },
//                   ),
//
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     child: Text('Doctors'),
//                     style: ElevatedButton.styleFrom(shape: StadiumBorder()),
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/doctors');
//                     },
//                   ),
//
//                   SizedBox(height:10),
//                   ElevatedButton(
//                     child: Text('Doctors'),
//                     style: ElevatedButton.styleFrom(shape: StadiumBorder()),
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/doctors');
//                     },
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//
//                     child: Text('Բժիշկներ',
//
//                       style: TextStyle(fontSize: 18,
//                           color: Colors.black)
//                       ,),
//                     style:  ElevatedButton.styleFrom(
//                       minimumSize: Size(100, 40),
//                       primary: Colors.white,
//                       shape: StadiumBorder(),
//                       side: BorderSide(color: Colors.black26, width: 2),
//                     ),
//                     onPressed: () {
//                       onHover: (value) {  };
//                       Navigator.pushNamed(context, '/doctors');
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               IconButton(
//                 icon: Icon(Icons.phone),
//                 onPressed: () {
//                   _launchPhone();
//                 },
//               ),
//               IconButton(
//                 icon: Image.asset('assets/viber_icon.png'),
//                 onPressed: () {
//                   _launchViber();
//                 },
//               ),
//               IconButton(
//                 icon: Image.asset('assets/whatsapp_icon.png'),
//                 onPressed: () {
//                   _launchWhatsApp();
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _launchPhone() async {
//     String phoneNumber = '1234567890'; // Replace with your phone number
//     String url = 'tel:$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchViber() async {
//     String phoneNumber = '1234567890'; // Replace with your phone number
//     String url = 'viber://add?number=$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchWhatsApp() async {
//     String phoneNumber = '1234567890'; // Replace with your phone number
//     String url = 'https://wa.me/$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }

// class DoctorsPage extends StatelessWidget {
//   final List<Doctor> doctors = [
//     Doctor(
//       name: 'Dr. John Doe',
//       position: 'Cardiologist',
//       imagePath: 'assets/doctor1.jpg',
//       phoneNumber: '1111111111',
//     ),
//     Doctor(
//       name: 'Dr. Jane Smith',
//       position: 'Dermatologist',
//       imagePath: 'assets/doctor2.jpg',
//       phoneNumber: '2222222222',
//     ),
//     Doctor(
//       name: 'Dr. David Johnson',
//       position: 'Orthopedic Surgeon',
//       imagePath: 'assets/doctor3.jpg',
//       phoneNumber: '3333333333',
//     ),
//     Doctor(
//       name: 'Dr. Sarah Williams',
//       position: 'Pediatrician',
//       imagePath: 'assets/doctor4.jpg',
//       phoneNumber: '4444444444',
//     ),
//     Doctor(
//       name: 'Dr. John Doe',
//       position: 'Cardiologist',
//       imagePath: 'assets/doctor1.jpg',
//       phoneNumber: '1111111111',
//     ),
//     Doctor(
//       name: 'Dr. Jane Smith',
//       position: 'Dermatologist',
//       imagePath: 'assets/doctor2.jpg',
//       phoneNumber: '2222222222',
//     ),
//     Doctor(
//       name: 'Dr. David Johnson',
//       position: 'Orthopedic Surgeon',
//       imagePath: 'assets/doctor3.jpg',
//       phoneNumber: '3333333333',
//     ),
//     Doctor(
//       name: 'Dr. Sarah Williams',
//       position: 'Pediatrician',
//       imagePath: 'assets/doctor4.jpg',
//       phoneNumber: '4444444444',
//     ),
//     Doctor(
//       name: 'Dr. John Doe',
//       position: 'Cardiologist',
//       imagePath: 'assets/doctor1.jpg',
//       phoneNumber: '1111111111',
//     ),
//     Doctor(
//       name: 'Dr. Jane Smith',
//       position: 'Dermatologist',
//       imagePath: 'assets/doctor2.jpg',
//       phoneNumber: '2222222222',
//     ),
//     Doctor(
//       name: 'Dr. David Johnson',
//       position: 'Orthopedic Surgeon',
//       imagePath: 'assets/doctor3.jpg',
//       phoneNumber: '3333333333',
//     ),
//     Doctor(
//       name: 'Dr. Sarah Williams',
//       position: 'Pediatrician',
//       imagePath: 'assets/doctor4.jpg',
//       phoneNumber: '4444444444',
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Doctors'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.phone),
//             onPressed: () {
//               _launchPhone();
//             },
//           ),
//           IconButton(
//             icon: Image.asset('assets/viber_icon.png'),
//             onPressed: () {
//               _launchViber();
//             },
//           ),
//           IconButton(
//             icon: Image.asset('assets/whatsapp_icon.png'),
//             onPressed: () {
//               _launchWhatsApp();
//             },
//           ),
//         ],
//       ),
//       body: GridView.builder(
//         padding: EdgeInsets.all(16.0),
//         itemCount: doctors.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16.0,
//           mainAxisSpacing: 16.0,
//         ),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               _showDoctorDetails(context, doctors[index]);
//             },
//             child: Card(
//               elevation: 4.0,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     doctors[index].imagePath,
//                     width: 80,
//                     height: 80,
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(
//                     doctors[index].name,
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 4.0),
//                   Text(doctors[index].position),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   void _showDoctorDetails(BuildContext context, Doctor doctor) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(doctor.name),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Position: ${doctor.position}'),
//               SizedBox(height: 8),
//               Text('Additional information about the doctor goes here...'),
//             ],
//           ),
//           actions: [
//             TextButton(
//               child: Text('Close'),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.phone),
//               onPressed: () {
//                 _launchPhone();
//               },
//             ),
//             IconButton(
//               icon: Image.asset('assets/viber_icon.png'),
//               onPressed: () {
//                 _launchViber();
//               },
//             ),
//             IconButton(
//               icon: Image.asset('assets/whatsapp_icon.png'),
//               onPressed: () {
//                 _launchWhatsApp();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _launchPhone() async {
//     String phoneNumber = '1234567890'; // Replace with your phone number
//     String url = 'tel:$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchViber() async {
//     String phoneNumber = '1234567890'; // Replace with your phone number
//     String url = 'viber://add?number=$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchWhatsApp() async {
//     String phoneNumber = '1234567890'; // Replace with your phone number
//     String url = 'https://wa.me/$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchDoctorPhone(String phoneNumber) async {
//     String url = 'tel:$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchDoctorViber(String phoneNumber) async {
//     String url = 'viber://add?number=$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchDoctorWhatsApp(String phoneNumber) async {
//     String url = 'https://wa.me/$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }

// class NewsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.phone),
//             onPressed: () {
//               _launchPhone();
//             },
//           ),
//           IconButton(
//             icon: Image.asset('assets/viber_icon.png'),
//             onPressed: () {
//               _launchViber();
//             },
//           ),
//           IconButton(
//             icon: Image.asset('assets/whatsapp_icon.png'),
//             onPressed: () {
//               _launchWhatsApp();
//             },
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           ListTile(
//             leading: Image.asset('assets/news_image1.jpg'),
//             title: Text('News 1'),
//             subtitle: Text('News details go here...'),
//           ),
//           ListTile(
//             leading: Image.asset('assets/news_image2.jpg'),
//             title: Text('News 2'),
//             subtitle: Text('News details go here...'),
//           ),
//           ListTile(
//             leading: Image.asset('assets/news_image3.jpg'),
//             title: Text('News 3'),
//             subtitle: Text('News details go here...'),
//           ), ListTile(
//             leading: Image.asset('assets/news_image3.jpg'),
//             title: Text('News 3'),
//             subtitle: Text('News details go here...'),
//           ),
//           ListTile(
//             leading: Image.asset('assets/news_image3.jpg'),
//             title: Text('News 3'),
//             subtitle: Text('News details go here...'),
//           ),
//           ListTile(
//             leading: Image.asset('assets/news_image1.jpg'),
//             title: Text('News 1'),
//             subtitle: Text('News details go here...'),
//           ),
//           ListTile(
//             leading: Image.asset('assets/news_image2.jpg'),
//             title: Text('News 2'),
//             subtitle: Text('News details go here...'),
//           ),
//           ListTile(
//             leading: Image.asset('assets/news_image3.jpg'),
//             title: Text('News 3'),
//             subtitle: Text('News details go here...'),
//           ), ListTile(
//             leading: Image.asset('assets/news_image3.jpg'),
//             title: Text('News 3'),
//             subtitle: Text('News details go here...'),
//           ),
//           ListTile(
//             leading: Image.asset('assets/news_image3.jpg'),
//             title: Text('News 3'),
//             subtitle: Text('News details go here...'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _launchPhone() async {
//     String phoneNumber = '093313363'; // Replace with your phone number
//     String url = 'tel:$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchViber() async {
//     String phoneNumber = '093313363'; // Replace with your phone number
//     String url = 'viber://add?number=$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
//   void _launchWhatsApp() async {
//     String phoneNumber = '1234567890'; // Replace with your phone number
//     String url = 'https://wa.me/$phoneNumber';
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }


