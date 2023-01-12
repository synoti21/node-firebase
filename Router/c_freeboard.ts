import express, {Request, Response} from "express";
import * as FirebaseUtil from "../Util/firebaseUtil";
import {documentBody} from "../Util/dataInterface";

const freeboardRouter = express.Router();

freeboardRouter.get("/",async(req:Request,res:Response) => {
    res.send("FreeBoard");
})
freeboardRouter.get("/getPostData", async (req: Request, res: Response) => {
    const DOCUMENT_ID = req.query.DOCUMENT_ID;
    if(DOCUMENT_ID == undefined){
        res.send("no document id");
    }else{
        let dataBody = await FirebaseUtil.getPostData("FreeBoard",DOCUMENT_ID.toString());
        res.send(dataBody);
    }
})

freeboardRouter.post("/getPostList", async (req: Request, res: Response) => {
    const postArr = await FirebaseUtil.getPost("FreeBoard");
    res.send({postArr: postArr, postNumber: postArr.length});
})
freeboardRouter.post("/addPost", async (req: Request, res: Response) => {
    const NEW_DOCUMENT: documentBody = {
        title: req.body.title,
        context: req.body.context,
        writer: req.body.writer,
        date: req.body.date,
        tag: req.body.tag
    }
    const docId = await FirebaseUtil.addPost("FreeBoard", NEW_DOCUMENT);
    res.send(docId);
})

export default freeboardRouter;

