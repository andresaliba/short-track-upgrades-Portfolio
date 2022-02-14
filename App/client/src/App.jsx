import { useState } from "react";
import { Route, Routes } from "react-router-dom";
import "./App.scss";
import Home from "./Components/Home/Home";
import Login from "./Components/Login/Login";
import Dashboard from "./Components/Dashboard/Dashboard";

const App = () => {
  const [authToken, setAuthToken] = useState(null);

  return (
    <div className="overlay">
      <Routes>
        {/* HOME PAGE  */} 
        <Route path="/" element={<Home authToken={authToken} />} />

        {/* DASHBOARD PAGE */}
        <Route
          path="/dashboard"
          element={<Dashboard authToken={authToken} />}
        />

        {/* LOGIN PAGE */}
        <Route
          path="/login"
          element={<Login authToken={authToken} setAuthToken={setAuthToken} />}
        />
      </Routes>
    </div>
  );
};

export default App;
