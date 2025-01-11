import 'package:chat_app/pages/app_services.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as provider;
// ignore: depend_on_referenced_packages
//import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: 'https://bioudpmlmblhwvcdtlhj.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJpb3VkcG1sbWJsaHd2Y2R0bGhqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzY2MDMxMTYsImV4cCI6MjA1MjE3OTExNn0.Lbyeq4rVPfhiKK36fe_LoULVf7BRseQFwj0yvWx7G_k',
  );

  runApp(
    provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider<AppService>(
          create: (_) => AppService(),
        )
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/chat': (_) => const ChatPage(),
      },
    );
  }
}
