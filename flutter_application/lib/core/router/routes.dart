enum Routes {
  initial(
    name: "initial",
    path: "/",
  ),
  login(
    name: "login",
    path: "/login",
  ),
  home(
    name: "home",
    path: "/home",
  ),
  settings(
    name: "settings",
    path: "/settings",
  ),
  changeEmailAddress(
    name: "changeEmailAddress",
    path: "/changeEmailAddress",
  ),
  themeMode(
    name: "themeMode",
    path: "/themeMode",
  );

  const Routes({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}
