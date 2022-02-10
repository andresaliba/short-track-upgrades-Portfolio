const User = require("../models/user");
const Racer = require("../models/racer");
const validator = require("validator");
const {
  validateAddRacer,
  validateDeleteRacer,
  validateUpdateRacer,
} = require("./validate");

const addRacer = async (req, res) => {
  try {
    const token = req.token;

    let {
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

    const validation = validateAddRacer({
      token,
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
    });

    if (!validation.success) {
      res.status(400).json(validation);
    }

    type = validator.rtrim(validator.escape(type), "");
    plateNum = validator.rtrim(validator.escape(plateNum), "");
    firstName = validator.rtrim(validator.escape(firstName), "");
    lastName = validator.rtrim(validator.escape(lastName), "");
    gender = validator.rtrim(validator.escape(gender), "");
    address = validator.rtrim(validator.escape(address), "");
    city = validator.rtrim(validator.escape(city), "");
    postalCode = validator.rtrim(validator.escape(postalCode), "");
    phoneNum = validator.rtrim(validator.escape(phoneNum), "");

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

const deleteRacer = async (req, res) => {
  try {
    const token = req.token;

    const { racerId } = req.body;

    const validation = validateDeleteRacer({
      token,
      racerId,
    });

    if (!validation.success) {
      res.status(400).json(validation);
    }

    const user = await User.findOne({ _id: token.user_id });
    if (!user) {
      return res.status(401).json({
        success: false,
        message: "User not found",
      });
    }

    const racer = await Racer.findOne({ _id: racerId });
    if (!racer) {
      return res.status(401).json({
        success: false,
        message: "Racer not found",
      });
    }

    await Racer.deleteOne({ _id: racerId });
    await user.racers.pull(racer);
    await user.save();
    res.status(200).json({
      success: true,
      message: "Racer deleted",
      data: {
        racer,
        user,
      },
    });
  } catch (err) {
    console.log("Error deleting racer");
    console.error(err);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
    return;
  }
};

const updateRacer = async (req, res) => {
  try {
    const token = req.token;
    let {
      racerId,
      type, // optional
      plateNum, // optional
      firstName, // optional
      lastName, // optional
      gender, // optional
      address, // optional
      city, // optional
      postalCode, // optional
      phoneNum, // optional
    } = req.body;

    const validation = validateUpdateRacer({
      token,
      racerId,
      type,
      plateNum,
      firstName,
      lastName,
      gender,
      address,
      city,
      postalCode,
      phoneNum,
    });

    if (!validation.success) {
      return res.status(400).json(validation);
    }
    // There must be a better way for this hahahahhahahahah :(
    if (type) {
      type = validator.rtrim(validator.escape(type), "");
    }
    if (plateNum) {
      plateNum = validator.rtrim(validator.escape(plateNum), "");
    }
    if (firstName) {
      firstName = validator.rtrim(validator.escape(firstName), "");
    }
    if (lastName) {
      lastName = validator.rtrim(validator.escape(lastName), "");
    }
    if (gender) {
      gender = validator.rtrim(validator.escape(gender), "");
    }
    if (address) {
      address = validator.rtrim(validator.escape(address), "");
    }
    if (city) {
      city = validator.rtrim(validator.escape(city), "");
    }
    if (postalCode) {
      postalCode = validator.rtrim(validator.escape(postalCode), "");
    }
    if (phoneNum) {
      phoneNum = validator.rtrim(validator.escape(phoneNum), "");
    }

    const user = await User.findOne({ _id: token.user_id });
    if (!user) {
      return res.status(401).json({
        success: false,
        message: "User not found",
      });
    }

    const racer = await Racer.findOne({ _id: racerId });
    if (!racer) {
      return res.status(401).json({
        success: false,
        message: "Racer not found",
      });
    }

    if (type) {
      racer.type = type;
    }
    if (plateNum) {
      racer.plateNum = plateNum;
    }
    if (firstName) {
      racer.firstName = firstName;
    }
    if (lastName) {
      racer.lastName = lastName;
    }
    if (gender) {
      racer.gender = gender;
    }
    if (address) {
      racer.address = address;
    }
    if (city) {
      racer.city = city;
    }
    if (postalCode) {
      racer.postalCode = postalCode;
    }
    if (phoneNum) {
      racer.phoneNum = phoneNum;
    }

    await racer.save();
    await user.save();
    res.status(200).json({
      success: true,
      message: "Racer updated",
      data: {
        racer,
        user,
      },
    });
  } catch (err) {
    console.log("Error updating racer");
    console.error(err);
    res.status(500).json({
      success: false,
      message: "Server error",
    });
  }
};

module.exports = { addRacer, deleteRacer, updateRacer };
