import 'package:emart_app/view/splashScreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'consts/consts.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

// Future<void> initializeApp() async {
//   await Firebase.initializeApp();
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: darkFontGrey,
            ),
            backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
