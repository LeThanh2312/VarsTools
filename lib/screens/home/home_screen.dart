import 'package:flutter/material.dart';
import 'package:varstools/config/app_constants.dart';
import 'package:varstools/screens/home/widgets/widget_list_file_recently.dart';
import 'package:varstools/screens/home/widgets/widget_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const WidgetSearch(),
              const SizedBox(
                height: defaultPadding,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [
                        Icon(Icons.file_present_outlined),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Nhập hình ảnh'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [
                        Icon(Icons.credit_card),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Thẻ ID'),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: const [
                        Icon(Icons.folder),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Thư mục'),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    bottom: defaultPadding, top: defaultPadding),
                child: const Text(
                  'Thư mục gần đây',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              const ListFileRecently()
            ],
          ),
        ),
      ),
    );
  }
}
