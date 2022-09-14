import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class ListFileRecycleBin extends StatefulWidget {
  const ListFileRecycleBin({Key? key}) : super(key: key);

  @override
  State<ListFileRecycleBin> createState() => _ListFileRecycleBinState();
}

class _ListFileRecycleBinState extends State<ListFileRecycleBin> {
  List listFolder = [];

  @override
  Widget build(BuildContext context) {
    return listFolder.isEmpty
        ? SizedBox(
            height: 82.0.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.folder_off_outlined,
                    size: 22,
                  ),
                  Text(
                    'Trống ở đây',
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
