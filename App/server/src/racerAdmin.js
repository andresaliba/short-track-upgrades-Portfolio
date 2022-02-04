const verifyToken = require("./tokens");
const User = require("../models/user");
const Racer = require("../models/racer");

const addRacer = async (req, res) => {
  try {
    const token = verifyToken(req);

    if (!token) {
      res.status(401).json({
        success: false,
        message: "No token provided",
      });
      return;
    }
    const {
      type,
      plateNum,
      firstName,
      lastName,
      gender,
      category,
      address,
      city,
      postalCode,
      phoneNum,
      paid,
      attendedCount,
      totalPoints,
    } = req.body;

    if (
      !type ||
      !plateNum ||
      !firstName ||
      !lastName ||
      !gender ||
      !category ||
      !address ||
      !city ||
      !postalCode ||
      !phoneNum ||
      !paid ||
      !attendedCount ||
      !totalPoints
    ) {
      res.status(400).json({
        sucess: false,
        message: "Please fill out all fields",
      });
    }

    const user = await User.findOne({ _id: token.user_id });
    if (!user) {
      res.status(401).json({
        success: false,
        message: "User not found",
      });
      return;
    }

    const racer = new Racer({
      type,
      plateNum,
      firstName,
      lastName,
      gender,
      category,
      address,
      city,
      postalCode,
      phoneNum,
      paid,
      attendedCount,
      totalPoints,
    });

    await racer.save();
    user.racer.push(user);
    user.save();
  } catch (err) {
    res.status(500).json({
      success: false,
      message: "Server error",
    });
    return;
  }
};

module.exports = { addRacer };
