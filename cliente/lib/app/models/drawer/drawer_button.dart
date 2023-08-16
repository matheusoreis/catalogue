import '../../views/components/your_icons/your_icons_icons.dart';

enum UserAccess {
  user,
  seller,
  admin,
}

class DrawerModel {
  final String buttonText;
  final YourIcons icon;
  void Function()? onPressed;
  UserAccess? userAccess;

  DrawerModel({
    required this.icon,
    required this.buttonText,
    required this.onPressed,
    this.userAccess,
  });
}
