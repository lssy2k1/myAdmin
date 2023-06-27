importScripts('https://www.gstatic.com/firebasejs/9.2.0/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/9.2.0/firebase-messaging.js');

firebase.initializeApp({
    messagingSenderId: "91308184669"
});

const messaging = firebase.messaging()