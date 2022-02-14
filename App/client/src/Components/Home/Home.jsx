import Nav from '../Nav/Nav';
import Footer from '../Footer/Footer';
import { Link } from 'react-router-dom';
import { useState } from 'react';

const Home = () => {
  return (
    <div className="Home">
      {/* Navegation Bar */}
      <Nav />

      <div className="container-fluid">
        <div className="row">
          <div className="col">
            Colchester Short Track
            <p>Volunteer group in Truro,NS</p>
            <button className="btn btn-warning">2021 Results</button>
          </div>

          <div className="col">
            <h1>Race Categories</h1>
            <p>Run Bikes</p>
            <p>Grade 1 and Under </p>
            <p>Grade 1 School</p>
            <p>Grade 2 to 9</p>
            <p>Grade 10 or Older - Adult</p>
            <p>Run</p>
          </div>

          <div className="col"></div>
          <div className="col">
            <button className="btn btn-primary">2022 Seanson Details</button>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
};

export default Home;
