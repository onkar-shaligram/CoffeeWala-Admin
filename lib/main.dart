import 'package:coffeewala_admin/models/user.dart';
import 'package:coffeewala_admin/screens/home/archive_page.dart';
import 'package:coffeewala_admin/screens/services/auth.dart';
import 'package:coffeewala_admin/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
        routes : {
        '/archives' : (context) => Archives()
    }
      ),
    );
  }
}
