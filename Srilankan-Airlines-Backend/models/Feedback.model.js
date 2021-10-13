const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const UserSchema = new Schema({
    name: {
        type: String,
    },
    description: {
        type: String,
    },
    rating : {
        type: Number,
    },
});

module.exports = Feedback = mongoose.model("Feedback", UserSchema);