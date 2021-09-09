var dsBridge = require("dsbridge");
function onSSOFlow() {
  try {
    dsBridge.call("synapse.onSSOFlow", "");
  } catch (e) {
    console.log(`Call to native method onSoSFlow failed !`);
  }
}

function onPermissionRequest(permission) {
  let data = {};
  try {
    data = dsBridge.call("synapse.onPermissionRequest",permission);
  } catch (e) {
    console.log(`Call to native method onPermissionRequest failed !`);
  }
  console.log(`data recieved onPermissionRequest! ${data}`);
  return true;
}

function openCartReview(cartReviewData) {
  try {
    dsBridge.call("synapse.openCartReview", cartReviewData);
  } catch (e) {
    console.log(`Call to native method openCartReview failed !`);
  }
}
