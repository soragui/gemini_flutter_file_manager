import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:find/src/home/home_view_model.dart';
import 'package:find/src/home/home_screen.dart';
import 'package:find/src/data/repositories/file_repository.dart';
import 'package:find/src/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel(FileRepository())),
      ],
      child: MaterialApp(
        title: 'Find',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system, // Or ThemeMode.light/dark
        home: const HomeScreen(),
      ),
    );
  }
}
