const express = require("express");
const router = express.Router();

const {
    addFeedback,getFeedbacks
} = require("../controllers/Feedback.controller");

//@route  Get api/feedback
//@desc   Get all feedback
//@access Public
router.get("/", getFeedbacks);

//@route  POST api/feedback
//@desc   Add feedback
//@access Public
router.post("/", addFeedback);

module.exports = router;