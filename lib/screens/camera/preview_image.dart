import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:sizer/sizer.dart';
import 'package:varstools/screens/camera/crop_image_screen.dart';
import 'package:varstools/screens/camera/widgets/popup_filter_image.dart';
import 'package:varstools/utilities/extensions/enum/style_camera.dart';

class PreviewImageScreen extends StatefulWidget {
  const PreviewImageScreen({
    Key? key,
    required this.picture,
    required this.style,
  }) : super(key: key);

  final List<XFile> picture;
  final StyleCamera style;

  @override
  State<PreviewImageScreen> createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  bool isShowPopupFilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _buildTitle(context),
              widget.style == StyleCamera.cardID
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _numbered('1'),
                        const SizedBox(width: 10,),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.file(File(widget.picture[0].path),
                                fit: BoxFit.cover, width: 100),
                            const SizedBox(
                              height: 20,
                            ),
                            Image.file(File(widget.picture[1].path),
                                fit: BoxFit.cover, width: 100),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(
                      width: 40.0.w,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: widget.picture.map((e) {
                          String index = '${widget.picture.indexOf(e) + 1}';
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _numbered(index),
                              Image.file(File(e.path),
                                  fit: BoxFit.cover, width: 30.0.w),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
            ],
          ),
          showPopupFilter(),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CropImageScreen(
                        picture: widget.picture,
                      ),
                    ),
                  );
                },
                iconSize: 27.0,
                icon: const Icon(
                  Icons.crop,
                ),
              ),
              IconButton(
                onPressed: () {
                  isShowPopupFilter = !isShowPopupFilter;
                  setState(() {});
                },
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
    );
  }

  Widget _numbered(String text) {
    return Text(
      text.length == 1 ? '0$text' : text,
    );
  }

  Widget showPopupFilter() {
    return Align(
      alignment: FractionalOffset.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: isShowPopupFilter ? 100.0.w : 0,
        height: isShowPopupFilter ? 40.0.h : 0,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(isShowPopupFilter ? 0.0 : 300.0),
            color: Colors.transparent),
        child: const PopupFilter(),
      ),
    );
  }
}
