const Plane = require("../models/Plane.model");

//get plane by Id
const getPlaneById = async (req, res) => {
  try {
    Plane.findById(req.params.id).populate({
      path: "flight",
      populate: {
        path: "seats",
      },
    }).then((plane) => {
      res.json(plane);
    });
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};

//get all planes
const getPlaneList = async (req, res) => {
  try {
    Plane.find()
      .populate({
        path: "flight",
        populate: {
          path: "seats",
        },
      })
      .then((plans) => {
        res.json(plans);
      });
  } catch (err) {
    console.log(err.message);
    res.status(500).send("Server Error");
  }
};

//Insert plane to the system
const addPlane = async (req, res) => {
  const { planeNo, planeImg } = req.body;

  try {
    //create a user instance
    const plane = new Plane({
      planeNo,
      planeImg,
      flight: [],
    });

    //save user to the database
    await plane
      .save()
      .then(async (insertedPlane) => {
        res.json(insertedPlane);
      })
      .catch((err) => res.status(400).json("Error: " + err));
  } catch (err) {
    //Something wrong with the server
    console.log(err.message);
    return res.status(500).send("Server Error");
  }
};

module.exports = {
  addPlane,
  getPlaneList,
  getPlaneById,
};
