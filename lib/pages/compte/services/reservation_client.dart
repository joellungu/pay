import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pages/entreprise/produits.dart';
import 'package:pay/utils/boutique_controller.dart';

class ReservationClient extends GetView<BoutiqueController> {
  //
  //BoutiqueController boutiqueController = Get.find();
  //
  ReservationClient() {
    controller.all();
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
            title: const Text("Liste de business"),
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
                    hintText: "Boutique ou business",
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
                        print(e);
                        if (e['typeEtablissement'] == "Restaurant" ||
                            e['typeEtablissement'] == "Bar" ||
                            e['typeEtablissement'] == "Pharmacie") {
                          return ListTile(
                            onTap: () {
                              //
                              Get.to(Produits(
                                  "${e['id']}", "${e['denomination']}"));
                              //
                            },
                            // leading: Container(
                            //   height: 50,
                            //   width: 50,
                            //   alignment: Alignment.center,
                            //   decoration: BoxDecoration(
                            //     color: Colors.indigo.shade900.withOpacity(0.2),
                            //     borderRadius: BorderRadius.circular(25),
                            //   ),
                            //   child: Icon(
                            //     Icons.question_mark,
                            //     size: 30,
                            //     color: Colors.grey.shade700,
                            //   ),
                            // ),

                            title: Text(
                              "${e['denomination']}",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Text(
                                "${e['provinceSiege']}, ${e['adresseEtablissement']}"),
                            // trailing: Icon(
                            //   Icons.arrow_forward_ios,
                            // ),
                          );
                        } else {
                          return Container();
                        }
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
