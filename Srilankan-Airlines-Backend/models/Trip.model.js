const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const TripSchema = new Schema({
  flightClass: {
    type: String,
  },
  seatNo: {
    type: String,
  },
  flight: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Flight",
  },
  checkinStatus: {
    type: Boolean,
  },
  bookingStatus: {
    type: Boolean,
  },
});

module.exports = Trip = mongoose.model("Trip", TripSchema);
