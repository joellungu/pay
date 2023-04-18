import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'services/services.dart';

class Compte extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Compte();
  }
}

class _Compte extends State<Compte> {
  RxList categorie = [].obs;
  double top = 0.0;
  double y = -1.5;
  double y1 = -1.5;
  double y2 = -1;
  //
  RxBool renverser = true.obs;
  //
  //
  //ControllerApp controllerApp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo.shade900, // Status bar color
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          //backgroundColor: Colors.grey.shade150,
          body: Stack(
            children: [
              NotificationListener<ScrollNotification>(
                onNotification: (sn) {
                  print("p: ${sn.metrics.pixels}");
                  print("eA: ${sn.metrics.extentAfter}");
                  print("eB: ${sn.metrics.extentBefore}");
                  print("eI: ${sn.metrics.extentInside}");
                  print("msE: ${sn.metrics.maxScrollExtent}");
                  print("msE: ${sn.metrics.minScrollExtent}");

                  if (sn.metrics.pixels <= 190) {
                    print('Get more data');
                    y = y1;
                    setState(() {});
                  } else {
                    y = y2;
                    setState(() {});
                  }
                  return true;
                },
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      backgroundColor: Colors.indigo.shade900,
                      onStretchTrigger: () {
                        //print("Le truc strck");
                        return Future.value();
                      },
                      pinned: true,
                      snap: false,
                      floating: false,
                      expandedHeight: Get.size.height / 2.5,
                      flexibleSpace: FlexibleSpaceBar(
                        expandedTitleScale: 2,
                        background: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          //
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              backgroundColor: Colors.white,
                                              content: Container(
                                                height: 120,
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    ListTile(
                                                      leading: Icon(Icons
                                                          .help_outline_outlined),
                                                      title:
                                                          Text("Aide et FAQ"),
                                                    ),
                                                    ListTile(
                                                      leading: Icon(
                                                          CupertinoIcons
                                                              .info_circle),
                                                      title: Text(
                                                          "À propos de l'application"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                          //showModalBottomSheet(context: context, builder: builder)
                                          // showBottomSheet(
                                          //   context: context,
                                          //   builder: (c) {
                                          //     return SizedBox(
                                          //       height: 100,
                                          //       child: Column(
                                          //         mainAxisAlignment:
                                          //             MainAxisAlignment.center,
                                          //         children: const [
                                          //           ListTile(
                                          //             leading: Icon(Icons
                                          //                 .help_outline_outlined),
                                          //             title:
                                          //                 Text("Aide et FAQ"),
                                          //           ),
                                          //           ListTile(
                                          //             leading: Icon(
                                          //                 CupertinoIcons
                                          //                     .info_circle),
                                          //             title: Text(
                                          //                 "À propos de l'application"),
                                          //           ),
                                          //         ],
                                          //       ),
                                          //     );
                                          //   },
                                          // );
                                        },
                                        icon: Icon(
                                          Icons.help,
                                          color: Colors.indigo.shade900,
                                        ),
                                      ),
                                      const Text(
                                        "Pay",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      // IconButton(
                                      //   onPressed: () {
                                      //     //
                                      //   },
                                      //   icon: Icon(
                                      //     Icons.help,
                                      //     color: Colors.indigo.shade900,
                                      //   ),
                                      // ),
                                      Container(
                                        height: 40,
                                        width: 50,
                                        child: Switch(
                                          onChanged: (e) {
                                            setState(() {
                                              renverser.value = e;
                                            });
                                          },
                                          value: renverser.value,
                                          activeColor: Colors.green.shade700,
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  renverser.value
                                      ? Card(
                                          color: Colors.indigo.shade900,
                                          elevation: 3,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Row(children: [
                                                  Icon(
                                                    Icons.wallet,
                                                    color:
                                                        Colors.green.shade700,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Vos comptes",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade500),
                                                  ),
                                                ]),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  //
                                                  //showSimpleModal(Lieu(0), context);

                                                  //
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Colors.indigo.shade800
                                                        .withOpacity(0.5),
                                                  ),
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                ),
                                                child: SizedBox(
                                                  width: Get.size.width / 1.2,
                                                  height: 65,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "CDF",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade500,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 9,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "130050",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                fontSize: 25,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  //showSimpleModal(Lieu(1), context);
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Colors.indigo.shade800
                                                        .withOpacity(0.5),
                                                  ),
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                ),
                                                child: SizedBox(
                                                  width: Get.size.width / 1.2,
                                                  height: 65,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Text(
                                                          "USD",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade500,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 9,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "3010",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                fontSize: 25,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Colors.indigo.shade800
                                                      .withOpacity(0.5),
                                                ),
                                                width: Get.size.width,
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      flex: 2,
                                                      child: Text(
                                                        "TAUX",
                                                        style: TextStyle(
                                                          color: Colors
                                                              .green.shade700,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 9,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "2503",
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade400,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Card(
                                          color: Colors.indigo.shade900,
                                          elevation: 3,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Row(children: [
                                                  Icon(
                                                    Icons.history,
                                                    color:
                                                        Colors.green.shade700,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Dernier prélèvement",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade500),
                                                  ),
                                                ]),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  //
                                                  //showSimpleModal(Lieu(0), context);

                                                  //
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Colors.indigo.shade800
                                                        .withOpacity(0.5),
                                                  ),
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                ),
                                                child: SizedBox(
                                                  width: Get.size.width / 1.2,
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          "Date",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade500,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 9,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "13 oct. 2023 à 18h30'",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  //showSimpleModal(Lieu(1), context);
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Colors.indigo.shade800
                                                        .withOpacity(0.5),
                                                  ),
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                ),
                                                child: SizedBox(
                                                  width: Get.size.width / 1.2,
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          "Montant",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade500,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 9,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "30100 CDF",
                                                              textAlign:
                                                                  TextAlign
                                                                      .left,
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .grey
                                                                    .shade400,
                                                                fontSize: 25,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  //showSimpleModal(Lieu(1), context);
                                                },
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                    Colors.indigo.shade800
                                                        .withOpacity(0.5),
                                                  ),
                                                  elevation:
                                                      MaterialStateProperty.all(
                                                          0),
                                                ),
                                                child: SizedBox(
                                                  width: Get.size.width / 1.2,
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 3,
                                                        child: Text(
                                                          "Motif",
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade500,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 9,
                                                        child: Container(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "Achat d'un boisson sucré à Chez BIBI qcs:cbh msqjc bjk:",
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.left,
                                                            maxLines: 2,
                                                            style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade400,
                                                              fontSize: 13,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        centerTitle: false,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                //Get.to(Prelevement()); //
                                showModalBottomSheet(
                                  context: context,
                                  builder: (c) {
                                    return Services();
                                  },
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green.shade700,
                                ),
                                elevation: MaterialStateProperty.all(0),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 65,
                                width: Get.size.width / 1.2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(CupertinoIcons.circle_grid_3x3_fill),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Services",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 20, top: 20),
                                child: Text(
                                  "Dernieres actions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ListTile(
                            onTap: () {
                              Get.dialog(
                                Center(
                                  child: Card(
                                    child: Container(
                                      height: 200,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            child: IconButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              icon: Icon(Icons.close),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 7,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: const Text.rich(
                                                TextSpan(
                                                  text: "Voulez-vous ",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                  children: [
                                                    TextSpan(
                                                      text: "Payer ",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          " cette facture maintenant ?",
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(Colors
                                                                    .green
                                                                    .shade800),
                                                      ),
                                                      onPressed: () {
                                                        //
                                                        //Get.back();
                                                        //Get.to(Paiement());
                                                      },
                                                      child:
                                                          const Text("Payer"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
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
                                Icons.calendar_month,
                                size: 30,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            title: Text(
                              "13 Jui. 2023 à 13h10",
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: RichText(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                text: "18500 CDF    ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Pour l'achat d'un téléphone",
                                    style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            trailing: index % 2 == 1
                                ? Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : Container(
                                    height: 0,
                                    width: 0,
                                  ),
                          );
                        },
                        childCount: 7,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 100,
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              //
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all(
                                Colors.indigo.shade800.withOpacity(0.2),
                              ),
                            ),
                            child: Text(
                              "Voir plus",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedAlign(
                alignment: Alignment(0, y),
                duration: const Duration(milliseconds: 800),
                child: Container(
                  height: 55,
                  color: Colors.indigo.shade900,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 30,
                          width: 30,
                        ),
                      ),
                      const Text(
                        "Pay",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //Get.to(Lunette());
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ],
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
