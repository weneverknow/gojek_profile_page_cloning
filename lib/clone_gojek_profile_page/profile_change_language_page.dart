import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'language_provider.dart';
import 'sentence_theme.dart';

class ProfileChangeLanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        title: Consumer(
            builder: (context, watch, child) => Text(
                changeLanguageAppBar[watch(changeLanguageProvider).lang]
                    .toString())),
        centerTitle: false,
      ),
      body: Consumer(
        builder: (context, watch, child) => Column(
          children: [
            InkWell(
              onTap: () {
                if (!watch(changeLanguageProvider).isEnglish) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text(
                              'Are you sure you want to change the language to English?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('No')),
                            TextButton(
                                onPressed: () {
                                  watch(changeLanguageProvider).isEnglish =
                                      true;
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes'))
                          ],
                        );
                      });
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 0.8))),
                child: Row(
                  children: [
                    watch(changeLanguageProvider).isEnglish
                        ? Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(Icons.check,
                                color: Colors.green[300], size: 22),
                          )
                        : SizedBox(width: 42),
                    Text('English'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (watch(changeLanguageProvider).isEnglish) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Confirmation'),
                          content: Text(
                              'Are you sure you want to change the language to Bahasa Indonesia?'),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('No')),
                            TextButton(
                                onPressed: () {
                                  watch(changeLanguageProvider).isEnglish =
                                      false;
                                  Navigator.of(context).pop();
                                },
                                child: Text('Yes'))
                          ],
                        );
                      });
                }

                //watch(changeLanguageProvider).isEnglish = false;
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black12, width: 0.8))),
                child: Row(
                  children: [
                    watch(changeLanguageProvider).isEnglish
                        ? SizedBox(width: 42)
                        : Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(Icons.check,
                                color: Colors.green[300], size: 22),
                          ),
                    Text('Bahasa'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
