const express = require("express");
const router = express.Router();

const {
    getAllOffers,
    viewOffer,
    addOffers,
} = require("../controllers/Offers.controller");

//@route  get api/offers
//@desc   get offers
//@access Public
router.get("/", getAllOffers);

//@route  get api/viewOffer
//@desc   view offers
//@access Public
router.get("/:id", viewOffer);

//@route  POST api/addOffers
//@desc   Add Offers
//@access Public
router.post("/", addOffers);

module.exports = router;