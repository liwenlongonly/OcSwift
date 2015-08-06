$(document).ready(function(){


    function connectWebViewJavascriptBridge(callback) {
        if (window.WebViewJavascriptBridge) {
            callback(WebViewJavascriptBridge)
        } else {
            document.addEventListener('WebViewJavascriptBridgeReady', function() {
                callback(WebViewJavascriptBridge)
            }, false)
        }
    }

    connectWebViewJavascriptBridge(function(bridge) {

        bridge.init(function(message, responseCallback) {
            alert(JSON.stringify(message));
            var data = { 'Javascript Responds':'Wee!' };
            responseCallback(data);
        })

        bridge.registerHandler('testJavascriptHandler', function(data, responseCallback) {
            alert(JSON.stringify(data));
            var responseData = { 'Javascript Says':'Right back atcha!' }
            responseCallback(responseData)
        })

        $("#btn1").on("click",function(e){

            e.preventDefault()
            var data = 'Hello from JS button'
            bridge.send(data, function(responseData){
                alert(JSON.stringify(responseData))
            })

        });

        $("#btn2").on("click",function(e){
            e.preventDefault()
            bridge.callHandler('testObjcCallback', {'foo': 'bar'}, function(response) {
                alert(JSON.stringify(response));
            })
        });

    })

});