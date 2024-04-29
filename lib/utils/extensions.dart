extension StringUtils on String {
  String truncateTo(int maxLength, {bool showEllipsis = true}) {
    if (showEllipsis && maxLength > 3) {
      return length <= maxLength ? this : '${substring(0, maxLength - 3)}...';
    } else {
      return length <= maxLength ? this : substring(0, maxLength);
    }
  }
}
