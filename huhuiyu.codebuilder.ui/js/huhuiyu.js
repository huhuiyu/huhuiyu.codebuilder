// 自定义功能封装
// 依赖axios,和qs
const huhuiyu = {
  // ajax相关信息
  server: {
    tokenKey: 'local-token-key',
    saveToken: function (data) {
      if (data && data.token) {
        localStorage.setItem(huhuiyu.server.tokenKey, data.token);
      }
    },
    loadToken: function () {
      return localStorage.getItem(huhuiyu.server.tokenKey);
    },
    // baseUrl: 'http://127.0.0.1:8080/huhuiyu.codebuilder.template-1.0.0'
    baseUrl: 'http://127.0.0.1:20000'
  },
  ajax: function (url, params, cb, method) {
    url = huhuiyu.server.baseUrl + url;
    method = method ? method : 'post';
    let promise = axios({
      url: url,
      data: Qs.stringify(params, { allowDots: true }),
      method: method,
      headers: {
        token: huhuiyu.server.loadToken()
      }
    });
    promise
      .then(function (resp) {
        huhuiyu.server.saveToken(resp.data);
        cb(resp.data);
      })
      .catch(function (error) {
        console.error(error);
        cb({ code: 500, success: false, message: '请求失败' });
      });
  },
  // md5加密
  md5: function (info) {
    return SparkMD5.hash(info);
  }
};
