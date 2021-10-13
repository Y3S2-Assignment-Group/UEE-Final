const Trip = require("../models/Trip.model");

//get trip details
const getTripDetailsbyID = async (req, res) => {
  try {
    const user = await Trip.findById(req.params.id).populate({
      path: "flight",
      model: "Flight",
      populate: {
        path: "Plane",
        // select: "name",
      },
    });
    res.json(user);
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};

module.exports = {
  getTripDetailsbyID,
};
