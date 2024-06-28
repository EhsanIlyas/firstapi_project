import 'dart:convert';

import 'package:flutter/material.dart';
import 'Home_Screen.dart';
import 'package:http/http.dart' as http;

import 'Post_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

       home: HomeScreen(),


    );
  }
}


