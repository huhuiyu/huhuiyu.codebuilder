(function () {
  let app;
  new Vue({
    el: '#app',
    data() {
      return {
        title: '后端接口测试',
        token: '',
        login: {
          loading: false,
          username: '',
          password: '',
          info: {}
        }
      };
    },
    methods: {
      getToken() {
        app.token = '获取token信息中...';
        huhuiyu.ajax('/util/getToken', {}, function (data) {
          app.token = data.token;
        });
      },
      adminAuth() {
        app.login.loading = true;
        huhuiyu.ajax('/test/adminLogin', {}, function (data) {
          app.login.loading = false;
          if (data.success) {
            app.login.info = data.resultData.loginInfo;
            return;
          }
          app.$message(data.message);
        });
      },
      adminLogout() {
        app.login.loading = true;
        huhuiyu.ajax('/util/adminLogout', {}, function (data) {
          app.login.loading = false;
          app.$message(data.message);
        });
      },
      getLoginInfo() {
        app.login.loading = true;
        huhuiyu.ajax('/util/getAdminLoginInfo', {}, function (data) {
          app.login.loading = false;
          app.login.info = data;
        });
      },
      adminLogin() {
        app.login.loading = true;
        huhuiyu.ajax(
          '/util/adminLogin',
          {
            tbAdmin: {
              username: app.login.username,
              password: huhuiyu.md5(app.login.password)
            }
          },
          function (data) {
            app.login.loading = false;
            data.success
              ? app.$message('登陆成功！')
              : app.$message(data.message);
          }
        );
      }
    },
    created() {
      app = this;
    }
  });
})();
