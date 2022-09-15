import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:varstools/screens/camera/preview_image.dart';
import 'package:varstools/utilities/extensions/enum/style_camera.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:sizer/sizer.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription>? cameras;

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  StyleCamera styleCamera = StyleCamera.cardID;
  bool isPageFirst = true;
  late bool isFlash;

  List<XFile> listPicture = [];

  @override
  void dispose() {
    _controller.dispose();
    listPicture = [];
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    isFlash = false;
    initCamera(widget.cameras![0]);
    print("==== $isPageFirst +$isFlash");
  }

  Future initCamera(CameraDescription cameraDescription) async {
    _controller = CameraController(cameraDescription, ResolutionPreset.high);
    try {
      await _controller.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            if (_controller.value.isInitialized)
              Container(
                margin: EdgeInsets.only(top: 9.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (styleCamera == StyleCamera.cardID)
                      Expanded(child: customCameraIDCard()),
                    if (styleCamera == StyleCamera.passport)
                      Expanded(child: customCameraPassport()),
                    if (styleCamera == StyleCamera.document)
                      Expanded(child: customCameraDocument()),
                  ],
                ),
              )
            else
              Container(
                  color: Colors.black,
                  child: const Center(child: CircularProgressIndicator())),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 15.0.h,
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(24)),
                    color: Colors.transparent),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            styleCamera = StyleCamera.cardID;
                            setState(() {});
                          },
                          child: Text(
                            StyleCamera.cardID.name,
                            style: TextStyle(
                              color: styleCamera == StyleCamera.cardID
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            styleCamera = StyleCamera.passport;
                            setState(() {});
                          },
                          child: Text(
                            StyleCamera.passport.name,
                            style: TextStyle(
                              color: styleCamera == StyleCamera.passport
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            styleCamera = StyleCamera.document;
                            setState(() {});
                          },
                          child: Text(
                            StyleCamera.document.name,
                            style: TextStyle(
                              color: styleCamera == StyleCamera.document
                                  ? Colors.green
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Expanded(
                          child: IconButton(
                            onPressed: takePicture,
                            iconSize: 50,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.camera, color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {},
                            iconSize: 50,
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: const Icon(Icons.collections,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      iconSize: 50,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.close, color: Colors.black),
                    ),
                    Visibility(
                      visible: (styleCamera == StyleCamera.cardID),
                      child: Text(
                        isPageFirst ? 'Trang đầu' : 'Trang sau',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (!isFlash) {
                          print('==== isFlash: $isFlash');
                          _controller.setFlashMode(FlashMode.off);
                        } else {
                          print('==== isFlash: $isFlash');
                          _controller.setFlashMode(FlashMode.always);
                        }
                        isFlash = !isFlash;
                        setState(() {});
                      },
                      iconSize: 50,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(isFlash ? Icons.flash_on : Icons.flash_off,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future takePicture() async {
    XFile? picture;
    XFile? picture2;
    if (!_controller.value.isInitialized) {
      return null;
    }
    if (_controller.value.isTakingPicture) {
      return null;
    }
    if (styleCamera == StyleCamera.cardID) {
      if (isPageFirst) {
        picture = await _controller.takePicture();
        listPicture.add(picture);
        isPageFirst = false;
        setState(() {});
      } else {
        picture2 = await _controller.takePicture();
        listPicture.add(picture2);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewImageScreen(
              picture: listPicture,
              style: StyleCamera.cardID,
            ),
          ),
        ).then((_) => setState(
              () {
                listPicture.clear();
                isPageFirst = true;
              },
            ));
      }
    } else if (styleCamera == StyleCamera.passport) {
      try {
        await _controller.setFlashMode(FlashMode.off);
        picture = await _controller.takePicture();
        listPicture.add(picture);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewImageScreen(
              picture: listPicture,
              style: StyleCamera.passport,
            ),
          ),
        ).then((_) => setState(
              () {
            listPicture.clear();
            isPageFirst = true;
          },
        ));
      } on CameraException catch (e) {
        debugPrint('Error occured while taking picture: $e');
        return null;
      }
    } else if (styleCamera == StyleCamera.document) {
      try {
        await _controller.setFlashMode(FlashMode.off);
        picture = await _controller.takePicture();
        listPicture.add(picture);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PreviewImageScreen(
              picture: listPicture,
              style: StyleCamera.document,
            ),
          ),
        ).then((_) => setState(
              () {
            listPicture.clear();
            isPageFirst = true;
          },
        ));
      } on CameraException catch (e) {
        debugPrint('Error occured while taking picture: $e');
        return null;
      }
    }
  }

  Widget customCameraIDCard() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 70.0.h,
          child: CameraPreview(_controller),
        ),
      ],
    );
  }

  Widget customCameraPassport() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 70.0.h,
          child: CameraPreview(_controller),
        ),
        const Center(
          child: Dash(
              direction: Axis.horizontal,
              length: 400,
              dashLength: 12,
              dashColor: Colors.black),
        )
      ],
    );
  }

  Widget customCameraDocument() {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 70.0.h,
          child: CameraPreview(_controller),
        ),
      ],
    );
  }
}
