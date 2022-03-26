import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/style/no_transitions_on_web.dart';
import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialize();
  runApp(Kweb());
}

class Kweb extends StatelessWidget {
  const Kweb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<FirebaseApp> k = Firebase.initializeApp(
      options: FirebaseOptions(
          appId: '1:517395428477:web:217478bb6bae0ceee8ed14',
          apiKey: 'AIzaSyAESsbkDeq1nHA0DzE1l08NWCcDnokP5mw',
          messagingSenderId: '517395428477',
          projectId: 'kweb-692dc'),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Kweb',
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      theme: ThemeData(
        pageTransitionsTheme: NoTransitionsOnWeb(),
      ),
      home: FutureBuilder(
          future: k,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Container(
                  child: Text('error'),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Future.delayed(const Duration(milliseconds: 500), () {
                Get.toNamed(Routes.login);
              });
            }
            return Scaffold(
                backgroundColor: Color.fromRGBO(123, 3, 19, 1),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: CircularProgressIndicator()),
                ));
          }),
    );
  }
}

Future<bool> initialize() async {
  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });
  return true;
}
