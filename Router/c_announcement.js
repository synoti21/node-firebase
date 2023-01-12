"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const firestore_1 = require("firebase/firestore");
const express_1 = __importDefault(require("express"));
const announcementRouter = express_1.default.Router();
const firebase = require("../firebase_config/db");
const firebaseDB = firebase.firestore();
const documentCollection = (0, firestore_1.collection)(firebaseDB, "Announcement");
announcementRouter.post("/addPost", (req, res) => __awaiter(void 0, void 0, void 0, function* () {
    const NEW_DOCUMENT = {
        title: req.body.title,
        context: req.body.context,
        writer: req.body.writer,
        date: req.body.date,
        tag: req.body.tag
    };
    yield (0, firestore_1.addDoc)(documentCollection, NEW_DOCUMENT);
}));
exports.default = announcementRouter;
