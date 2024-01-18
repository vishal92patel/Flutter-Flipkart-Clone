const IResolutions = {
  _1min: '1',
  _3min: '3',
  _5min: '5',
  _15min: '15',
  _30min: '30',
  _45min: '45',
  _1hrs: '1h',
  _2hrs: '2h',
  _3hrs: '3h',
  _4hrs: '4h',
  _1D: '1D',
  _1W: '1W',
  _1M: '1M',
};


function onDOMContentLoaded() {
  if (window.messageHandler) {
    messageHandler.postMessage(JSON.stringify({
      action: 'onDOMContentLoaded',
      data: null
    }));
  };
}

window.addEventListener("flutterInAppWebViewPlatformReady", function (event) {

  // send data from html to flutter
  window.flutter_inappwebview.callHandler('getHandlerFromHtml', {
    name: "vishal patel"
  });

  window.flutter_inappwebview.callHandler('initiate').then((args) => {
    scripData = args;
    initOnReady();
  });
});