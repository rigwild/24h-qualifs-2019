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
            },
            loan: [],
        }
    },

    // Function triggered on page load
    async mounted() {

        // Fetch all data from the API
        await Promise.all([this.getLoan()])

        // Fetching OK
        this.loading = false
    },

    methods: {
        async getLoan() {
            let res = await fetch(`${API_PREFIX}getLoan`, {
                method: 'GET',
                headers: { 'Content-type': 'application/json' }
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
                this.loan = res;
            }
        },

        // Set the notification
        setNotif(type, msg) {
            this.notif = { type, msg }
            console.log('Notif was set :', this.notif)
        },
    }
})

Vue.config.devtools = true
