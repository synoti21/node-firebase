import {FirebaseOptions, FirebaseApp, initializeApp} from "firebase/app";
import {getFirestore, getDocs, getDoc, addDoc,doc, Firestore, collection} from "firebase/firestore";
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

    const NEW_DATA_JSON = {
        "title" : NEW_DATA.title,
        "context" : NEW_DATA.context,
        "writer" : NEW_DATA.writer,
        "date" : NEW_DATA.date,
        "tag" : NEW_DATA.tag
    }

    const docSnap = await addDoc(collection(firebaseDB, collectionName), NEW_DATA_JSON);
    console.log(docSnap.id)
    return docSnap.id
}

export const getPost = async (collectionName: string) => {
    let postArr : Array<string> = [];

    try{
        const querySnapshot = await getDocs(collection(firebaseDB, collectionName));
        querySnapshot.forEach((doc) => {
            postArr.push(doc.id);
        })
        console.log(postArr)
        return postArr

    }catch(e){
        console.log("no collection name");
        return postArr
    }

}

export const getPostData = async (collectionName: string, documentId: string) => {
    const docSnap = await getDoc(doc(firebaseDB, collectionName, documentId));
    if(docSnap.exists()){
        console.log(docSnap.data())
        return docSnap.data();
    }
}

