import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:varstools/config/app_color.dart';
import 'package:varstools/screens/file/widgets/list_file_recycle_bin.dart';


class WidgetRecycleBin extends StatefulWidget {
  const WidgetRecycleBin({Key? key}) : super(key: key);

  @override
  State<WidgetRecycleBin> createState() => _WidgetRecycleBinState();
}

class _WidgetRecycleBinState extends State<WidgetRecycleBin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildTitle(),
          const Text(
            'Thư mục đã xóa',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const ListFileRecycleBin()
        ],
      ),
    );
  }
  Widget _buildTitle(){
    return Container(
      margin: EdgeInsets.only(top: 5.0.h,right: 20.0,left: 20.0,bottom: 5.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: const Center(
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          Text(
            'Thùng rác',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: AppColors.greyText),
          ),
                  ],
      ),
    );
  }

}
