import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'evenements.dart';
import 'reservation_client.dart';
import 'scanne.dart';

class Services extends StatelessWidget {
  List<Map> services = [
    {"titre": "Commande", "icon": Icons.restaurant},
    {"titre": "Reservation", "icon": Icons.schedule},
    {"titre": "Evenements", "icon": Icons.event_note},
    //{"titre": "Demande", "icon": Icons.vape_free},
    //{"titre": "Achat unité", "icon": Icons.phone_android_rounded},
    {"titre": "Payemant abonnement", "icon": Icons.payment},
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      crossAxisCount: 4,
      children: List.generate(services.length, (index) {
        //
        Map e = services[index];
        //
        return InkWell(
          onTap: () {
            //
            if (index == 0) {
              Get.to(Scnanner());
            } else if (index == 1) {
              Get.to(ReservationClient());
            } else if (index == 2) {
              Get.to(Evenements());
            }
          },
          child: SizedBox(
            height: 200,
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade900.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Icon(
                    e["icon"],
                    size: 30,
                    color: Colors.grey.shade700,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    e["titre"],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 8,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
