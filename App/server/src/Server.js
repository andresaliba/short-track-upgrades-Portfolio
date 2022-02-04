require("dotenv").config();
const { connect } = require("../config/db");
const jwt = require("jsonwebtoken");
const cors = require("cors");
const express = require("express");
const User = require("../models/user");
const mongoose = require("mongoose");
const { registerUser, loginUser } = require("./userAdmin.js");

const app = express();

app.use(express.json());

app.use(cors());

connect();

// Register a new user
// TODO - add validation
app.post("/api/register", async (req, res) => {
  await registerUser(req, res);
});

// Login a user
// TODO - add validation
app.post("/api/login", async (req, res) => {
  await loginUser(req, res);
});

// API Token Test
app.get("/api/token-test", async (req, res) => {
  try {
    // Get the token from the header
    const token = req.headers.authorization.split(" ")[1];

    // If there is no token, return an error
    if (!token) {
      res.status(401).json({
        success: false,
        message: "No token provided",
      });
    }

    // Verify the token
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    const { user_id } = decoded;
    User.findOne({ _id: user_id }, (err, user) => {
      if (err) {
        console.log("Error finding user");
        console.error(err);
        res.status(500).json({
          success: false,
          message: "Server error",
        });
      }
      console.log(user);
      res.status(200).json({
        success: true,
        message: "Token verified",
      });
    });
  } catch (err) {
    console.log("Error decoding token");
    console.error(err);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
});

app.listen(8000, async () => {
  console.log("Listening on port: " + 8000);
});

process.on("SIGINT", () => {
  mongoose.connection.close(() => {
    console.log("Mongoose connection disconnected through app termination");
    process.exit(0);
  });
});
