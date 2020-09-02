Vue.config.devtools = true; 
require('../css/todolist.scss');

global.jQuery = require('jquery');
global.fetch = require('node-fetch');

require('bootstrap-sass');

import Vue from 'vue';
import store from './store/store'
import gestionnaireProfesseur from './components/GestionnaireTeacher';
//  import de awesome font 
import { faSearch } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";
import { library } from '@fortawesome/fontawesome-svg-core'
import VueNotifications from 'vue-notifications'
import swal from 'sweetalert'// https://github.com/t4t5/sweetalert

function toast ({title, message, type, timeout, cb}) {
  if (type === VueNotifications.types.warn) type = 'warning'
  return swal(title, message, type)
}

const options = {
  success: toast,
  error: toast,
  info: toast,
  warn: toast
}


library.add(faSearch);

Vue.use(VueNotifications, options);
Vue.component("font-awesome-icon", FontAwesomeIcon);
Vue.config.productionTip = false;

// library.add(faFontAwesome)

new Vue({
    el: '#app',
    store,
    // render: h => h(require('./components/GestionnaireTeacher.vue'))
    render: h => h(gestionnaireProfesseur)
    // components: {gestionnaireProfesseur}
});

