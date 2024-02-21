import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  FocusScopeNode get focusScope => FocusScope.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this)..hideCurrentSnackBar();

  void closeKeyboard() => focusScope.unfocus();

  void showErrorSnackBarMessage(
    String message,
  ) {
    scaffoldMessenger.showSnackBar(
      SnackBar(
        backgroundColor: colorScheme.error,
        content: Text(
          message,
          style: TextStyle(color: colorScheme.onError),
        ),
      ),
    );
  }

  void showSnackBarMessage(
    String message,
  ) =>
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            message,
          ),
        ),
      );
}
