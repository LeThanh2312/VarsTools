enum SortItem { timeNew, timeOld, aToZ , zToA }

extension SortItemExtention on SortItem? {
  String get name {
    switch (this) {
      case SortItem.timeNew:
        return 'Ngày tạo (mới nhất)';
      case SortItem.timeOld:
        return 'Ngày tạo (cũ nhất)';
      case SortItem.aToZ:
        return 'Tên tài liệu (A đến Z)';
      case SortItem.zToA:
        return 'Tên tài liệu ( Z đến A)';
      default:
    }
    return '';
  }
}