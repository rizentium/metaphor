import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:metaphor/metaphor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dio = Dio();
  final _metaphorPlugin = Metaphor.initialize(
    options: MetaphorOptions(
      resolvers: [
        MetaphorResolver(
          requestOptions: MetaphorRequestOptions(
            method: MetaphorRequestType.GET,
            path: "/v1/users",
          ),
          data: {"is_mocked": true},
        ),
      ],
    ),
  );

  @override
  void initState() {
    _dio.interceptors.add(_metaphorPlugin.dioInterceptor());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(dio: _dio),
    );
  }
}

class Dashboard extends StatelessWidget {
  final Dio _dio;
  const Dashboard({super.key, required Dio dio}) : _dio = dio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metaphor Example'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          OutlinedButton(
            onPressed: () => _getUsers().then(
              (value) => _showSnackBar(context, json.encode(value)),
            ),
            child: const Text('Get Users'),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _getUsers() async {
    const url = 'https://603fdc88f3abf00017785396.mockapi.io';
    final response = await _dio.get('$url/v1/users');

    return response.data;
  }

  _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Result: $message"),
    ));
  }
}
