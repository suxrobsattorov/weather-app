extension StringExtensions on String {
  String capitalizeString() => '${this[0].toUpperCase()}${substring(1)}';
}
