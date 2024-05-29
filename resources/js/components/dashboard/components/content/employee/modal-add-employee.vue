<template>
    <div>
        <div class="overlay" v-if="show || update">
            <div class="modal-content-add">
                <div class="col-9">
                    <div class="card mb-4">
                        <div class="card-header pb-0">
                            <h6>
                                {{
                                    this.update
                                        ? "Update Employee"
                                        : "Add Employee"
                                }}
                            </h6>

                            <div class="my-auto text-end">
                                <div class="dropdown float-lg-end pe-4">
                                    <a
                                        class="cursor-pointer text-sm mb-0"
                                        id="dropdownTable"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false"
                                        @click="closeModal"
                                    >
                                        <i
                                            class="fa fa-times-circle text-secondary"
                                            aria-hidden="true"
                                        ></i>
                                    </a>
                                </div>
                            </div>
                            <p class="text-sm mb-0">
                                <i
                                    class="fa fa-check text-info"
                                    aria-hidden="true"
                                ></i
                                ><span class="font-weight-bold ms-1"
                                    >Record</span
                                >
                                employee data
                            </p>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="name">Full Name:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update ? employee.name : 'Name'
                                            "
                                            id="name"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="employment_position"
                                            >Employment position:</label
                                        >
                                        <select
                                            class="form-control"
                                            id="employment_position"
                                        >
                                            <option
                                                v-for="jobPosition in datJobPosition"
                                                :key="jobPosition.id"
                                                :value="jobPosition.description"
                                                :selected="
                                                    employee.employment ===
                                                    jobPosition.description
                                                "
                                            >
                                                {{ jobPosition.description }}
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="consecutive"
                                            >Consecutive:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.consecutive
                                                    : 'Consecutive'
                                            "
                                            id="consecutive"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="identification_number"
                                            >Identification number:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.identification_number
                                                    : 'Identification number'
                                            "
                                            id="identification_number"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="address">Address:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.address
                                                    : 'Housing address'
                                            "
                                            id="address"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="city">City:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.city
                                                    : 'City where you live'
                                            "
                                            id="city"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label for="address"
                                            >Postal Code:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.postal_code
                                                    : 'Code'
                                            "
                                            id="postal_code"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="phone_number"
                                            >Phone Number:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.phone_number
                                                    : 'Number'
                                            "
                                            id="phone_number"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.email
                                                    : 'Email employee'
                                            "
                                            id="email"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="concept">Concept:</label>
                                        <select
                                            class="form-control"
                                            id="concept"
                                        >
                                            <option
                                                v-for="concept in dataConcept"
                                                :key="concept.id"
                                                :value="concept.description"
                                                :selected="
                                                    employee.concept ===
                                                    concept.description
                                                "
                                            >
                                                {{ concept.description }}
                                            </option>
                                        </select>
                                        <!-- <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.concept
                                                    : 'Name concept'
                                            "
                                            id="concept"
                                        /> -->
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="value">Value:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update ? employee.value : '$0'
                                            "
                                            id="value"
                                            v-model="value"
                                            @input="formatCurrency"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="bonus">Bonus:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update ? employee.bonus : '$0'
                                            "
                                            id="bonus"
                                            v-model="bonus"
                                            @input="formatCurrency"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="discount">Discount:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.discount
                                                    : '$0'
                                            "
                                            id="discount"
                                            v-model="discount"
                                            @input="formatCurrency"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="total">Total:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update ? employee.total : '$0'
                                            "
                                            id="total"
                                            :value="formattedTotal"
                                            readonly
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="bonus">Bank:</label>
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.bank
                                                    : 'Bank name'
                                            "
                                            id="bank"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="employment_position"
                                            >Type account bank:</label
                                        >
                                        <select
                                            class="form-control"
                                            id="type_account_bank"
                                        >
                                            <option
                                                value="Corriente"
                                                :selected="
                                                    employee.type_account_bank ===
                                                    'Corriente'
                                                "
                                            >
                                                Current
                                            </option>
                                            <option
                                                value="Ahorro"
                                                :selected="
                                                    employee.type_account_bank ===
                                                    'Ahorro'
                                                "
                                            >
                                                Saving
                                            </option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="total"
                                            >Number account bank</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control"
                                            :placeholder="
                                                update
                                                    ? employee.number_account
                                                    : 'number account bank'
                                            "
                                            id="number_account"
                                        />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label for="upload_signature"
                                            >Upload signature:</label
                                        >
                                        <input
                                            type="file"
                                            name="upload_signature"
                                            class="file-input"
                                            id="upload_signature"
                                            @change="previewImage"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <img
                                            :src="
                                                update
                                                    ? `/api/${employee.upload_signature}`
                                                    : imagePreview
                                            "
                                            class="img-preview"
                                            alt="Signature preview"
                                            v-if="imagePreview || update"
                                        />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <button
                                            @click="
                                                this.update
                                                    ? updateEmployee(employee)
                                                    : registerEmployee()
                                            "
                                            class="button-22"
                                            role="button"
                                        >
                                            {{
                                                this.update
                                                    ? "Update employee"
                                                    : "Add Employee"
                                            }}
                                        </button>
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
    </div>
</template>

<style>
.overlay {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 9999;
}

.modal-content-add {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50%;
    margin-top: 170px;
    line-height: 1;
}

.container {
    margin-top: 1rem;
}

input[type="file"]::file-selector-button {
    margin-right: 15px;
    height: 40px;
    border-radius: 50%;
    padding: 10px 30px;
    border-radius: 6px;
    color: #fff;
    cursor: pointer;
    transition: background 0.2s ease-in-out;
    font-size: 0;
    border: 2px dashed #ccc;
}

input[type="file"]::file-selector-button:hover {
    border: 2px dashed #ccc;
}

/* CSS */
.button-22 {
    align-items: center;
    appearance: button;
    background-color: #0276ff;
    border-radius: 8px;
    border-style: none;
    box-shadow: rgba(255, 255, 255, 0.26) 0 1px 2px inset;
    box-sizing: border-box;
    color: #fff;
    cursor: pointer;
    display: flex;
    flex-direction: row;
    flex-shrink: 0;
    font-family: "RM Neue", sans-serif;
    font-size: 100%;
    line-height: 1.15;
    margin: 0;
    margin-top: 25px;
    margin-left: 160px;
    padding: 6px 13px;
    text-align: center;
    text-transform: none;
    transition: color 0.13s ease-in-out, background 0.13s ease-in-out,
        opacity 0.13s ease-in-out, box-shadow 0.13s ease-in-out;
    user-select: none;
    -webkit-user-select: none;
    touch-action: manipulation;
}

.button-22:active {
    background-color: #006ae8;
}

.button-22:hover {
    background-color: #1c84ff;
}

@media (min-width: 768px) {
    .button-66 {
        padding: 16px 44px;
        min-width: 150px;
    }
}

.img-preview {
    width: 40%;
}
</style>

<script>

import ComponentLoading from "../report/loading.vue";

export default {
    data() {
        return {
            imagePreview: null,
            value: "",
            bonus: "",
            discount: "",
            dataConcept: [],
            datJobPosition: [],
            isLoading: false,
        };
    },
    props: {
        show: {
            type: Boolean,
            required: true,
        },
        update: {
            type: Boolean,
            required: false,
        },
        employee: {
            type: Object,
            required: false,
        },
    },
    components: {
        ComponentLoading,
    },

    mounted() {
        this.getAxios("getConcept").then((dataConcept) => {
            this.dataConcept = dataConcept;
        });
        this.getAxios("getJob").then((dataJobs) => {
            this.datJobPosition = dataJobs;
        });
    },

    computed: {
        formattedTotal() {
            const value = this.parseCurrency(this.value);
            const bonus = this.parseCurrency(this.bonus);
            const discount = this.parseCurrency(this.discount);

            const total = value + bonus - discount;
            if (this.update && isNaN(total)) return;
            return "$" + total.toLocaleString();
        },
    },

    methods: {
        closeModal() {
            this.$emit("close");
            location.reload();
        },

        async getAxios(route) {
            const response = await this.$axios.get(`/api/${route}`, {
                headers: {
                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                },
            });

            return response.data;
        },

        formatCurrency() {
            this.value = this.value.replace(/[^\d]/g, "");
            this.bonus = this.bonus.replace(/[^\d]/g, "");
            this.discount = this.discount.replace(/[^\d]/g, "");
            this.value = "$" + Number(this.value).toLocaleString();
            this.bonus = "$" + Number(this.bonus).toLocaleString();
            this.discount = "$" + Number(this.discount).toLocaleString();
        },
        parseCurrency(value) {
            const numberValue = value.replace(/[^\d]/g, "");

            return parseFloat(numberValue);
        },
        previewImage(event) {
            const file = event.target.files[0];
            this.imagePreview = URL.createObjectURL(file);
        },

        async registerEmployee() {
            const formData = new FormData();
            formData.append("name", document.getElementById("name").value);
            formData.append(
                "employment",
                document.getElementById("employment_position").value
            );
            formData.append(
                "identification_number",
                document.getElementById("identification_number").value
            );
            formData.append(
                "address",
                document.getElementById("address").value
            );
            formData.append("city", document.getElementById("city").value);
            formData.append(
                "postal_code",
                document.getElementById("postal_code").value
            );
            formData.append(
                "phone_number",
                document.getElementById("phone_number").value
            );
            formData.append("email", document.getElementById("email").value);
            formData.append(
                "concept",
                document.getElementById("concept").value
            );
            formData.append("value", document.getElementById("value").value);
            formData.append("bonus", document.getElementById("bonus").value);
            formData.append(
                "discount",
                document.getElementById("discount").value
            );
            formData.append("total", document.getElementById("total").value);
            formData.append("bank", document.getElementById("bank").value);
            formData.append(
                "type_account_bank",
                document.getElementById("type_account_bank").value
            );
            formData.append(
                "number_account",
                document.getElementById("number_account").value
            );
            formData.append(
                "consecutive",
                document.getElementById("consecutive").value
            );
            formData.append(
                "upload_signature",
                document.getElementById("upload_signature").files[0]
            );
            formData.append("username", localStorage.nameUser);
            formData.append("action", "created");
            formData.append(
                "description_action",
                `The administrator added a new employee ${
                    document.getElementById("name").value
                }`
            );
            this.isLoading = true;
            await this.$axios
                .post("/api/registerEmployee", formData, {
                    headers: {
                        "Content-Type": "multipart/form-data",
                        Authorization: `Bearer ${localStorage.TokenAccess}`,
                    },
                })
                .then(() => {
                    this.isLoading = false;
                    location.reload();
                })
                .catch((error) => {
                    alert(error.response.data);
                });
        },

        async updateEmployee(employee) {
            const formDataUpdate = new FormData();

            const appendIfNotEmpty = (key, value) => {
                if (value !== "") {
                    formDataUpdate.append(key, value);
                }
            };

            appendIfNotEmpty("name", document.getElementById("name").value);
            appendIfNotEmpty(
                "employment",
                document.getElementById("employment_position").value
            );
            appendIfNotEmpty(
                "identification_number",
                document.getElementById("identification_number").value
            );
            appendIfNotEmpty(
                "address",
                document.getElementById("address").value
            );
            appendIfNotEmpty("city", document.getElementById("city").value);
            appendIfNotEmpty(
                "postal_code",
                document.getElementById("postal_code").value
            );
            appendIfNotEmpty(
                "phone_number",
                document.getElementById("phone_number").value
            );
            appendIfNotEmpty("email", document.getElementById("email").value);
            appendIfNotEmpty(
                "concept",
                document.getElementById("concept").value
            );
            appendIfNotEmpty("value", document.getElementById("value").value);
            appendIfNotEmpty("bonus", document.getElementById("bonus").value);
            appendIfNotEmpty(
                "discount",
                document.getElementById("discount").value
            );
            appendIfNotEmpty("total", document.getElementById("total").value);
            appendIfNotEmpty("bank", document.getElementById("bank").value);
            appendIfNotEmpty(
                "type_account_bank",
                document.getElementById("type_account_bank").value
            );
            appendIfNotEmpty(
                "number_account",
                document.getElementById("number_account").value
            );
            appendIfNotEmpty(
                "consecutive",
                document.getElementById("consecutive").value
            );

            appendIfNotEmpty(
                "upload_signature",
                document.getElementById("upload_signature").files[0] ==
                    undefined
                    ? ""
                    : document.getElementById("upload_signature").files[0]
            );

            formDataUpdate.append("username", localStorage.nameUser);
            formDataUpdate.append("action", "updated");
            formDataUpdate.append(
                "description_action",
                `The administrator updated an employee ${
                    document.getElementById("name").placeholder
                }`
            );

            await this.$axios
                .post(`/api/updateEmployee/${employee.id}`, formDataUpdate, {
                    headers: {
                        "Content-Type": "multipart/form-data",
                        Authorization: `Bearer ${localStorage.TokenAccess}`,
                    },
                })
                .then((res) => {
                    console.log(res);
                })
                .catch((error) => {
                    alert(error.response.data);
                });
        },
    },
};
</script>
