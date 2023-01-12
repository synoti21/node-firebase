import express, {Request, Response} from "express";
import announcementRouter from "./Router/c_announcement";
import freeboardRouter from "./Router/c_freeboard";
import qaRouter from "./Router/c_qa";

import * as FirebaseUtil from "./Util/firebaseUtil";

const app = express();

FirebaseUtil.initFirebase();

app.use(express.json());
app.use(express.urlencoded());

app.use("/announcement", announcementRouter);
app.use("/freeboard", freeboardRouter);
app.use("/qa",qaRouter);

app.get("/", (req: Request, res: Response) => {
    res.send("hello");
})


app.listen(8080, () => {
    console.log("Server is running");
})