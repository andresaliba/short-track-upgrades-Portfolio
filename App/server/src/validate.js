const validator = require("validator");

const validateRegister = (username, password, email, firstName, lastName) => {
  if (
    validator.isEmpty(username) ||
    validator.isEmpty(password) ||
    validator.isEmpty(email) ||
    validator.isEmpty(firstName) ||
    validator.isEmpty(lastName)
  ) {
    return {
      success: false,
      message: "All fields are required",
    };
  }
  if (!validator.isEmail(email)) {
    return {
      success: false,
      message: "Invalid email",
    };
  }
  return {
    success: true,
  };
};

const validateLogin = (username, password) => {
  if (validator.isEmpty(username) || validator.isEmpty(password)) {
    return {
      success: false,
      message: "All fields are required",
    };
  }
  return {
    success: true,
  };
};

const validateAddRacer = (racerData) => {
  if (!validator(racerData.token)) {
    return {
      success: false,
      message: "No token provided",
    };
  }
  if (!validator.isJWT(racerData)) {
    return {
      success: false,
      message: "Invalid token",
    };
  }
  if (
    validator.isEmpty(racerData.type) ||
    validator.isEmpty(racerData.plateNum) ||
    validator.isEmpty(racerData.firstName) ||
    validator.isEmpty(racerData.lastName) ||
    validator.isEmpty(racerData.gender) ||
    validator.isEmpty(racerData.category) ||
    validator.isEmpty(racerData.address) ||
    validator.isEmpty(racerData.city) ||
    validator.isEmpty(racerData.postalCode) ||
    validator.isEmpty(racerData.phoneNum)
  )
    return {
      success: false,
      message: "All fields are required",
    };

  if (!validator.isPostalCode(racerData, "CA")) {
    return {
      success: false,
      message: "Invalid postal code",
    };
  }
  if (
    !validator.isMobilePhone(racerData.phoneNum, "en-CA", { strictMode: false })
  ) {
    return {
      success: false,
      message: "Invalid phone number",
    };
  }
  return {
    success: true,
  };
};

const validateDeleteRacer = (racerData) => {
  if (!validator(racerData.token)) {
    return {
      success: false,
      message: "No token provided",
    };
  }
  if (!validator.isJWT(racerData)) {
    return {
      success: false,
      message: "Invalid token",
    };
  }
  if (validator.isEmpty(racerData.racerId)) {
    return {
      success: false,
      message: "No racer id provided",
    };
  }
  return {
    success: true,
  };
};

const validateUpdateRacer = (racerData) => {
  if (!validator(racerData.token)) {
    return {
      success: false,
      message: "No token provided",
    };
  } else if (!validator.isJWT(racerData)) {
    return {
      success: false,
      message: "Invalid token",
    };
  } else if (validator.isEmpty(racerData.racerId)) {
    return {
      success: false,
      message: "No racer id provided",
    };
  }
  return {
    success: true,
  };
};

module.exports = {
  validateRegister,
  validateLogin,
  validateAddRacer,
  validateDeleteRacer,
  validateUpdateRacer,
};
