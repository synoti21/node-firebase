import express, {Request, Response} from "express";
import announcementRouter from "./Router/c_announcement";
import * as FirebaseUtil from "./Util/firebaseUtil";

const app = express();

FirebaseUtil.initFirebase();

app.use(express.json());
app.use(express.urlencoded());

app.use("/announcement", announcementRouter);

app.get("/", (req: Request, res: Response) => {
    res.send("hello");
})

app.post("/", (req: Request, res: Response) => {
    res.send("hello");
})

app.listen(8080, () => {
    console.log("Server is running");
})