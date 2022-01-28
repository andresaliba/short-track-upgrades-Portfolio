const mongoose = require("mongoose");
const userData = require("../json/userData");
const racerData = require("../json/racerData");

const userCount = userData.data.length;
console.log(`Seeding ${userCount} users`);

const main = async () => {
  await mongoose.connect("mongodb://mongo:27017/test");
  console.log("Connected to MongoDB");

  const userSchema = new mongoose.Schema({
    username: String,
    password: String,
    email: String,
    firstName: String,
    lastName: String,
    racer: [
      {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Racer",
      },
    ],
  });

  const User = mongoose.model("User", userSchema);

  const racerSchema = new mongoose.Schema({
    plateNum: Number,
    firstName: String,
    lastName: String,
    gender: String,
    category: String,
    address: String,
    city: String,
    postalCode: String,
    phoneNum: Number,
    attended: Boolean,
    paid: Boolean,
    attendedCount: Number,
    totalPoints: Number,
  });

  const Racer = mongoose.model("Racer", racerSchema);

  const collectionList = await mongoose.connection.db
    .listCollections()
    .toArray();
  collectionList.forEach((collection) => {
    // If the user collection exists, drop it
    if (collection.name === "users") {
      console.log("Dropping users collection");
      mongoose.connection.db.dropCollection(collection.name);
    } else if (collection.name === "racers") {
      console.log("Dropping racers collection");
      mongoose.connection.db.dropCollection(collection.name);
    }
  });

  userData.data.forEach(async (user, index) => {
    const { username } = user;
    const tmpUser = await new User({
      username,
      password: null,
      email: null,
      firstName: null,
      lastName: null,
      racer: [],
    });
    await tmpUser.save();
  });

  racerData.data.forEach(async (racer, index) => {
    const {
      plateNum,
      firstName,
      lastName,
      sex,
      category,
      address,
      city,
      postalCode,
      phoneNum,
      attended,
      paid,
      attendedCount,
      totalPoints,
    } = racer;
    const tmpRacer = await new Racer({
      plateNum,
      firstName,
      lastName,
      gender: sex,
      category,
      address,
      city,
      postalCode,
      phoneNum,
      attended,
      paid,
      attended,
      attendedCount,
      totalPoints,
    });
    await tmpRacer.save();
  });
};

try {
  main();
} catch {
  console.log("Error");
}
