<template>
    <div class="card">
        <div class="card-header pb-0">
            <div class="row">
                <div class="col-lg-6 col-7">
                    <h6>My registered users</h6>
                    <p class="text-sm mb-0">
                        <i class="fa fa-check text-info" aria-hidden="true"></i>
                        <span class="font-weight-bold ms-1">Employees</span>
                        registered
                    </p>
                </div>
                <div class="col-lg-6 col-5 my-auto text-end">
                    <div class="dropdown float-lg-end pe-4">
                        <a
                            class="cursor-pointer text-sm mb-0"
                            id="dropdownTable"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                        >
                            <span class="mySpanAddEmployee"
                                >See all employees</span
                            >
                            <i
                                class="fa fa-plus-circle text-secondary"
                                aria-hidden="true"
                            ></i>
                        </a>
                        <!-- <ul
                            class="dropdown-menu px-2 py-3 ms-sm-n4 ms-n5"
                            aria-labelledby="dropdownTable"
                        >
                            <li>
                                <a
                                    class="dropdown-item border-radius-md"
                                    href="javascript:;"
                                    >Add employee</a
                                >
                            </li>
                        </ul> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body px-0 pb-2">
            <div class="table-responsive">
                <table class="table align-items-center mb-0">
                    <thead>
                        <tr>
                            <th
                                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                            >
                                Email
                            </th>
                            <th
                                class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2"
                            >
                                Name
                            </th>
                            <th
                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                            >
                                City
                            </th>
                            <th
                                class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"
                            >
                               Payment date
                            </th>
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
                                            {{ emp.email }}
                                        </h6>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle text-sm">
                                <span class="text-xs font-weight-bold">
                                    {{ emp.name }}
                                </span>
                            </td>
                            <td class="text-center ">
                                <span class="text-xs font-weight-bold">{{emp.city}}</span>
                            </td>
                              <td class="text-center ">
                                <span class="text-xs font-weight-bold">{{this.$formatedDate(emp.created_collection_account)}}</span>
                            </td>
                            
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</template>

<style>
.mySpanAddEmployee {
    font-weight: 600;
    margin-right: 5px;
}
</style>

<script>
export default {
    data() {
        return {
            employee: [],
        };
    },
    mounted() {
        this.$axios
            .get("/api/employeeAllRegistered", {
                headers: {
                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                },
            })
            .then((response) => {
                this.employee = response.data;
            });
    },
};
</script>
