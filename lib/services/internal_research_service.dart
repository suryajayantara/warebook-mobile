import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/commons/network_utility.dart';
import 'package:warebook_mobile/models/internalResearch/internal_research.dart';

class InternalResearchService extends GetConnect {
  final urlPath = NetworkUtility();
  final routeName = "research";
  GetStorage dataStorage = GetStorage('auth');

/* 
    Get Internal Research - all (Auth Needed)
    Method  : GET
    URL     : api.com/journalTopic
    Desc    : Digunakan untuk Store / Menyimpan data Journal Topic 
    Header  : 
                - Accept : application/json
                - Authencticatop : Baerer Token
    Body    : 
                - title(String) => Judul dari Journal Topic
                - Abstract(String) => Deskripsi dari journal topic itu sendiri
                
  
  */


  Future<List<InternalResearch>> getAll() async {
    return await get(Uri.parse(urlPath.serviceUrl() + routeName).toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return List<InternalResearch>.from(
            value.body["data"].map((e) => InternalResearch.fromJson(e)));
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  Future<InternalResearch> getDetails(int id) async {
    return await get(
            Uri.parse(urlPath.serviceUrl() + routeName + '/${id}').toString())
        .then((value) {
      if (value.body != null && value.isOk) {
        return InternalResearch.fromJson(value.body['data']);
      } else {
        throw "${value.body} - ${value.statusCode}";
      }
    });
  }

  
  /* 
    Create Internal Research (Auth Needed)
    Method  : POST
    URL     : api.com/journalTopic
    Desc    : Digunakan untuk Store / Menyimpan data Journal Topic 
    Header  : 
                - Accept : application/json
                - Authencticatop : Baerer Token
    Body    : 
                - title(String) => Judul dari Journal Topic
                - Abstract(String) => Deskripsi dari journal topic itu sendiri
                
  
  */

  Future<InternalResearch> createInternalResearch(
      InternalResearch internalResearch,
      MultipartFile multipartDocument,
      MultipartFile multipartProposal) async {
    var form = FormData({
      'title': internalResearch.title,
      'abstract': internalResearch.abstract,
      'budget': internalResearch.budget,
      'budget_type': internalResearch.budgetType,
      'contract_number': internalResearch.contractNumber,
      'project_started_at': internalResearch.projectStartedAt,
      'project_finish_at': internalResearch.projectFinishAt,
      'team_member': internalResearch.teamMember,
      'proposal_url': multipartProposal,
      'document_url': multipartDocument,
    });
    return await post(
            Uri.parse(urlPath.serviceUrl() + routeName).toString(), form,
            headers: urlPath.header(
                'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NmY1YjczNy01N2ZmLTQ2NzItYjM2YS1mOTYyZGE5YTg3MTAiLCJqdGkiOiJkNjZmNmJiYjI2OTc1OGI5NDNmYzQ0ZTViMDY5NzA5M2JhMjk3NGZmM2U0MTVkMjY2M2RjNDk0MzhiODI5YTJlN2JmZDI0ZWZmYzgxMzQ1ZiIsImlhdCI6MTY1OTkyMTg1NS4xMzc2NDEsIm5iZiI6MTY1OTkyMTg1NS4xMzc2NDcsImV4cCI6MTY2MDAwODI1NS4wMzQ0OTgsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.HQ3IoW4anrDVcmMwo_ua-kxrfI6CMqYTI-1RK2b7sMgwOhFEgila6-9wPo9He7iKMjjUaepg1c6PpwRc3UeP48tno4FteHsjsYeTS45FgOekhNCA2v4f_GAEFgHdfobybuQc4RPt8Zn9Ds6GoitmRIPpJWj1g29zWYdi5OCRKiRxNi2tKUJjMaUP8WhX4JLnRaRqrCeFgAw9x_JLnk0N_mi-6RTXAm7kCUaZONxFu-s4aoCEvFOYG9G19Y6Jt6VppPO9MgEnFKlYhF2-gbwMWHLSiF76M84VHLPRbbv-gClz1uuW1GHXNkpmThISSO7LpC1bwjjJY2vAo-kG4HbfMvOtS0PZ_YFuEhvt091C8JENqFaFnKWIYeFc3C9iLPHJZVSEPthwvgaDt7VN33i24cuuCFKX_m4s7owI-nBVoENIDZRSPY2vca7oW-SPL6tdRVqCs79juBpqRfDtc08a6OPsDP38hqpF-rDIQ2MPvEfD3m08-93X_o-ebLtZr9atjf_Jz5c2kDr7SAgjbgQjiVZpvyzsPMuHvj6EAsk77BbD6cpC_YeasI_mQVv-1KQrWrU0OiWSHtp-bDiWD8QETi7WqgktS6LAtFcKiDAzBRQ2RPL0eNscdLjo7INFcfvx0733ISoSe0BrYEqAVTYS9XxWEiiuS5O0yLWE9G1wpno'))
        .then((value) {
      if (value.body != null && value.isOk) {
        print(value.body);
        return InternalResearch.fromJson(value.body['data']);
        // print(internalResearch.fromJson(value.body['data']));
      } else {
        throw "${value.bodyString} - ${value.statusCode} - ${value.body}";
      }
    }).catchError((e) {
      throw e;
    });
    
  }

}
