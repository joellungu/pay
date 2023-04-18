import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Propos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("À propos"),
      ),
      body: Html(
        data: "",
      ),
    );
  }
}
