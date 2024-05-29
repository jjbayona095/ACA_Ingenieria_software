/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */



import { createApp } from "vue";
import App from "./App.vue";
import axios from 'axios';
//import VueAxios from 'vue-axios';
import { createRouter, createWebHistory } from "vue-router";
import routes from "./router";

const router = createRouter({
    history: createWebHistory(),
    routes: routes.routes  
})

const nowDate = () => {
    const date = new Date();
    const day = date.getDate();
    const month = date.getMonth() + 1;
    const monthFormatted = month < 10 ? `0${month}` : month;
    const year = date.getFullYear();

    document.getElementById("day_date").innerHTML = day;
    document.getElementById("moth_date").innerHTML = monthFormatted
    document.getElementById("year_date").innerHTML = year;
}

const formatedDate = (date) => {
    if(date == null){
        return "Without generating"
    }
    const nowDate = new Date(date);
    const option = { month: "long", day: "numeric", year: "numeric" };
    const dateFormated = nowDate.toLocaleDateString("en-US", option);
    return dateFormated;
}

const app = createApp(App);
app.config.globalProperties.$axios = axios;
app.config.globalProperties.$dateNow = nowDate;
app.config.globalProperties.$formatedDate = formatedDate;
app.use(router);
app.mount('#app');

require('./bootstrap');