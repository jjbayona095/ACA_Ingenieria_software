import Login from './components/login/login.vue';
import Home from './components/dashboard/home.vue';
import Employee from './components/dashboard/employee.vue';
import Management from './components/dashboard/management.vue';
import Report from './components/dashboard/report.vue';


export default {
    routes: [
        {
            path: "/",
            component: Login,
            name: "User authentication",
            meta: {
                title: "Log in"
            },
        },
        {
            path: "/api/logout",
            name: "logout"
        },
        {
            path: "/dashboard/home",
            component: Home,
            name: "home",
            meta: {
                title: "Control panel home"
            },
        },
        {
            path: "/dashboard/employee",
            component: Employee,
            name: "employee",
            meta: {
                title: "Control panel employee"
            },
        },
        {
            path: "/dashboard/management",
            component: Management,
            name: "management",
            meta: {
                title: "Control panel management"
            },
        },
        {
            path: "/dashboard/report",
            component: Report,
            name: "report",
            meta: {
                title: "Control panel report"
            },
        },
        {
            path: "/api/employeeAllRegistered",  
            name: "employee registered"
        },
        {
            path: "/api/historyAllRegistered",  
            name: "history added"
        },
        {
            path: "/api/deleteEmployeed/{id}",  
            name: "delete employee"
        },
        {
            path: "/api/updateEmployee/{id}",  
            name: "delete employee"
        },
        {
            path: "/api/registerEmployee", 
            name: "register employee"
        },
        {
            path: "/api/addConcept", 
            name: "register a concept"
        },
        {
            path: "/api/addJobPosition", 
            name: "register a job positions"
        },
        {
            path: "/api/bonusEmployeed", 
            name: "generate pdf collection account"
        },
        {
            path: "/api/updateBonusEmployee", 
            name: "Edit bonus employee"
        },
        {
            path: "/api/collectionAccount/{year}/{month}", 
            name: "get collection account"
        },
        {
            path: "/api/pdf/view", 
            name: "get collection account pdf"
        },
    ]
}