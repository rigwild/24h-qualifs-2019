'use strict'

const apiUrl = controller => `../api/?controller=${controller}`;
const apiCall = async (controller, body = undefined) => {
    let res = await fetch(apiUrl(controller), {
        method: body ? 'POST' : 'GET',
        headers: { 'Content-type': 'application/json' },
        body: body && JSON.stringify(body)
    })

    // The server returned an error
    if (!isValidHttpCode(res)) {
        const { error = 'The server returned an error.' } = await res.json().catch(_ => ({}))
        throw new Error(error);
    }

    return await res.json()
    // The server returned success
};

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
            game: [],
            user: {
                username: ''
            },
            id_user: []
        }
    },

    // Function triggered on page load
    async mounted() {
        // Load current user data from cache
        this.user = JSON.parse(localStorage.getItem('user') || false)

        // Fetch all data from the API
        await Promise.all([this.getGame()])

        // Fetching OK
        this.loading = false
    },

    methods: {
        async getGame() {
            try {
                const res = await apiCall('getGame');
                if (res)
                    this.game = res;
            } catch (err) {
                this.notif.visible = true
                this.notif.msg = err.message
                this.notif.type = 'alert-danger'
            }
        },

        async loanGame(userId, gameId) {
            try {
                const res = await apiCall('loanGame', {
                  id_user: userId,
                  id_jeu: gameId
                });
                if (res) {
                    this.game = res;
                }
            } catch (err) {
                this.notif.visible = true
                this.notif.msg = err.message
                this.notif.type = 'alert-danger'
            }
            this.id_user = [];
        },

        async returnGame(gameId) {
            try {
                const res = await apiCall('returnGame', {
                  id_jeu: gameId
                });
                if (res) {
                    this.game = res;
                }
            } catch (err) {
                this.notif.visible = true
                this.notif.msg = err.message
                this.notif.type = 'alert-danger'
            }
            this.id_user = [];
        },

        async deleteGame(gameId) {
            try {
                const res = await apiCall('deleteGame', {
                    id_jeu: [gameId]
                });
                if (res) {
                    this.notif.visible = true
                    this.notif.msg = "La jeu a été supprimé !"
                    this.notif.type = 'alert-success'
                }
            } catch (err) {
                this.notif.visible = true
                this.notif.msg = err.message
                this.notif.type = 'alert-danger'
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
            await fetch(apiUrl('disconnect'))
            window.location.href = '../index.html'
        }
    }
})

Vue.config.devtools = true