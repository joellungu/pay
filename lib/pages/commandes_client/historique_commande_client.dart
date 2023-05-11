import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay/utils/commande_controller.dart';
import 'package:pay/utils/requete.dart';

import 'historique_details.dart';

class HistoriqueCommandeClient extends GetView<CommandeController> {
  //
  Requete requete = Requete();
  //
  CommandeController commandeController = Get.find();
  //
  RxString date = "Date".obs;
  //
  RxString service = "Restaurant".obs;
  //
  Rx<Widget> vue = Rx(Container());

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: const Text("Vos commandes"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      height: 45,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Obx(
                        () => Text(date.value),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () {
                        //
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2023),
                                lastDate: DateTime(2030))
                            .then(
                          (d) {
                            //
                            final box = GetStorage();
                            //
                            Map user = box.read("user");
                            //
                            date.value = "${d!.day}-${d.month}-${d.year}";
                            //
                            commandeController.commandes(
                                "${user['id']}", date.value);
                            // vue.value = FutureBuilder(
                            //   future: commandeController.commandes(
                            //       "${user['id']}", date.value),
                            //   builder: (c, t) {
                            //     if (t.hasData) {
                            //       List liste = t.data as List;
                            //       return ListView(
                            //         padding: const EdgeInsets.all(10),
                            //         children:
                            //             List.generate(liste.length, (index) {
                            //           //
                            //           Map e = liste[index];
                            //           //
                            //           return InkWell(
                            //             onTap: () {
                            //               //
                            //               //Get.to(EvenementDetails(e));
                            //               //
                            //             },
                            //             child: Row(
                            //               mainAxisAlignment:
                            //                   MainAxisAlignment.spaceAround,
                            //               children: [
                            //                 Expanded(
                            //                   flex: 4,
                            //                   child: Container(
                            //                     alignment: Alignment.center,
                            //                     decoration: BoxDecoration(
                            //                       color: Colors.indigo.shade900,
                            //                       image: DecorationImage(
                            //                           image: NetworkImage(
                            //                               "${Requete.urlSt}produit/photo.png?id=${e['id']}"),
                            //                           fit: BoxFit.cover),
                            //                       borderRadius:
                            //                           BorderRadius.circular(
                            //                         25,
                            //                       ),
                            //                     ),
                            //                     child: Image.network(
                            //                         "${Requete.urlSt}produit/photo.png?id=${e['id']}"),
                            //                   ),
                            //                 ),
                            //                 Expanded(
                            //                   flex: 6,
                            //                   child: ListTile(
                            //                     title: Text(
                            //                       "${e['nom']}",
                            //                       style: TextStyle(
                            //                           fontWeight:
                            //                               FontWeight.w500,
                            //                           fontSize: 25),
                            //                     ),
                            //                     subtitle: Text(
                            //                       "${e['prix']}, ${e['devise']}",
                            //                       style: TextStyle(
                            //                           fontWeight:
                            //                               FontWeight.normal,
                            //                           fontSize: 30),
                            //                     ),
                            //                     // trailing: Icon(
                            //                     //   Icons.arrow_forward_ios,
                            //                     // ),
                            //                   ),
                            //                 )
                            //               ],
                            //             ),
                            //           );
                            //         }),
                            //       );
                            //     } else if (t.hasError) {
                            //       return Center(
                            //         child: Icon(Icons.hourglass_empty),
                            //       );
                            //     }
                            //     return Center(
                            //       child: SizedBox(
                            //         height: 40,
                            //         width: 40,
                            //       ),
                            //     );
                            //   },
                            // );
                          },
                        );
                      },
                      child: Text("Date"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: controller.obx(
                  (state) {
                    List liste = state as List;
                    return ListView(
                      padding: const EdgeInsets.all(10),
                      children: List.generate(liste.length, (index) {
                        //
                        Map e = liste[index];
                        //
                        return InkWell(
                          onTap: () {
                            //
                            Get.to(HistoriqueDetails(e));
                            //
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 4,
                                child: e['type'] == 2
                                    ? Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.indigo.shade900,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${Requete.urlSt}produit/photo.png?id=${e['idProduit']}"),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.circular(
                                            25,
                                          ),
                                        ),
                                        child: Image.network(
                                            "${Requete.urlSt}produit/photo.png?id=${e['idProduit']}"),
                                      )
                                    : Container(
                                        child: FutureBuilder(
                                          future: getDetailBoutique(
                                              "${e['idBoutique']}"),
                                          builder: (c, t) {
                                            //
                                            if (t.hasData) {
                                              Map e = t.data as Map;
                                              if (e["id"] != null) {
                                                return ListTile(
                                                  title: Text(
                                                    "${e['denomination']}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 25),
                                                  ),
                                                  subtitle: Text(
                                                    "${e['adresseEtablissement']}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 13),
                                                  ),
                                                  // trailing: Icon(
                                                  //   Icons.arrow_forward_ios,
                                                  // ),
                                                );
                                              } else {
                                                return Container();
                                              }
                                            } else if (t.hasError) {
                                              return Container();
                                            }
                                            return Center(
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 40,
                                                width: 40,
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                              ),
                              Expanded(
                                flex: 6,
                                child: ListTile(
                                  title: Text(
                                    "${e['date']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                  subtitle: Text(
                                    "${e['prix']}, ${e['devise']}\n_______________________",
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
                  onError: (error) => Container(),
                  onLoading: const Center(
                    child: SizedBox(
                      height: 40,
                      width: 40,
                    ),
                  ),
                )
                //Obx(() => vue.value),
                )
          ],
        ),
      ),
    );
  }

  Future<Map> getDetailBoutique(String idBoutique) async {
    Response rep = await requete.getE("boutique/$idBoutique");
    if (rep.isOk) {
      return rep.body;
    } else {
      return {};
    }
  }
}
