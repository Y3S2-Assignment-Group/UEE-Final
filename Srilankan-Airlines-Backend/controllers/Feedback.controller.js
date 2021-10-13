const Feedback = require("../models/Feedback.model");

//get all feedbacks
const getFeedbacks = async (req, res) => {
  try {
    Feedback.find().then((feedbacks) => {
      res.json(feedbacks);
    });
  } catch (err) {
    //Something wrong with the server
    console.log(err.message);
    return res.status(500).send("Server Error");
  }
};

//Insert feedback to the system
const addFeedback = async (req, res) => {
  const { name, description, rating } = req.body;

  try {
    //create a user instance
    const feed = new Feedback({
      name,
      description,
      rating,
    });

    //save user to the database
    await feed
      .save()
      .then(async (feedback) => {
        res.json(feedback);
      })
      .catch((err) => res.status(400).json("Error: " + err));
  } catch (err) {
    //Something wrong with the server
    console.log(err.message);
    return res.status(500).send("Server Error");
  }
};

module.exports = {
  addFeedback,
  getFeedbacks
};
