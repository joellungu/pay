import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pages/compte/services/panier.dart';
import 'package:pay/utils/panier_controller.dart';
import 'package:pay/utils/produit_controller.dart';
import 'package:pay/utils/requete.dart';

import 'details_produit.dart';
import 'nouveau_produit.dart';

class Produits extends GetView<ProduitController> {
  String id;
  String titre;
  Produits(this.id, this.titre) {
    controller.tousProduitsEntreprise(id);
  }
  //
  PanierController panierController = Get.find();

  RxString nom = "".obs;
  //
  RxBool v = true.obs;
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
            title: Text(titre),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  onChanged: (t) {
                    nom.value = t;
                  },
                  decoration: InputDecoration(
                    hintText: "Cherche ",
                    contentPadding: const EdgeInsets.all(5),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: controller.obx(
                    (state) {
                      List l = state!;
                      return Obx(
                        () => v.value
                            ? Column(
                                //
                                //padding: EdgeInsets.symmetric(horizontal: 10),
                                children: List.generate(l.length, (index) {
                                  Map e = l[index];
                                  if ((e['nom']
                                      .toLowerCase()
                                      .contains(nom.value.toLowerCase()))) {
                                    return ListTile(
                                      onTap: () {
                                        //
                                        showDialog(
                                            context: context,
                                            builder: (c) {
                                              TextEditingController quantite =
                                                  TextEditingController(
                                                      text: "1");
                                              TextEditingController table =
                                                  TextEditingController(
                                                      text: "1");
                                              return Material(
                                                color: Colors.transparent,
                                                child: Center(
                                                  child: Container(
                                                    height: 300,
                                                    width: 300,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                  "${e['nom']}"),
                                                              IconButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                icon:
                                                                    const Icon(
                                                                  Icons.close,
                                                                  size: 40,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: TextField(
                                                            controller:
                                                                quantite,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              label: Text(
                                                                  "Quantité"),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: TextField(
                                                            controller: table,
                                                            keyboardType:
                                                                TextInputType
                                                                    .number,
                                                            decoration:
                                                                InputDecoration(
                                                              label:
                                                                  Text("Table"),
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomCenter,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              if (quantite
                                                                      .text !=
                                                                  "0") {
                                                                Map p = {
                                                                  "id": e['id'],
                                                                  "idBoutique":
                                                                      "${e['idBoutique']}",
                                                                  "nom":
                                                                      "${e['nom']}",
                                                                  "prix":
                                                                      "${e['prix']}",
                                                                  "devise":
                                                                      "${e['devise']}",
                                                                  "quantite":
                                                                      quantite
                                                                          .text,
                                                                  "table": table
                                                                      .text,
                                                                };
                                                                panierController
                                                                    .listProduits
                                                                    .add(p);
                                                                Get.back();
                                                              }
                                                            },
                                                            child: const Text(
                                                                "Ajouter"),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                        //
                                      },
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo.shade900,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${Requete.urlSt}produit/photo.png?id=${e['id']}"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        "${e['nom']} ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${e['prix']} ${e['devise']}",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    );
                                  } else {
                                    print(
                                        "La valeur vaut2: ${(e['nom'].toLowerCase().contains(nom.value.toLowerCase()))} ------------------");
                                    return Container();
                                  }
                                }),
                              )
                            : Container(),
                      );
                    },
                    onEmpty: Container(),
                    onLoading: const Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //
              Get.to(Panier());
            },
            heroTag: "payer",
            child: const Icon(Icons.add_shopping_cart),
          ),
        ),
      ),
    );
  }
}
