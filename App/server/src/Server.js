require("dotenv").config();
const { connect } = require("../config/db");
const jwt = require("jsonwebtoken");
const bcryptjs = require("bcryptjs");
const express = require("express");
const User = require("../models/user");

const app = express();

app.use(express.json());

connect();

// Register a new user
app.post("/api/register", async (req, res) => {
  try {
    const { username, password, email, firstName, lastName } = req.body;
    if (!(username && password && email && firstName && lastName)) {
      res.status(400).send("Missing required fields");
    }
    // Check if the username is already taken
    const user = await User.findOne({ username });
    if (user) {
      res.status(409).send("Username already taken");
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
        expiresIn: "2h",
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

app.post("/api/login", async (req, res) => {
  try {
    const { username, password } = req.body;
    if (!(username && password)) {
      res.status(400).send("Missing required fields");
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
        expiresIn: "2h",
      }
    );

    user.token = token;
    await user.save();

    res.status(200).send(user);
  } catch (err) {
    console.log("Error Loggin In");
    console.error(err);
    res.status(500).send("Server error");
  }
});

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
        res.status(500).send("Server error");
      }
      console.log(user);
      res.status(200).send(user);
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
