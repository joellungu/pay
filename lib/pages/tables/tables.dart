import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Tables extends StatelessWidget {
  //
  final box = GetStorage();
  //
  RxList liste = [].obs;
  //
  Tables() {
    //
    liste.value = box.read("tables") ?? [];
  }
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tables"),
      ),
      body: Obx(
        () => ListView(
          children: List.generate(
            liste.length,
            (index) => ListTile(
              leading: Icon(Icons.table_bar),
              title: Text("${liste[index]['table']}"),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        alignment: Alignment.center,
        child: ElevatedButton(
          child: const Text("Ajouter"),
          onPressed: () {
            //
            liste.value = box.read("tables") ?? [];
          },
        ),
      ),
    );
  }
}
