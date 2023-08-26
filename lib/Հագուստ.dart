import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ClothesPage extends StatefulWidget {
  @override
  _ClothesPageState createState() => _ClothesPageState();
}

class _ClothesPageState extends State<ClothesPage> {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;
  int _selectedCardIndex = -1; // New variable to track selected card index

  List<String> headerImages = [
    'assets/bajheader.png',
    'assets/header.png',
    'assets/header1.png',
  ];

  List<String> departmentOptions = [
    'Բոլորը',
    'Երեկոյան զգեստներ',
    'Տաբատ',
    'Կիսաշրջազգեստ',

  ];
  String selectedDepartment = 'Բոլորը';

  List<DepartmentCardData> departmentCards = [
    DepartmentCardData(
        departmentName: 'Երեկոյան զգեստներ',
        imageUrls: [
          'assets/Հագուստ/1.jpg',
          'assets/Հագուստ/2.jpg',
          'assets/Հագուստ/3.jpg',

          // Add additional image URLs here
        ],
        price: 100,
        location: 'Location 1',
        description: """Վարձակալության է տրվում գրասենյակային տարածք Օպերայի հարևանությամբ՝ Մաշտոցի պողոտայում: Տարածքը գտնվում է նորակառույց շենքի 3-րդ հարկում, զբաղեցնում է 127 ք. Մ. Մակերես:
Շինության տիպը Պանելային
Նորակառույց Ոչ
Վերելակ Առկա է
Հարկերի քանակ 11
Հարկ 10 / 11
Սենյակների քանակ 2
Սանհանգույցների քանակ 1
Ընդհանուր մակերեսը 40 ք.մ.
Առաստաղի բարձրությունը 2,8 մ
Պատշգամբ Բաց պատշգամբ""" // Add description for the card
    ),
    DepartmentCardData(
        departmentName: 'Երեկոյան զգեստներ',
        imageUrls: [
          'assets/Հագուստ/4.jpg',
          'assets/Հագուստ/5.jpg',
          'assets/Հագուստ/6.jpg',

          // Add additional image URLs here
        ],
        price: 100,
        location: 'Location 1',
        description: """Վարձակալության է տրվում գրասենյակային տարածք Օպերայի հարևանությամբ՝ Մաշտոցի պողոտայում: Տարածքը գտնվում է նորակառույց շենքի 3-րդ հարկում, զբաղեցնում է 127 ք. Մ. Մակերես:
Շինության տիպը Պանելային
Նորակառույց Ոչ
Վերելակ Առկա է
Հարկերի քանակ 11
Հարկ 10 / 11
Սենյակների քանակ 2
Սանհանգույցների քանակ 1
Ընդհանուր մակերեսը 40 ք.մ.
Առաստաղի բարձրությունը 2,8 մ
Պատշգամբ Բաց պատշգամբ""" // Add description for the card
    ),
    DepartmentCardData(
        departmentName: 'Երեկոյան զգեստներ',
        imageUrls: [
          'assets/Հագուստ/7.jpg',
          'assets/Հագուստ/8.jpg',
          'assets/Հագուստ/9.jpg',

          // Add additional image URLs here
        ],
        price: 100,
        location: 'Location 1',
        description: """Վարձակալության է տրվում գրասենյակային տարածք Օպերայի հարևանությամբ՝ Մաշտոցի պողոտայում: Տարածքը գտնվում է նորակառույց շենքի 3-րդ հարկում, զբաղեցնում է 127 ք. Մ. Մակերես:
Շինության տիպը Պանելային
Նորակառույց Ոչ
Վերելակ Առկա է
Հարկերի քանակ 11
Հարկ 10 / 11
Սենյակների քանակ 2
Սանհանգույցների քանակ 1
Ընդհանուր մակերեսը 40 ք.մ.
Առաստաղի բարձրությունը 2,8 մ
Պատշգամբ Բաց պատշգամբ""" // Add description for the card
    ),


    DepartmentCardData(
        departmentName: 'Տաբատ',
        imageUrls: [
          'assets/Հագուստ/10.jpg',
          'assets/Հագուստ/11.jpg',
          'assets/Հագուստ/12.jpg',

          // Add additional image URLs here
        ],
        price: 100,
        location: 'Location 1',
        description: """Վարձակալության է տրվում գրասենյակային տարածք Օպերայի հարևանությամբ՝ Մաշտոցի պողոտայում: Տարածքը գտնվում է նորակառույց շենքի 3-րդ հարկում, զբաղեցնում է 127 ք. Մ. Մակերես:
Շինության տիպը Պանելային
Նորակառույց Ոչ
Վերելակ Առկա է
Հարկերի քանակ 11
Հարկ 10 / 11
Սենյակների քանակ 2
Սանհանգույցների քանակ 1
Ընդհանուր մակերեսը 40 ք.մ.
Առաստաղի բարձրությունը 2,8 մ
Պատշգամբ Բաց պատշգամբ""" // Add description for the card
    ),
    DepartmentCardData(
        departmentName: 'Տաբատ',
        imageUrls: [
          'assets/Հագուստ/13.jpg',
          'assets/Հագուստ/14.jpg',
          'assets/Հագուստ/15.jpg',

          // Add additional image URLs here
        ],
        price: 100,
        location: 'Location 1',
        description: """Վարձակալության է տրվում գրասենյակային տարածք Օպերայի հարևանությամբ՝ Մաշտոցի պողոտայում: Տարածքը գտնվում է նորակառույց շենքի 3-րդ հարկում, զբաղեցնում է 127 ք. Մ. Մակերես:
Շինության տիպը Պանելային
Նորակառույց Ոչ
Վերելակ Առկա է
Հարկերի քանակ 11
Հարկ 10 / 11
Սենյակների քանակ 2
Սանհանգույցների քանակ 1
Ընդհանուր մակերեսը 40 ք.մ.
Առաստաղի բարձրությունը 2,8 մ
Պատշգամբ Բաց պատշգամբ""" // Add description for the card
    ),
    DepartmentCardData(
        departmentName: 'Տաբատ',
        imageUrls: [
          'assets/Հագուստ/16.jpg',
          'assets/Հագուստ/17.jpg',
          'assets/Հագուստ/18.jpg',
          'assets/Հագուստ/19.jpg',

          // Add additional image URLs here
        ],
        price: 100,
        location: 'Location 1',
        description: """Վարձակալության է տրվում գրասենյակային տարածք Օպերայի հարևանությամբ՝ Մաշտոցի պողոտայում: Տարածքը գտնվում է նորակառույց շենքի 3-րդ հարկում, զբաղեցնում է 127 ք. Մ. Մակերես:
Շինության տիպը Պանելային
Նորակառույց Ոչ
Վերելակ Առկա է
Հարկերի քանակ 11
Հարկ 10 / 11
Սենյակների քանակ 2
Սանհանգույցների քանակ 1
Ընդհանուր մակերեսը 40 ք.մ.
Առաստաղի բարձրությունը 2,8 մ
Պատշգամբ Բաց պատշգամբ""" // Add description for the card
    ),

    DepartmentCardData(
        departmentName: 'Կիսաշրջազգեստ',
        imageUrls: [
          'assets/Հագուստ/20.jpg',
          'assets/Հագուստ/21.jpg',
          'assets/Հագուստ/22.jpg',


          // Add additional image URLs here
        ],
        price: 100,
        location: 'Location 1',
        description: """Վարձակալության է տրվում գրասենյակային տարածք Օպերայի հարևանությամբ՝ Մաշտոցի պողոտայում: Տարածքը գտնվում է նորակառույց շենքի 3-րդ հարկում, զբաղեցնում է 127 ք. Մ. Մակերես:
Շինության տիպը Պանելային
Նորակառույց Ոչ
Վերելակ Առկա է
Հարկերի քանակ 11
Հարկ 10 / 11
Սենյակների քանակ 2
Սանհանգույցների քանակ 1
Ընդհանուր մակերեսը 40 ք.մ.
Առաստաղի բարձրությունը 2,8 մ
Պատշգամբ Բաց պատշգամբ""" // Add description for the card
    ),
    DepartmentCardData(
        departmentName: 'Կիսաշրջազգեստ',
        imageUrls: [
          'assets/Հագուստ/24.jpg',
          'assets/Հագուստ/23.jpg',
          'assets/Հագուստ/22.jpg',


          // Add additional image URLs here
        ],
        price: 100,
        location: 'Location 1',
        description: """Վարձակալության է տրվում գրասենյակային տարածք Օպերայի հարևանությամբ՝ Մաշտոցի պողոտայում: Տարածքը գտնվում է նորակառույց շենքի 3-րդ հարկում, զբաղեցնում է 127 ք. Մ. Մակերես:
Շինության տիպը Պանելային
Նորակառույց Ոչ
Վերելակ Առկա է
Հարկերի քանակ 11
Հարկ 10 / 11
Սենյակների քանակ 2
Սանհանգույցների քանակ 1
Ընդհանուր մակերեսը 40 ք.մ.
Առաստաղի բարձրությունը 2,8 մ
Պատշգամբ Բաց պատշգամբ""" // Add description for the card
    ),

  ];

  @override
  void initState() {
    super.initState();
    // Start auto-sliding the header pictures
    _pageController = PageController();
    startAutoSlide();
  }

  @override
  void dispose() {
    // Dispose the page controller
    _pageController.dispose();
    super.dispose();
  }

  void startAutoSlide() {
    // Auto-slide the header pictures every 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      if (_currentPageIndex == headerImages.length - 1) {
        // If it's the last image, go back to the first image
        _currentPageIndex = 0;
      } else {
        // Go to the next image
        _currentPageIndex++;
      }
      // Animate to the next page
      _pageController.animateToPage(
        _currentPageIndex,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      // Start auto-slide again
      startAutoSlide();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200.0,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: headerImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        headerImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  Positioned(
                    top: 16.0,
                    left: 2.0,
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Positioned(
                    left: 0.0,
                    bottom: 0.0,
                    child: Container(
                      width: 300,
                      height: 40.0,
                      color: Color(0xFFD83232),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                          8,
                          8,
                          90,
                          8,
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Center(
                            child: Text(
                              'Հագուստ', // Updated text for Sale
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: departmentOptions.map((String department) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        department,
                        style: TextStyle(
                          color: selectedDepartment == department
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                      selected: selectedDepartment == department,
                      onSelected: (selected) {
                        setState(() {
                          selectedDepartment = department;
                        });
                      },
                      selectedColor: Color(0xFFD83232),
                      backgroundColor: Colors.grey.shade300,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 10.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: departmentCards
                  .where((card) =>
              selectedDepartment == 'Բոլորը' ||
                  card.departmentName == selectedDepartment)
                  .length,
              itemBuilder: (context, index) {
                DepartmentCardData card = departmentCards
                    .where((card) =>
                selectedDepartment == 'Բոլորը' ||
                    card.departmentName == selectedDepartment)
                    .toList()[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCardIndex = index;
                    });
                    navigateToDepartmentDetail(context, card);
                  },
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: 1.0,
                                  enlargeCenterPage: true,
                                ),
                                items: card.imageUrls.map((imageUrl) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width:
                                        MediaQuery.of(context).size.width,
                                        child: Image.asset(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              if (_selectedCardIndex == index)
                              // Show play icon if selected
                                Positioned(
                                  bottom: 8.0,
                                  right: 8.0,
                                  child: Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.blueAccent,
                                    size: 32.0,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price: \$${card.price}', // Add the dollar sign to the price
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  'Location: ${card.location}',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToDepartmentDetail(
      BuildContext context, DepartmentCardData departmentCard) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DepartmentDetailPage(
          departmentName: departmentCard.departmentName,
          imageUrls: departmentCard.imageUrls,
          price: departmentCard.price,
          location: departmentCard.location,
          description: departmentCard.description, // Pass the description
        ),
      ),
    );
  }
}

class DepartmentCardData {
  final String departmentName;
  final List<String> imageUrls;
  final int price;
  final String location;
  final String description; // New field for description

  DepartmentCardData({
    required this.departmentName,
    required this.imageUrls,
    required this.price,
    required this.location,
    required this.description, // Pass the description
  });
}

class DepartmentDetailPage extends StatefulWidget {
  final String departmentName;
  final List<String> imageUrls;
  final int price;
  final String location;
  final String description; // New field for description

  const DepartmentDetailPage({
    required this.departmentName,
    required this.imageUrls,
    required this.price,
    required this.location,
    required this.description, // Pass the description
  });

  @override
  _DepartmentDetailPageState createState() => _DepartmentDetailPageState();
}

class _DepartmentDetailPageState extends State<DepartmentDetailPage> {
  int _currentImageIndex = 0;

  void _selectImage(int index) {
    setState(() {
      _currentImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD83232),
        title: Text(widget.departmentName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'image_${widget.imageUrls[_currentImageIndex]}',
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ImageFullScreenPage(
                            imageUrl: widget.imageUrls[_currentImageIndex],
                          ),
                        ),
                      );
                    },
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity! > 0) {
                        // Swipe left
                        int prevIndex = _currentImageIndex - 1;
                        if (prevIndex < 0) {
                          prevIndex = widget.imageUrls.length - 1;
                        }
                        _selectImage(prevIndex);
                      } else if (details.primaryVelocity! < 0) {
                        // Swipe right
                        int nextIndex = _currentImageIndex + 1;
                        if (nextIndex >= widget.imageUrls.length) {
                          nextIndex = 0;
                        }
                        _selectImage(nextIndex);
                      }
                    },
                    child: Image.asset(
                      widget.imageUrls[_currentImageIndex],
                      fit: BoxFit.cover,
                      height: 300.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            GridView.builder(
              // Rest of the code remains the same...

              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6, // Adjust the number of images per row as needed
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _selectImage(index);
                  },
                  child: Hero(
                    tag: 'image_${widget.imageUrls[index]}',
                    child: Image.asset(
                      widget.imageUrls[index],
                      fit: BoxFit.cover,
                      color: _currentImageIndex == index ? Colors.grey : null,
                      colorBlendMode:
                      _currentImageIndex == index ? BlendMode.saturation : null,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 8.0),
            Text(
              'Price: \$${widget.price}', // Add the dollar sign to the price
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.green,
              ),
            ),
            Text(
              'Location: ${widget.location}',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Description:', // Display the description title
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Flexible( // Wrap SingleChildScrollView with Flexible
              child: SingleChildScrollView(
                child: Text(
                  widget.description, // Display the description text
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageFullScreenPage extends StatelessWidget {
  final String imageUrl;

  const ImageFullScreenPage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'image_$imageUrl',
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ClothesPage(),
  ));
}
