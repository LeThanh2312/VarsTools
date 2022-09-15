enum StyleCamera { cardID, passport, document }

extension StyleCameraExtention on StyleCamera? {
  String get name {
    switch (this) {
      case StyleCamera.cardID:
        return 'Thẻ ID';
      case StyleCamera.passport:
        return 'Hộ chiếu';
      case StyleCamera.document:
        return 'Văn bản';

      default:
    }
    return '';
  }
}