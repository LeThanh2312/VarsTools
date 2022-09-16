import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:sizer/sizer.dart';

class GridviewImage extends StatefulWidget {
  const GridviewImage({Key? key, required this.picture}) : super(key: key);
  final List<XFile> picture;

  @override
  State<GridviewImage> createState() => _GridviewImageState();
}

class _GridviewImageState extends State<GridviewImage> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 0),
      itemCount: widget.picture.length,
      itemBuilder: (BuildContext ctx, int index) {
        return filterItem(widget.picture[index]);
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 5.0.h / 4.5.h,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
    );
  }

  Widget filterItem(XFile picture) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.file(
              File(picture.path),
              fit: BoxFit.cover,
              width: 200,
              height: 200,
            ),
          ),
          const Positioned(
            right: 0,
            top: 0,
            child: Icon(Icons.check_box,color: Colors.green,),
          )
        ],
      ),
    );
  }
}
