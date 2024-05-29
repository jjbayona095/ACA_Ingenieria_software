<template>
    <div class="card h-100">
        <div class="card-header pb-0">
            <h6>My change history</h6>
            <p class="text-sm">
                <i class="fa fa-arrow-up text-success" aria-hidden="true"></i>
                this month
            </p>
        </div>
        <div
            class="overflow-hidden position-relative border-radius-xl mt-3"
            style="max-height: 400px; overflow-y: auto"
        >
            <div class="card-body card-scroll-h p-3" id="historyMessage">
                <div
                    class="timeline timeline-one-side"
                    v-for="history in historys"
                    :key="history.id"
                >
                    <div class="timeline-block mb-3">
                        <span class="timeline-step">
                            <i
                                class="ni ni-bell-55 text-success text-gradient"
                                v-if="history.action === 'created'"
                            ></i>
                            <i
                                class="ni ni-single-02 text-danger text-gradient"
                                v-if="history.action === 'delete'"
                            ></i>
                            <i
                                class="ni ni-notification-70 text-warning text-gradient"
                                v-if="history.action === 'generated'"
                            ></i>
                            <i
                                class="ni ni-air-baloon text-info text-gradient"
                                v-if="history.action === 'updated'"
                            ></i>
                        </span>
                        <div class="timeline-content">
                            <p
                                class="text-secondary font-weight-bold text-xs mt-1 mb-0"
                            >
                                {{ capitalizeFirstLetter(history.username) }}
                            </p>
                            <h6 class="text-dark text-sm font-weight-bold mb-0">
                                {{ history.description_action }}
                            </h6>
                            <p
                                class="text-secondary font-weight-bold text-xs mt-1 mb-0"
                            >
                                {{ formatDateTime(history.created_at) }}
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<style>
.card-scroll-h {
    overflow-y: scroll;
    max-height: 370px; /* ajusta este valor a la altura máxima deseada */
}

.card-scroll-h::-webkit-scrollbar {
    width: 5px; /* Ancho del scrollbar */
    height: 8px; /* Altura del scrollbar */
    background-color: rgba(0, 0, 0, 0.05); /* Fondo del scrollbar */
}

.card-scroll-h::-webkit-scrollbar-thumb {
    background-color: rgba(0, 0, 0, 0.3); /* Color del thumb del scrollbar */
    border-radius: 10px; /* Radio de borde del thumb del scrollbar */
}

.card-scroll-h::-webkit-scrollbar-track {
    background-color: transparent; /* Fondo del track del scrollbar */
}
</style>

<script>
export default {
    data() {
        return {
            showModal: false,
            historys: [],
        };
    },

    mounted() {
        this.$axios
            .get("/api/historyAllRegistered", {
                headers: {
                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                },
            })
            .then((response) => {
                this.historys = response.data;
            })
            .finally(() => {
                const messagesDiv = document.getElementById("historyMessage");
                messagesDiv.scrollTop = messagesDiv.scrollHeight;
            });
    },

    methods: {
        // Definimos la función que formatea la fecha y hora
        formatDateTime(created_at) {
            const dateObj = new Date(created_at);
            const options = {
                day: "2-digit",
                month: "short",
                hour: "numeric",
                minute: "numeric",
                hour12: true,
            };
            return new Intl.DateTimeFormat("en-US", options).format(dateObj);
        },

        capitalizeFirstLetter(str) {
            return str.charAt(0).toUpperCase() + str.slice(1);
        },
    },
};
</script>
