import React from 'react';
import TruroFlag from "../../images/TownOfTruro.jpeg";
import ColchesterFlag from "../../images/ColchesterCounty.gif";
import Railyard from "../../images/Railyard_Logo.png";

const Footer = () => {
  return (
    <div className='Footer'>
      <div className="container fixed-bottom pb-3">
        <div className="row">
          <div className="col">
            <div className="mx-auto text-center">
              <img
                style={{ width: 150, height: 100 }}
                src={TruroFlag}
                alt="flag of truro connection"
              />
              <img 
                style={{ width: 150 }} 
                src={ColchesterFlag} 
                alt="flag of colchester county" />
              <img 
                style={{ width: 150 }}
                src={Railyard} 
                alt="flag of the railyard" />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Footer;
