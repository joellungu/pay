import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay/pages/profile/profile.dart';

import 'pages/accueil.dart';
import 'pages/entreprise/entreprise.dart';
import 'pages/login/connexion.dart';
import 'utils/boutique_controller.dart';
import 'utils/commande_controller.dart';
import 'utils/compte_controller.dart';
import 'utils/login_controller.dart';
import 'utils/panier_controller.dart';
import 'utils/produit_controller.dart';
import 'widgets/paiement_controller.dart';

void main() async {
  //
  await GetStorage.init();
  //
  LoginController applicationController = Get.put(LoginController());
  //
  ProduitController produitController = Get.put(ProduitController());
  //
  CompteController compteController = Get.put(CompteController());
  //
  CommandeController commandeController = Get.put(CommandeController());
  //
  BoutiqueController boutiqueController = Get.put(BoutiqueController());
  //
  PanierController panierController = Get.put(PanierController());
  //
  PaiementController paiementController = Get.put(PaiementController());
  //
  runApp(Pay());
}

class Pay extends StatelessWidget {
  Pay({super.key});
  //
  final box = GetStorage();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map e = box.read("user") ?? {};
    print(e);
    //
    return GetMaterialApp(
      title: 'Pay',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: e['id'] != null ? Accueil() : Connexion(),
      //Connexion()
      //Accueil(),
      //Entreprise(),
      //Profile(),
    );
  }
}
