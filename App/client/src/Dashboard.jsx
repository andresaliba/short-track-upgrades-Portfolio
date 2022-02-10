import React, { useEffect } from "react";

const Dashboard = (props) => {
  const { authToken } = props;

  useEffect(() => {}, []);

  return (
    <div>
      <h1>Dashboard</h1>
      <h2>You have to be logged in to see this!</h2>
    </div>
  );
};

export default Dashboard;
