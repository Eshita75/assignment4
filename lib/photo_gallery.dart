import 'dart:convert';

import 'package:assignment4/photo_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'image.dart';


class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  bool _getproductListInProgress = false;
  List<Photos> imageList = [];

  @override
  void initState() {
    _getPhotos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery App', style: TextStyle(fontWeight: FontWeight.w600),),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          elevation: 50,
        ),
        body: RefreshIndicator(
          onRefresh: _getPhotos,
          child: Visibility(
            visible: _getproductListInProgress == false,
            replacement: Center(
              child: CircularProgressIndicator(),
            ),
            child: ListView.builder(
              itemCount: imageList.length,
              itemBuilder: (context, index){
                return _getImages(context, index);
              },
            ),
          ),
        )
    );
  }

  Widget _getImages(BuildContext context, int index) {
    return Row(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return PhotoDetails(
                imageURL: imageList[index].url,
                title: imageList[index].title,
                ID: imageList[index].id,
              );
            },),);
          }, child: Container(
          margin: EdgeInsets.only(left: 15, top: 15),
          height: 100,
          width: 100,
          child: Image.network(imageList[index].thumbnailUrl),
        ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(imageList[index].title),
          ),
        ),
      ],
    );
  }

  Future<void> _getPhotos() async{
    try{
      _getproductListInProgress = true;
      setState(() {});

      imageList.clear();
      String ProductListURL = 'https://jsonplaceholder.typicode.com/photos';
      Uri uri = Uri.parse(ProductListURL);
      Response response = await get(uri);

      final decodedData = jsonDecode(response.body);

      print(response.statusCode);
      print(response.body);

      if(response.statusCode == 200){
        //loop over the list
        for(Map<String, dynamic> p in decodedData){
          Photos photos = Photos(
              albumId: p['albumId'] ?? '',
              id: p['id'] ?? '',
              title: p['title'] ?? '',
              url: p['url'] ?? '',
              thumbnailUrl: p['thumbnailUrl'] ?? '');

          imageList.add(photos);
        }
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Get Image List failed try again'))
        );
      }

      _getproductListInProgress = false;
      setState(() {
      });
    } catch(e){
      throw Exception('Failed to get photos: $e');
    }
  }
}
