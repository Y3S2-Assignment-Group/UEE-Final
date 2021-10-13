const express = require("express");
const router = express.Router();

const {
    addFlight,
    updateFlightStatus,
    getFlightList,
    getFlightById,
    updateFlightBookingSeats,
    getFlightByDestination
} = require("../controllers/Flights.controller");

//@route  POST api/flightbookseat
//@desc   Book seats
//@access Public
router.post("/flightbookseat/:id", updateFlightBookingSeats);

//@route  POST api/addFlight
//@desc   Add Flights
//@access Public
router.post("/", addFlight);

//@route  PUT api/updateFlightStatus
//@desc   update Flight Status
//@access Public
router.put("/", updateFlightStatus);

//@route  GET api/getFlightList
//@desc   Get Flight List
//@access Public
router.get("/", getFlightList);

//@route  GET api/getFlightList
//@desc   Get Flight List
//@access Public
router.get("/:id", getFlightById);

//@route  GET api/getFlightList
//@desc   Get Flight List
//@access Public
router.get("/destination/:to", getFlightByDestination);

module.exports = router;


