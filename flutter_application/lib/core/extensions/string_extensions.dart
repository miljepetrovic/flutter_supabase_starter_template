extension NullabeStringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
