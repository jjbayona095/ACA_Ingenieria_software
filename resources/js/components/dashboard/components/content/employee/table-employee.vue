<template>
    <div class="col-12">
        <ModalAddEmployeeComponent
            :show="showModal"
            :update="updateModal"
            :employee="updateEmployee"
            @close="closeModal"
        >
        </ModalAddEmployeeComponent>
        <div class="card mb-4">
            <div class="card-header pb-0">
                <h6>Employee table</h6>
            </div>

            <div class="my-auto text-end">
                <div class="dropdown float-lg-end pe-4">
                    <a
                        class="cursor-pointer text-sm mb-0"
                        id="dropdownTable"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                    >
                        <span class="mySpanAddEmployee"
                            >Option add employee</span
                        >
                        <i
                            class="fa fa-plus-circle text-secondary"
                            aria-hidden="true"
                        ></i>
                    </a>
                    <ul
                        class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5"
                        aria-labelledby="dropdownTable"
                    >
                        <li>
                            <a
                                class="dropdown-item border-radius-md"
                                href="javascript:;"
                                @click="showModal = true"
                                >Add employee</a
                            >
                        </li>
                    </ul>
                </div>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
                <div class="table-responsive p-0">
                    <table class="table align-items-center mb-0">
                        <thead>
                            <tr>
                                <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                >
                                    Employee
                                </th>
                                <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                >
                                    CC
                                </th>
                                <th
                                    class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                                >
                                    Function
                                </th>
                                <th
                                    class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                >
                                    Status
                                </th>
                                <th
                                    class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                >
                                    Address
                                </th>
                                <th
                                    class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                                >
                                    City
                                </th>
                                <th class="text-secondary opacity-7"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="emp in employee" :key="emp.id">
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div
                                            class="d-flex flex-column justify-content-center"
                                        >
                                            <h6 class="mb-0 text-sm">
                                                {{ emp.name }}
                                            </h6>
                                            <p
                                                class="text-xs text-secondary mb-0"
                                            >
                                                {{ emp.email }}
                                            </p>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <p class="text-xs text-secondary mb-0">
                                        {{ emp.identification_number }}
                                    </p>
                                </td>
                                <td>
                                    <p class="text-xs font-weight-bold mb-0">
                                        {{ emp.employment }}
                                    </p>
                                    <p class="text-xs text-secondary mb-0">
                                        Job Position
                                    </p>
                                </td>
                                <td class="align-middle text-center text-sm">
                                    <span
                                        class="badge badge-sm bg-gradient-success"
                                        >Active</span
                                    >
                                </td>
                                <td class="align-middle text-center">
                                    <span
                                        class="text-secondary text-xs font-weight-bold"
                                        >{{ emp.address }}</span
                                    >
                                </td>
                                <td class="align-middle text-center">
                                    <span
                                        class="text-secondary text-xs font-weight-bold"
                                        >{{ emp.city }}</span
                                    >
                                </td>
                                <td class="align-middle">
                                    <a
                                        href="javascript:;"
                                        class="fa fa-pencil-square-o m-1"
                                        data-toggle="tooltip"
                                        data-original-title="Edit user"
                                        @click="updateEmployeeModal(emp)"
                                    >
                                    </a>
                                    <a
                                        href="javascript:;"
                                        class="fa fa-money m-1"
                                        data-toggle="tooltip"
                                        data-original-title="Edit user"
                                        @click="updateModalBonus(emp)"
                                    >
                                    </a>
                                    <a
                                        href="javascript:;"
                                        class="fa fa-eye m-1"
                                        data-toggle="tooltip"
                                        data-original-title="See employee"
                                        @click="generarPDF(emp)"
                                    >
                                    </a>
                                    <a
                                        href="javascript:;"
                                        class="fa fa-trash m-1"
                                        data-toggle="tooltip"
                                        data-original-title="Delete user"
                                        @click="
                                            {
                                                {
                                                    deleteEmployee(emp);
                                                }
                                            }
                                        "
                                    >
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <ComponentPDF></ComponentPDF>
                </div>
            </div>
        </div>
    </div>
</template>

<style>
.html-a-convertir {
    display: flex;
    justify-content: center;
    flex-direction: column;
    width: 750px;
    margin: 0 auto;
}
</style>
<script>
import ComponentPDF from "./see-employee-pdf.vue";
import ModalAddEmployeeComponent from "./modal-add-employee.vue";
import html2pdf from "html2pdf.js";
import Swal from "sweetalert2";

export default {
    components: {
        ComponentPDF,
        ModalAddEmployeeComponent,
    },
    data() {
        return {
            showModal: false,
            updateModal: false,
            updateEmployee: [],
            employee: [],
        };
    },
    async mounted() {
        this.updateList();
    },
    methods: {
        updateEmployeeModal(emp) {
            this.updateModal = true;
            this.updateEmployee = emp;
        },
        updateModalBonus(emp) {
            Swal.fire({
                title: `Enter the bonus to the employee ${emp.name}`,
                input: "text",
                inputPlaceholder: "$0.00",
                showCancelButton: true,
                confirmButtonText: "Add bonus",
                showLoaderOnConfirm: true,
                inputAttributes: {
                    "aria-label": "Bonus amount",
                },
                preConfirm: (inputValue) => {
                    const enteredValue = parseFloat(
                        inputValue.replace(/[$,]/g, "")
                    );
                    console.log("Entered Value:", enteredValue);
                },
            }).then(async (result) => {
                if (result.isConfirmed) {
                    const value = "$" + Number(result.value).toLocaleString();
                    const formData = new FormData();
                    formData.append("bonus", value);
                    await Promise.all([
                        this.$axios.post(
                            "/api/addHistory",
                            {
                                username: localStorage.nameUser,
                                action: "updated",
                                description: `The administrator added a bonus to an employee ${emp.name}`,
                            },
                            {
                                headers: {
                                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                                },
                            }
                        ),
                        this.$axios.post(
                            `/api/bonusEmployeed/${emp.id}/${value}`,
                            formData,
                            {
                                headers: {
                                    "Content-Type": "multipart/form-data",
                                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                                },
                            }
                        ),
                    ])
                        .then(() => {
                            Swal.fire(
                                `Bonus added at employee! ${emp.name}`,
                                `You added a bonus of ${value}`,
                                "success"
                            );
                        })
                        .finally(async () => {
                            this.updateList();
                        });
                }
            });
        },
        computedPDF(employee) {
            this.$dateNow();
            const elementIds = {
                name: "name",
                cc: "identification_number",
                phone: "phone_number",
                email: "email",
                address: "address",
                city: "city",
                postal_code: "postal_code",
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
            };

            document.getElementById(
                "img"
            ).src = `/api/${employee.upload_signature}`;
            // Obtener la fecha actual
            for (const [elementId, property] of Object.entries(elementIds)) {
                document.getElementById(elementId).innerHTML =
                    employee[property];
            }
        },

        generarPDF(employee) {
            this.computedPDF(employee);
            const html = document.querySelector("#html_see_employee").innerHTML;
            const options = {
                filename: `${employee.name}_${employee.identification_number}.pdf`,
                margin: [10, 10, 10, 10],
                html2canvas: { scale: 2 }, // Adjust scale as needed
                jsPDF: { unit: "mm", format: "a4", orientation: "portrait" },
            };

            html2pdf().from(html).set(options).output("dataurlnewwindow");
        },

        async deleteEmployee(employee) {
            Swal.fire({
                title: "Are you sure delete this employee?",
                showDenyButton: true,
                confirmButtonText: "Delete",
                confirmButtonColor: "#F13F1B",
                denyButtonText: `Cancel`,
                denyButtonColor: "#CAC0BE",
            }).then(async (result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    await Promise.all([
                        this.$axios.post(
                            "/api/addHistory",
                            {
                                username: localStorage.nameUser,
                                action: "delete",
                                description: `The administrator delete a employee ${employee.name}`,
                            },
                            {
                                headers: {
                                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                                },
                            }
                        ),
                        this.$axios.delete(
                            `/api/deleteEmployeed/${employee.id}`,
                            {
                                headers: {
                                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                                },
                            }
                        ),
                    ]).then(() => {
                        this.updateList();
                    });
                    Swal.fire("Delete!", "", "success");
                } else if (result.isDenied) {
                    Swal.fire("Changes are not saved", "", "info");
                }
            });
        },
        closeModal() {
            this.showModal = false;
            this.updateModal = false;
            this.updateEmployee = [];
        },

        async updateList() {
            await this.$axios
                .get("/api/employeeAllRegistered", {
                    headers: {
                        Authorization: `Bearer ${localStorage.TokenAccess}`,
                    },
                })
                .then((response) => {
                    this.employee = response.data;
                });
        },
    },

    computed: {
        formattedEmployment(string) {
            return string.charAt(0).toUpperCase() + string.slice(1);
        },
    },
};
</script>
