import { useState } from "react";
import React from "react";
import { Route, Routes } from "react-router-dom";
import "./App.scss";
import Home from "./Home";
import Dashboard from "./Dashboard";
import Login from "./Login";

const App = () => {
  const [authToken, setAuthToken] = useState(null);

  return (
    <div>
      a
      <Routes>
        <Route path="/" element={<Home />} />
        <Route
          path="/dashboard"
          element={<Dashboard authToken={authToken} />}
        />
        <Route
          path="/login"
          element={<Login authToken={authToken} setAuthToken={setAuthToken} />}
        />
      </Routes>
    </div>
  );
};

export default App;
