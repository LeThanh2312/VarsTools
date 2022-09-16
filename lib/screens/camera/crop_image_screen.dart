import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:crop_your_image/crop_your_image.dart';

class CropImageScreen extends StatefulWidget {
  const CropImageScreen({Key? key, required this.picture}) : super(key: key);
  final List<XFile> picture;

  @override
  State<CropImageScreen> createState() => _CropImageScreenState();
}

class _CropImageScreenState extends State<CropImageScreen> {
  int index = 1;
  final _cropController = CropController();

  set currentImage(int value) {
    setState(() {
      index = value + 1;
    });
    _cropController.image =
        File(widget.picture[index - 1].path).readAsBytesSync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 5.0.h, right: 20.0, left: 20.0, bottom: 5.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Center(
                    child: Icon(Icons.arrow_back_ios),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 68.0.w,
            child: Stack(
              children: [
                Image.file(File(widget.picture[index - 1].path),
                    fit: BoxFit.cover, width: 68.0.w),
                // IgnorePointer(
                //   child: ClipPath(
                //     //clipper: _CircleCropAreaClipper(_rect),
                //     child: Container(
                //       width: double.infinity,
                //       height: double.infinity,
                //       color: Colors.black.withAlpha(100),
                //     ),
                //   ),
                // ),
              ],
            )
          ),
          // SizedBox(
          //   height: 68.0.h,
          //   child: Crop(
          //     image: File(widget.picture[index - 1].path).readAsBytesSync(),
          //     controller: _cropController,
          //     onCropped: (image) {
          //       // do something with image data
          //     },
          //   ),
          // ),
          Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    if (index > 1) index--;
                    setState(() {});
                  },
                  iconSize: 27.0,
                  icon: const Icon(
                    Icons.arrow_circle_left_outlined,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text('$index/${widget.picture.length}'),
                ),
                IconButton(
                  onPressed: () {
                    if (index < widget.picture.length) index++;
                    setState(() {});
                  },
                  iconSize: 27.0,
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                iconSize: 27.0,
                icon: const Icon(
                  Icons.camera_alt,
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 27.0,
                icon: const Icon(
                  Icons.rotate_left,
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 27.0,
                icon: const Icon(
                  Icons.rotate_right,
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 27.0,
                icon: const Icon(
                  Icons.flip_camera_android,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 27.0,
                icon: const Icon(
                  Icons.check,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}