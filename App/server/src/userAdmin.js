const bc = require("bcryptjs");
const jwt = require("jsonwebtoken");
const User = require("../models/user");
const validator = require("validator");
const { validateRegister, validateLogin } = require("./validate");

const registerUser = async (req, res) => {
  try {
    let { username, password, email, firstName, lastName } = req.body;
    const validation = validateRegister(
      username,
      password,
      email,
      firstName,
      lastName
    );
    if (!validation.success) {
      return res.status(400).json(validation);
    }
    username = validator.rtrim(validator.escape(username), " ");
    password = validator.rtrim(validator.escape(password), " ");
    email = validator.normalizeEmail(email);
    firstName = validator.rtrim(validator.escape(firstName), " ");
    lastName = validator.rtrim(validator.escape(lastName), " ");

    // Check if the username is already taken
    const user = await User.findOne({ username });
    if (user) {
      res.status(409).json({
        success: false,
        message: "Username is already taken",
      });
      return;
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

    res.status(201).json({
      success: true,
      message: "User created",
      data: {
        token,
      },
    });
    return;
  } catch (err) {
    console.log("Error Creating new user");
    console.error(err);

    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

const loginUser = async (req, res) => {
  try {
    let { username, password } = req.body;
    const validation = validateLogin(username, password);
    if (!validation.success) {
      return res.status(400).json(validation);
    }

    username = validator.rtrim(validator.escape(username), " ");
    password = validator.rtrim(validator.escape(password), " ");

    const user = await User.findOne({ username });

    if (!user) {
      return res.status(401).json({
        success: false,
        message: "Invalid credentials",
      });
    }

    if (!(await bc.compare(password, user.password))) {
      return res.status(401).json({
        success: false,
        message: "Invalid credentials",
      });
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

    return res.status(200).json({
      success: true,
      message: "Login successful",
      data: {
        token,
      },
    });
  } catch (err) {
    console.log("Error Loggin In");
    console.error(err);
    return res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

module.exports = { registerUser, loginUser };
