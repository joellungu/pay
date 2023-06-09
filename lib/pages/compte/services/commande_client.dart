import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/utils/produit_controller.dart';
import 'package:pay/utils/requete.dart';

class CommandeClient extends GetView<ProduitController> {
  Produits() {
    controller.tousProduitsEntreprise("1");
  }
  //

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
                    contentPadding: const EdgeInsets.all(0),
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
                                        //Get.to(DetailsPRoduit(e));
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
                                        "${e['nom']} | ${e['prix']} ${e['devise']}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      subtitle: Text(
                                          "${e['quantite']} | ${e['unite']}"),
                                      // trailing: Icon(
                                      //   Icons.arrow_forward_ios,
                                      // ),
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
        ),
      ),
    );
  }
}
