import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay/utils/panier_controller.dart';
import 'package:pay/utils/requete.dart';
import 'package:pay/widgets/paiement.dart';
import 'package:uuid/uuid.dart';

class EvenementDetails extends StatelessWidget {
  Map e;
  EvenementDetails(this.e);
  //

  PanierController controller = Get.find();
  //
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
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 9,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900,
                    image: DecorationImage(
                        image: NetworkImage(
                            "${Requete.urlSt}produit/photo.png?id=${e['id']}"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(
                      1,
                    ),
                  ),
                  child: Image.network(
                      "${Requete.urlSt}produit/photo.png?id=${e['id']}"),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                    "${e['nom']}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                  subtitle: Text(
                    "${e['prix']}, ${e['devise']}",
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
                  ),
                  // trailing: Icon(
                  //   Icons.arrow_forward_ios,
                  // ),
                ),
              )
            ],
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              //
              final box = GetStorage();
              //
              Map user = box.read("user");
              //
              var ref = getReference();
              //
              DateTime dateTime = DateTime.now();
              String d = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
              Map x = {
                "idBoutique": e['idBoutique'],
                "idUtilisateur": user['id'],
                "date": d,
                "type": 2,
                "idProduit": e['id'],
                //"produits": [{}],
                "prix": e['prix'],
                "devise": e['devise'],
                "reference": ref,
              };
              //Cette methose est pour le Test
              //send(x);
              //
              showDialog(
                context: context,
                builder: (c) {
                  return Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 300,
                        width: 270,
                        child: PayementMethode(
                          x,
                          7,
                          send,
                          "pay",
                          "pay",
                        ),
                      ),
                    ),
                  );
                },
              );

              //
            },
            child: Container(
              height: 50,
              color: Colors.indigo,
              alignment: Alignment.center,
              child: Text(
                "Reserver",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  send(Map e) async {
    //
    Get.back();
    //
    Get.dialog(
      const Center(
        child: SizedBox(
          height: 40,
          width: 40,
          child: CircularProgressIndicator(),
        ),
      ),
    );
    controller.commander(e);
  }

  //
  String getReference() {
    var uuid = Uuid();
    return "${uuid.v4()}";
  }
}
