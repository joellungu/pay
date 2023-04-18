import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay/utils/compte_controller.dart';

class MesComptes extends GetView<CompteController> {
  MesComptes() {
    controller.tousCompte();
  }

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: const Text("Mes comptes"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          controller.obx(
            (state) {
              List l = state!;

              String compte = box.read("compte") ?? "";
              RxString c = compte.obs;
              //
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  l.length,
                  (index) {
                    Map e = l[index];
                    return Card(
                      elevation: 1,
                      child: InkWell(
                        onTap: () {
                          c.value = "${e['reseau']}";
                          box.write("compte", c.value);
                        },
                        child: Obx(
                          () => Container(
                            padding: const EdgeInsets.only(left: 10),
                            height: 70,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                c.value == "${e['reseau']}"
                                    ? Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : Container(),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    alignment: Alignment.centerLeft,
                                    child: Text.rich(
                                      TextSpan(text: "", children: [
                                        TextSpan(
                                          text: "${e['reseau']}\n",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.indigo.shade900,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "+243 ${e['numero']}",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.dialog(
                                      const Center(
                                        child: SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    );
                                    controller.supprimer("${e['id']}");
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (c) {
                  //

                  final formKey = GlobalKey<FormState>();
                  //
                  RxString device = "Vodacom".obs;
                  //
                  TextEditingController telephone = TextEditingController();
                  //
                  return Material(
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: Get.size.height / 2,
                        width: Get.size.width / 1.3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Ajouter un compte",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.close),
                                      onPressed: () {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                              ),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    onChanged: (tt) {
                                      //
                                      device.value = tt as String;
                                    },
                                    value: device.value,
                                    items: const [
                                      //
                                      DropdownMenuItem(
                                        value: "Vodacom",
                                        child: Text("Vodacom"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Airtel",
                                        child: Text("Airtel"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Orange",
                                        child: Text("Orange"),
                                      ),
                                      DropdownMenuItem(
                                        value: "Africell",
                                        child: Text("Africell"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Form(
                              key: formKey,
                              child: TextFormField(
                                controller: telephone,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixIcon:
                                      const Icon(Icons.person_outline_outlined),
                                  prefixText: "+243  ",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'telephone'.tr,
                                  labelText: 'telephone'.tr,
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Téléphone'.tr;
                                  } else if (!value.isPhoneNumber) {
                                    return "Téléphone";
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  //print("Password value $value");
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  Get.dialog(
                                    const Center(
                                      child: SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                  );
                                  /**
                                   */

                                  final box = GetStorage();
                                  Map user = box.read("user");
                                  print(user);
                                  String idProprio = "${user['id']}";
                                  //
                                  Map e = {
                                    "reseau": device.value,
                                    "numero": telephone.text,
                                    "idProprietaire": idProprio,
                                  };
                                  //
                                  controller.enregistrer(e);
                                  //Get.off(Accueil()); //
                                  //Get.to(Inscription()); //
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade700,
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: Get.size.width / 1.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.check),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Ajouter",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text("Ajouter"),
          )
        ],
      ),
    );
  }
}
