const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const FlightSchema = new Schema({
  to: {
    type: String,
  },
  from: {
    type: String,
  },
  departure: {
    type: Date,
  },
  arrival: {
    type: Date,
  },
  gate: {
    type: String,
  },
  seats: [
    {
      type: Array,
    },
  ],
  status: {
    type: String,
  },
  plane: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Plane",
  },
});

module.exports = Flight = mongoose.model("Flight", FlightSchema);
