import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pages/entreprise/produits.dart';
import 'package:pay/utils/boutique_controller.dart';
import 'package:pay/utils/requete.dart';

import 'evenement_details.dart';

class Evenements extends GetView<BoutiqueController> {
  //
  //BoutiqueController boutiqueController = Get.find();
  //
  Evenements() {
    controller.allEvenements();
  }

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
            title: const Text("Evenements"),
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
                    contentPadding: EdgeInsets.all(0),
                    hintText: "Evenements",
                    prefixIcon: const Icon(
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
                child: controller.obx(
                  (state) {
                    List l = state!;
                    return ListView(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      children: List.generate(l.length, (index) {
                        Map e = l[index];
                        return InkWell(
                          onTap: () {
                            //
                            Get.to(EvenementDetails(e));
                            //
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
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
                                  child: Image.network(
                                      "${Requete.urlSt}produit/photo.png?id=${e['id']}"),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: ListTile(
                                  title: Text(
                                    "${e['nom']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                  subtitle: Text(
                                    "${e['prix']}, ${e['devise']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 30),
                                  ),
                                  // trailing: Icon(
                                  //   Icons.arrow_forward_ios,
                                  // ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
