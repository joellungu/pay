import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pay/utils/requete.dart';

class PaiementController extends GetxController {
  Requete requete = Requete();
  Future<Map> paiement(Map e) async {
    Response rep = await requete.postE("paiement/paie", e);
    print("la reponse du serveur: ${rep.statusCode}");
    print("la reponse du serveur: ${rep.body}");

    if (rep.isOk) {
      return rep.body;
    } else {
      return {"erreur": rep.statusCode};
    }
  }

  Future<Map> verification(String orderNumber) async {
    //flexpay
    var rep = await http.get(
      Uri.parse("http://41.243.7.46:3006/api/rest/v1/check/$orderNumber"),
      headers: {
        "Content-Type": "application/json",
        "Authorization":
            "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJcL2xvZ2luIiwicm9sZXMiOlsiTUVSQ0hBTlQiXSwiZXhwIjoxNzQ1NTg3Nzc1LCJzdWIiOiI2OGQ5MTY2NzY0ZjFiZDMyYTVjZjBjZWJiN2I0NjMyYiJ9.4F57X9ybGSbPw2mxbMPjV8uo-yq56A0QixXYkuyeC60",
      },
    );
    /**
     * timeout(
      const Duration(minutes: 1),
      onTimeout: () {
        // Time has run out, do what you wanted to do.
        return http.Response(
            'Error', 408); // Request Timeout response status code
      },
    );
     */
    print(rep.statusCode);
    print(rep.body);
    //Response rep = await requete
    //  .get("http://41.243.7.46:3006/flexpay/api/rest/v1/$orderNumber");
    if (rep.statusCode == 200 || rep.statusCode == 201) {
      return jsonDecode(rep.body);
    } else {
      return jsonDecode(rep.body);
    }
  }
}
