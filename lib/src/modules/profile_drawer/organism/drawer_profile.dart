import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/profile_drawer/atoms/custom_drawer_buttom.dart';
import 'package:finalproject/src/modules/profile_drawer/molecules/profile_section.dart';
import 'package:finalproject/src/modules/twitter_view/twitter_view.dart';
import 'package:flutter/material.dart';

class DrawerProfile extends StatelessWidget {
  const DrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: ProfileSection(),
          ),
          CustomDrawerButtom(
            icon: Icons.account_circle_rounded,
            buttomText: 'Profile',
            onButtomClick: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(profileRoute, (route) => false);
            },
          ),
          CustomDrawerButtom(
            icon: Icons.admin_panel_settings_outlined,
            buttomText: 'Edit Profile Testing',
            onButtomClick: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(editProfileRoute, (route) => false);
            },
          ),
          CustomDrawerButtom(
            icon: Icons.logout_outlined,
            buttomText: 'Logout',
            onButtomClick: () async {
              Navigator.of(context).pop();
              await showLogOutDialog(context);
            },
          ),
        ],
      ),
    );
  }
}
