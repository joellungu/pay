import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pages/accueil.dart';
import 'package:pay/pages/condition_utilisation/condition_utilisation.dart';
import 'package:pay/utils/login_controller.dart';

class Inscription extends StatelessWidget {
  //

  final formKey = GlobalKey<FormState>();
  final nomUtilisateur = TextEditingController();
  final phone = TextEditingController();
  final mdp1 = TextEditingController();
  final mdp2 = TextEditingController();
  final codepromo = TextEditingController();
  //
  LoginController loginController = Get.find();
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
            title: const Text("Inscription"),
            centerTitle: true,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text("""Votre argent partout avec vous"""),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: nomUtilisateur,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Nom d'utilisateur".tr,
                          labelText: "Nom d'utilisateur".tr,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nom d'utilisateur".tr;
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phone,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone_android_sharp),
                          prefixText: "+243  ",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Téléphone'.tr,
                          labelText: 'Téléphone'.tr,
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
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: mdp1,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Mot de passe'.tr,
                          labelText: 'Mot de passe'.tr,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Mot de passe'.tr;
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: mdp2,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.password),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Confirmation mot de passe'.tr,
                          labelText: 'Confirmation mot de passe'.tr,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirmation mot de passe'.tr;
                          } else if (mdp1.text != mdp2.text) {
                            return "Les deux mots de passe ne correspondent pas.";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: codepromo,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.join_full),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Champ non obligatoire'.tr,
                          labelText: 'Code promo'.tr,
                        ),
                        onChanged: (value) {
                          //print("Password value $value");
                        },
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            //Get.off(Accueil()); //
                            /**
                             */
                            Map e = {
                              "nomUtilisateur": nomUtilisateur.text,
                              "telephone": phone.text,
                              "motdepasse": mdp1.text,
                              "codePromo": codepromo.text,
                            };
                            showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController text =
                                    TextEditingController();
                                return Material(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      height: 200,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Align(
                                            alignment: Alignment.topCenter,
                                            child: Text(
                                              "Vous-allez reçevoir un CODE réçu par SMS",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              child: TextField(
                                                controller: text,
                                                autofocus: true,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                if (text.text.isNotEmpty &&
                                                    text.text == "1234567") {
                                                  Get.dialog(
                                                    const Center(
                                                      child: SizedBox(
                                                        height: 40,
                                                        width: 40,
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    ),
                                                  );
                                                  loginController
                                                      .inscription(e);
                                                  //Get.off(Accueil()); //
                                                } else {
                                                  Get.snackbar(
                                                    "Erreur",
                                                    "Le code ne corespond pas!",
                                                    colorText: Colors.black,
                                                    backgroundColor:
                                                        Colors.white,
                                                  );
                                                }
                                              },
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  Colors.green.shade700,
                                                ),
                                                elevation:
                                                    MaterialStateProperty.all(
                                                        0),
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 50,
                                                width: Get.size.width / 1.2,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Icon(Icons.check),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "Valider",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 25,
                                                      ),
                                                    ),
                                                  ],
                                                ),
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
                              Icon(Icons.login),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "S'enregistrer",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            onChanged: (e) {},
                            value: true,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                //
                                Get.to(ConditionUtilisateur());
                              },
                              child: const Text(
                                "J'ai lu et j'accepte les termes et conditions d'utulisation",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  decorationStyle: TextDecorationStyle.solid,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
