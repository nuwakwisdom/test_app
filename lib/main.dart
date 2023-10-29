import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/navigator/navigator.dart';
import 'package:test_app/core/sl/sl_container.dart';
import 'package:test_app/features/dashboard/presentation/notifier/dashboard_notifier.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => sl<HomeNotifier>(),
        )
      ],
      child: MaterialApp(
        // title: 'Text App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: generateRoute,
        initialRoute: RouteName.splash,
      ),
    );
  }
}
