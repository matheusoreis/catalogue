import 'package:catalogue/app/views/components/alert_dialog.dart';
import 'package:catalogue/app/views/components/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/auth/sign_in.dart';
import '../../../../models/drawer/drawer_button.dart';
import '../../../../shared/local_storage.dart';
import '../../../components/your_icons/your_icons_icons.dart';
import '../home_controller.dart';

class MyDrawerController {
  MyDrawerController({
    required this.homeController,
    required this.sharedPreferenceService,
  });
  final HomeController homeController;
  final SharedPreferenceService sharedPreferenceService;

  late UserAccess userAccess;
  late SignInModelRecord signInModelRecordData;

  void getSignInModelRecord({required SignInModelRecord signInModelRecord}) {
    signInModelRecordData = signInModelRecord;

    verifyUserAccess();
  }

  void verifyUserAccess() {
    if (signInModelRecordData.access == 'Admin') {
      userAccess = UserAccess.admin;
    } else if (signInModelRecordData.access == 'Seller') {
      userAccess = UserAccess.seller;
    } else {
      userAccess = UserAccess.user;
    }
  }

  List<DrawerModel> drawerButtonList({required BuildContext context}) {
    List<DrawerModel> list = [
      DrawerModel(
        icon: YourIcons.home,
        buttonText: 'Home',
        onPressed: () {
          Scaffold.of(context).closeDrawer();
        },
      ),
      DrawerModel(
        icon: YourIcons.location,
        buttonText: 'Sobre',
        onPressed: () {
          GoRouter.of(context).push('/about');
        },
      ),
      DrawerModel(
        icon: YourIcons.shoppingBag,
        buttonText: 'Produtos',
        onPressed: () {
          GoRouter.of(context).push('/product');
        },
      ),
      DrawerModel(
        icon: YourIcons.chat,
        buttonText: 'Orçamento',
        onPressed: () {
          GoRouter.of(context).push('/budget');
        },
        userAccess: UserAccess.user,
      ),
      DrawerModel(
        icon: YourIcons.infoCircle,
        buttonText: 'Admin',
        onPressed: () {
          MyAlertModal(
            context: context,
            title: 'Informação',
            content: 'Seu acesso é de um administrador!',
            button: [
              Button(
                text: 'Voltar',
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          );
        },
        userAccess: UserAccess.admin,
      ),
      DrawerModel(
        icon: YourIcons.infoCircle,
        buttonText: 'Vendedor',
        onPressed: () {
          MyAlertModal(
            context: context,
            title: 'Informação',
            content: 'Seu acesso é de um vendedor!',
            button: [
              Button(
                text: 'Voltar',
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          );
        },
        userAccess: UserAccess.seller,
      ),
      DrawerModel(
        icon: YourIcons.settings,
        buttonText: 'Configurações',
        onPressed: () {
          GoRouter.of(context).push('/config');
        },
      ),
    ];

    if (userAccess != UserAccess.seller) {
      list.removeWhere((item) {
        return item.userAccess == UserAccess.seller;
      });
    }

    if (userAccess != UserAccess.admin) {
      list.removeWhere((item) {
        return item.userAccess == UserAccess.admin;
      });
    }

    if (userAccess == UserAccess.seller || userAccess == UserAccess.admin) {
      list.removeWhere((item) {
        return item.userAccess == UserAccess.user;
      });
    }

    return list;
  }

  Future exitAccount({required BuildContext context}) async {
    await sharedPreferenceService.deleteData('userData');

    if (context.mounted) Scaffold.of(context).closeDrawer();
    if (context.mounted) GoRouter.of(context).go('/entry');
  }
}
