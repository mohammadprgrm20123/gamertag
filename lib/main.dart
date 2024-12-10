import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'chat/view/chat_screen.dart';

import 'infrastructure/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) => ProviderScope(
    child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.getAppTheme(),
          home: const ChatScreen(userId: '1',),
        ),
  );
}
