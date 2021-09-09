abstract class NativeBridge {
  Future<void> onSSOFlow();

  Future<bool> onPermissionRequest(String permission);

  Future<void> openCartReview(String cartReviewData);
}
