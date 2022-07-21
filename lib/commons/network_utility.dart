class NetworkUtility {
  var url = 'http://172.28.175.234:8000/api/v1/';

  Map<String, String> header(token) {
    return {
      "Content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
}
