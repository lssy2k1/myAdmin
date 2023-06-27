const firebaseModule = (function () {
    async function init() {
        // Your web app's Firebase configuration
        if ('serviceWorker' in navigator) {
            window.addEventListener('load', function() {
                navigator.serviceWorker.register('/firebase-messaging-sw.js')
                    .then(registration => {
                        var firebaseConfig = {
                            apiKey: "AIzaSyAR7ByOlaA06JQcMcFrD28jruD2fubCpGY",
                            authDomain: "skilled-torus-389700.firebaseapp.com",
                            projectId: "skilled-torus-389700",
                            storageBucket: "skilled-torus-389700.appspot.com",
                            messagingSenderId: "91308184669",
                            appId: "1:91308184669:web:caeba5aa9dc362c7ace9b4"
                        };
                        // Initialize Firebase
                        console.log("==========================================initialize firebase");
                        firebase.initializeApp(firebaseConfig);


                        // Show Notificaiton Dialog
                        const messaging = firebase.messaging();
                        messaging.requestPermission()
                            .then(function() {
                                return messaging.getToken();
                            })
                            .then(async function(token) {
                                await fetch('/register', { method: 'post', body: token })
                                console.log(token);
                                messaging.onMessage(payload => {
                                    const title = payload.notification.title
                                    const options = {
                                        body : payload.notification.body
                                    }
                                    navigator.serviceWorker.ready.then(registration => {
                                        registration.showNotification(title, options);
                                    })
                                })
                            })
                            .catch(function(err) {
                                console.log("Error Occured");
                            })
                    })
            })
        }
    }

    return {
        init: function () {
            init()
        }
    }
})()

firebaseModule.init()