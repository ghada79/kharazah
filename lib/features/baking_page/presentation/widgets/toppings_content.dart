import 'package:flutter/material.dart';

class ToppingsContent extends StatefulWidget {
  final Function(Map<String, dynamic>) onItemSelected;

  const ToppingsContent({required this.onItemSelected});

  @override
  _ToppingsContentState createState() => _ToppingsContentState();
}

class _ToppingsContentState extends State<ToppingsContent> {
  String selectedFlavorImage = ''; // الصورة المختارة
  String selectedTabName = ''; // اسم التاب الذي تم اختياره

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

  @override
  Widget build(BuildContext context) {
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
            _buildFlavorGrid(flavors, flavorImages, 'Retro'),
            _buildFlavorGrid(flavors, flavorImages, 'Memes'),
            _buildFlavorGrid(flavors, flavorImages, 'Birthday'),
            _buildFlavorGrid(flavors, flavorImages, 'Ribbon'),
          ],
        ),
      ),
    );
  }

  Widget _buildFlavorGrid(
      List<String> flavors, List<String> flavorImages, String tabName) {
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
            setState(() {
              selectedFlavorImage =
                  flavorImages[index]; // تحديث الصورة عند النقر
              selectedTabName = tabName; // حفظ اسم التاب الذي تم اختياره
            });
            widget.onItemSelected({
              'title': flavors[index],
              'image': flavorImages[index],
              'tab': tabName, // إرسال اسم التاب مع الصورة
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
}
