

<script>
  import VueNotifications from 'vue-notifications'

  export default {
    name: 'popupNotification',
    notifications: {
      showSuccessMsg: {
        type: VueNotifications.types.success, // or just 'success' or any other string
        title: 'HelloWorld there',
        message: 'That\'s the success!'
      },
      showInfoMsg: {
        type: VueNotifications.types.info,
        title: 'Hey you',
        message: 'Here is some info for you'
      },
      showWarnMsg: {
        type: VueNotifications.types.warn,
        title: 'Wow, man',
        message: 'That\'s the kind of warning'
      },
      showErrorMsg: {
        type: VueNotifications.types.error,
        title: 'Wow-wow',
        message: 'That\'s the error'
      }
    },
    methods: {
      validNotification(titre,message){
          this.showSuccessMsg({title: titre, message: message})
      },
      errorNotification(titre,message){
          this.showErrorMsg({title: titre, message: message})
      },
      makeRequest (url) {
        return this.ajaxCall('whatever').then(response => {
          // Some error message overridings
          if (response.loginError) return this.showErrorMsg({message: 'Login error'})
          if (!response.ok) return this.showErrorMsg({message: response.message})

          this.showSuccessMsg()
        })
      },
      ajaxCall (url) {
        return new Promise((resolve, reject) => {
          resolve({loginError: true})
          // resolve({ok: false})
          // resolve({ok: true})
        })
      }
    }
  }
</script>

<style scoped>
  h3 {
    margin: 40px 0 0;
  }

  ul {
    list-style-type: none;
    padding: 0;
  }

  li {
    display: inline-block;
    margin: 0 10px;
  }

  a {
    color: #42b983;
  }

  .hello {
    text-align: center
  }

  .msg-buttons {
    margin: 10px;
  }

  .msg-buttons__btn {
    color: white;
    font-size: 14px;
    background-color: #41b883;
    border-radius: 3px;
    padding: 7px 12px;
    border: 1px solid transparent;
    transition: background .4s ease;
    cursor: pointer;
  }

  .msg-buttons__btn:hover {
    background-color: #71b999;
  }

</style>
