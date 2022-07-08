import 'package:domaingen/core/enum/view_state.dart';
import 'package:domaingen/core/models/domain_result_model.dart';
import 'package:domaingen/core/repositorys/domain_result_repository.dart';
import 'package:domaingen/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'base_viewmodel.dart';

class DomainResultViewmodel extends BaseViewModel {
  DomainResultRepo domainResultRepo = locator<DomainResultRepo>();

  DomainResultModel? domain;

  Future getDomain(String domainName, BuildContext context) async {
    setState(ViewState.busy);
    if (domainName.isEmpty) {
      return false;
      // Fluttertoast.showToast(
      //     msg: 'Form domain tidak boleh kosong',
      //     gravity: ToastGravity.BOTTOM,
      //     toastLength: Toast.LENGTH_LONG);
    }
    domain = await domainResultRepo.getDomain(domainName, context);
    notifyListeners();
    setState(ViewState.idle);
  }
}
