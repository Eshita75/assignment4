import 'package:flutter/material.dart';

// class PhotoDetails extends StatefulWidget {
//   const PhotoDetails({super.key});
//
//   @override
//   State<PhotoDetails> createState() => _PhotoDetailsState();
// }
//
// class _PhotoDetailsState extends State<PhotoDetails> {
//
//
//   late String imageURL;
//   late String title;
//   late int ID;
//
//   PhotoDetailScreen({required this.imageURL, required this.title, required this.ID}) {
//     // TODO: implement PhotoDetailScreen
//     throw UnimplementedError();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Photo Details', style: TextStyle(fontWeight: FontWeight.w600),),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//         elevation: 10,
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height:40
//           )
//         ],
//       ),
//     );
//   }
// }

class PhotoDetails extends StatelessWidget {

  late String imageURL;
  late String title;
  late int ID;

  PhotoDetails({required this.imageURL, required this.title, required this.ID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App', style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 10,
      ),
      body: Column(
        children: [
          SizedBox(height: 90,),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Image.network(imageURL),
                SizedBox(height: 20,),
                Text("Title: $title", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                Text('ID: $ID', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400))
              ],
            ),
          ),

        ],
      ),
    );
  }
}

