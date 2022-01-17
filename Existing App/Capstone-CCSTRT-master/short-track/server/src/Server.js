let express = require('express');
let cors = require('cors');

let bodyParser = require('body-parser');
let cookieParser = require('cookie-parser');

let sanitizer = require('express-sanitizer');
let session = require('express-session');

let bcrypt = require('bcrypt');
let Sequelize = require('sequelize');
const Op = Sequelize.Op;

let app = express();
app.use(cors({ origin: ['http://localhost:4200'], credentials: true }));
app.use(bodyParser.json());
app.use(cookieParser());
app.use(sanitizer());

app.use(
  session({
    resave: false,
    saveUninitialized: true,
    secret: 'Pxki0%Gul3kZysRupW8raUA#*',
    cookie: { secure: false, maxAge: 3600000 }
  })
);

// express static middleware - setup static files location
app.use(express.static('./dist'));

const port = process.env.PORT || 8081;

///sequelize object
//construct works like (db name, mysql username, mysql password (it's null because i don't have a password), and then list of options)
const sequelize = new Sequelize('ccstrt', 'root', '', {
  // dialectOptions: {
  //   socketPath: '/Applications/MAMP/tmp/mysql/mysql.sock'
  // },
  host: 'localhost',
  dialect: 'mysql'
});

//models
//this is a representation of a table, as a model
//because i define it as 'tbl_users', it will recognize that as the table name
let tbl_users = sequelize.define(
  'tbl_users',
  {
    username: {
      type: Sequelize.STRING,
      primaryKey: true
    },

    password: Sequelize.STRING,
    type: Sequelize.STRING,
    racerID: Sequelize.INTEGER
  },
  {
    //MODEL OPTIONS
    //this disables sequelize making table names plural, as in 'tbl_userss', which we don't want
    freezeTableName: true,
    //if true will not delete model if timestamps are active
    paranoid: false,
    //underscored naming convention
    underscored: true,
    //removes created_at and updated_at field names
    timestamps: false
  }
);

//racer model
//for tbl_racers
let tbl_racers = sequelize.define(
  'tbl_racers',
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    type: Sequelize.STRING,
    belongsTo: Sequelize.INTEGER,
    plateNum: Sequelize.INTEGER,
    firstName: Sequelize.STRING,
    lastName: Sequelize.STRING,
    sex: Sequelize.STRING,
    category: Sequelize.STRING,
    address: Sequelize.STRING,
    city: Sequelize.STRING,
    postalCode: Sequelize.STRING,
    phoneNum: Sequelize.STRING,
    attendedCount: Sequelize.INTEGER,
    attended: Sequelize.STRING,
    totalPoints: Sequelize.INTEGER,
    paid: Sequelize.STRING
  },
  {
    freezeTableName: true,
    paranoid: false,
    underscored: true,
    timestamps: false
  }
);

let tbl_results = sequelize.define(
  'tbl_results',
  {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    results: Sequelize.STRING,
    season: Sequelize.STRING,
    category: Sequelize.STRING
  },
  {
    freezeTableName: true,
    paranoid: false,
    underscored: true,
    timestamps: true
  }
);

// Model for PayPal price
const tbl_paypal = sequelize.define(
  'tbl_paypal',
  {
    price: {
      type: Sequelize.INTEGER,
      primaryKey: true
    }
  },
  {
    freezeTableName: true,
    paranoid: false,
    underscored: true,
    timestamps: false
  }
);

// -------------------------------------------------------- GET REQUESTS

// Get request for PayPal Price
app.get('/admin/get/paypal', (req, res) => {
  return tbl_paypal
    .findAll()
    .then(price => {
      res.status(200);
      res.send(price);
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

//private get request
//will not send anything UNLESS there is a session existing
app.get('/racers/get', (req, res) => {
  if (req.session.loggedIn.type == 'Admin') {
    return tbl_racers
      .findAll()
      .then(racers => {
        res.status(200);
        res.send(racers);
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

app.get('/racers/get/points', (req, res) => {
  if (req.session.loggedIn.type == 'Admin') {
    return tbl_racers
      .findAll({ order: [['totalPoints', 'DESC']] })
      .then(racers => {
        res.status(200);
        res.send(racers);
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

app.get('/racers/get/:racerID', (req, res) => {
  let racerID = req.params.racerID;

  if (
    req.session.loggedIn.type == 'Admin' ||
    req.session.loggedIn.type == 'Volunteer' ||
    req.session.loggedIn.type == 'Racer'
  ) {
    tbl_racers
      .findOne({ where: { id: racerID } })
      .then(racer => {
        if (racer) {
          if (
            racer.id == racerID ||
            racer.belongsTo == racerID ||
            (req.session.loggedIn.type == 'Admin' || req.session.loggedIn.type == 'Volunteer')
          ) {
            res.send(racer);
            res.status(200);
          } else {
            res.status(401);
            res.send({ error: 'Unauthorized access' });
          }
        } else {
          res.status(200);
          res.send({ exists: false });
        }
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

app.get('/racers/get/plate/:plateNum', (req, res) => {
  let plateNum = req.params.plateNum;

  // if (req.session.loggedIn.type == 'Admin' || req.session.loggedIn.type == 'Volunteer') {
  tbl_racers
    .findOne({ where: { plateNum: plateNum } })
    .then(racer => {
      res.status(200);

      if (racer) {
        res.send(racer);
      } else {
        res.send({ exists: false });
      }
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
  // } else {
  //   res.status(401);
  //   res.send({ error: 'Unauthorized access' });
  // }
});

// Check if plate exists for sign-up validation
app.get('/racers/get/plate/check/:plateNum', (req, res) => {
  let plateNum = req.params.plateNum;

  tbl_racers
    .findOne({ where: { plateNum: plateNum } })
    .then(racer => {
      res.status(200);

      if (racer) {
        res.send({ exists: true, category: racer.category });
      } else {
        res.send({ exists: false });
      }
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

// Check if user exists for sign-up validation
app.get('/users/get/check/:userName', (req, res) => {
  let userName = req.params.userName;

  //console.log(userName);

  tbl_users
    .findOne({ where: { username: userName } })
    .then(user => {
      res.status(200);

      if (user) {
        res.send({ exists: true });
      } else {
        res.send({ exists: false });
      }
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

app.get('/racers/search/:type/:needle?/:attended?/:random?', (req, res) => {
  let searchType = req.params.type;
  let needle = parseInt(req.params.needle);
  let attended = req.params.attended;
  let random = req.params.random;
  let query = {};

  if (req.session.loggedIn.type == 'Admin') {
    if (searchType == 'category') {
      let category;

      switch (needle) {
        case 1:
          category = 'Run-Bike';
          break;
        case 2:
          category = 'Grade 1-Under';
          break;
        case 3:
          category = 'Grade 2-3';
          break;
        case 4:
          category = 'Grade 4-6';
          break;
        case 5:
          category = 'Jr. High';
          break;
        case 6:
          category = 'Adult';
          break;
      }

      if (attended == 'attended') {
        if (random == 'random') {
          query = { where: { category: category, attended: 'yes' }, order: sequelize.random() };
        } else {
          query = { where: { category: category, attended: 'yes' } };
        }
      } else {
        if (random == 'random') {
          query = { where: { category: category }, order: sequelize.random() };
        } else {
          query = { where: { category: category } };
        }
      }

      tbl_racers
        .findAll(query)
        .then(racers => {
          res.status(200);
          res.send(racers);
        })
        .catch(err => {
          res.status(500);
          res.send({ error: err });
          throw err;
        });
    } else if (searchType == 'attended') {
      tbl_racers
        .findAll({ where: { attended: 'yes' } })
        .then(racers => {
          res.status(200);
          res.send(racers);
        })
        .catch(err => {
          res.status(500);
          res.send({ error: err });
          throw err;
        });
    } else {
      res.status(401);
      res.send({ error: 'Unauthorized access' });
    }
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

app.get('/racers/get/children/:racerID', (req, res) => {
  let racerID = req.params.racerID;

  if (req.session.loggedIn.type == 'Admin' || req.session.loggedIn.type == 'Racer') {
    tbl_racers
      .findAll({ where: { belongsTo: racerID } })
      .then(racers => {
        res.status(200);
        res.send(racers);
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

//get request to check if a user is loggedin
app.get('/login/session/:type', (req, res) => {
  let actionType = req.params.type;

  if (actionType == 'get') {
    if (req.session.loggedIn && req.session.loggedIn != false) {
      res.status(200);

      //console.log(req.session.loggedIn);
      res.send(req.session.loggedIn);
    } else {
      res.send({ loggedIn: false });
    }
  } else if (actionType == 'destroy') {
    if (req.session.loggedIn && req.session.loggedIn != false) {
      //DESTROY THE SESSION
      //logout the user
      req.session.destroy();
      res.status(200);
      res.send({ loggedOut: true });
    } else {
      res.status(401);
      res.send({ loggedOut: false });
    }
  } else {
    res.status(401);
    res.send({ loggedOut: false });
  }
});

app.get('/racers/users/get/:username', (req, res) => {
  let username = req.params.username;

  if (req.session.loggedIn != false) {
    return tbl_users
      .find({ where: { username: username } })
      .then(user => {
        res.status(200);
        res.send(user);
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

app.get('/results/get/', (req, res) => {
  tbl_results
    .findAll()
    .then(results => {
      res.status(200);
      res.send(results);
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

app.get('/results/get/meta/:id', (req, res) => {
  let resultID = req.params.id;

  tbl_results
    .findOne({ where: { id: resultID }, raw: true })
    .then(result => {
      if (result) {
        delete result.results;
        res.status(200);
        res.send(result);
      }
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

app.get('/results/get/:id', (req, res) => {
  let resultsID = req.params.id;
  let plateArray = [];
  let maxLaps = 0;

  tbl_results.findOne({ where: { id: resultsID } }).then(results => {
    let tempArray = results.results.split(':');
    let plateLapArray = tempArray[0].split(', ');
    maxLaps = tempArray[1];

    for (let plateLapString of plateLapArray) {
      let plateLapStringArray = plateLapString.split('.');
      plateArray.push(plateLapStringArray[0]);
    }

    return tbl_racers
      .findAll({ where: { plateNum: plateArray }, raw: true })
      .then(racers => {
        for (let racer of racers) {
          racer.lastName = racer.lastName.charAt(0);

          for (let plateLapString of plateLapArray) {
            let plateLapStringArray = plateLapString.split('.');
            //console.log(racer.plateNum == plateLapStringArray[0]);
            if (racer.plateNum == plateLapStringArray[0]) {
              racer.laps = parseInt(plateLapStringArray[1]);
              break;
            }
          }
        }

        res.status(200);
        res.send([racers, plateArray, maxLaps]);
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  });
});

// -------------------------------------------------------- POST REQUESTS
app.post('/admin/paypal', (req, res) => {
  if (req.session.loggedIn.type == 'Admin') {
    let newPrice = req.body.myPrice;
    let oldPrice = req.body.oldPrice;

    tbl_paypal
      .update({ price: newPrice }, { where: { price: oldPrice } })
      .then(result => {
        res.status(200);
        res.send({ updated: true });
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
      });
  }
});

app.post('/admin/newadmin', (req, res) => {
  if (req.session.loggedIn.type == 'Admin') {
    //sanitize all inputs
    req.body.username = req.sanitize(req.body.username);
    req.body.password = req.sanitize(req.body.password);

    let adminJSON;

    adminJSON = {
      username: req.body.username,
      password: '',
      type: req.body.type,
      racerID: null
    };

    // Hash the admin password
    bcrypt.hash(req.body.password, 10, (err, hash) => {
      if (err) {
        throw err;
      } else {
        req.body.password = hash;
        adminJSON.password = req.body.password;

        tbl_users
          .create(adminJSON)
          .then(result => {
            res.status(200);
            res.send({ createAdmin: true });
          })
          .catch(err => {
            res.status(500);
            res.send({ error: err });
            throw err;
          });
      }
    });
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

app.post('/racers/:type', (req, res) => {
  let actionType = req.params.type;

  if (actionType == 'add') {
    //console.log(req.body);

    //sanitize all inputs
    req.body.firstName = req.sanitize(req.body.firstName);
    req.body.lastName = req.sanitize(req.body.lastName);
    req.body.email = req.sanitize(req.body.email);
    req.body.password = req.sanitize(req.body.password);
    req.body.sex = req.sanitize(req.body.sex);
    req.body.category = req.sanitize(req.body.category);
    req.body.address = req.sanitize(req.body.address);
    req.body.city = req.sanitize(req.body.city);
    req.body.postalCode = req.sanitize(req.body.postalCode);
    req.body.phoneNum = req.sanitize(req.body.phoneNum);
    req.body.attendedCount = 0;
    req.body.totalPoints = 0;

    let userJSON;

    //to be save i loop through all of the children and sanitize each field
    //also append parent info
    for (let child of req.body.children) {
      child.firstName = req.sanitize(child.firstName);
      child.lastName = req.sanitize(child.lastName);
      child.plateNum = req.sanitize(child.plateNum);
      child.address = req.body.address;
      child.city = req.body.city;
      child.postalCode = req.body.postalCode;
      child.phoneNum = req.body.phoneNum;
      child.attendedCount = 0;
      child.totalPoints = 0;
    }

    //create racer using previously created model
    //much more secure and easier than a raw query
    tbl_racers
      .create(req.body)
      .then(result => {
        for (let child of req.body.children) {
          child.belongsTo = result.id;
        }

        userJSON = {
          username: req.body.email,
          password: '',
          type: 'Racer',
          racerID: result.id
        };

        tbl_racers.bulkCreate(req.body.children).then(result => {
          bcrypt.hash(req.body.password, 10, (err, hash) => {
            if (err) {
              throw err;
            } else {
              req.body.password = hash;
              userJSON.password = req.body.password;

              tbl_users.create(userJSON).then(result => {
                res.status(200);
                res.send({ createRacer: true });
              });
            }
          });
        });
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else if (actionType == 'checkin') {
    if (req.session.loggedIn.type == 'Admin') {
      tbl_racers
        .update(
          { attended: 'yes', attendedCount: Sequelize.literal('attendedCount + 1') },
          { where: { id: req.body, attended: 'no' } }
        )
        .then(result => {
          res.status(200);
          res.send({ updated: true });
        })
        .catch(err => {
          res.status(500);
          res.send({ error: err });
          throw err;
        });
    } else if (req.session.loggedIn.type == 'Racer') {
      for (let id of req.body) {
        tbl_racers.findOne({ where: { id: id } }).then(racer => {
          if (racer.id == id || racer.belongsTo == id) {
            tbl_racers
              .update(
                { attended: 'yes', attendedCount: Sequelize.literal('attendedCount + 1') },
                { where: { id: id, attended: 'no' } }
              )
              .then(result => {})
              .catch(err => {
                res.status(500);
                res.send({ error: err });
                throw err;
              });
          }
        });
      }
      res.status(200);
      res.send({ updated: true });
    } else {
      res.status(401);
      res.send({ err: 'Unauthorized access' });
    }
  } else if (actionType == 'resetAttend' && req.session.loggedIn.type == 'Admin') {
    tbl_racers
      .update({ attended: 'no' }, { where: { attended: 'yes' } })
      .then(result => {
        res.status(200);
        res.send({ resetAttend: true });
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else if (actionType == 'resetAttendedStatus' && req.session.loggedIn.type == 'Admin') {
    //console.log('I am doing attendeded status');
    tbl_racers
      .update({ attendedCount: 0 }, { where: { attendedCount: { [Op.ne]: null } } })
      .then(result => {
        res.status(200);
        res.send({ resetAttendedStatus: true });
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else if (actionType == 'resetTotalPoints' && req.session.loggedIn.type == 'Admin') {
    //console.log('I am doing total points reset');
    tbl_racers
      .update({ totalPoints: 0 }, { where: { totalPoints: { [Op.ne]: null } } })
      .then(result => {
        res.status(200);
        res.send({ resetTotalPoints: true });
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else if (actionType == 'resetPaid' && req.session.loggedIn.type == 'Admin') {
    //console.log('I am doing paid');

    tbl_racers
      .update({ paid: 'no' }, { where: { paid: 'yes' } })
      .then(result => {
        res.status(200);
        res.send({ resetPaid: true });
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  } else if (
    actionType == 'input' &&
    (req.session.loggedIn.type == 'Admin' || req.session.loggedIn.type == 'Volunteer')
  ) {
    //console.log('im here');
    tbl_results
      .create(req.body)
      .then(result => {
        res.status(200);
        res.send([{ created: true }, result.id]);
      })
      .catch(err => {
        res.status(500);
        res.send({ error: err });
        throw err;
      });
  }
});

app.post('/login/unlock', (req, res) => {
  //sanitize form inputs
  let username = req.sanitize(req.body.username);
  let password = req.sanitize(req.body.password);

  /*
    example of 'raw' query
    sequelize.query("SELECT * from tbl_users WHERE username").then(user => {
        //console.log(user);
    });
    */

  //first, query for entered user
  tbl_users
    .find({ where: { username: username } })
    .then(user => {
      //this will take the hashed password that was retrieved from the query
      return { type: user.type, password: user.password, username: user.username, racerID: user.racerID };
    })
    .then(user => {
      //bcrypt will compare the retrieved password with the password that the user entered
      bcrypt.compare(password, user.password, function(err, result) {
        if (result) {
          //if the user is successful, send a success code
          delete user.password;
          req.session.loggedIn = user;
          //console.log(req.session.loggedIn);
          res.status(200);
          res.send(user);
        } else {
          //if the user is unsuccessful, send an unauthorized code
          res.status(401);
          res.send({ loggedIn: false });
        }
      });
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

// -------------------------------------------------------- PUT REQUESTS

app.put('/racers/:type', (req, res) => {
  if (
    req.session.loggedIn.type == 'Admin' ||
    (req.body.id == req.session.loggedIn.racerID || req.body.belongsTo == req.session.loggedIn.racerID)
  ) {
    let actionType = req.params.type;
    let racer = req.body;
    ////console.log(racer);

    //Check action type
    if (actionType == 'edit') {
      //Logic to determine what kind of racer is editing here, and do they have permissions?
      //Condition 1: Parent Racer (Is the session's racerID matching up with the racer's ID through PUT?)
      //Condition 2: Child Racer (Is the session's racerID matching up with tthe racer's belongsTo through PUT?)
      //Condition 3: Admin (Is an admin user logged in?)

      //console.log('racer');
      //console.log(racer);
      //console.log('testing: ' + req.session.loggedIn.racerID == racer.belongsTo);

      if (
        req.session.loggedIn.racerID == racer.id ||
        req.session.loggedIn.racerID == racer.belongsTo ||
        req.session.loggedIn.type == 'Admin'
      ) {
        racer.firstName = req.body.sanitize(racer.firstName);
        racer.lastName = req.body.sanitize(racer.lastName);
        racer.phoneNum = req.body.sanitize(racer.phoneNum);
        racer.address = req.body.sanitize(racer.address);
        racer.city = req.body.sanitize(racer.city);
        racer.plateNum = req.body.sanitize(racer.plateNum);
        racer.sex = req.body.sanitize(racer.sex);
        racer.category = req.body.sanitize(racer.category);
        tbl_racers
          .update(
            {
              firstName: racer.firstName,
              lastName: racer.lastName,
              phoneNum: racer.phoneNum,
              address: racer.address,
              city: racer.city,
              belongsTo: racer.belongsTo,
              sex: racer.sex,
              category: racer.category
            },
            { where: { id: racer.id } }
          )
          .then(result => {
            res.status(200);
            res.send({ updated: true });
          })
          .catch(err => {
            res.status(500);
            res.send({ error: err });
            throw err;
          });
      } else {
        res.status(401);
        res.send({ error: 'Unauthorized access' });
      }
    } else {
      res.status(401);
      res.send({ error: 'Unauthorized access' });
    }
  }
});

// Reset password for user
app.post('/admin/resetpass', (req, res) => {
  if (req.session.loggedIn.type == 'Admin') {
    const user = req.body.user;

    // Hash the admin password
    bcrypt.hash(req.body.password, 10, (err, hash) => {
      if (err) {
        throw err;
      } else {
        req.body.password = hash;

        tbl_users
          .update(
            {
              password: req.body.password
            },
            { where: { username: user } }
          )
          .then(result => {
            res.status(200);
            res.send({ resetPass: true });
          })
          .catch(err => {
            res.status(500);
            res.send({ error: err });
            throw err;
          });
      }
    });
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

// Add points for Racer
app.post('/admin/addpoints', (req, res) => {
  //console.log(req);
  const plateNumber = req.body.plate;
  const points = req.body.points;

  tbl_racers
    .update(
      {
        totalPoints: sequelize.literal('totalPoints + ' + points)
      },
      { where: { plateNum: plateNumber } }
    )
    .then(result => {
      res.status(200);
      res.send({ pointsAdded: true });
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

app.post('/admin/setPaid', (req, res) => {
  //console.log(req);
  const ids = req.body;

  tbl_racers
    .update(
      {
        paid: 'yes'
      },
      { where: { id: ids } }
    )
    .then(result => {
      res.status(200);
      res.send({ familyPaid: true });
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

// -------------------------------------------------------- DELETE REQUESTS

app.delete('/racers/:id/delete', (req, res) => {
  let racerID = req.params.id;

  //Only Admins can delete Racers
  if (req.session.loggedIn.type == 'Admin') {
    //Determine racer type before deleting
    tbl_racers.findOne({ where: { id: racerID } }).then(racer => {
      //If the racer type is a Parent, then the accounts will be orphaned, which can't happen
      //What I do first is delete all the children and THEN delete the parent
      //On the client side, there is a confirmation and this is made crystal clear that this will batch delete everything

      if (racer.type == 'Parent') {
        //Destroy all child models first
        tbl_racers
          .destroy({ where: { belongsTo: racerID } })
          .then(result => {
            //Destroy parent
            tbl_racers
              .destroy({ where: { id: racerID } })
              .then(result => {
                res.status(200);
                res.send({ destroyed: result });
              })
              .catch(err => {
                res.status(500);
                res.send({ error: err });
                throw err;
              });
          })
          .catch(err => {
            res.status(500);
            res.send({ error: err });
            throw err;
          });

        //In the event that this is NOT a Parent racer
        //Delete the child
      } else {
        tbl_racers
          .destroy({ where: { id: racerID } })
          .then(result => {
            res.send({ destroyed: result });
            res.status(200);
          })
          .catch(err => {
            res.status(500);
            res.send({ error: err });
            throw err;
          });
      }
    });
  } else {
    res.status(401);
    res.send({ error: 'Unauthorized access' });
  }
});

app.delete('/results/delete/:id', (req, res) => {
  let resultsID = req.params.id;

  tbl_results
    .destroy({ where: { id: resultsID } })
    .then(result => {
      res.status(200);
      res.send({ deleted: true });
    })
    .catch(err => {
      res.status(500);
      res.send({ error: err });
      throw err;
    });
});

app.listen(port, () => console.log(`Listening on port ${port}`));
