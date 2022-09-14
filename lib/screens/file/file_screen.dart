import 'package:flutter/material.dart';
import 'package:varstools/config/app_constants.dart';
import 'package:varstools/screens/home/widgets/widget_search.dart';
import 'package:varstools/screens/file/widgets/widget_list_folder.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({Key? key}) : super(key: key);

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          margin: const EdgeInsets.only(
            left: defaultPadding,
            right: defaultPadding,
            bottom: defaultPadding,
            top: defaultPadding,
          ),
          child: Column(
            children: const [
              WidgetSearch(),
              ListFolder()
            ],
          ),
        ),
      ),
    );
  }
}
