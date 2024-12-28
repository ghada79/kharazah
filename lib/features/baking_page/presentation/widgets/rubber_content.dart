// import 'package:flutter/material.dart';
//
// class RubbersContent extends StatefulWidget {
//   final Function(Map<String, dynamic>) onItemSelected;
//
//   const RubbersContent({required this.onItemSelected});
//
//   @override
//   _ToppingsContentState createState() => _ToppingsContentState();
// }
//
// class _ToppingsContentState extends State<RubbersContent> {
//   String selectedRubberImage = ''; // الصورة المختارة
//   String selectedTabName = ''; // اسم التاب الذي تم اختياره
//
//   List<String> rubbers = [
//     'Vanilla',
//     'Chocolate',
//     'Red Velvet',
//     'Strawberry',
//     'Caramel',
//     'Coffee'
//   ];
//   List<String> rubberImages = [
//     'assets/images/cake.jpg',
//     'assets/images/cake.jpg',
//     'assets/images/istockphoto.jpg',
//     'assets/images/cake.jpg',
//     'assets/images/cake.jpg',
//     'assets/images/istockphoto.jpg'
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Customize"),
//           bottom: TabBar(
//             tabs: [
//               Tab(text: 'Retro'),
//               Tab(text: 'Memes'),
//               Tab(text: 'Birthday'),
//               Tab(text: 'Ribbon'),
//             ],
//             labelColor: Colors.purple,
//             unselectedLabelColor: Colors.grey,
//             indicatorColor: Colors.purple,
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildFlavorGrid(rubbers, rubberImages, 'Retro'),
//             _buildFlavorGrid(rubbers, rubberImages, 'Memes'),
//             _buildFlavorGrid(rubbers, rubberImages, 'Birthday'),
//             _buildFlavorGrid(rubbers, rubberImages, 'Ribbon'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildFlavorGrid(
//       List<String> patterns, List<String> rubberImages, String tabName) {
//     return GridView.builder(
//       padding: EdgeInsets.all(16),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1.5,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//       ),
//       itemCount: patterns.length,
//       itemBuilder: (context, index) {
//         return InkWell(
//           onTap: () {
//             setState(() {
//               selectedRubberImage =
//               rubberImages[index]; // تحديث الصورة عند النقر
//               selectedTabName = tabName; // حفظ اسم التاب الذي تم اختياره
//             });
//             widget.onItemSelected({
//               'title': patterns[index],
//               'image': rubberImages[index],
//               'tab': tabName, // إرسال اسم التاب مع الصورة
//             });
//           },
//           child: Card(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   rubberImages[index],
//                   height: 40,
//                   width: 50,
//                   fit: BoxFit.cover,
//                 ),
//                 SizedBox(height: 8),
//                 Text(patterns[index]),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
