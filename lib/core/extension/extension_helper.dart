// ignore_for_file: avoid_shadowing_type_parameters
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

extension ListExtension<T> on List<T> {
  List<T> whereNotNull() => where((element) => element != null).toList();

  List<T> sortBy<T>(T Function(T) getField, {bool descending = false}) {
    List<T> sorted = List.from(this);
    sorted.sort((a, b) {
      final aValue = getField(a) as Comparable;
      final bValue = getField(b) as Comparable;
      return (descending ? -1 : 1) * Comparable.compare(aValue, bValue);
    });
    return sorted;
  }

  List<T> update(int pos, T t) {
    List<T> list = [];
    list.add(t);
    replaceRange(pos, pos + 1, list);
    return this;
  }



  List<T> get nonDuplicate => toSet().toList();

  List<T> get reversedList => reversed.toList();

  T? get firstOrNull => isEmpty ? null : first;

  T? get lastOrNull => isEmpty ? null : last;
}

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(
    height: toDouble(),
  );

  SizedBox get pw => SizedBox(width: toDouble());
}

extension IterableExtension<T> on Iterable<T> {
  T? lastWhereOrNull(bool Function(T) test) {
    try {
      return lastWhere(test);
    } catch (_) {
      return null;
    }
  }

  bool get isNotNullOrEmpty => isNotEmpty;

  bool get isNullOrEmpty => isEmpty;
}


extension AnyTypeExtension on dynamic {
  String get className => runtimeType.toString();

  int get classHashCode => className.hashCode;

  bool isTypeOf<T>() => this is T;

  bool isNotTypeOf<T>() => this is! T;
}

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  double get heightWithoutSafeArea =>
      height -
          MediaQuery.of(this).padding.top -
          MediaQuery.of(this).padding.bottom;

  double get widthWithoutSafeArea =>
      width -
          MediaQuery.of(this).padding.left -
          MediaQuery.of(this).padding.right;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  double get navigationBarHeight => kBottomNavigationBarHeight;

  double get appBarHeight => kToolbarHeight;

  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  double get keyboardHeightWithBar =>
      MediaQuery.of(this).viewInsets.bottom + navigationBarHeight;

  double get keyboardHeightWithoutBar =>
      MediaQuery.of(this).viewInsets.bottom - navigationBarHeight;

  double get keyboardHeightWithoutAppBar =>
      MediaQuery.of(this).viewInsets.bottom - appBarHeight;

  double get keyboardHeightWithoutAppBarAndBar =>
      MediaQuery.of(this).viewInsets.bottom -
          appBarHeight -
          navigationBarHeight;

  double get keyboardHeightWithoutAppBarAndBarAndSafeArea =>
      MediaQuery.of(this).viewInsets.bottom -
          appBarHeight -
          navigationBarHeight -
          MediaQuery.of(this).padding.top -
          MediaQuery.of(this).padding.bottom;
}

extension ThemeExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

extension ContextExtension on BuildContext {
  bool get isArabic => Localizations.localeOf(this).languageCode == 'ar';
}

extension StringExtension on String {
  bool get isNullOrEmpty => isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isNullOrWhiteSpace => trim().isEmpty;

  bool get isNotNullOrWhiteSpace => !isNullOrWhiteSpace;

  bool toBool() => toLowerCase() == 'true';

  IconData get getAwesomeIcon {
    switch (this) {
      case "plane":
        return FontAwesomeIcons.plane;
      case "folderTree":
        return FontAwesomeIcons.folderTree;
      case "mugSaucer":
        return FontAwesomeIcons.mugHot;
      case "utensils":
        return FontAwesomeIcons.utensils;
      case "tree":
        return FontAwesomeIcons.tree;
      case "book":
        return FontAwesomeIcons.book;
      case "monument":
        return FontAwesomeIcons.monument;
      case "glassCheers":
        return FontAwesomeIcons.champagneGlasses;
      case "dumbbell":
        return FontAwesomeIcons.dumbbell;
      case "shoppingBag":
        return FontAwesomeIcons.bagShopping;
      case "listSquares":
        return FontAwesomeIcons.list;
      default:
        return FontAwesomeIcons.certificate;
    }
  }

  String toCapitalized() {
    return length > 0
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalized())
        .join(' ');
  }
}

extension PopUpsExtension on BuildContext {
  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Future<T?> showCustomDialog<T>(Widget dialog) async {
    return showDialog<T>(
      context: this,
      builder: (context) => dialog,
    );
  }

  showCustomBottomSheet<T>(Widget bottomSheet,
      {GlobalKey<ScaffoldState>? scaffoldKey}) async {
    if (scaffoldKey != null) {
      return scaffoldKey.currentState!
          .showBottomSheet((context) => bottomSheet);
    }
    return showModalBottomSheet<T>(
      context: this,
      builder: (context) => bottomSheet,
    );
  }
}

extension DateTimeExtension on DateTime {
  String toShortDateString() => DateFormat('MM/dd/yyyy').format(this);

  String toLongDateString() => DateFormat('MMMM d, y').format(this);

  String toShortTimeString() => DateFormat('HH:mm').format(this);

  String toLongTimeString() => DateFormat('HH:mm:ss').format(this);

  Duration difference(DateTime other) => differenceBetween(this, other);

  String timeAgo({bool? numericDates = true, DateTime? date2}) {
    date2 ??= DateTime.now();
    final difference = date2.difference(this);
    if (difference.inDays > 8) {
      return DateFormat('MMMM d, y').format(this);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates ?? true) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates ?? true) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates ?? true) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates ?? true) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  String remainingTime({
    bool showDays = true,
    bool showHours = true,
    bool showMinutes = true,
    bool showSeconds = true,
    DateTime? other,
  }) {
    other ??= DateTime.now();
    final diff = difference(other);
    final days = diff.inDays;
    final hours = diff.inHours - (days * 24);
    final minutes = diff.inMinutes - (days * 24 * 60) - (hours * 60);
    final seconds = diff.inSeconds -
        (days * 24 * 60 * 60) -
        (hours * 60 * 60) -
        (minutes * 60);
    final daysString = days.toString().padLeft(2, '0');
    final hoursString = hours.toString().padLeft(2, '0');
    final minutesString = minutes.toString().padLeft(2, '0');
    final secondsString = seconds.toString().padLeft(2, '0');
    final daysText = '${daysString}d';
    final hoursText = '${hoursString}h';
    final minutesText = '${minutesString}m';
    final secondsText = '${secondsString}s';
    final text = (showDays ? '$daysText ' : '') +
        (showHours ? '$hoursText ' : '') +
        (showMinutes ? '$minutesText ' : '') +
        (showSeconds ? secondsText : '');
    return text.trim();
  }

  static Duration differenceBetween(DateTime start, DateTime end) {
    final difference = end.difference(start);
    return difference.isNegative ? Duration.zero : difference;
  }
}

extension BlocExtension on BuildContext {
  T? bloc<T extends BlocBase>() => BlocProvider.of<T>(this, listen: false);

  bool hasBloc<T extends BlocBase>() => bloc<T>() != null;
}
