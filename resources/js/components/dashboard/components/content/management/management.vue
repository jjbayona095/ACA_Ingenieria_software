<template>
    <div class="row">
        <div class="col-md-7 mt-4">
            <div class="card">
                <div class="card-header pb-0 px-3">
                    <h6 class="mb-0">Concept list</h6>
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
                                >Management concept</span
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
                                    @click="addConcept()"
                                    >Add a concept</a
                                >
                            </li>
                        </ul>
                    </div>
                </div>
                <div
                    class="overflow-hidden position-relative border-radius-xl mt-3"
                    style="max-height: 400px; overflow-y: auto"
                >
                    <div class="card-body card-scroll-h pt-4 p-3">
                        <ul class="list-group">
                            <li
                                v-for="concept in filteredConcepts"
                                :key="concept.id"
                                class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg"
                            >
                                <div class="d-flex flex-column">
                                    <h6 class="mb-3 text-sm">Management</h6>
                                    <span class="mb-2 text-xs"
                                        >Concept description:
                                        <span
                                            class="text-dark font-weight-bold ms-sm-2"
                                            >{{ concept.description }}</span
                                        ></span
                                    >
                                </div>
                                <div class="ms-auto text-end">
                                    <a
                                        class="btn btn-link text-danger text-gradient px-3 mb-0"
                                        href="javascript:;"
                                        @click="
                                            deleteManagement(
                                                concept.id,
                                                'concept'
                                            )
                                        "
                                        ><i
                                            class="far fa-trash-alt me-2"
                                            aria-hidden="true"
                                        ></i
                                        >Delete</a
                                    >
                                    <a
                                        class="btn btn-link text-dark px-3 mb-0"
                                        href="javascript:;"
                                        @click="editConcept(concept.description, concept.id)"
                                        ><i
                                            class="fas fa-pencil-alt text-dark me-2"
                                            aria-hidden="true"
                                        ></i
                                        >Edit</a
                                    >
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-5 mt-4">
            <div class="card h-100 mb-4">
                <div class="card-header pb-0 px-3">
                    <div class="row">
                        <div class="col-md-6">
                            <h6 class="mb-0">Job positions</h6>
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
                                        >Management Job positions</span
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
                                            @click="addJobPositions()"
                                            >Add a job position</a
                                        >
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body card-scroll-h pt-4 p-3">
                    <h6
                        class="text-uppercase text-body text-xs font-weight-bolder mb-3"
                    >
                        List position
                    </h6>
                    <ul class="list-group">
                        <li
                            v-for="jobPosition in filteredJobPositions"
                            :key="jobPosition.id"
                            class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg"
                        >
                            <div class="d-flex align-items-center">
                                <button
                                    class="btn btn-icon-only btn-rounded btn-outline-success mb-0 me-3 btn-sm d-flex align-items-center justify-content-center"
                                >
                                    <i
                                        class="fas fa-arrow-up"
                                        aria-hidden="true"
                                    ></i>
                                </button>
                                <div class="d-flex flex-column">
                                    <h6 class="mb-1 text-dark text-sm">
                                        {{ jobPosition.description }}
                                    </h6>
                                    <span class="text-xs">
                                        Current job title
                                    </span>
                                </div>
                            </div>
                            <div
                                class="d-flex align-items-center text-success text-gradient text-sm font-weight-bold"
                            >
                                <a
                                    class="btn btn-link text-danger text-gradient px-3 mb-0"
                                    href="javascript:;"
                                    @click="
                                        deleteManagement(jobPosition.id, 'jobs')
                                    "
                                    ><i
                                        class="far fa-trash-alt me-2"
                                        aria-hidden="true"
                                    ></i
                                    >Delete</a
                                >
                            </div>
                        </li>
                    </ul>
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
import Swal from "sweetalert2";
export default {
    data() {
        return {
            dataConcept: [],
            dataJobPosition: [],
        };
    },
    mounted() {
        this.getConcept();
        this.getJobsPosition();
    },

    methods: {
        async getAxios(route) {
            const response = await this.$axios.get(`/api/${route}`, {
                headers: {
                    Authorization: `Bearer ${localStorage.TokenAccess}`,
                },
            });

            return response.data;
        },

        postAxios(route, text, id = null) {
            this.$axios
                .post(
                    `/api/${route}`,
                    {
                        description: text,
                        id: id
                    },
                    {
                        headers: {
                            Authorization: `Bearer ${localStorage.TokenAccess}`,
                        },
                    }
                );
        },

        deleteAxios(route, id, who) {
            this.$axios
                .post(
                    `/api/${route}`,
                    {
                        id: id,
                        who: who
                    },
                    {
                        headers: {
                            Authorization: `Bearer ${localStorage.TokenAccess}`,
                        },
                    }
                );
                this.getConcept();
                this.getJobsPosition();
        },



        async addConcept() {
            const { value: text } = await Swal.fire({
                input: "textarea",
                inputLabel: "Concept descriptions",
                inputPlaceholder: "Type your concept here...",
                inputAttributes: {
                    "aria-label": "Type your concept here",
                },
                showCancelButton: true,
            });

            if (text) {
                this.postAxios("addConcept", text);
                this.getConcept();
                Swal.fire(text);
            }
            location.reload()
        },

        async editConcept(concept, id){
              const { value: text } = await Swal.fire({
                input: "textarea",
                inputLabel: "Concept descriptions edit",
                inputPlaceholder: concept,
                inputAttributes: {
                    "aria-label": "edit your concept here",
                },
                showCancelButton: true,
            });

            if (text) {
                console.log(text, id)
                this.postAxios("editConcept", text, id);
                this.getConcept();
                Swal.fire(text);
            }
            // location.reload()

        },

        getConcept() {
            this.getAxios("getConcept").then((dataConcept) => {
                this.dataConcept = dataConcept;
            });
        },



        getJobsPosition() {
            this.getAxios("getJob").then((dataJobPosition) => {
                this.dataJobPosition = dataJobPosition;
            });
        },

        deleteManagement(id, who) {
            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!",
            }).then((result) => {
                if (result.isConfirmed) {
                    if(who == "concept") {
                        this.deleteAxios('deleteConcept', id, 'concept');
                    } else {
                        this.deleteAxios('deleteConcept', id, 'jobs');
                    }
                    Swal.fire(
                        "Deleted!",
                        "Your file has been deleted.",
                        "success"
                    );
                    location.reload()
                }
            });
        },

        async addJobPositions() {
            const { value: text } = await Swal.fire({
                input: "text",
                inputLabel: "Job position",
                inputPlaceholder: "Enter the job position",
            });

            if (text) {
                this.postAxios("addJobPosition", text);
                this.getJobsPosition();
                Swal.fire(`Job position added: ${text}`);
            }
            location.reload()
        },
    },

    computed: {
        filteredConcepts() {
            return this.dataConcept.filter((concept) => concept.state === 1);
        },
        filteredJobPositions() {
            return this.dataJobPosition.filter(
                (concept) => concept.state === 1
            );
        },
    },
};
</script>
