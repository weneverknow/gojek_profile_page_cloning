import 'package:gojek_profile_page_cloning/clone_gojek_profile_page/profile_page.dart';
import 'package:gojek_profile_page_cloning/clone_gojek_profile_page/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'clone_gojek_profile_page/theme.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
      theme: watch(changeThemeNotifier).darkTheme ? dark : light,
    );
  }
}
