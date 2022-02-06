const jwt = require("jsonwebtoken");

const getToken = async (req, res, next) => {
  let token;
  if (req.headers.authorization) {
    token = req.headers.authorization.split(" ")[1];
  }
  if (!token) {
    req.token = null;
    next();
  } else {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.token = decoded;
    next();
  }
};

module.exports = getToken;
