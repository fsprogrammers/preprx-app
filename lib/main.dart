import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:preprx/utils/app_routes.dart';
import 'package:preprx/view/splash/splash2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      designSize: Size(375, 812),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRouter,
        builder: (context, child) => Overlay(
          initialEntries: [
            if (child != null) ...[OverlayEntry(builder: (context) => child)],
          ],
        ),
        title: 'PrepRx',
        theme: ThemeData(useMaterial3: true),
      ),
    );
  }
}
