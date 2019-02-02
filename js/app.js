const API_PREFIX = 'api/?controller='

const checkLoggedIn = () => {
  if (localStorage.getItem('loggedIn') === 'true') {
    const user = JSON.parse(localStorage.getItem('user') || {})
    if (typeof user === 'object' && user.hasOwnProperty('id')) {
      return true
    }
  }
  localStorage.clear()
  return false
}

const getQueryString = key => new URLSearchParams(window.location.search).get(key)

const isValidHttpCode = fetchObj =>
  fetchObj.status && fetchObj.status >= 200 && fetchObj.status <= 299
