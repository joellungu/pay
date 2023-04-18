import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class MesContacts extends StatelessWidget {
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
            title: const Text("Vos contacts"),
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
                  child: FutureBuilder(
                    future: getAll(),
                    builder: (c, t) {
                      if (t.hasData) {
                        return t.data as Widget;
                      } else if (t.hasError) {
                        return Center(
                          child: Icon(Icons.hourglass_empty),
                        );
                      }
                      return Center(
                        child: SizedBox(
                          height: 40,
                          width: 40,
                        ),
                      );
                    },
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.people),
          ),
        ),
      ),
    );
  }

  Future<Widget> getAll() async {
    //
    List<Contact> contacts = await ContactsService.getContacts();
    //
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 10),
      children: List.generate(contacts.length, (index) {
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
            "${contacts[index].prefix} ${contacts[index].displayName}",
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
    );
  }
}
