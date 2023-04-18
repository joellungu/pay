import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter/services.dart' show rootBundle;

class ConditionUtilisateur extends StatelessWidget {
  String text = "";
  ConditionUtilisateur() {
    load();
  }
  Future<String> load() async {
    String data =
        await rootBundle.loadString('assets/Politiaue de confidentialite.html');
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Condition utilisateur"),
        ),
        body: FutureBuilder(
          future: load(),
          builder: (c, t) {
            if (t.hasData) {
              String data = t.data as String;
              return ListView(
                children: [
                  Html(
                    data: data,
                    shrinkWrap: true,
                  ),
                ],
              );
            } else if (t.hasError) {
              return Container();
            }
            return Container();
          },
        ));
  }
}
