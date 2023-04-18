import 'dart:io';

import 'package:barcode_widget/barcode_widget.dart' as bc;
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/material.dart';

class Scnanner extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Scnanner();
  }
}

class _Scnanner extends State<Scnanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: (QRViewController c) async {
              controller = c;
              controller!.scannedDataStream.listen((scanData) {
                print("${scanData.code}");
                //Get.back();
                showDialog(
                  context: context,
                  builder: (c) {
                    return AlertDialog(
                      title: const Text("Resultas"),
                      content: Text("${scanData.code}"),
                    );
                  },
                );
              });
            },
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                height: Get.size.height / 2,
                width: Get.size.width / 1.3,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      color: Colors.red.shade900,
                      //strokeAlign: 2,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
