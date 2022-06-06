import 'package:domaingen/core/enum/view_state.dart';
import 'package:domaingen/core/models/domain_result_model.dart';
import 'package:domaingen/core/repositorys/domain_result_repository.dart';
import 'package:domaingen/locator.dart';
import 'package:flutter/cupertino.dart';
import 'base_viewmodel.dart';

class DomainResultViewmodel extends BaseViewModel {
  DomainResultRepo domainResultRepo = locator<DomainResultRepo>();

  DomainResultModel? domain;

  Future getDomain(String domainName, BuildContext context) async {
    setState(ViewState.busy);
    domain = await domainResultRepo.getDomain(domainName, context);
    notifyListeners();
    setState(ViewState.idle);
  }
}
