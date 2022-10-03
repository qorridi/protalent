import 'dart:convert';

import 'package:http/http.dart' as http;


var cmd = 'https://dmsdev-api.eksad.com/gateway/pro/v1/cmd';
var qry = 'https://dmsdev-api.eksad.com/gateway/pro/v1/qry';

Future<bool> createSetting(im, tt,  em, no) async {
  final response = await http.post(
      Uri.parse('$cmd/setting/saveSetting'),
      body: jsonEncode(
          {
            "image": im,
            "title": tt,
            // "tagline": tl,
            "email": em,
            "no": no,
          }),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      });
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> updateSetting(id, title,  email, no) async {
  final response = await http
      .put(Uri.parse('$cmd/setting/updateSetting'),
      body: jsonEncode({
        "idsetting": id,
        // "image": image,
        // "name": name,
        "title": title,
      //  "tagline": tagline,
        "email": email,
        "no": no,

      }),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      });
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<List<dynamic>> getSetting() async {
  var response = await http.get(
      Uri.parse('$cmd/setting/getAllSettingByIdRole'));
  return jsonDecode(response.body)['data'];
}

Future<List<dynamic>> getSettingDesc() async {
  var response = await http.get(
      Uri.parse('$qry/setting/getSettingByIdDesc'));
  return jsonDecode(response.body)['data'];
}


Future<dynamic> getSettingTitle() async {
  var response = await http.get(
      Uri.parse('$qry/setting/getSettingByIdDesc'));
  return jsonDecode(response.body)['data'];
}