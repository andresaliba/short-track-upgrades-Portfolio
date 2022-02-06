const User = require("../models/user");
const Racer = require("../models/racer");

const addRacer = async (req, res) => {
  try {
    const token = req.token;

    if (!token) {
      return res.status(401).json({
        success: false,
        message: "No token provided",
      });
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
      return res.status(400).json({
        sucess: false,
        message: "Please fill out all fields",
      });
    }

    const user = await User.findOne({ _id: token.user_id });
    if (!user) {
      return res.status(401).json({
        success: false,
        message: "User not found",
      });
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
    await user.racers.push(racer);
    await user.save();
    res.status(201).json({
      success: true,
      message: "Racer added",
      data: {
        racer,
        user,
      },
    });
  } catch (err) {
    console.log("Error adding racer");
    console.error(err);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
    return;
  }
};

const deleteRacer = async (req, res) => {};

const updateRacer = async (req, res) => {};

module.exports = { addRacer, deleteRacer, updateRacer };
