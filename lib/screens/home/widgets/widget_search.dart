import 'package:flutter/material.dart';
import 'package:varstools/config/app_color.dart';
import 'package:varstools/config/app_constants.dart';
import 'package:sizer/sizer.dart';

class WidgetSearch extends StatefulWidget {
  const WidgetSearch({Key? key}) : super(key: key);

  @override
  State<WidgetSearch> createState() => _WidgetSearchState();
}

class _WidgetSearchState extends State<WidgetSearch> {
  TextEditingController searchWardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        height: 5.0.h,
              decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: AppColors.greyLine)),
        child: Container(
            width: 90.0.w,
            margin: const EdgeInsets.only(
                left: 0, right: defaultPadding),
            child: TextField(
              onChanged: (String value) {
                // final List<String> searchBrand = saleCarGetIt!.listBrand
                //     .where((Brand brand) => brand.name!
                //     .toLowerCase()
                //     .contains(value.toLowerCase()))
                //     .toList();
                // setState(() {
                //   _searchKeyword = value;
                //   listBrands = searchBrand;
                // });
              },
              controller: searchWardController,
              style: const TextStyle(color: Colors.black, fontSize: 14),
              decoration: const InputDecoration(
                hintText: 'Tìm kiếm',
                hintStyle: TextStyle(
                  color: Color(0xFF717171),
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                //contentPadding: EdgeInsets.only(bottom: 2.0.h),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search),
              ),
            )),
      ),
    );
  }
}
