import 'package:eezy_admin/model/services/authentication_services.dart';
import 'package:eezy_admin/view/dashbord/web_layout.dart';
import 'package:eezy_admin/view/sign-up/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pocketbase/pocketbase.dart';

//import 'firebase_options.dart';

// import { initializeApp } from "firebase/app";
// import { getAnalytics } from "firebase/analytics";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(

  //     options: const FirebaseOptions(
  //         apiKey: "AIzaSyDsQnPQMhJSXauMo1VUOEeTDiRviaj50Z0",
  //         appId: "1:253239783033:web:e8da99b44eb11c8e67eea8",
  //         messagingSenderId: "253239783033",
  //         projectId: "eezy-14970",
  //         storageBucket: "eezy-14970.appspot.com",
  //         authDomain: "eezy-14970.firebaseapp.com",
  //         measurementId: "G-6S8D6X30LY"));
  final pb = PocketBase('https://eezy.pockethost.io'
      //'http://127.0.0.1:8090',
      // load the fetch_client only for web, otherwise - fallback to the default http.Client()
      //  httpClientFactory: kIsWeb ? () => FetchClient(mode: RequestMode.cors) : null,
      );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //  final bool isValid = pb.authStore.isValid;
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: 
        //isValid ? WebLayout() : const LandingPage(),

            //DashBoard()
            LandingPage()
            // WebLayout()

            );
  }
}
