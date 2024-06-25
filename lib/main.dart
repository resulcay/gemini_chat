import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemini_chat/constants/text_constants.dart';
import 'package:gemini_chat/utilities/theme.dart';
import 'package:gemini_chat/view/onboarding_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: TextConstants.appTitle,
      theme: ThemeConfig.themeData,
      home: const OnboardingView(),
    );
  }
}
