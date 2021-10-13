const User = require("../models/User.model");
const Trip = require("../models/Trip.model");
const Seat = require("../models/Seat.model");
const Flight = require("../models/Flight.model");

//get User details
const getUserDetails = async (req, res) => {
  try {
    //get user details
    //-password : dont return the pasword
    const user = await User.findById(req.user.id)
      .select("-password")
      .populate({
        path: "prevTrips",
        populate: {
          path: "flight",
        },
      })
      .populate({
        path: "currentTrip",
        populate: {
          path: "flight",
        },
      })
      .populate({
        path: "scheduledTrips",
        populate: {
          path: "flight",
        },
      });
    res.json(user);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};


//get User Previous Trips details
const getUserPreviousTripsDetails = async (req, res) => {
  try {
    const user = await User.findById(req.user.id)
      .select("prevTrips")
      .populate({
        path: "prevTrips",
        populate: {
          path: "flight",
        },
      });

    res.json(user.prevTrips);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};


//get User Schedule Trips details
const getUserScheduleTripsDetails = async (req, res) => {
  try {
    const user = await User.findById(req.user.id)
      .select("scheduledTrips")
      .populate({
        path: "scheduledTrips",
        populate: {
          path: "flight",
        },
      });

    res.json(user.scheduledTrips);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};


//get User Current Trip details
const getUserCurrentTripDetails = async (req, res) => {
  try {
    const user = await User.findById(req.user.id)
      .select("currentTrip")
      .populate({
        path: "currentTrip",
        populate: {
          path: "flight",
        },
      });

    res.json(user.currentTrip);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};

//get User details
const getUserDetailsByUserId = async (req, res) => {
  try {
    //get user details
    //-password : dont return the pasword
    const user = await User.findById(req.params.id)
      .select("-password")
      .populate({ path: "prevTrips", model: "Trip" })
      .populate({ path: "currentTrip", model: "Trip" })
      .populate({ path: "scheduledTrips", model: "Trip" });
    res.json(user);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};

//book flights
const bookTrip = async (req, res) => {
  const { flightClass, seatNo, flight } = req.body;

  try {
    //create a user instance
    const trip = new Trip({
      flightClass,
      seatNo,
      flight,
      checkinStatus: false,
      bookingStatus: true,
    });

    //save user to the database
    await trip
      .save()
      .then(async (insertedTrip) => {
        //todo: add to users current trip
        await User.findByIdAndUpdate(req.user.id).then(async (existingUser) => {
          existingUser.currentTrip = insertedTrip;
          existingUser.save().then((updatedUser) => {
            res.json(updatedUser);
          });
        });
      })
      .catch((err) => res.status(400).json("Error: " + err));
  } catch (err) {
    //Something wrong with the server
    console.log(err.message);
    return res.status(500).send("Server Error");
  }
};

//checkin to flight
const checkinTrip = async (req, res) => {
  try {
    const trip = await Trip.findById(req.params.id);

    if (trip != null) {
      Trip.findByIdAndUpdate(req.params.id).then(async (existingTrip) => {
        existingTrip.checkinStatus = true;

        existingTrip
          .save()
          .then(async (response) => {
            //todo:remove from users current and add to prev
            User.findByIdAndUpdate(req.user.id).then((existingUser) => {
              existingUser.currentTrip = null;
              existingUser.prevTrips.unshift(trip);

              existingUser.save().then(() => {
                res.json("user checkedin");
              });
            });
          })
          .catch((err) => res.status(400).json("Error: " + err));
      });
    }
  } catch (err) {
    //Something wrong with the server
    console.error(err.message);
    return res.status(500).send("Server Error");
  }
};

//schedule trips
const scheduleTrips = async (req, res) => {
  const { flightClass, seatNo, flight } = req.body;

  try {
    //create a user instance
    const trip = new Trip({
      flightClass,
      seatNo,
      flight,
      checkinStatus: false,
      bookingStatus: false,
    });

    //save user to the database
    await trip
      .save()
      .then(async (newScheduledTrip) => {
        //todo: add to users scheduled trip
        await User.findByIdAndUpdate(req.user.id).then(async (existingUser) => {
          existingUser.scheduledTrips.unshift(newScheduledTrip);
          await existingUser.save().then(() => {
            res.json(newScheduledTrip);
          });
        });
      })
      .catch((err) => res.status(400).json("Error: " + err));
  } catch (err) {
    //Something wrong with the server
    console.log(err.message);
    return res.status(500).send("Server Error");
  }
};

module.exports = {
  getUserDetails,
  getUserDetailsByUserId,
  bookTrip,
  checkinTrip,
  scheduleTrips,
  getUserCurrentTripDetails,
  getUserScheduleTripsDetails,
  getUserPreviousTripsDetails
};
