(function () {
  let app;

  new Vue({
    el: '#app',
    data() {
      return {
        title: '测试huhuiyu.js',
        md5info: '',
        ajax: {
          loading: false,
          echo: '',
          result: {}
        }
      };
    },
    computed: {
      md5result() {
        return huhuiyu.md5(app.md5info);
      }
    },
    methods: {
      sendAjax() {
        app.ajax.loading = true;
        huhuiyu.ajax(
          '/',
          {
            echo: app.ajax.echo
          },
          function (data) {
            app.ajax.loading = false;
            app.ajax.result = data;
          }
        );
      }
    },
    created() {
      app = this;
    }
  });
})();
