<template>
    <div class="row">
        <div class="col-lg-8">
            <div class="row">
                <div class="col-xl-6 mb-xl-0 mb-4">
                    <div class="card shadow-xl">
                        <div
                            class="overflow-hidden position-relative border-radius-xl"
                            style="max-height: 250px; overflow-y: auto"
                        >
                            <div class="card-header pb-0 p-3">
                                <h6 class="mb-0">Select Collection Account</h6>
                            </div>
                            <div
                                class="card-body card-scroll position-relative z-index-1 p-3"
                            >
                                <div class="d-flex align-items-center">
                                    <h6
                                        class="text-uppercase text-body text-xs font-weight-bolder m-0 me-2"
                                    >
                                        All Employees
                                    </h6>
                                    <div class="form-check form-switch m-1">
                                        <input
                                            class="form-check-input"
                                            type="checkbox"
                                            :id="'flexSwitchCheckDefault'"
                                            @change="selectAllEmployeed()"
                                        />
                                    </div>
                                </div>
                                <ul class="list-group">
                                    <li
                                        v-for="(item, index) in employees"
                                        :key="index"
                                        class="list-group-item border-0 px-0"
                                    >
                                        <div
                                            class="form-check form-switch ps-0"
                                        >
                                            <input
                                                class="form-check-input ms-auto"
                                                type="checkbox"
                                                :id="
                                                    'flexSwitchCheckEmployee' +
                                                    index
                                                "
                                                @change="selectEmployeed(item)"
                                            />
                                            <label
                                                class="form-check-label text-body ms-3 text-truncate w-80 mb-0"
                                                :for="
                                                    'flexSwitchCheckDefault' +
                                                    index
                                                "
                                                >{{ item.name }}</label
                                            >
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-header mx-4 p-3 text-center">
                                    <div
                                        class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg"
                                    >
                                        <i
                                            class="fas fa-envelope opacity-10"
                                            aria-hidden="true"
                                        ></i>
                                    </div>
                                </div>
                                <div class="card-body pt-0 p-3 text-center">
                                    <h6 class="text-center mb-0">Report</h6>
                                    <span class="text-xs"
                                        >Reports sent to email employee</span
                                    >
                                    <hr class="horizontal dark my-3" />
                                    <h5 class="mb-0" id="send_to_count">0</h5>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 mt-md-0 mt-4">
                            <div class="card">
                                <div class="card-header mx-4 p-3 text-center">
                                    <div
                                        class="icon icon-shape icon-lg bg-gradient-primary shadow text-center border-radius-lg"
                                    >
                                        <i
                                            class="fas fa-file-pdf opacity-10"
                                            aria-hidden="true"
                                        ></i>
                                    </div>
                                </div>
                                <div class="card-body pt-0 p-3 text-center">
                                    <h6 class="text-center mb-0">Generated</h6>
                                    <span class="text-xs"
                                        >Collection accounts generated</span
                                    >
                                    <hr class="horizontal dark my-3" />
                                    <h5
                                        class="mb-0"
                                        id="collectionAccountCount"
                                    >
                                        0
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mb-lg-0 mb-4">
                    <div class="card mt-4">
                        <div class="card-header pb-0 p-3">
                            <div class="row">
                                <div class="col-6 d-flex align-items-center">
                                    <h6 class="mb-0">
                                        Generate collection account
                                    </h6>
                                </div>
                                <div class="col-6 text-end">
                                    <a
                                        class="btn bg-gradient-dark mb-0"
                                        href="javascript:;"
                                        @click="generateCollectionAccount()"
                                    >
                                        <i
                                            class="fas fa-plus"
                                            aria-hidden="true"
                                        ></i
                                        >&nbsp;&nbsp;Generate</a
                                    >
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-3">
                            <div class="row">
                                <div class="col-md-6 mb-md-0 mb-4">
                                    <label>Execution period</label>
                                    <div
                                        class="card card-body border card-plain border-radius-lg d-flex align-items-center flex-row"
                                    >
                                        <input
                                            type="date"
                                            class="mb-0 sin-borde text-dark"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            aria-hidden="true"
                                            aria-label="Edit execution period"
                                            data-bs-original-title="Edit execution period"
                                            id="execution_period"
                                        />
                                        <span class="sr-only"
                                            >Edit execution period</span
                                        >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <label>End of execution period</label>
                                    <div
                                        class="card card-body border card-plain border-radius-lg d-flex align-items-center flex-row"
                                    >
                                        <input
                                            type="date"
                                            class="mb-0 sin-borde text-dark"
                                            data-bs-toggle="tooltip"
                                            data-bs-placement="bottom"
                                            aria-hidden="true"
                                            aria-label="Edit end of execution period"
                                            data-bs-original-title="Edit end of execution period"
                                            id="end_execution"
                                        />
                                        <span class="sr-only"
                                            >Edit end of execution period</span
                                        >
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <ComponentLoading
            :show="isLoading"
            @close="!isLoading"
        ></ComponentLoading>
        <ComponentCollectionAccounts></ComponentCollectionAccounts>
        <ComponentGeneratePdf></ComponentGeneratePdf>
    </div>
</template>

<style>
.sin-borde {
    border: none;
    outline: none;
    font-weight: bold;
}

input[type="date"]::-webkit-calendar-picker-indicator {
    color: #56589da1; /* Cambia el color a rojo */
    font-size: 17px; /* Cambia el tamaño a 24px */
    margin-left: 120px;
}

.card-scroll {
    overflow-y: scroll;
    max-height: 250px; /* ajusta este valor a la altura máxima deseada */
}

.card-scroll::-webkit-scrollbar {
    width: 5px; /* Ancho del scrollbar */
    height: 8px; /* Altura del scrollbar */
    background-color: rgba(0, 0, 0, 0.05); /* Fondo del scrollbar */
}

.card-scroll::-webkit-scrollbar-thumb {
    background-color: rgba(0, 0, 0, 0.3); /* Color del thumb del scrollbar */
    border-radius: 10px; /* Radio de borde del thumb del scrollbar */
}

.card-scroll::-webkit-scrollbar-track {
    background-color: transparent; /* Fondo del track del scrollbar */
}
</style>

<script>
import ComponentCollectionAccounts from "./collection-accounts.vue";
import ComponentGeneratePdf from "../employee/see-employee-pdf.vue";
import ComponentLoading from "./loading.vue";
import html2pdf from "html2pdf.js";
import Swal from "sweetalert2";

export default {
    components: {
        ComponentCollectionAccounts,
        ComponentGeneratePdf,
        ComponentLoading,
    },
    data() {
        return {
            employees: [],
            employeedSelect: [],
            isLoading: false,
        };
    },
    mounted() {
        Promise.all([
            this.$axios
                .get("/api/employeeAllRegistered", {
                    headers: {
                        Authorization: `Bearer ${localStorage.TokenAccess}`,
                    },
                })
                .then((response) => {
                    this.employees = response.data;
                }),
        ]);
    },
    methods: {
        selectEmployeed(employee) {
            if (event.target.checked) {
                const index = this.employeedSelect.findIndex(
                    (emp) => emp.id === employee.id
                );
                if (index === -1) {
                    this.employeedSelect.push(employee);
                }
            } else {
                this.employeedSelect = this.employeedSelect.filter(
                    (emp) => emp.id !== employee.id
                );
            }
        },

        selectAllEmployeed() {
            const nodeListSwitch = document.querySelectorAll(
                '[id^="flexSwitchCheckEmployee"]'
            );

            nodeListSwitch.forEach(async (index, i) => {
                let checkboxElement = document.getElementById(
                    `flexSwitchCheckEmployee${i}`
                );
                if (event.target.checked) {
                    checkboxElement.checked = true;
                    await this.$axios
                        .get("/api/employeeAllRegistered", {
                            headers: {
                                Authorization: `Bearer ${localStorage.TokenAccess}`,
                            },
                        })
                        .then((response) => {
                            this.employeedSelect = response.data;
                        });
                } else {
                    this.employeedSelect.length = 0;
                    checkboxElement.checked = false;
                }
            });
        },
        async generateCollectionAccount() {
            try {
                const execution_period =
                    document.getElementById("execution_period").value;
                const end_execution =
                    document.getElementById("end_execution").value;

                if (execution_period === "" || end_execution === "") {
                    return Swal.fire(
                        "Error!",
                        "Error without dates or select employee!",
                        "warning"
                    );
                }

                const dateString = new Date(execution_period);

                const year = dateString.getFullYear();
                let month = dateString.getMonth() + 2;
                if (month < 10) month = month.toString().padStart(2, "0");

                const dateNow = new Date();
                const currentMonth = dateNow.getMonth() + 1; // Los meses se representan en base 0, por lo que mayo es el mes 4.
                const currentDay = dateNow.getDate();
                const validDay = [1, 2, 3, 4, 5, 6, 7]; // Array de días válidos

                if (
                    currentMonth === parseInt(month) ||
                    validDay.includes(currentDay)
                ) {
                    if (this.employeedSelect.length == 0) {
                        return Swal.fire(
                            "Error!",
                            "Error without employees!",
                            "warning"
                        );
                    } else {
                        await this.employeedSelect.forEach(async (employee) => {
                            this.$dateNow();
                            const elementIds = {
                                name: "name",
                                cc: "identification_number",
                                phone: "phone_number",
                                email: "email",
                                address: "address",
                                city: "city",
                                concept: "concept",
                                bonus: "bonus",
                                discount: "discount",
                                value_service: "value",
                                total: "total",
                                name_bank: "name",
                                cc_bank: "identification_number",
                                name_signature: "name",
                                cc_signature: "identification_number",
                                type_bank: "type_account_bank",
                                name_bank_acc: "bank",
                                number_bank: "number_account",
                                consecutive: "consecutive",
                                postal_code: "postal_code"
                            };

                            document.getElementById("img").src = `/api/${employee.upload_signature}`;
                            const execution_period_pdf = document.getElementById("execution_period_pdf");
                            const end_execution_pdf = document.getElementById("end_execution_pdf");

                            execution_period_pdf.innerHTML = execution_period;
                            end_execution_pdf.innerHTML = end_execution;

                            for (const [elementId, property] of Object.entries(elementIds)) {
                                document.getElementById(elementId).innerHTML =
                                    employee[property];
                            }
                           

                            let consecutive = employee['consecutive'] + 1
                            document.getElementById("consecutive").innerHTML = consecutive;
                          
                         
                            const html =
                                document.querySelector(
                                    "#html_see_employee"
                                ).innerHTML;

                            const options = {
                                filename: `${employee.identification_number}.pdf`,
                                margin: [10, 10, 10, 10],
                                image: { type: "jpeg", quality: 5 },
                                html2canvas: {
                                    dpi: 600,
                                    letterRendering: true,
                                },
                                jsPDF: {
                                    unit: "mm",
                                    format: "a4",
                                    orientation: "portrait",
                                },
                            };
                            html2pdf()
                                .from(html)
                                .set(options)
                                .output("blob")
                                .then((pdfBlob) => {
                                    const formData = new FormData();
                                    formData.append(
                                        "name_pdf",
                                        pdfBlob,
                                        options.filename
                                    );
                                    formData.append("employee_id", employee.id);
                                    formData.append(
                                        "execution_period",
                                        execution_period
                                    );
                                    formData.append(
                                        "end_of_execution_period",
                                        end_execution
                                    );
                                    formData.append(
                                        "number_collection_account",
                                        consecutive
                                    );

                                    //Enviar solicitud POST
                                    this.isLoading = true;

                                    Promise.all([
                                        this.$axios
                                            .post(
                                                `/api/uploadCollectionAccount/${year}/${month}`,
                                                formData,
                                                {
                                                    headers: {
                                                        "Content-Type":
                                                            "multipart/form-data",
                                                        Authorization: `Bearer ${localStorage.TokenAccess}`,
                                                    },
                                                }
                                            )
                                            .catch((error) => {
                                                console.error(error);
                                            }),
                
                                        this.$axios.post(
                                            "/api/addHistory",
                                            {
                                                username: localStorage.nameUser,
                                                action: "generated",
                                                description: `The administrator generates a collection account ${employee.name}`,
                                            },
                                            {
                                                headers: {
                                                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                                                },
                                            }
                                        ),
                                    ]).finally(() => {
                                        this.isLoading = false;
                                        location.reload();
                                    });
                                });
                        });
                    }
                } else {
                    return Swal.fire(
                        "Error!",
                        "Cannot generate a past collection account!",
                        "warning"
                    );
                }
            } catch (error) {
                console.error("Se produjo un error:", error.message);
            }
        },
    },
};
</script>
