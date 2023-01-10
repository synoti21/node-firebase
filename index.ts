import express, {Request, Response} from "express";

const app = express();


app.use(express.json());
app.use(express.urlencoded());

app.get("/'", (req: Request, res: Response) => {
    res.send("hello");
})

app.listen(8080, () => {
    console.log("Server is running");
})