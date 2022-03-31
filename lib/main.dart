import 'package:flutter/material.dart';
import 'package:flutter_search/HomePage.dart';

void main() => runApp(SearchBarExample());

class SearchBarExample extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo Search',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage(title: 'Flutter Demo Home'),
    );
  }
  
}



