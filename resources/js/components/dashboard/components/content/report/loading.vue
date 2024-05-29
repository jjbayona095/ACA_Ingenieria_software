<template>
    <div class="overlay" v-if="show">
        <div class="modal-content">
            <div class="col-3">
                <div class="card mb-4">
                    <div class="loader"></div>
                    <span class="msjLoading"
                        >Give me a moment, making requests <span class="dot1">.</span
                        ><span class="dot2">.</span
                        ><span class="dot3">.</span></span
                    >
                </div>
            </div>
        </div>
    </div>
</template>

<style>
.loader {
    border: 16px solid #f3f3f3;
    border-top: 16px solid #3498db;
    border-radius: 50%;
    width: 70px;
    height: 70px;
    animation: spin 2s linear infinite;
    margin-bottom: 11px;
    margin-left: 123px;
    margin-top: 10px;
}
.msjLoading {
    margin-left: 16px;
    margin-bottom: 10px;
    color: rgb(24, 78, 101);
    font-weight: bold;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.dot1, .dot2, .dot3 {
  animation: dots 1.5s infinite;
  animation-delay: 0s, 0.5s, 1s;
  display: inline-block;
  opacity: 0;
}

@keyframes dots {
  0% { opacity: 0; }
  50% { opacity: 1; }
  100% { opacity: 0; }
}

@keyframes spin {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}
.overlay {
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    z-index: 9999;
}

.modal-content {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 50%;
    margin-top: 100px;
}

.container {
    margin-top: 1rem;
}
</style>

<script>
export default {
    props: {
        show: {
            type: Boolean,
            required: true,
        },
    },
};
</script>
