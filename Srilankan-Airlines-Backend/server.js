const express = require("express");
const cors = require("cors");
const connectDB = require("./config/db");

const app = express();

//Connect Database
connectDB();

//Using Cors
app.use(cors());

//Init Middleware( include  bodyparser through express)
app.use(express.json({ extended: false }));

app.get("/", (req, res) => res.send("Sri Lankan Airline Backend Api Running"));

//Define Routes

const PORT = process.env.PORT || 5000;

//API routes

//-------Feedback-----------
app.use("/api/feedBack", require("./routes/Feedback.routes"));

//-------Flight-------------
app.use("/api/flight", require("./routes/Flights.routes"));

//-------Offers-------------
app.use("/api/offer", require("./routes/Offers.routes"));

//-------Plane--------------
app.use("/api/plane", require("./routes/Plane.routes"));

//-------Trip---------------
app.use("/api/trip", require("./routes/Trip.routes"));

//-------User---------------
app.use("/api/user", require("./routes/User.routes"));

app.listen(PORT, () => console.log(`Server started on port ${PORT}`));