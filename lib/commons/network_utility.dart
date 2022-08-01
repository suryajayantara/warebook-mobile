class NetworkUtility {

  /* 

      Service : Laravel-warebook
      hostUrl => host Address (Default : localhost/127.0.0.1)
      hostPort => host Port (Default : 8000)
      hostVersion => api Versioning (default : v1)
  
  */

  String hostUrl = "192.168.1.55";
  String hostPort = "8000";
  String hostVersion = 'v1';

  String serviceUrl() {
    return "http://${hostUrl}:${hostPort}/api/${hostVersion}/";
  }

  // Header
  Map<String, String> header(token) {
    return {
      "Content-type": "application/json",
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
}
