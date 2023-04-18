import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pay/utils/login_controller.dart';
import 'package:pay/utils/requete.dart';

class UpdateProfile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UpdateProfile();
  }
}

class _UpdateProfile extends State<UpdateProfile> {
  //
  final formKey = GlobalKey<FormState>();
  var id = "";
  final nomUtilisateur = TextEditingController();
  final phone = TextEditingController();
  final mdp1 = TextEditingController();
  final mdp2 = TextEditingController();
  //
  LoginController loginController = Get.find();
  String path = "";
  final box = GetStorage();
  //
  Map user = {};
  bool photo = false;

  @override
  void initState() {
    //
    user = box.read("user");
    //print(user);
    //
    super.initState();
    //
    id = "${user['id']}";
    nomUtilisateur.text = user['nomUtilisateur'];
    phone.text = user['telephone'];
    mdp1.text = user['motdepasse'];
    mdp2.text = user['motdepasse']; //photo
    photo = user['photo'] != null;
    print("photo: $photo");
    print("${Requete.urlSt}utilisateur/photo.png?id=$id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo.shade900,
        title: const Text("Profile"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(10),
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
                    child: SizedBox(
                      height: 130,
                      width: 130,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Align(
                              alignment: Alignment.center,
                              child: !photo
                                  ? Container(
                                      height: 90,
                                      width: 90, //NetworkImage() :
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.indigo.shade900,
                                        image: (path.isNotEmpty
                                            ? DecorationImage(
                                                image: FileImage(
                                                  File(path),
                                                ),
                                                fit: BoxFit.cover)
                                            : null),
                                        borderRadius: BorderRadius.circular(
                                          45,
                                        ),
                                      ),
                                      child: path.isEmpty
                                          ? const Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 50,
                                            )
                                          : Container(
                                              color: Colors.transparent,
                                            ),
                                    )
                                  : Container(
                                      height: 90,
                                      width: 90, // :
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.indigo.shade900,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${Requete.urlSt}utilisateur/photo.png?id=$id"),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(
                                          45,
                                        ),
                                      ),
                                      //child: Image.network(
                                      //  "${Requete.urlSt}utilisateur/photo.png?id=$id"),
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();
                                  //
                                  final XFile? image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    if (image != null) {
                                      path = image.path;
                                      photo = false;
                                    }
                                  });
                                },
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.green.shade900,
                                    borderRadius: BorderRadius.circular(
                                      20,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.photo_camera,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                      }

                      return null;
                    },
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
                        Map e = {
                          "id": id,
                          "nomUtilisateur": nomUtilisateur.text,
                          "telephone": phone.text,
                          "motdepasse": mdp1.text,
                          "photo": path.isEmpty
                              ? user['photo']
                              : File(path).readAsBytesSync(),
                        };
                        /**
                         */
                        Get.dialog(
                          const Center(
                            child: SizedBox(
                              height: 40,
                              width: 40,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                        loginController.mettreajour(e);
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
                          Icon(Icons.security_update),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Modifier",
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
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/**
 * 
 */
