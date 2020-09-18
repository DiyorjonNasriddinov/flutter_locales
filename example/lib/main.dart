import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['en', 'fa', 'ps']); // get last saved language
  // remove await async (to get system language as default)

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocaleBuilder(
      builder: (locale) => MaterialApp(
        title: 'Flutter Locales',
        localizationsDelegates: Locales.delegates,
        supportedLocales: Locales.supportedLocales,
        locale: locale,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: LocaleText('localization')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LocaleText('welcome', style: TextStyle(fontSize: 32)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => SettingScreen()));
        },
        child: Icon(Icons.settings),
      ),
    );
  }
}

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: LocaleText('setting'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () => LocaleNotifier.of(context).change('en'),
            title: LocaleText('english'),
          ),
          ListTile(
            onTap: () => LocaleNotifier.of(context).change('ps'),
            title: LocaleText('pashto'),
          ),
          ListTile(
            onTap: () => LocaleNotifier.of(context).change('fa'),
            title: LocaleText('farsi'),
          ),
        ],
      ),
    );
  }
}
