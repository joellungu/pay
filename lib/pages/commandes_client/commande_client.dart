import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:pay/utils/commande_controller.dart';

class CommandeClient extends GetView<CommandeController> {
  //
  RxString date = "Date".obs;
  RxString service = "Restaurant".obs;
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
                              service.value = tt as String;
                            },
                            value: service.value,
                            items: const [
                              //
                              DropdownMenuItem(
                                value: "Restaurant",
                                child: Text("Restaurant"),
                              ),
                              DropdownMenuItem(
                                value: "Pharmacie",
                                child: Text("Pharmacie"),
                              ),
                              DropdownMenuItem(
                                value: "Bar",
                                child: Text("Bar"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 3,
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: () {
                          //
                        },
                        child: Text(date.value),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView(),
            )
          ],
        ),
      ),
    );
  }
}
