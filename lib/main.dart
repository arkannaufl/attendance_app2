import 'package:attendance_app2/ui/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAH6TyGXknT_ChYJ5uR1wZ2JQ2un-v32XE', //current_key
          appId: '1:998285413528:android:032cc5f2367d9c590f54ed', //mobilesdk_app_id
          messagingSenderId: '998285413528',//project_number
          projectId: 'attendance-app2-f7497' //project_id
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
