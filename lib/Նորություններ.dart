import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<Article> articles = [

    Article(
      name: 'Հանրապետությունում ծնունդների թիվն աճել է',
      imageUrl: 'assets/news2.png', // Replace with the path to your local image
      content: 'This is the content of Article 1.',
    ),
    Article(
      name: 'Ծերացման ընթացը հնարավոր է դադարեցնել',
      imageUrl: 'assets/news3.png', // Replace with the path to your local image
      content: 'This is the content of Article 2.',
    ),


    Article(
      name: '«Բժշկության առաջնորդություն» ծրագրի մասնակից-դասընթացավար ',
      imageUrl: 'assets/news3.png', // Replace with the path to your local image
      content: 'This is the content of Article 1.',
    ),
    Article(
      name: 'Մեծահասակ մարդիկ ավելի շատ են վախենում թուլամտությունից, քան քաղցկեղից',
      imageUrl: 'assets/news4.png', // Replace with the path to your local image
      content: 'This is the content of Article 2.',
    ),


    Article(
      name: '«Բժշկության առաջնորդություն» ծրագրի մասնակից-դասընթացավար ',
      imageUrl: 'assets/news5.png', // Replace with the path to your local image
      content: 'This is the content of Article 1.',
    ),
    Article(
      name: 'Article 2',
      imageUrl: 'assets/news6.png', // Replace with the path to your local image
      content: 'This is the content of Article 2.',
    ),



    Article(
      name: 'Article 1',
      imageUrl: 'assets/news7.png', // Replace with the path to your local image
      content: 'This is the content of Article 1.',
    ),
    Article(
      name: 'Article 2',
      imageUrl: 'assets/news8.png', // Replace with the path to your local image
      content: 'This is the content of Article 2.',
    ),


    // Add more articles here
  ];

  bool showInfoContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: AppBar(
          title: Text('Նորություններ'),
          backgroundColor:Color(0xFFD83232),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollEndNotification &&
              notification.metrics.atEdge &&
              notification.metrics.pixels != 0) {
            setState(() {
              showInfoContainer = true;
            });
          } else if (notification is ScrollStartNotification &&
              notification.metrics.atEdge &&
              notification.metrics.pixels == 0) {
            setState(() {
              showInfoContainer = false;
            });
          }
          return false;
        },
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ArticlePage(article: articles[index]),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Flexible(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              articles[index].imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 4.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFD83232).withOpacity(0.7),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            articles[index].name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (showInfoContainer)
              Container(
                height: 150,
                color: Colors.grey[200],
                padding: EdgeInsets.all(5),
                child: Center(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              launchWhatsApp('1234567890');
                            },
                            icon: Image.asset('assets/whatsapp.png'),
                            color: Colors.green,
                          ),
                          IconButton(
                            onPressed: () {
                              launchViber('1234567890');
                            },
                            icon: Image.asset('assets/viber.png'),
                            color: Colors.green,
                          ),
                          IconButton(
                            onPressed: () {
                              launchPhoneCall('1234567890');
                            },
                            icon: Image.asset('assets/call.png'),
                            color: Colors.blue,
                          ),
                        ],
                      ),

                      SizedBox(height: 2.0),
                      Center(
                        child: Text(
                          'Address: 123 Medical Center Street, City',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.0),
                      InkWell(
                        onTap: () {
                          launchWebsite('https://www.medicalcenter.com');
                        },
                        child: Center(
                          child: Text(
                            'Website: www.medicalcenter.com',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.0),
                      InkWell(
                        onTap: () {
                          launchEmail('medicalcenter@gmail.com');
                        },
                        child: Center(
                          child: Text(
                            'Email: medicalcenter@gmail.com',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.0),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }




  void launchWhatsApp(String phoneNumber) async {
    String url = 'https://wa.me/$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final status = await Permission.phone.request();
      if (status.isGranted) {
        await launch(url);
      } else {
        throw 'Permission to make phone calls is required';
      }
    }
  }
  void launchPhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final status = await Permission.phone.request();
      if (status.isGranted) {
        await launch(url);
      } else {
        throw 'Permission to make phone calls is required';
      }
    }
  }
  void launchWebsite(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      final status = await Permission.notification.request();
      if (status.isGranted) {
        await launch(url);
      } else {
        throw 'Permission to access notifications is required';
      }
    }
  }
  void launchViber(String phoneNumber) async {
    String viberUrl = 'viber://add?number=$phoneNumber';
    String fallbackUrl = 'https://viber.com/dl';

    try {
      if (await canLaunch(viberUrl)) {
        await launch(viberUrl);
      } else {
        await launch(fallbackUrl);
      }
    } catch (e) {
      throw 'Could not launch Viber';
    }
  }
  void launchEmail(String email) async {
    String url = 'mailto:$email';
    String fallbackUrl = 'https://mail.google.com/';

    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        await launch(fallbackUrl);
      }
    } catch (e) {
      throw 'Could not launch Email app';
    }
  }




}

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: AppBar(
          title: Text(article.name),
          backgroundColor: Color(0xFFD83232),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200.0, // Specify the desired height
              child: Image.asset(
                article.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.content,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

// Rest of the code remains the same
}



class Article {
  final String name;
  final String imageUrl;
  final String content;

  Article({
    required this.name,
    required this.imageUrl,
    required this.content,
  });
}

