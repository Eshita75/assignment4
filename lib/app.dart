import 'package:assignment4/photo_gallery.dart';
import 'package:flutter/material.dart';



class photoGalleryApp extends StatelessWidget {
  const photoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoGallery(),
    );
  }
}
