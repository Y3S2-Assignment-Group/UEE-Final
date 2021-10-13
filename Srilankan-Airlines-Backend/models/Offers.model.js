const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const UserSchema = new Schema({
    destination: {
        type: String,
    },
    percentages: {
        type: String,
    },
    ticketPrice: {
        type: String,
    },
    destinationImg: {
        type: String,
    },
    flightRefFlight: {
        type: String,
    },
});

module.exports = Offers = mongoose.model("Offers", UserSchema);