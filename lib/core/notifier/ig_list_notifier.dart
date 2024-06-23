import 'package:flutter/material.dart';
import '../../main.dart';
import '../../model/lc_model.dart';
import '../api/ig_list_api.dart';

class ICNotifier extends ChangeNotifier {
  final IGListApi _igAPI = IGListApi();
  bool _isLoading = false;
  String? _ig;
  String? _district;

  String? get getIG => _ig;
  String? get getDistrict =>_district;

  bool get getIsLoading => _isLoading;
  ICModel? _iCModel;
  ICModel? get getIcModel => _iCModel;

  Future<void> igList(
      {required BuildContext context,
      required String ig,
      required String district,required int pageIndex}) async {
    try {
      _isLoading = true;
      _ig= ig;
      _district =district;
      notifyListeners();
      final listData = await _igAPI.iGListApi(ig: ig, district: district,pageIndex: pageIndex);
      print("sssssssssssssssssssss1 ${listData['hasError']}");

      if (listData['hasError'] == false) {
        print("sssssssssssssssssssss11");

        _iCModel = ICModel.fromJson(listData);
        print("sssssssssssssssssssss222");

        _isLoading = false;
        notifyListeners();
        print("sssssssssssssssssssss");
      }
      print("sssssssssssssssssssss2");

      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print(error);
      SnackBar snackBar = SnackBar(
          backgroundColor: Colors.red, content: Text(error.toString()));
      snackbarKey.currentState?.showSnackBar(snackBar);
      _isLoading = false;
      notifyListeners();
    }
  }
}
