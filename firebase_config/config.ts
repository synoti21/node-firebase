import {FirebaseOptions} from "firebase/app";
import dotenv from "dotenv";

dotenv.config();

const firebaseConfig: FirebaseOptions = {
    apiKey : process.env.DB_API_KEY,
    authDomain : process.env.DB_AUTH_DOMAIN,
    projectId : process.env.DB_PROJECT_ID,
    appId : process.env.DB_APP_ID
}

module.exports(firebaseConfig);

