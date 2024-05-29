<template>
    <div
        class="at-custom-side-wrapper addthis-smartlayers addthis-smartlayers-desktop"
        aria-labelledby="at-custom-sidebar-label"
        role="region"
        :style="sideNavStyles"
    >
        <div
            id="at-custom-sidebar"
            class="at-custom-sidebar atss-left addthis-animated slideInLeft"
            style="background-color: rgb(255, 255, 255)"
        >
            <div class="at-custom-sidebar-label at4-hide">AddThis Sharing</div>
            <div class="at-custom-sidebar-btns">
                <a
                    href="#"
                    role="button"
                    tabindex="0"
                    title="Facebook"
                    class="fas fa-home"
                    @click.prevent="handleLinkClick('home')"
                    style="line-height: 50px; height: 34px; width: 30px"
                >
                </a>
                <a
                    href="#"
                    role="button"
                    tabindex="0"
                    title="Twitter"
                    class="fas fa-address-card"
                    @click.prevent="handleLinkClick('employee')"
                    style="line-height: 50px; height: 34px; width: 30px"
                ></a
                ><a
                    href="#"
                    role="button"
                    tabindex="0"
                    title="LinkedIn"
                    class="fas fa-file"
                    @click.prevent="handleLinkClick('report')"
                    style="line-height: 50px; height: 50px; width: 30px"
                    ></a>
                <!-- <a
                    href="#"
                    role="button"
                    tabindex="0"
                    title="More"
                    class="at-share-btn at-svc-compact"
                    ><span
                        class="at-icon-wrapper"
                        style="
                            background-color: rgb(255, 255, 255);
                            line-height: 50px;
                            height: 50px;
                            width: 50px;
                            border-radius: 0%;
                        "
                        ><svg
                            xmlns="http://www.w3.org/2000/svg"
                            xmlns:xlink="http://www.w3.org/1999/xlink"
                            viewBox="0 0 32 32"
                            version="1.1"
                            role="img"
                            aria-labelledby="at-svg-addthis-7"
                            title="More"
                            alt="More"
                            class="at-icon at-icon-addthis"
                            style="
                                fill: rgb(50 68 99);
                                width: 32px;
                                height: 32px;
                            "
                        >
                            <title id="at-svg-addthis-7">AddThis</title>
                            <g>
                                <path
                                    d="M18 14V8h-4v6H8v4h6v6h4v-6h6v-4h-6z"
                                    fill-rule="evenodd"
                                ></path>
                            </g>
                        </svg> </span
                ></a> -->

                <div
                    class="at-custom-sidebar-counter"
                    style="width: 50px; overflow-wrap: break-word"
                ></div>
            </div>
        </div>
    </div>
</template>

<style>
#at-custom-sidebar {
    top: 36% !important;
    bottom: auto;
}
.atss-left {
    float: right;
    right: -1px;
}

.slideInLeft {
    animation-name: slideInLeft;
}

.addthis-animated {
    animation-fill-mode: both;
    animation-timing-function: ease-out;
    animation-duration: 0.3s;
}

.at-custom-sidebar {
    top: 20%;
    width: 58px;
    position: fixed;
    text-align: center;
    z-index: 100020;
    background: #fff;
    overflow: hidden;
    box-shadow: 0 0 10px 0 rgb(0 0 0 / 20%);
    font: initial;
    line-height: normal;
    top: auto;
    bottom: 0;
}

.at4-hide {
    display: none !important;
    opacity: 0 !important;
}

.at-custom-sidebar .at-custom-sidebar-btns {
    display: inline-block;
    text-align: center;
    padding-top: 4px;
}
</style>

<script>
export default {
    data() {
        return {
            screenWidth: window.innerWidth,
        };
    },
    computed: {
        sideNavStyles() {
            if (this.screenWidth > 1200) {
                return {
                    display: "none",
                };
            } else {
                return {};
            }
        },
    },
    mounted() {
        window.addEventListener("resize", this.updateScreenWidth);
    },
    beforeDestroy() {
        window.removeEventListener("resize", this.updateScreenWidth);
    },
    methods: {
        updateScreenWidth() {
            this.screenWidth = window.innerWidth;
        },
        handleLinkClick(term) {
            switch (term) {
                case "home":
                    this.$router.push("/dashboard/home").then(() => {
                        location.reload();
                    });
                    break;
                case "employee":
                    this.$router.push("/dashboard/employee").then(() => {
                        location.reload();
                    });
                    break;
                case "report":
                    this.$router.push("/dashboard/report").then(() => {
                        location.reload();
                    });
                    break;

                default:
                    break;
            }
        },
    },
};
</script>
