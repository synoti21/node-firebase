import {FirebaseOptions, FirebaseApp, initializeApp} from "firebase/app";
import {getFirestore, setDoc, addDoc, Firestore, collection} from "firebase/firestore";
import {documentBody} from "./dataInterface";

import dotenv from "dotenv";

dotenv.config();

const firebaseConfig: FirebaseOptions = {
    apiKey : process.env.FB_API_KEY,
    authDomain : process.env.FB_AUTH_DOMAIN,
    projectId : process.env.FB_PROJECT_ID,
    appId : process.env.FB_APP_ID
}

let firebaseApp : FirebaseApp;
let firebaseDB : Firestore;
export const initFirebase = () => {
    firebaseApp = initializeApp(firebaseConfig);
    firebaseDB = getFirestore();
}


export const addPost =  async (collectionName: string, NEW_DATA: documentBody) => {

    const collectionRef = collection(firebaseDB, collectionName);

    const NEW_DATA_JSON = {
        "title" : NEW_DATA.title,
        "context" : NEW_DATA.context,
        "writer" : NEW_DATA.writer,
        "date" : NEW_DATA.date,
        "tag" : NEW_DATA.tag
    }

    const docSnap = await addDoc(collectionRef, NEW_DATA_JSON);
    return docSnap.id;
}

export const getPost = () => {

}

export const getPostData = () => {

}

