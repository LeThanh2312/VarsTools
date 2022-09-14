import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class ListFileRecently extends StatefulWidget {
  const ListFileRecently({Key? key}) : super(key: key);

  @override
  State<ListFileRecently> createState() => _ListFileRecentlyState();
}

class _ListFileRecentlyState extends State<ListFileRecently> {
  List listFileRecently = [];

  @override
  Widget build(BuildContext context) {
    return listFileRecently.isEmpty
        ? SizedBox(
            height: 58.0.h,
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
