<template>
    <div class="col-lg-4">
        <div class="card h-100">
            <div class="card-header pb-0 p-3">
                <div class="row">
                    <div class="col-8 d-flex align-items-center">
                        <h6 class="mb-0">Collection accounts</h6>
                    </div>
                </div>
            </div>

            <div class="card-body p-3 pb-0">
                <div class="row">
                    <div class="col-6">
                        <div
                            class="card card-body border card-plain border-radius-lg d-flex align-items-center flex-row"
                        >
                            <select
                                id="select-month"
                                class="sin-borde"
                                @change="nowChangeCollection()"
                            >
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-4">
                        <div
                            class="card card-body border card-plain border-radius-lg d-flex align-items-center flex-row"
                        >
                            <select id="select-year" class="sin-borde" @change="nowChangeCollection()">
                                <option value="2023">2023</option>
                                <option value="2024">2024</option>
                                <option value="2025">2025</option>
                                <option value="2026">2026</option>
                                <option value="2027">2027</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div
                    class="overflow-hidden position-relative border-radius-xl mt-3"
                    style="max-height: 400px; overflow-y: auto"
                >
                    <ul class="list-group card-scroll-account">
                        <li
                            v-for="(item, index) in collectionAccount"
                            :key="index"
                            class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"
                        >
                            <div class="d-flex flex-column">
                                <h6
                                    class="mb-1 text-dark font-weight-bold text-sm"
                                >
                                    {{ this.$formatedDate(item.updated_at) }}
                                </h6>
                                <span class="text-xs">{{
                                    item.employee_name
                                }}</span>
                            </div>
                            <div class="d-flex align-items-center text-sm">
                                {{ item.employee_cc }}
                                <button
                                    class="btn btn-link text-dark text-sm mb-0 px-0 ms-4"
                                    @click="
                                        viewPdfCollectionAccount(
                                            item.employee_url_file
                                        )
                                    "
                                >
                                    <i
                                        class="fas fa-file-pdf text-lg me-1"
                                        aria-hidden="true"
                                    ></i>
                                    PDF
                                </button>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</template>
<style>
.card .card-body {
    font-family: "Open Sans";
    padding: 0.5rem;
}
.card-scroll-account {
    overflow-y: scroll;
    max-height: 400px; /* ajusta este valor a la altura máxima deseada */
}

.card-scroll-account::-webkit-scrollbar {
    width: 5px; /* Ancho del scrollbar */
    height: 8px; /* Altura del scrollbar */
    background-color: rgba(0, 0, 0, 0.05); /* Fondo del scrollbar */
}

.card-scroll-account::-webkit-scrollbar-thumb {
    background-color: rgba(0, 0, 0, 0.3); /* Color del thumb del scrollbar */
    border-radius: 10px; /* Radio de borde del thumb del scrollbar */
}

.card-scroll-account::-webkit-scrollbar-track {
    background-color: transparent; /* Fondo del track del scrollbar */
}
</style>

<script>
export default {
    data() {
        return {
            collectionAccount: [],
        };
    },
    async mounted() {
        const month = document.getElementById("select-month");
        const year = document.getElementById("select-year");

        const currentMonth = new Date().toLocaleString("en-US", {
            month: "2-digit",
        });
        month.value = currentMonth;
        for (let i = 0; i < month.options.length; i++) {
            const option = month.options[i];
            if (option.value === currentMonth) {
                option.selected = true;
                break;
            }
        }

        this.fetchCollectionAccount(year.value, month.value);
    },

    methods: {
        viewPdfCollectionAccount(path) {
            this.$axios
                .get("/api/pdf/view", {
                    headers: {
                        Authorization: `Bearer ${localStorage.TokenAccess}`,
                    },
                    params: {
                        path: path,
                    },
                    responseType: "blob",
                })
                .then((res) => {
                    const url = URL.createObjectURL(
                        new Blob([res.data], { type: "application/pdf" })
                    );
                    window.open(url, "_blank");
                });
        },
   
        nowChangeCollection() {
            const month = document.getElementById("select-month");
            const year = document.getElementById("select-year");
            this.fetchCollectionAccount(year.value, month.value, );
        },

        fetchCollectionAccount(yearValue, monthValue) {
            this.$axios
                .get(`/api/collectionAccount/${yearValue}/${monthValue}`, {
                    headers: {
                        Authorization: `Bearer ${localStorage.TokenAccess}`,
                    },
                })
                .then((response) => {
                    this.collectionAccount = response.data;
                    document.getElementById("collectionAccountCount").innerHTML = this.collectionAccount.length
                    document.getElementById("send_to_count").innerHTML = this.collectionAccount[0].send_to_email
                });
        },
    },
};
</script>
