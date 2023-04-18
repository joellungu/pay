import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mes_contacts.dart';

class DemandeTransfere extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo.shade900,
            title: const Text("Demande et transfère"),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Cherche ",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  children: List.generate(100, (index) {
                    return ListTile(
                      leading: Container(
                        height: 50,
                        width: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade900.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.question_mark,
                          size: 30,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      title: Text(
                        "Comment obtenir les API de paiement ?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text("Questions courante..."),
                      // trailing: Icon(
                      //   Icons.arrow_forward_ios,
                      // ),
                    );
                  }),
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(MesContacts());
            },
            child: Icon(Icons.people),
          ),
        ),
      ),
    );
  }
}
