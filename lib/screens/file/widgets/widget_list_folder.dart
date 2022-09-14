import 'package:flutter/material.dart';
import 'package:varstools/config/app_constants.dart';
import 'package:sizer/sizer.dart';
import 'package:varstools/screens/file/widgets/popup_sort.dart';
import 'package:varstools/screens/file/widgets/widget_recycle_bin.dart';
import 'package:varstools/utilities/extensions/enum/sort_item.dart';

class ListFolder extends StatefulWidget {
  const ListFolder({Key? key}) : super(key: key);

  @override
  State<ListFolder> createState() => _ListFolderState();
}

class _ListFolderState extends State<ListFolder> {
  List listFolder = [];
  final folderController = TextEditingController();
  late String nameOfFolder;

  void _onSelectWard(SortItem value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    bottom: defaultPadding, top: defaultPadding),
                child: Text(
                  'Tất cả (${listFolder.length})',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      _showMyDialog();
                    },
                    child: const Icon(Icons.add_circle),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          context: context,
                          builder: (context) {
                            return PopupSort(_onSelectWard);
                          });
                      setState(() {});
                    },
                    child: const Icon(Icons.sort),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WidgetRecycleBin()),
                      );
                    },
                    child: const Icon(Icons.recycling),
                  ),
                ],
              ),
            ),
          ],
        ),
        listFolder.isEmpty
            ? SizedBox(
                height: 68.0.h,
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
            : Container()
      ],
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Tạo thư mục mới',
            textAlign: TextAlign.left,
          ),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return TextField(
                controller: folderController,
                autofocus: true,
                decoration: const InputDecoration(hintText: 'Nhập tên thư mục'),
                onChanged: (val) {
                  setState(() {
                    nameOfFolder = folderController.text;
                  });
                },
              );
            },
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text(
                'Đồng ý',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text(
                'Hủy',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
