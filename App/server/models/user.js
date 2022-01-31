const mongoose = require("mongoose");
const bcryptjs = require("bcryptjs");

const userSchema = new mongoose.Schema({
  username: String,
  password: String,
  email: String,
  firstName: String,
  lastName: String,
  token: String,
  racer: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Racer",
    },
  ],
});

userSchema.methods.genHash = function (password) {
  return bcryptjs.hashSync(password, bcryptjs.genSaltSync(10), null);
};

userSchema.methods.validatePassword = (password) => {
  return bcryptjs.compareSync(password, this.password);
};

const User = mongoose.model("User", userSchema);

module.exports = User;
