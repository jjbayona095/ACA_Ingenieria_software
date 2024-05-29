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
                    <TableEmployeeComponent></TableEmployeeComponent>
                </div>
            </div>
        </main>
    </div>
</template>

<script>
import MenuComponent from "./components/menu.vue";
import NavbarComponent from "./components/navbar.vue";
import TableEmployeeComponent from "./components/content/employee/table-employee.vue";
import MenuMobile from "./components/menu-mobile.vue";
export default {
    components: {
        MenuComponent,
        NavbarComponent,
        TableEmployeeComponent,
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
