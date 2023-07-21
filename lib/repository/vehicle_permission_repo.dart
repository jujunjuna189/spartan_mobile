import 'package:spartan_mobile/repository/auth_repo.dart';
import 'package:spartan_mobile/utils/api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:spartan_mobile/widgets/toast/toast_alert.dart';
import 'package:spartan_mobile/widgets/toast/toast_loader.dart';

class VehiclePermissionRepo {
  VehiclePermissionRepo._privateConstructor();
  static final VehiclePermissionRepo instance = VehiclePermissionRepo._privateConstructor();

  final _perizinanKendaraanStore = Api.perizinanKendaraanStore;
  final _reportPerizinanKendaraan = Api.reportPerizinanKendaraan;

  Future report(Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(_reportPerizinanKendaraan), body: body);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];
        //return data response
        ToastLoader.instance.hideLoader();
        return iterable;
      }
    } catch (e) {
      ToastLoader.instance.hideLoader();
      ToastAlert.instance.showMessage(serverError: true);
    }
    ToastLoader.instance.hideLoader();
    ToastAlert.instance.showMessage(failed: true);
    return false;
  }

  Future store(Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(_perizinanKendaraanStore), body: body);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        Iterable iterable = jsonResponse['data'];
        //Set session permission with today
        AuthRepo.instance.setSession("vehicle_permission", iterable.first);
        //return data response
        ToastLoader.instance.hideLoader();
        ToastAlert.instance.showMessage(success: true);
        return iterable.first;
      }
    } catch (e) {
      ToastLoader.instance.hideLoader();
      ToastAlert.instance.showMessage(serverError: true);
    }
    ToastLoader.instance.hideLoader();
    ToastAlert.instance.showMessage(failed: true);
    return false;
  }
}