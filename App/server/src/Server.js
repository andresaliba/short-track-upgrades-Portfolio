require("dotenv").config();
const { connect } = require("../config/db");
const cors = require("cors");
const getToken = require("./tokens");
const express = require("express");
const User = require("../models/user");
const mongoose = require("mongoose");
const { registerUser, loginUser } = require("./userAdmin.js");
const { addRacer, deleteRacer, updateRacer } = require("./racerAdmin.js");
const testResponse = require("./test");

const app = express();

app.use(express.json());
app.use(getToken);
app.use(cors());

// Register a new user
// TODO - add validation
app.post("/api/register", async (req, res) => {
  await connect();
  await registerUser(req, res);
  mongoose.connection.close();
});

// Login a user
// TODO - add validation
app.post("/api/login", async (req, res) => {
  await connect();
  await loginUser(req, res);
  mongoose.connection.close();
});

app.get("/api/test", async (req, res) => {
  testResponse(req, res);
});

// API Token Test
app.get("/api/token-test", async (req, res) => {
  try {
    const token = req.token;

    // If there is no token, return an error
    if (!token) {
      return res.status(401).json({
        success: false,
        message: "No token provided",
      });
    }

    const { user_id } = token;
    await connect();
    const user = await User.findOne({ _id: user_id }, async (err, user) => {
      if (err) {
        console.log("Error finding user");
        console.error(err);
        throw err;
      }
      return user;
    }).clone();

    mongoose.connection.close();

    if (!user) {
      return res.status(401).json({
        success: false,
        message: "User not found",
      });
    }

    return res.status(200).json({
      success: true,
      message: "Token is valid",
      data: {
        user,
      },
    });
  } catch (err) {
    console.log("Error decoding token");
    console.error(err);
    return res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
});

app.post("/api/racer", async (req, res) => {
  await connect();
  await addRacer(req, res);
  mongoose.connection.close();
});

app.delete("/api/racer", async (req, res) => {
  await connect();
  await deleteRacer(req, res);
  mongoose.connection.close();
});

app.put("/api/racer", async (req, res) => {
  await connect();
  await updateRacer(req, res);
  mongoose.connection.close();
});

app.listen(8000, async () => {
  console.log("Listening on port: " + 8000);
});
