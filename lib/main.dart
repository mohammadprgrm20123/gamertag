import 'package:flutter/material.dart';
import 'chat/view/chat_screen.dart';

import 'infrastructure/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.getAppTheme(),
        home: const ChatScreen(),
      );
}
