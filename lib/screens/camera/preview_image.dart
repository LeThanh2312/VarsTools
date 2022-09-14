import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:sizer/sizer.dart';

class PreviewImageScreen extends StatelessWidget {
  const PreviewImageScreen({
    Key? key,
    required this.picture,
  }) : super(key: key);

  final List<XFile> picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTitle(context),
          Center(
              child: picture.length == 2
                  ? Column(mainAxisSize: MainAxisSize.min, children: [
                      Image.file(File(picture[0].path),
                          fit: BoxFit.cover, width: 100),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.file(File(picture[1].path),
                          fit: BoxFit.cover, width: 100),
                    ])
                  : Column(mainAxisSize: MainAxisSize.min, children: [
                      Image.file(File(picture[0].path),
                          fit: BoxFit.cover, width: 250),
                      const SizedBox(height: 24),
                      Text(picture[0].name),
                    ])),
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
                  Icons.crop,
                ),
              ),
              IconButton(
                onPressed: () {},
                iconSize: 27.0,
                icon: const Icon(
                  Icons.filter_alt_rounded,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              IconButton(
                onPressed: () {},
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

  Widget _buildTitle(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(top: 5.0.h, right: 20.0, left: 20.0, bottom: 5.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
