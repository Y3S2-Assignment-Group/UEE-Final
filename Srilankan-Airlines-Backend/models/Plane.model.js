const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const PlaneSchema = new Schema({
  planeNo: {
    type: String,
  },
  planeImg: {
    type: String,
  },
  flight: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Flight",
    },
  ],
});

module.exports = Plane = mongoose.model("Plane", PlaneSchema);
