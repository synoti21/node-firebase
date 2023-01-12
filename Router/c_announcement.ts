import express, {Request, Response} from "express";
import * as FirebaseUtil from "../Util/firebaseUtil";
import {documentBody} from "../Util/dataInterface";

const announcementRouter = express.Router();

announcementRouter.get("/",async(req:Request,res:Response) => {
    res.send("announcement");
})
announcementRouter.get("/getPostData", async (req: Request, res: Response) => {

})
announcementRouter.post("/addPost", async (req: Request, res: Response) => {
    const NEW_DOCUMENT: documentBody = {
        title: req.body.title,
        context: req.body.context,
        writer: req.body.writer,
        date: req.body.date,
        tag: req.body.tag
    }
    const docId = FirebaseUtil.addPost("Announcement", NEW_DOCUMENT);

    res.send(docId);
})

export default announcementRouter;

