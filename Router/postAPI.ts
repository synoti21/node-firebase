import {initializeApp} from "firebase/app";
import {setDoc, addDoc, doc} from "firebase/firestore";
import express, {Request, Response} from "express";


const postRouter = express.Router();
const firebaseDB = require("../firebase_config/db");

interface documentBody {
    title: String,
    context: String,
    writer: String,
    date: Number,
    tag: Array<String>
}

postRouter.post("/addPost", async (req: Request, res: Response) => {
    const NEW_DOCUMENT: documentBody = {
        title: req.body.title,
        context: req.body.context,
        writer: req.body.writer,
        date: req.body.date,
        tag: req.body.tag
    }

})