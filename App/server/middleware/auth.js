const jwt = require("jsonwebtoken");

const config = process.env;

const verifyToken = (req, res, next) => {
  const token =
    req.body.token || req.query.token || req.headers["x-access-token"];

  if (!token) {
    res.status(403).send("You must incldue a token");
  }

  try {
    const decoded = jwt.verify(token, config.JWT_SECRET);
    req.user = decoded;
  } catch (err) {
    console.log("Error verifying token");
    console.error(err);
    res.status(401).send("Invalid token");
  }
  return next();
};

module.exports = verifyToken;
