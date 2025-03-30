import 'package:dribble_app/bottom_bar.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: dribble_app(),
    );
  }
}
class dribble_app extends StatefulWidget {
  const dribble_app({super.key});

  @override
  State<dribble_app> createState() => _dribble_appState();
}

class _dribble_appState extends State<dribble_app> {
  @override
  Widget build(BuildContext context) {
    return BottomBar();
  }
}