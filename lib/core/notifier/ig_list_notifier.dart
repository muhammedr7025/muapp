import 'package:flutter/material.dart';

import '../../main.dart';
import '../../model/lc_model.dart';
import '../api/ig_list_api.dart';



class ICNotifier extends ChangeNotifier {

  final IGListApi _igAPI = IGListApi();
  bool _isLoading = false;

  bool get getIsLoading => _isLoading;
  ICModel? _iCModel;
  ICModel?get getIcModel => _iCModel;



  Future<void> _igList({
    required BuildContext context,
  required String ig,required String district
  }) async {
    try {
      _isLoading = true;
      notifyListeners();
      final listData = await _igAPI.iGListApi(ig: ig, district: district);
      if(listData['hasError'] == false){
        _iCModel = ICModel.fromJson(listData);
        _isLoading = false;
        notifyListeners();
      }
      _isLoading = false;
      notifyListeners();
    } catch(error){
       SnackBar snackBar = SnackBar(
          backgroundColor: Colors.red, content: Text(error.toString()));
      snackbarKey.currentState?.showSnackBar(snackBar);
      _isLoading = false;
      notifyListeners();
    }
  }
}