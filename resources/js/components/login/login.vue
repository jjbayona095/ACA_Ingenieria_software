<template>
    <section>
        <!-- Content -->

        <div class="cloud x1"></div>
        <!-- Time for multiple clouds to dance around -->
        <div class="cloud x2"></div>
        <div class="cloud x3"></div>
        <div class="cloud x4"></div>
        <div class="cloud x5"></div>

        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-6 col-12-small mt-3">
                        <img
                            src="images/logo.svg"
                            alt="Image"
                            class="img-fluid"
                            width="400"
                            height="300"
                        />
                    </div>
                    <div class="col-6 col-12-small contents">
                        <div class="row login" v-if="!openRegister">
                            <div class="mb-4">
                                <h4>Credenciales Intuition</h4>
                                <p class="mb-4">
                                    Sistema de cuenta de cobro de Intuition
                                    Business, por favor usa las credenciales
                                    asignadas.
                                </p>
                            </div>
                            <form action="#" method="post">
                                <div class="form-group first">
                                    <input
                                        v-model="email"
                                        required
                                        type="email"
                                        placeholder="Email"
                                        class="form-control"
                                        id="email"
                                    />
                                </div>
                                <div class="form-group last mb-4">
                                    <div class="input-group">
                                        <input
                                            :type="
                                                showPassword
                                                    ? 'text'
                                                    : 'password'
                                            "
                                            v-model="password"
                                            placeholder="Contraseña"
                                            class="form-control"
                                            id="password"
                                            required
                                        />
                                        <div class="input-group-append">
                                            <span
                                                class="input-group-text"
                                                @click="
                                                    togglePasswordVisibility
                                                "
                                            >
                                                <i
                                                    :class="
                                                        showPassword
                                                            ? 'fa fa-eye-slash'
                                                            : 'fa fa-eye'
                                                    "
                                                ></i>
                                            </span>
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex mb-5 align-items-center">
                                    <label
                                        class="control control--checkbox mb-0"
                                        ><span>Recuerdame mis datos</span>
                                        <input
                                            type="checkbox"
                                            checked="checked"
                                            v-model="rememberMe"
                                        />
                                        <div class="control__indicator"></div>
                                    </label>
                                </div>
                                <input
                                    type="submit"
                                    value="Iniciar sesión"
                                    class="btn btn-block mySubmitBtnClass"
                                    @click="handleSubmit"
                                />
                            </form>

                            <p class="mb-4" v-if="error !== null">
                                {{ error }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import "./style.css";
import Swal from "sweetalert2";

export default {
    data() {
        return {
            email: "",
            password: "",
            error: null,
            showPassword: false,
            rememberMe: false,

        };
    },
    components: {
        //ChildRegister,
    },
    mounted() {
        const email = this.getCookie("rememberedEmail");
        const password = this.getCookie("rememberedPassword");
        if (email && password) {
            this.email = email;
            this.password = password;
            this.rememberMe = true;
        }
    },

    methods: {
        handleSubmit(e) {
            e.preventDefault();
            if (this.password.length > 0) {
                this.$axios.get("/sanctum/csrf-cookie").then(() => {
                    this.$axios
                        .post("/api/login", {
                            email: this.email,
                            password: this.password,
                        })
                        .then((response) => {
                            if (response.data.success) {
                                localStorage.setItem(
                                    "user_id",
                                    response.data.user.id
                                );
                                localStorage.setItem(
                                    "type",
                                    response.data.user.type
                                );
                                localStorage.setItem(
                                    "nameUser",
                                    response.data.user.name
                                );
                                localStorage.setItem(
                                    "TokenAccess",
                                    response.data.token
                                );
                                this.$router.go("/dashboard/home");
                            } else {
                                Swal.fire(
                                    "Error!",
                                    "Something wrong has happened with your credentials, it may be that the email is wrong or your password",
                                    "warning"
                                );
                            }
                        })
                        .catch(function (error) {
                            console.error(error);
                        });
                });
            }
            if (this.rememberMe) {
                this.setCookie("rememberedEmail", this.email, 7);
                this.setCookie("rememberedPassword", this.password, 7);
            } else {
                this.deleteCookie("rememberedEmail");
                this.deleteCookie("rememberedPassword");
            }
        },

        togglePasswordVisibility() {
            this.showPassword = !this.showPassword;
        },

        setCookie(name, value, days) {
            let expires = "";
            if (days) {
                const date = new Date();
                date.setTime(date.getTime() + days * 24 * 60 * 60 * 1000);
                expires = "; expires=" + date.toUTCString();
            }
            document.cookie = name + "=" + value + expires + "; path=/";
        },

        getCookie(name) {
            const nameEQ = name + "=";
            const ca = document.cookie.split(";");
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i];
                while (c.charAt(0) == " ") c = c.substring(1, c.length);
                if (c.indexOf(nameEQ) == 0)
                    return c.substring(nameEQ.length, c.length);
            }
            return null;
        },

        deleteCookie(name) {
            document.cookie = name + "=; Max-Age=-99999999;";
        },
    },

    beforeRouteEnter(to, from, next) {
        if (localStorage.TokenAccess) {
            return next("/dashboard/home");
        }
        next();
    },
};
</script>
