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
                <div class="p-3">
                    <span
                        >Remaining time for closing modifications:
                        <b>{{ numberDays }} day(s)</b></span
                    >
                </div>
                <ComponentGenerate></ComponentGenerate>
            </div>
        </main>
    </div>
</template>

<script>
import MenuComponent from "./components/menu.vue";
import NavbarComponent from "./components/navbar.vue";
import ComponentGenerate from "./components/content/report/generate.vue";
import MenuMobile from "./components/menu-mobile.vue";

export default {
    components: {
        MenuComponent,
        NavbarComponent,
        ComponentGenerate,
        MenuMobile
    },
    data() {
        return {
            numberDays: 0,
        };
    },

    mounted() {
        let dateNow = new Date();

        // Establece la fecha objetivo (por ejemplo, el 7 de junio)
        let dateObjective = new Date(
            dateNow.getFullYear(),
            dateNow.getMonth() + 1,
            7
        );

        // Calcula la diferencia en milisegundos entre las dos fechas
        const differenceMilliseconds = dateObjective - dateNow;

        // Calcula el número de días restantes
        const remainingDays = Math.ceil(
            differenceMilliseconds / (1000 * 60 * 60 * 24)
        );
        this.numberDays = remainingDays;
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
