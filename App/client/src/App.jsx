import React from "react";
import { Route, Routes } from "react-router-dom";
import "./App.scss";
import Home from "./Home";
import Dashboard from "./Dashboard";
import Login from "./Login";

const App = () => {
  return (
    <div>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/login" element={<Login />} />
      </Routes>
    </div>
  );
};

export default App;
