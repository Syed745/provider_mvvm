import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/authRepository.dart';
import 'package:mvvm/utils/routes/routesName.dart';
import 'package:mvvm/utils/utils.dart';

class AuthView with ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  isLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    isLoading(true);
    await _authRepo.loginApi(data).then((value) {
      isLoading(false);

      if (kDebugMode) {
        Utils.flashbarMessage('Login successfully', context);
        Navigator.pushNamed(context, RoutesName.home);

        print(value.toString());
      }
    }).onError((error, stackTrace) {
      isLoading(false);

      if (kDebugMode) {
        Utils.flashbarMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  ///////
  bool _signLoading = false;
  bool get signUpLoading => _signLoading;

  isSignUpLoading(bool value) {
    _signLoading = value;
    notifyListeners();
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    isSignUpLoading(true);
    await _authRepo.registerApi(data).then((value) {
      isSignUpLoading(false);

      if (kDebugMode) {
        Utils.flashbarMessage('Sign up successfully', context);
        //  Navigator.pushNamed(context, RoutesName.home);

        print(value.toString());
      }
    }).onError((error, stackTrace) {
      isSignUpLoading(false);

      if (kDebugMode) {
        Utils.flashbarMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
