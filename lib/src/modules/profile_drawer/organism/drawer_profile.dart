import 'package:aries_designs/aries_designs.dart';
import 'package:finalproject/src/constants/routes.dart';
import 'package:finalproject/src/modules/profile_drawer/atoms/custom_drawer_buttom.dart';
import 'package:finalproject/src/modules/profile_drawer/molecules/drawer_profile_header_section.dart';
import 'package:finalproject/src/modules/twitter_view/twitter_view.dart';
import 'package:flutter/material.dart';

class DrawerProfile extends StatelessWidget {
  const DrawerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.only(left: 18),
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 2),
              margin: EdgeInsets.symmetric(vertical: 2),
              child: DrawerProfileHeaderSection(),
            ),
            Spacing.sp12,
            CustomDrawerButtom(
              icon: Icons.account_circle_rounded,
              buttomText: 'Profile',
              onButtomClick: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(profileRoute, (route) => false);
              },
            ),
            CustomDrawerButtom(
              icon: Icons.bookmark_border_outlined,
              buttomText: 'Bookmarks',
              onButtomClick: () async {},
            ),
            CustomDrawerButtom(
              icon: Icons.edit_document,
              buttomText: 'Lists',
              onButtomClick: () async {},
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
      ),
    );
  }
}
