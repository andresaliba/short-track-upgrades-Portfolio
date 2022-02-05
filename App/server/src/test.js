const testResponse = async (req, res) => {
  res.status(200).json({
    success: true,
    message: "Test response",
  });
  console.log("Test response");
};

module.exports = testResponse;
