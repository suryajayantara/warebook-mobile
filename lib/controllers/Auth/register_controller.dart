import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:warebook_mobile/models/departement.dart';
import 'package:warebook_mobile/models/study.dart';
import 'package:warebook_mobile/services/auth_service.dart';
import 'package:warebook_mobile/services/departement_service.dart';
import 'package:warebook_mobile/services/study_service.dart';
import 'package:warebook_mobile/views/pages/auth/login.dart';
import 'package:warebook_mobile/views/pages/menu/dashboard/dashboard.dart';

class RegisterController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController uniqueId = TextEditingController();

  // Vars
  final listDataDepartement = <Departement>[].obs;
  final listDataStudy = <Study>[].obs;

  GetStorage dataStorage = GetStorage('auth');

  var departemenLoading = false.obs;

  // Service
  final _departemenService = DepartementService();
  final _studyService = StudyService();
  final _authService = AuthService();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllDepartemen();
  }

  Future getAllDepartemen() {
    departemenLoading(true);
    return _departemenService.getAllDepartement().then((value) {
      listDataDepartement.assignAll(value);
      departemenLoading(false);
    }).catchError((e) {
      throw "$e";
    });
  }

  Future getStudyById(id) {
    return _studyService.getStudyById(id).then((value) {
      listDataStudy.assignAll(value);
    }).catchError((e) {
      throw "$e";
    });
  }

  void registerUser(id, roles) async {
    FormData form = FormData({
      'name': name.value.text,
      'email': email.value.text,
      'unique_id': uniqueId.value.text,
      'password': password.value.text,
      'roles': roles,
      'study_id': id
    });

    await _authService.registerUser(form).then((value) {
      Get.offAll(() => LoginPage());
    }).catchError((e) {
      throw e;
    });
  }
}
