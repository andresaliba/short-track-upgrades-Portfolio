const jwt = require("jsonwebtoken");

const verifyToken = (req) => {
  const token = req.headers.authorization.split(" ")[1];
  if (!token) {
    return false;
  }
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    return decoded;
  } catch (err) {
    return false;
  }
};

module.exports = { verifyToken };
