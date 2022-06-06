import 'package:dio/dio.dart';
import 'package:domaingen/core/constans/api.dart';
import 'package:domaingen/core/models/domain_result_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DomainResultRepo extends ChangeNotifier {
  Dio dio = Dio();
  Response? response;

  Future<DomainResultModel?> getDomain(
      String domainName, BuildContext context) async {
    try {
      response = await dio.get(Api.domain + domainName);
      notifyListeners();
      final parser = response!.data;
      final data = DomainResultModel.fromJson(parser);
      if (kDebugMode) {
        print('respons $data');
      }
      return data;
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error');
    }
  }
}
