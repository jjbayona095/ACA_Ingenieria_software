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
                <div class="row">
                    <ManagementComponent></ManagementComponent>
                </div>
            </div>
        </main>
    </div>
</template>

<script>
import MenuComponent from "./components/menu.vue";
import NavbarComponent from "./components/navbar.vue";
import ManagementComponent from "./components/content/management/management.vue";
import MenuMobile from "./components/menu-mobile.vue";


export default {
    components: {
        MenuComponent,
        NavbarComponent,
        ManagementComponent,
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
