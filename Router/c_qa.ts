import express, {Request, Response} from "express";
import * as FirebaseUtil from "../Util/firebaseUtil";
import {documentBody} from "../Util/dataInterface";

const qaRouter = express.Router();

qaRouter.get("/",async(req:Request,res:Response) => {
    res.send("Q&A");
})
qaRouter.get("/getPostData", async (req: Request, res: Response) => {
    const DOCUMENT_ID = req.query.DOCUMENT_ID;
    if(DOCUMENT_ID == undefined){
        res.send("no document id");
    }else{
        let dataBody = await FirebaseUtil.getPostData("Q&A",DOCUMENT_ID.toString());
        res.send(dataBody);
    }
})

qaRouter.post("/getPostList", async (req: Request, res: Response) => {
    const postArr = await FirebaseUtil.getPost("Q&A");
    res.send({postArr: postArr, postNumber: postArr.length});
})
qaRouter.post("/addPost", async (req: Request, res: Response) => {
    const NEW_DOCUMENT: documentBody = {
        title: req.body.title,
        context: req.body.context,
        writer: req.body.writer,
        date: req.body.date,
        tag: req.body.tag
    }
    const docId = await FirebaseUtil.addPost("Q&A", NEW_DOCUMENT);
    res.send(docId);
})

export default qaRouter;

