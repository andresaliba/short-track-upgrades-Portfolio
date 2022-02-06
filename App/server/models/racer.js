const mongoose = require("mongoose");

const racerSchema = new mongoose.Schema({
  type: String,
  plateNum: Number,
  firstName: String,
  lastName: String,
  gender: String,
  category: String,
  address: String,
  city: String,
  postalCode: String,
  phoneNum: String,
  paid: Boolean,
  attendedCount: Number,
  totalPoints: Number,
});

const Racer = mongoose.model("Racer", racerSchema);

module.exports = Racer;
