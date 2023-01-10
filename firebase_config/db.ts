import {FirebaseApp, initializeApp} from "firebase/app";
import {Firestore, getFirestore} from "firebase/firestore";

const firebaseConfig = require("./config");


let firebaseApp : FirebaseApp = initializeApp(firebaseConfig);
let firebaseDB : Firestore = getFirestore();

module.exports(firebaseDB);

