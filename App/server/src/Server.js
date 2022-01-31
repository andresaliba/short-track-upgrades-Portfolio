require("dotenv").config();
const { connect } = require("../config/db");
const jwt = require("jsonwebtoken");
const cors = require("cors");
const bcryptjs = require("bcryptjs");
const express = require("express");
const User = require("../models/user");

const app = express();

app.use(express.json());

app.use(cors());

connect();

// Register a new user
// TODO - add validation
app.post("/api/register", async (req, res) => {
  try {
    const { username, password, email, firstName, lastName } = req.body;
    if (!(username && password && email && firstName && lastName)) {
      res.status(400).json({
        success: false,
        message: "Please fill out all fields",
      });
    }
    // Check if the username is already taken
    const user = await User.findOne({ username });
    if (user) {
      res.status(409).json({
        success: false,
        message: "Username is already taken",
      });
    }

    // Encrypt the password
    const newUser = new User({
      username,
      email,
      firstName,
      lastName,
    });
    newUser.password = newUser.genHash(password);

    // Generate a new token for the user
    const token = jwt.sign(
      {
        user_id: newUser._id,
        email,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: "24h",
      }
    );

    newUser.token = token;
    await newUser.save();

    res.status(201).send(newUser);
  } catch (err) {
    console.log("Error Creating new user");
    console.error(err);
    res.status(500).send("Server error");
  }
});

// Login a user
// TODO - add validation
app.post("/api/login", async (req, res) => {
  try {
    const { username, password } = req.body;
    if (!(username && password)) {
      res.status(400).json({
        success: false,
        message: "Missing required fields",
      });
      return;
    }

    const user = await User.findOne({ username });
    if (!(user && (await bcryptjs.compare(password, user.password)))) {
      res.status(401).send("Invalid credentials");
    }

    const token = jwt.sign(
      {
        user_id: user._id,
        email: user.email,
      },
      process.env.JWT_SECRET,
      {
        expiresIn: "24h",
      }
    );

    user.token = token;
    await user.save();

    res.status(200).json({
      success: true,
      message: "Login successful",
      token,
    });
  } catch (err) {
    console.log("Error Loggin In");
    console.error(err);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
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

app.listen(8000, () => {
  console.log("Listening on port: " + 8000);
});
