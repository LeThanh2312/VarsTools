import 'package:flutter/material.dart';

class CropEditor extends StatefulWidget {
  const CropEditor({Key? key}) : super(key: key);

  @override
  State<CropEditor> createState() => _CropEditorState();
}

class _CropEditorState extends State<CropEditor> {
  //final ValueChanged<Rect>? onMoved;

  late Rect _rect;

  set rect(Rect newRect) {
    setState(() {
      _rect = newRect;
    });
    //widget.onMoved!.call(_rect);
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
