'use strict'

new Vue({
  el: '#app',
  data() {
    return {
      loading: true,
      notif: {
        visible: false,
        msg: null,
        type: 'info'
      }
    }
  },

  // Function triggered on page load
  async mounted() {
    // Check the user is logged in
    if (!checkLoggedIn()) return (window.location.href = 'login.html')

    // Load current user data from cache
    this.user = JSON.parse(localStorage.getItem('user') || false)

    // Fetch all data from the API
    await Promise.all([])

    // Fetching OK
    this.loading = false
  },

  methods: {
    async exampleFetch() {
      let res = await fetch(`${API_PREFIX}sendFriendRequest`, {
        method: 'POST',
        headers: { 'Content-type': 'application/json' },
        body: JSON.stringify({
          param1: 'test' // this.param1
        })
      })

      // The server returned an error
      if (!isValidHttpCode(res)) {
        const { error = 'The server returned an error.' } = await res.json().catch(_ => ({}))
        this.notif.visible = true
        this.notif.msg = error
        this.notif.type = 'negative'
        return
      }

      res = await res.json()
      // The server returned success
      if (res) {
        this.notif.visible = true
        this.notif.type = 'positive'
        this.notif.msg = 'Friend request sent successfully.'
      }
    },

    // Set the notification
    setNotif(type, msg) {
      this.notif = { type, msg }
      console.log('Notif was set :', this.notif)
    },

    // Disconnect from the app and the API
    async logout() {
      this.loading = true
      localStorage.clear()
      await fetch(`${API_PREFIX}disconnect`)
      window.location.href = 'login.html'
    }
  }
})

Vue.config.devtools = true
