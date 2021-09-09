@JS()
library t;

import 'package:js/js.dart';
import 'package:flutter_app/bridge/NativeBridge.dart';

class CoreDSBridge implements NativeBridge {
  static CoreDSBridge _instance;

  CoreDSBridge._();

  static CoreDSBridge get instance {
    if (_instance == null) {
      _instance = CoreDSBridge._();
    }
    return _instance;
  }

  @override
  Future<void> onSSOFlow() async {
    _onSSOFlow();
  }

  @override
  Future<bool> onPermissionRequest(String permission) async {
    bool variable = _onPermissionRequest(permission);
    print('in flutter $variable');
    return variable;
  }

  @override
  Future<void> openCartReview(String cartReviewData) async {
    _openCartReview(cartReviewData);
  }
}

@JS('onSSOFlow')
external void _onSSOFlow();

@JS('onPermissionRequest')
external bool _onPermissionRequest(String permission);

@JS('openCartReview')
external void _openCartReview(String cartReviewData);
