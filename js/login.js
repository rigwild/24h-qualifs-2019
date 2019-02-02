'use strict'

new Vue({
  el: '#app',

  data: {
    username: '',
    password: '',
    notif: {
      visible: false,
      msg: '',
      type: ''
    }
  },

  methods: {
    async login() { // api/?controller=login
      let res = await fetch(`${API_PREFIX}login`, {
        method: 'POST',
        headers: { 'Content-type': 'application/json' },
        body: JSON.stringify({
          username: this.username,
          password: this.password
        })
      })

      // The server returned an error
      if (!isValidHttpCode(res)) {
        const { error = 'The server returned an error.' } = await res.json().catch(_ => ({}))
        this.notif.visible = true
        this.notif.msg = error
        this.notif.type = 'alert-danger'
        return
      }

      res = await res.json()
      // The server returned success
      if (res) {
        localStorage.setItem('user',JSON.stringify(res));
        localStorage.setItem('loggedIn','true');
        window.location.href = 'admin/index.html'
      }
    }
  }
})

Vue.config.devtools = true
