import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:varstools/config/app_color.dart';
import 'package:varstools/config/app_constants.dart';
import 'package:varstools/utilities/extensions/enum/sort_item.dart';

class PopupSort extends StatefulWidget {
  const PopupSort(this.onSelectWard, {Key? key}) : super(key: key);
  final void Function(SortItem value) onSelectWard;

  @override
  _PopupSortState createState() => _PopupSortState();
}

class _PopupSortState extends State<PopupSort> {
  TextEditingController searchWardController = TextEditingController();
  List<SortItem> list = [
    SortItem.timeNew,
    SortItem.timeOld,
    SortItem.aToZ,
    SortItem.zToA
  ];
  SortItem select = SortItem.timeNew;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0.w,
      height: 40.0.h,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.greyLine),
        borderRadius: BorderRadius.circular(15),
        color: AppColors.alabasterColor,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            'Sắp xếp',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColors.greyText),
          ),
        ),
        SizedBox(
          height: 30.0.h,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: list.map((SortItem e) {
              final bool _isSelectedMenu = select == e;
              return InkWell(
                  onTap: () {
                    setState(() {
                      select = e;
                    });
                  },
                  child: itemWard(e, _isSelectedMenu));
            }).toList(),
          ),
        ),
      ]),
    );
  }

  Widget itemWard(SortItem e, bool _isSelectedMenu) {
    return InkWell(
      onTap: () {
        select = e;
        widget.onSelectWard(select);
        Navigator.of(context).pop();
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.only(
            left: defaultPadding, right: defaultPadding, bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: Text(
                e.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grey2Color,
                ),
              ),
            ),
            _isSelectedMenu
                ? const SizedBox(
                    width: 15,
                    height: 15,
                    child: Icon(Icons.select_all),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
