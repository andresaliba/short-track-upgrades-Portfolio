import React from "react";
import { Link } from "react-router-dom";
import logo from "../images/CSTLogo.png";

const Nav = () => {
  return (
    <div>
      <div className="container-fluid">
        <div className="row">
          <div className="col">
            <img className="p-3" src={logo} alt="tire track logo" />
          </div>
          <div className="col-2 align-self-center text-center">
            <div className="row">
              <div className="col">
                <Link to="/login">
                  <h3>Log In</h3>
                </Link>
              </div>
              <div className="col">
                <Link to="/signup">
                  <h3>Sign Up</h3>
                </Link>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Nav;