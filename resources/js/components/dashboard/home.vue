<template>
    <div>
        <MenuComponent></MenuComponent>
        <MenuMobile></MenuMobile>
        <main
            class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ps ps--active-y"
        >
            <!-- Navbar -->
            <NavbarComponent></NavbarComponent>
            <!-- End Navbar -->
            
            <div class="container-fluid py-4">
                <div class="row my-4">
                    <div class="col-lg-8 col-md-6 mb-md-0 mb-4">
                       <TableUserComponent></TableUserComponent>
                    </div>
                    <div class="col-lg-4 col-md-6">
                       <HistoryComponent></HistoryComponent>
                    </div>
                </div>
            </div>
        </main>
    </div>
</template>

<script>
import MenuComponent from "./components/menu.vue";
import NavbarComponent from "./components/navbar.vue";
import TableUserComponent from "./components/content/home/table-user.vue"
import HistoryComponent from "./components/content/home/history.vue";
import MenuMobile from "./components/menu-mobile.vue";

export default {
    components: {
        MenuComponent,
        NavbarComponent,
        HistoryComponent,
        TableUserComponent,
        MenuMobile
    },
    methods: {},

    beforeRouteEnter(to, from, next) {
        if (!localStorage.TokenAccess) {
            return next("/");
        }
        next();
    },
};
</script>
