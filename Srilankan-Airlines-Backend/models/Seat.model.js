const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const SeatSchema = new Schema({
  xAxis: {
    type: Number,
  },
  yAxis: {
    type: Number,
  },
  flight: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Flight",
  },
  
});

module.exports = Seat = mongoose.model("Seat", SeatSchema);
