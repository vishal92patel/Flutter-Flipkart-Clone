window.addEventListener("message", (event) => {
  onRealtimeCallback(event.data);
});
window.addEventListener("flutterInAppWebViewPlatformReady", function (event) {
  // // send data from html to flutter
  // window.flutter_inappwebview.callHandler('getHandlerFromHtml', {
  //   name: "vishal patel"
  // });
  window.flutter_inappwebview.callHandler("initiate").then((args) => {
    initiate(args);
  });
});

function initiate(args) {
  scripData = args;
  initOnReady();
}

const tzOffset = new Date().getTimezoneOffset() * 60000; // offset in milliseconds

const IResolutions = {
  _1min: "1",
  _3min: "3",
  _5min: "5",
  _15min: "15",
  _30min: "30",
  _45min: "45",
  _1hrs: "1h",
  _2hrs: "2h",
  _3hrs: "3h",
  _4hrs: "4h",
  _1D: "1D",
  _1W: "1W",
  _1M: "1M",
};

const QuickRangeInDuration = {
  1: 1,
  3: 3,
  5: 5,
  15: 15,
  30: 30,
  45: 45,
  60: 60,
  120: 120,
  180: 180,
  240: 240,
  "1h": 60,
  "2h": 120,
  "3h": 180,
  "4h": 240,
  "1D": 1440,
  "1W": 10080,
  "1M": 40320,
};

function callAPI(onResult, periodParams, resolution) {
  const from = new Date(periodParams.from * 1000);
  const to = new Date(periodParams.to * 1000);
  getData({
    fromDate: new Date(from.getTime() - tzOffset).toISOString(),
    toDate: new Date(to.getTime() - tzOffset).toISOString(),
    duration: QuickRangeInDuration[resolution],
  })
    .then((res) => {
      if (res.length >= 1 && res[0].close) {
        onResult(responseModifier(res));
      } else {
        onResult([]);
      }
    })
    .catch((err) => {
      onResult([]);
      console.log(err);
      alert(JSON.stringify(err));
    });
}

async function getData(requestPayload) {
  try {
    const body = {
      scripIds: [Number(scripData.scripId)],
      exchange: scripData.exchange,
      dates: {
        fromDate: requestPayload.fromDate,
        toDate: requestPayload.toDate,
      },
      duration: requestPayload.duration,
    };
    const response = await fetch(
      "https://dev-v2.alphansg.net/charts/v1/historical/equity/chart/data",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json;charset=utf-8",
          "X-Length": "t891zjf4",
          Authorization:
            "barear cfRR/vyJeXTKLrz0P1lN5kn7bkh3s8W8ftbMVW5R54HsbeVravLDfazKTCWTipuS8EzKQrTNdkJvR/GdEeHeaPBxDEZsQOFQ0qZbYlp9BYN7tKpFgILNnGG/rF+7SKZsKbM2dwFIa2811z3gJ88V5iF4PQUjbKsFvHb/hQ2HVMLIxUex4P3FgMg0H3CpNFMlsLmVLyDaSFl/YBnHL0qnFlcWqPIXv6vRTagbp69Iozdi3x0cGMXYsqnY4AclsR/96PHJlDI6kUK6jOisoDc+EMD0MjyySxWFkv7rja2GLMy3z9c/EzwXwP2it8W8NKKsvCfmFRKgT8l+3jXALNv9VNmVLkN0084TCQrOmsymtYm5vNymVi5TRLYLMaj3j+U3x2GP4ts89ptiU28FAfJpSshOp4ggtoZLA1LpOzz0H6vWk3wTBkyTXVr3gxvAsUtviJnax+s8vnEKVzVWWS7pt+wQ1btMNG76VoJNv5ZU+uylERQzT6Vi73ItRb0tAfaax3aZA/Eim5z7UPIOmJFEX6OkOG7Y8rk4QEQKW5tTUf21G0cB65s6IVBx1HX6JuI2Chp9//U/YRy4/V/+En8OpZtnmU6XAg658lZkMo7UPYcfYZLXdjr9TyfGyzQNiVFqYyONhJaKtNSf7ysmvwrsQQ==mD4bMx9ojk2Be77P",
        },
        body: JSON.stringify(body),
      }
    );
    return await response.json();
  } catch (exceptionError) {
    return exceptionError;
  }
}

function responseModifier(data) {
  isReady = true;
  return data.map((item, index) => {
    return {
      ...item,
      time: new Date(new Date(item.time).getTime() + tzOffset).getTime(), // convert to UTC format
    };
  });
}
