<template>
    <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
            <ol
                class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5"
            >
                <li class="breadcrumb-item text-sm">
                    <a class="opacity-5 text-dark" href="javascript:;">Pages</a>
                </li>
                <li
                    class="breadcrumb-item text-sm text-dark active"
                    aria-current="page"
                >
                    Dashboard
                </li>
            </ol>
            <h6 v-if="nameUser" class="font-weight-bolder mb-0">
                Hi, welcome {{ formattedNameUser }}
            </h6>
        </nav>
        <div class="buttons-container" style="z-index: 9999">
            <a
                href="javascript:;"
                class="nav-link text-body text-sm px-0"
                @click="logout"
            >
                <i class="fa fa-user me-sm-1" aria-hidden="true"></i>
                <span class="d-sm-inline d-none">Log Out</span>
            </a>
            <li class="nav-item px-3 d-flex align-items-center">
                <a href="javascript:;" class="nav-link text-body p-0">
                    <i
                        class="fa fa-bell fixed-plugin-button-nav cursor-pointer"
                        aria-hidden="true"
                    ></i>
                </a>
            </li>
            <li class="nav-item dropdown pe-2 d-flex align-items-center">
                <a
                    href="javascript:;"
                    class="nav-link text-body p-0"
                    id="dropdownMenuButton"
                    data-bs-toggle="dropdown"
                    aria-expanded="false"
                >
                    <i class="fa fa-cog cursor-pointer" aria-hidden="true"></i>
                </a>
                <ul
                    class="dropdown-menu dropdown-menu-end px-2 py-3 me-sm-n4"
                    aria-labelledby="dropdownMenuButton"
                >
                    <li class="mb-2">
                        <a
                            class="dropdown-item border-radius-md"
                            href="javascript:;"
                            @click="changePassword()"
                        >
                            <div class="d-flex py-1">
                                <!-- <div class="my-auto">
                                    <img
                                        sc="../assets/img/team-2.jpg"
                                        class="avatar avatar-sm me-3"
                                    />
                                </div> -->
                                <div
                                    class="d-flex flex-column justify-content-center"
                                >
                                    <h6 class="text-sm font-weight-normal mb-1">
                                        <span class="font-weight-bold"
                                            >Settings</span
                                        >
                                        Change to password
                                    </h6>
                                    <p class="text-xs text-secondary mb-0">
                                        <i
                                            class="fa fa-clock me-1"
                                            aria-hidden="true"
                                        ></i>
                                        Click here
                                    </p>
                                </div>
                            </div>
                        </a>
                    </li>
                </ul>
            </li>
        </div>
    </div>
</template>

<style>
.buttons-container {
    position: fixed;
    top: 10px;
    right: 10px;
    display: flex;
    margin-right: 50px;
    margin-top: 5px;
}

.buttons-container button {
    margin-left: 10px;
}
.buttons-container span {
    font-size: 15px;
}
</style>

<script>
import Swal from "sweetalert2";

export default {
    data() {
        return {
            nameUser: localStorage.getItem("nameUser"),
        };
    },
    methods: {
        logout() {
            this.$axios
                .post("/api/logout", {
                    user_id: localStorage.getItem("user_id"),
                })
                .then(() => {
                    localStorage.removeItem("user_id");
                    localStorage.removeItem("TokenAccess");
                    localStorage.removeItem("type");
                    this.$router.go("/");
                });
        },

        async changePassword() {
            console.log("holaa");
            Swal.fire({
                title: "Change Password",
                html:
                    '<input type="password" id="current-password" class="swal2-input" placeholder="Current Password" maxlength="10" autocapitalize="off" autocorrect="off">' +
                    '<input type="password" id="new-password" class="swal2-input" placeholder="New Password" maxlength="10" autocapitalize="off" autocorrect="off">',
                showCancelButton: true,
                confirmButtonText: "Change",
                cancelButtonText: "Cancel",
                focusConfirm: false,
                preConfirm: () => {
                    const currentPassword =
                        document.getElementById("current-password").value;
                    const newPassword =
                        document.getElementById("new-password").value;

                    this.$axios.post(
                        `/api/changePassword`,
                        {
                            current_password: currentPassword ,
                            new_password: newPassword
                        },
                        {
                            headers: {
                                Authorization: `Bearer ${localStorage.TokenAccess}`,
                            },
                        }
                    ).then((res)=> {
                        return Swal.fire(res.data.message, "", "success");
                    }).catch(()=> {
                        return Swal.fire("Error al cambiar la contraseña, credenciales incorrectas", "", "error");
                    });
                },
            })
        },
    },

    computed: {
        formattedNameUser() {
            if (this.nameUser) {
                const firstLetter = this.nameUser.charAt(0).toUpperCase();
                const restOfName = this.nameUser.slice(1);
                return firstLetter + restOfName;
            } else {
                return "";
            }
        },
    },
};
</script>
