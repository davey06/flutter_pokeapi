extension StringEditor on String {
  String toTitleCase() {
    final splits = trim().split(' ');
    final capitalize = splits
        .map(
          (word) =>
              word[0].toUpperCase() +
              word.substring(1, word.length).toLowerCase(),
        )
        .toList(growable: false);
    final titleCase = capitalize.fold(
        '', (previousValue, element) => '$previousValue $element');
    return titleCase.trim();
  }
}
