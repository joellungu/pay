import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pay/utils/panier_controller.dart';
import 'package:pay/utils/requete.dart';
import 'package:pay/widgets/paiement.dart';
import 'package:uuid/uuid.dart';

class HistoriqueDetails extends StatelessWidget {
  Map e;
  HistoriqueDetails(this.e);
  //

  PanierController controller = Get.find();
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
          ),
          body: ListView(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              e['type'] == 2
                  ? Container(
                      height: 400,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: BarcodeWidget(
                          barcode: Barcode.qrCode(
                            errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                          ),
                          data: '${e['id']}',
                          width: 200,
                          height: 200,
                        ),
                      ),
                    )
                  : Container(),
              e['type'] == 2
                  ? Container(
                      height: 400,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade900,
                          image: DecorationImage(
                              image: NetworkImage(
                                  "${Requete.urlSt}produit/photo.png?id=${e['idProduit']}"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(
                            1,
                          ),
                        ),
                        child: Image.network(
                            "${Requete.urlSt}produit/photo.png?id=${e['idProduit']}"),
                      ),
                    )
                  : Container(),
              ListTile(
                title: Text(
                  "Date: ${e['date']}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
                subtitle: Text(
                  "Total: ${e['prix']}, ${e['devise']}",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 30),
                ),
              ),
              Column(
                children: List.generate(e['produits'].length, (index) {
                  Map x = e['produits'][index];
                  return ListTile(
                    title: Text(
                      "${x['nom']} x ${x['quantite']}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                    ),
                    subtitle: Text(
                      "${x['prix']}, ${x['devise']}",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 30),
                    ),
                  );
                }),
              )
            ],
          ),

          // bottomNavigationBar: !e['deja']
          //     ? InkWell(
          //         onTap: () {
          //           //
          //           Get.dialog(
          //             const Material(
          //               color: Colors.transparent,
          //               child: Center(
          //                 child: SizedBox(
          //                   height: 40,
          //                   width: 40,
          //                   child: CircularProgressIndicator(),
          //                 ),
          //               ),
          //             ),
          //           );
          //           //
          //           e['deja'] = true;
          //           controller.mettreajourCommande(e);
          //         },
          //         child: Container(
          //           height: 50,
          //           color: Colors.indigo,
          //           alignment: Alignment.center,
          //           child: const Text(
          //             "Valider",
          //             style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ),
          //       )
          //     : Container(),
        ),
      ),
    );
  }

  //
  String getReference() {
    var uuid = Uuid();
    return "${uuid.v4()}";
  }
}
