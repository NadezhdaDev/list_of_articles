class PageControl {
  static int? _pageCounter;

  static int get() {
    _pageCounter ??= 0;

    // ignore: avoid-non-null-assertion
    return _pageCounter!;
  }

  static pageCounterInc() {
    _pageCounter = _pageCounter! + 1;
  }

  static pageCounterReset() {
    _pageCounter = 0;
  }
}
