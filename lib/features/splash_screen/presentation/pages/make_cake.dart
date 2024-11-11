import 'package:flutter/material.dart';

class CakeOption extends StatefulWidget {
  final Image image;
  final String title;
  final String price;

  const CakeOption({
    super.key,
    required this.title,
    required this.price,
    required this.image,
  });

  @override
  State<CakeOption> createState() => _CakeOptionState();
}

class _CakeOptionState extends State<CakeOption> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.image,
          const SizedBox(height: 5),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            widget.price,
            style: TextStyle(
              color: Colors.purple[400],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class BakingPage extends StatefulWidget {
  static String routeName = 'bake_page';

  @override
  State<BakingPage> createState() => _BakingPageState();
}

class _BakingPageState extends State<BakingPage> {
  String selectedOption = '';
  bool isDetailVisible = false;

  // متغيرات لتخزين الخيارات المختارة
  String? selectedCakeImage;
  String? selectedCakePrice;
  String? selectedShape;
  String? selectedFlavor;
  String? selectedColor;
  String? selectedToppings;

  final List<Map<String, dynamic>> cakes = [
    {
      'title': 'Mini Standard',
      'price': '190 SAR',
      'image': 'assets/images/images.jpg',
    },
    {
      'title': 'Mini Heart',
      'price': '220 SAR',
      'image': 'assets/images/images.jpg',
    },
    {
      'title': 'Standard Cake',
      'price': '240 SAR',
      'image': 'assets/images/images.jpg',
    },
    {
      'title': 'Heart Cake',
      'price': '230 SAR',
      'image': 'assets/images/images.jpg',
    },
  ];

  Widget _buildShapeContent() {
    return GridView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: cakes.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedShape = cakes[index]['title'];
              selectedCakeImage = cakes[index]['image'];
              selectedCakePrice = cakes[index]['price'];
            });
          },
          child: CakeOption(
            title: cakes[index]['title'] ?? '',
            price: cakes[index]['price'] ?? '',
            image: Image.asset(cakes[index]['image']),
          ),
        );
      },
    );
  }

  Widget _buildFlavorContent() {
    List<String> flavors = [
      'Vanilla',
      'Chocolate',
      'Red Velvet',
      'Strawberry',
      'Caramel',
      'Coffee'
    ];
    List<String> flavorImages = [
      'assets/images/cake.jpg',
      'assets/images/cake.jpg',
      'assets/images/istockphoto.jpg',
      'assets/images/cake.jpg',
      'assets/images/cake.jpg',
      'assets/images/istockphoto.jpg'
    ];

    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedFlavor = flavors[index];
              selectedCakeImage = flavorImages[index];
            });
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  flavorImages[index],
                  height: 40,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(flavors[index]),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildToppingsScreen() {
    Widget _buildFlavorContent(
        List<String> flavors, List<String> flavorImages) {
      return GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: flavors.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // هنا ممكن تضيفي الأكشن اللي عايزة تعمليه لما المستخدم يختار النكهة
            },
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    flavorImages[index],
                    height: 40,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Text(flavors[index]),
                ],
              ),
            ),
          );
        },
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Customize"),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Retro'),
              Tab(text: 'Memes'),
              Tab(text: 'Birthday'),
              Tab(text: 'Ribbon'),
            ],
            labelColor: Colors.purple,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.purple,
          ),
        ),
        body: TabBarView(
          children: [
            _buildFlavorContent(
              ['Vanilla', 'Chocolate'],
              ['assets/images/cake.jpg', 'assets/images/cake.jpg'],
            ),
            _buildFlavorContent(
              ['Red Velvet', 'Strawberry'],
              ['assets/images/istockphoto.jpg', 'assets/images/cake.jpg'],
            ),
            _buildFlavorContent(
              ['Caramel', 'Coffee'],
              ['assets/images/cake.jpg', 'assets/images/istockphoto.jpg'],
            ),
            _buildFlavorContent(
              ['Special 1', 'Special 2'],
              ['assets/images/cake.jpg', 'assets/images/cake.jpg'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorContent() {
    List<String> colors = ['Red', 'Blue', 'Green', 'Yellow', 'Pink', 'Purple'];

    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedColor = colors[index];
            });
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index],
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(height: 8),
                Text(colors[index]),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildToppingsContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            selectedToppings = value;
          });
        },
        decoration: InputDecoration(
          labelText: 'Add Toppings/Message',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSelectedContent() {
    switch (selectedOption) {
      case 'Shape':
        return _buildShapeContent();
      case 'Flavor':
        return _buildFlavorContent();
      case 'Color':
        return _buildColorContent();
      case 'Toppings':
        return buildToppingsScreen();
      case 'Write':
        return _buildToppingsContent();
      default:
        return _buildShapeContent();
    }
  }

  Widget _buildMenuItem(IconData icon, String label) {
    bool isSelected = selectedOption == label;

    return InkWell(
      onTap: () {
        setState(() {
          selectedOption = label;
          isDetailVisible = true;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple[300] : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 25),
            SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customize"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // عرض اللون المختار هنا
                if (selectedColor != null)
                  Text(
                    selectedColor ?? '', // عرض اللون المختار
                    style: TextStyle(
                      color: selectedColor != null
                          ? (selectedColor == 'Red'
                              ? Colors.red
                              : selectedColor == 'Blue'
                                  ? Colors.blue
                                  : selectedColor == 'Green'
                                      ? Colors.green
                                      : selectedColor == 'Yellow'
                                          ? Colors.yellow
                                          : selectedColor == 'Pink'
                                              ? Colors.pink
                                              : Colors.purple)
                          : Colors.black,
                      // تأكيد اللون المناسب بناءً على الاختيار
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                SizedBox(width: 10),
                Text(
                  selectedCakePrice ?? 'SAR 0',
                  style: TextStyle(color: Colors.purple[400]),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // الجزء العلوي لعرض صورة الكيكه
          if (selectedCakeImage != null)
            Positioned(
              left: 0,
              right: 0,
              top: 80,
              child: Image.asset(
                selectedCakeImage!,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

          // الشريط الجانبي للأختيار
          Positioned(
            left: 0,
            bottom: 80,
            child: Container(
              width: 80,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.purple[400],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      _buildMenuItem(Icons.cake, 'Shape'),
                      _buildMenuItem(Icons.restaurant, 'Flavor'),
                      _buildMenuItem(Icons.palette, 'Color'),
                      _buildMenuItem(Icons.fastfood, 'Toppings'),
                      _buildMenuItem(Icons.fastfood, 'Write'),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // عرض التفاصيل المختارة
          Positioned(
            left: 100,
            right: 16,
            bottom: 80,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: AnimatedOpacity(
                opacity: isDetailVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 5),
                    ],
                  ),
                  child: _buildSelectedContent(),
                ),
              ),
            ),
          ),

          // زر "التالي"
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              onPressed: () {
                // إرسال البيانات إلى الصفحة التالية
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderSummaryPage(
                      selectedShape: selectedShape,
                      selectedFlavor: selectedFlavor,
                      selectedColor: selectedColor,
                      selectedCakeImage: selectedCakeImage,
                      selectedCakePrice: selectedCakePrice,
                      selectedToppings: selectedToppings,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[400],
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrderSummaryPage extends StatelessWidget {
  final String? selectedShape;
  final String? selectedFlavor;
  final String? selectedColor;
  final String? selectedCakeImage;
  final String? selectedCakePrice;
  final String? selectedToppings;

  const OrderSummaryPage({
    Key? key,
    this.selectedShape,
    this.selectedFlavor,
    this.selectedColor,
    this.selectedCakeImage,
    this.selectedCakePrice,
    this.selectedToppings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Shape: $selectedShape'),
            Text('Flavor: $selectedFlavor'),
            Text('Color: $selectedColor'),
            Image.asset(selectedCakeImage ?? ''),
            Text('Price: $selectedCakePrice'),
            if (selectedToppings != null && selectedToppings!.isNotEmpty)
              Text('Toppings/Message: $selectedToppings'),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: BakingPage.routeName,
//     routes: {
//       BakingPage.routeName: (context) => BakingPage(),
//     },
//   ));
// }
