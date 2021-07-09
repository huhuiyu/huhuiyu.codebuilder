(function () {
  let app;
  new Vue({
    el: '#app',
    data() {
      return {
        title: 'websocket接口测试',
        info: '',
        isOpen: false
      };
    },
    methods: {
      startWs() {
        let ws = new WebSocket('ws://127.0.0.1:20000/ws');
        app.info = '开始连接websocket';
        ws.addEventListener('open', function (event) {
          console.debug('成功连接websocket', event);
          app.info = '连接websocket成功';
          app.isOpen = true;
        });
        ws.addEventListener('close', function (event) {
          console.debug('websocket已经断开', event);
          ws = null;
          app.isOpen = false;
          app.info = 'websocket已经断开';
        });
        ws.addEventListener('message', function (event) {
          app.info = event.data;
        });
      }
    },
    created() {
      app = this;
    }
  });
})();
