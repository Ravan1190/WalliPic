import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:walli_pic/utils/theme_states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: false);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController controller = PageController();  // It manipulate which page is visible in a PageView.

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // MultiProvider use to improve readability and reduce boilerplate code.
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ThemeState()),
          ChangeNotifierProvider(create: (context) => PageState()),
        ],
      builder: (context, _) {
          final themeState = Provider.of<ThemeState>(context);
          final pageState = Provider.of<PageState>(context);
          themeState.getTheme();
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //this prevent app from closing on pressing back button unless we are on homepage.
            home: WillPopScope(
                onWillPop: () async {
                  if (pageState.currentPage != 0) {
                    pageState.changePage(0);
                    controller.jumpTo(0);
                    return false;
                  } else
                    return true;
                },
              child: Scaffold(
                body: PageView(

                ),
              ),
            ),
          );
      },
    );
  }
}
