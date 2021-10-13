const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const UserSchema = new Schema({
  name: {
    type: String,
  },
  email: {
    type: String,
    unique: true,
  },
  password: {
    type: String,
  },
  profileImg: {
    type: String,
  },
  passportNumber: {
    type: String,
  },
  country: {
    type: String,
  },
  mobileNumber: {
    type: String,
  },
  prevTrips: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Trip",
    },
  ],
  currentTrip: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Trip",
  },
  scheduledTrips: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Trip",
    },
  ],
});

module.exports = User = mongoose.model("User", UserSchema);
