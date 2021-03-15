import 'package:gojek_profile_page_cloning/clone_gojek_profile_page/profile_change_language_page.dart';
import 'package:gojek_profile_page_cloning/clone_gojek_profile_page/profile_page_menu.dart';
import 'package:gojek_profile_page_cloning/clone_gojek_profile_page/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'language_provider.dart';
import 'sentence_theme.dart';

class ProfilePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 16,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.arrow_back),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Text(
                        myProfileText[watch(changeLanguageProvider).lang]
                            .toString(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/clerk.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'afrizalbotong',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    '+6281233085598',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                  Text(
                                    'cak.bhot@gmail.com',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                            )),
                        Container(
                          child: Icon(Mdi.pencil),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 16, top: 40),
                      child: Text(
                          accountText[watch(changeLanguageProvider).lang]
                              .toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600))),
                  SizedBox(height: 10),
                  Container(
                    margin: EdgeInsets.only(left: 16, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(darkMode[watch(changeLanguageProvider).lang]
                            .toString()),
                        Switch(
                            value: watch(changeThemeNotifier).darkTheme,
                            onChanged: (val) {
                              watch(changeThemeNotifier).changeTheme();
                            })
                      ],
                    ),
                  ),
                  ProfilePageMenu(
                      title: orderMenu[watch(changeLanguageProvider).lang]
                          .toString(),
                      icon: Mdi.bookOpen),
                  ProfilePageMenu(title: 'GoClub', icon: Mdi.circleDouble),
                  ProfilePageMenu(
                      title: voucherMenu[watch(changeLanguageProvider).lang]
                          .toString(),
                      icon: Mdi.playBox),
                  ProfilePageMenu(
                      title: inviteMenu[watch(changeLanguageProvider).lang]
                          .toString(),
                      icon: Mdi.accountBoxMultiple),
                  ProfilePageMenu(
                      title: voucherMenu[watch(changeLanguageProvider).lang]
                          .toString(),
                      icon: Mdi.brightnessPercent),
                  ProfilePageMenu(
                    title: languageMenu[watch(changeLanguageProvider).lang]
                        .toString(),
                    icon: Mdi.web,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProfileChangeLanguagePage()));
                    },
                  ),
                  ProfilePageMenu(
                      title: helpMenu[watch(changeLanguageProvider).lang]
                          .toString(),
                      icon: Mdi.helpCircle),
                  ProfilePageMenu(
                      title: addressMenu[watch(changeLanguageProvider).lang]
                          .toString(),
                      icon: Mdi.bookmark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
