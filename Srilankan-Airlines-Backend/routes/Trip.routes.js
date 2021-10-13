const express = require("express");
const router = express.Router();

const {
    getTripDetailsbyID,
} = require("../controllers/Trip.controller");

//@route  POST api/Trips
//@desc   Add Trips
//@access Public
router.get("/:id", getTripDetailsbyID);

module.exports = router;