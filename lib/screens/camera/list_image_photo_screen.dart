import 'package:flutter/material.dart';
import 'package:varstools/screens/camera/widgets/gridview_image.dart';
import 'package:sizer/sizer.dart';
import 'package:camera/camera.dart';
import 'package:varstools/screens/camera/preview_image.dart';
import 'package:varstools/utilities/extensions/enum/style_camera.dart';

class ListImagePhotoScreen extends StatefulWidget {
  const ListImagePhotoScreen(
      {Key? key, required this.picture, required this.style})
      : super(key: key);
  final List<XFile> picture;
  final StyleCamera style;

  @override
  State<ListImagePhotoScreen> createState() => _ListImagePhotoScreenState();
}

class _ListImagePhotoScreenState extends State<ListImagePhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
          top: 5.0.h,
          right: 20.0,
          left: 20.0,
          bottom: 5.0.w,
        ),
        child: Column(
          children: [
            Row(
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
            SizedBox(
              width: 100.0.w,
              height: 81.0.h,
              child: GridviewImage(picture: widget.picture),
            ),
          ],
        ),
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
              const SizedBox(
                width: 27.0,
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                iconSize: 27.0,
                icon: const Icon(
                  Icons.camera_alt,
                ),
              ),
              //to leave space in between the bottom app bar items and below the FAB
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PreviewImageScreen(
                        picture: widget.picture,
                        style: widget.style,
                      ),
                    ),
                  );
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
