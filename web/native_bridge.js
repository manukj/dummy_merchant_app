var dsBridge = require("dsbridge");
function onSSOFlow() {
  dsBridge.call("synapse.onSSOFlow", "").catch((err) => {
    console.log(`Call to native method onSoSFlow failed ! ${err}`); // Make sure cb gets the error
  });
}
//cartReviewData is an instant of CartReviewData
function openCartReview(cartReviewData) {
  dsBridge
    .call("synapse.openCartReview", JSON.stringify(cartReviewData))
    .catch((err) => {
      console.log(`Call to native method openCartReview failed ! ${err}`); // Make sure cb gets the error
    });
}