class NetworkUtility {
  /* 

      Service : Laravel-warebook
      hostUrl => host Address (Default : localhost/127.0.0.1)
      hostPort => host Port (Default : 8000)
      hostVersion => api Versioning (default : v1)
  
  */

  String hostUrl = "172.28.49.139";
  String hostPort = "8000";
  String hostVersion = 'v1';

  String serviceUrl() {
    return "http://${hostUrl}:${hostPort}/api/${hostVersion}/";
  }

  String serviceDownload() {
    return "http://${hostUrl}:${hostPort}/";
  }

  // Header
  Map<String, String> header(token) {
    return {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
  }
}
