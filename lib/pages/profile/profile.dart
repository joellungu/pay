import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pages/commandes_client/historique_commande_client.dart';
import 'package:pay/pages/compte/compte_client.dart';
import 'package:pay/pages/condition_utilisation/condition_utilisation.dart';
import 'package:pay/pages/demande_transfere/demande_transfere.dart';
import 'package:pay/pages/faq/faq.dart';
import 'package:pay/pages/propos/propos.dart';

import 'update.dart';

class Profile extends StatelessWidget {
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
            title: const Text("Pay"),
            centerTitle: true,
          ),
          body: ListView(
            padding: const EdgeInsets.all(10),
            children: [
              const SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  //
                  Get.to(UpdateProfile());
                  //DemandeTransfere
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    CupertinoIcons.person,
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                title: const Text("Profile"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
              ListTile(
                //
                onTap: () {
                  //
                  Get.to(HistoriqueCommandeClient());
                  //DemandeTransfere
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.wallet,
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                title: Text(
                    "Commande"), //Toutes les commandes que j'ai pu faire dans les bars, resto et autre...
                subtitle: Text("Bar, Restaurant, Pharmacie etc..."),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
              ListTile(
                onTap: () {
                  //
                  Get.to(DemandeTransfere());
                  //
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.send_to_mobile,
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                title: Text("Demandes & transfère"),
                subtitle: Text("Historique"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
              // ListTile(
              //   leading: Container(
              //     height: 50,
              //     width: 50,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: Colors.indigo.shade900.withOpacity(0.2),
              //       borderRadius: BorderRadius.circular(25),
              //     ),
              //     child: Icon(
              //       Icons.monetization_on,
              //       size: 30,
              //       color: Colors.grey.shade700,
              //     ),
              //   ),
              //   title: Text("Compte business"),
              //   subtitle: Text("Boutique, Independant etc"),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios,
              //   ),
              // ),
              ListTile(
                onTap: () {
                  //
                  Get.to(MesComptes());
                  //
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.monetization_on,
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                title: Text("Compte"),
                subtitle: Text("Ajouter, supprimer etc."),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
              // ListTile(
              //   leading: Container(
              //     height: 50,
              //     width: 50,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: Colors.indigo.shade900.withOpacity(0.2),
              //       borderRadius: BorderRadius.circular(25),
              //     ),
              //     child: Icon(
              //       Icons.developer_mode,
              //       size: 30,
              //       color: Colors.grey.shade700,
              //     ),
              //   ),
              //   title: Text("API & Integration"),
              //   subtitle: Text("Pour les dévéloppeurs"),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios,
              //   ),
              // ),
              ListTile(
                onTap: () {
                  //
                  Get.to(Faq());
                  //
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.question_mark,
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                title: Text("F.A.Q"),
                subtitle: Text("Questions courante..."),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(ConditionUtilisateur());
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                title: Text("Condition d'utilisation"),
                subtitle: Text("Régles et obligations"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
              ListTile(
                onTap: () {
                  Get.to(Propos());
                },
                leading: Container(
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    Icons.abc,
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                title: Text("À propos"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
              ),
              // ListTile(
              //   leading: Container(
              //     height: 50,
              //     width: 50,
              //     alignment: Alignment.center,
              //     decoration: BoxDecoration(
              //       color: Colors.indigo.shade900.withOpacity(0.2),
              //       borderRadius: BorderRadius.circular(25),
              //     ),
              //     child: Icon(
              //       Icons.contact_page_outlined,
              //       size: 30,
              //       color: Colors.grey.shade700,
              //     ),
              //   ),
              //   title: Text("Contacter nous"),
              //   trailing: Icon(
              //     Icons.arrow_forward_ios,
              //   ),
              // ),//,
            ],
          ),
        ),
      ),
    );
  }
}
