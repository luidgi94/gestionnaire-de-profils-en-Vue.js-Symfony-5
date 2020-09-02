import Vue from 'vue'
import 'es6-promise/auto'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
	state: {
		todos: [],
		GlobalLoading: true,
		GlobalTest : 'Vuex test'
	},
	mutations: {
		changeGlobaltest(state){
			state.GlobalTest = 'On change la valeur dans le store'
		},
		changeGlobalLoading(state, value){
			state.GlobalLoading = value
		},
	
	},
	actions: { // les action sont asynchrone et les mutation syncrones (bloquant)
		ChangeTest ({ commit }) {
			commit('changeGlobaltest')
		},
		updateLoader ({ commit },value) {
			commit('changeGlobalLoading',value)
		}
	},
	getters: {
		getGlobaltest: state => state.GlobalTest,
		all: state => state.todos,
		completed: state => state.todos.filter(todo => todo.completed),
		pending: state => state.todos.filter(todo => !todo.completed)
	}
})
