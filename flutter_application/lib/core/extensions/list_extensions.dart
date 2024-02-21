extension ExtensionList<T> on List<T> {
  T get lastIem => this[length - 1];
  List<T> get reversedCopy => reversed.toList();
}
