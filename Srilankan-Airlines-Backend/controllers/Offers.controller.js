const bcrypt = require("bcryptjs");
const Offer = require("../models/Offers.model");
const jwt = require("jsonwebtoken");
const config = require("config");

//get All Offer details
const getAllOffers = async (req, res) => {
  try {
    const offers = await Offer.find();
    res.json(offers);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};

//get single offer
const viewOffer = async (req, res) => {
  try {
    const singleOffer = await Offer.findById(req.params.id);
    res.json(singleOffer);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
}

const addOffers = async (req, res) => {
  const { destination, percentages, ticketPrice, destinationImg, flightRefFlight } = req.body;

  try {
    //create a user instance
    const offers = new Offer({
      destination, 
      percentages, 
      ticketPrice, 
      destinationImg, 
      flightRefFlight,
    });

    //save user to the database
    await offers.save()
      .then(async (offer) => {
        res.json(offer);
      })
      .catch((err) => res.status(400).json("Error: " + err));
  } catch (err) {
    //Something wrong with the server
    console.log(err.message);
    return res.status(500).send("Server Error");
  }
};

module.exports = {
  getAllOffers,
  viewOffer,
  addOffers,
};