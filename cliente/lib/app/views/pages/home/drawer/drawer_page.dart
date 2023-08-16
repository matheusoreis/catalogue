import 'package:flutter/material.dart';

import '../../../../models/auth/sign_in.dart';
import '../../../../models/drawer/drawer_button.dart';
import '../../../../shared/dependecy.dart';
import '../../../../shared/themes/colors.dart';
import '../../../components/buttons/button_icon.dart';
import '../../../components/texts.dart';
import '../../../components/your_icons/your_icons_icons.dart';
import '../../../store/home/drawer/drawer_controller.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key, required this.signInModelRecord});

  final SignInModelRecord signInModelRecord;

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  MyDrawerController drawerController = getIt<MyDrawerController>();

  @override
  void initState() {
    super.initState();

    drawerController.getSignInModelRecord(signInModelRecord: widget.signInModelRecord);
  }

  @override
  Widget build(BuildContext context) {
    List<DrawerModel> drawerButtonList = drawerController.drawerButtonList(context: context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: primary500,
                            radius: 35,
                            child: HeadlineMedium(
                              text: drawerController.signInModelRecordData.name[0].toUpperCase(),
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            child: const YourIcon(
                              YourIcons.exit,
                              size: 28.0,
                            ),
                            onTap: () {
                              drawerController.exitAccount(context: context);
                            },
                          )
                        ],
                      ),
                    ),
                    HeadlineSmall(
                      text: drawerController.signInModelRecordData.name,
                    ),
                    BodyLarge(
                      text: drawerController.signInModelRecordData.phone,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return ButtonWithIcon(
                    text: drawerButtonList[index].buttonText,
                    onPressed: drawerButtonList[index].onPressed,
                    icon: drawerButtonList[index].icon,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: drawerButtonList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
