require("dotenv").config();
const mongoose = require("mongoose");

const MONGO_URL = "mongodb://mongo:27017/test";

const connect = async () =>
  await mongoose
    .connect(MONGO_URL, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    })
    .then(() => {
      console.log("MongoDB connected");
    })
    .catch((error) => {
      console.log("MongoDB connection error");
      console.error(error);
      process.exit(1);
    });

module.exports = { connect };
