import 'package:http/http.dart' as http;

class LoginService {
  final String url = 'http://test.senyumtani.com/api/';
  var token;

  authData(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.post(fullUrl,
        headers: {
          'Content-type': 'application/x-www-form-urlencoded',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: data);
  }

  createData(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    final request = http.MultipartRequest("POST", Uri.parse(fullUrl));
    request.fields['name'] = data['name'];
    request.fields['email'] = data['email'];
    request.fields['password'] = data['password'];
    request.files
        .add(await http.MultipartFile.fromPath("image", data['image'].path));
    final response = await request.send();
    return response;
  }

  getData(apiUrl, tokens) async {
    var fullUrl = url + apiUrl;
    return await http.get(fullUrl, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $tokens'
    });
  }

  getDatas(apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.get(fullUrl, headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
  }
}
