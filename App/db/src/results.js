const mongoose = require("mongoose");

const results = new mongoose.Schema({
  date: Date,
  lastEdidted: Date,
  results: [
    {
      racer: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Racer",
      },
    },
  ],
  season: String,
  category: String,
});

const ResultsModel = mongoose.model("Results", results);

module.exports = ResultsModel;
