import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('ru', 'RU'),Locale('uz', 'UZ'),Locale('fr', 'FR')],
        path: 'assets/translation',
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child:Text("welcome".tr()),
              )

            ],
          ),
          const SizedBox(height: 340,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: (){
                  context.locale = const Locale("en","US");
                }, child: Text("ENGLISH"),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                ),
                onPressed: (){
                  context.locale = const Locale('ru', 'RU');
                }, child: Text("RUSSIA"),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: (){
                  context.locale = const Locale('uz', 'UZ');
                }, child: Text("UZBEK"),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                ),
                onPressed: (){
                  context.locale = const Locale('fr', 'FR');
                }, child: Text("FRENCH"),),

            ],
          ),
          SizedBox(height: 100,),
        ],
      )
    );
  }
}
