import { useState } from "react";
import React from "react";

const Login = (props) => {
  const { authToken, setAuthToken } = props;
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [passConfirm, setPassConfirm] = useState("");

  const handleLogin = async (e) => {
    e.preventDefault();
    if (password !== passConfirm) {
      alert("Passwords do not match!");
    }

    const res = await fetch("http://localhost:8000/api/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        username,
        password,
      }),
    });

    if (res.status === 200) {
      const { token } = await res.json();
      setAuthToken(token);
    }
  };

  return (
    <div>
      <h1>Login</h1>
      <form onSubmit={handleLogin}>
        <input
          type="text"
          name="username"
          value={username}
          onChange={(e) => {
            setUsername(e.target.value);
          }}
        />
        <input
          type="password"
          name="password"
          value={password}
          onChange={(e) => {
            setPassword(e.target.value);
          }}
        />
        <input
          type="password"
          name="passConfirm"
          value={passConfirm}
          onChange={(e) => {
            setPassConfirm(e.target.value);
          }}
        />
        <input type="submit" value="Login" />
      </form>
      <div>{authToken ? authToken : null}</div>
    </div>
  );
};

export default Login;
