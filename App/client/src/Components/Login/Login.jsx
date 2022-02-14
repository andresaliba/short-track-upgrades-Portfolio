import React from "react";
import Nav from "../Nav/Nav";
import { useState } from "react";

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
    <div className="Login">
      <Nav />
      <div className="pt-5">
        <div className="container">
          <h1 className="display-1 text-center">Welcome back!</h1>
          <div className="row">
            <div className="col d-flex justify-content-center pt-5">
              <form className="w-50" onSubmit={handleLogin}>
                <div className="form-group">
                  <label for="username">Username</label>
                  <input
                    class="form-control"
                    type="text"
                    name="username"
                    value={username}
                    onChange={(e) => {
                      setUsername(e.target.value);
                    }}
                  />
                </div>
                <div className="form=group">
                  <label for="password">Password</label>
                  <input
                    class="form-control"
                    type="password"
                    name="password"
                    value={password}
                    onChange={(e) => {
                      setPassword(e.target.value);
                    }}
                  />
                </div>
                <div className="form-group">
                  {/* <label for="passConfirm">Confirm Password</label> */}
                  {/* <input
                    class="form-control"
                    type="password"
                    name="passConfirm"
                    value={passConfirm}
                    onChange={(e) => {
                      setPassConfirm(e.target.value);
                    }}
                  /> */}
                  <button>Forgot your password?</button>
                  {/* <a href="#">Forgot your password?</a> */}
                </div>
                <div className="mx-auto text-center">
                  <input
                    type="submit"
                    className="btn btn-primary mt-3"
                    value="Login"
                  />
                </div>
                <div className="mx-auto text-center mt-3">
                  <button>Need help?</button>
                  {/* <a href="#">Need help?</a> */}
                </div>
              </form>
              <div>{authToken ? authToken : null}</div>
            </div>
          </div>
        </div>
      </div>
      {/* <div className="container fixed-bottom pb-3">
        <div className="row">
          <div className="col">
            <div className="mx-auto text-center">
              <img style={{width: 150, height: 100}} src={TruroFlag} alt="flag of truro connection" />
              <img style={{width: 150}} src={ColchesterFlag} alt="flag of colchester county" />
              <img style={{width: 150}} src={Railyard} alt="flag of the railyard" />
            </div>
          </div>
        </div>
      </div> */}
    </div>
  );
};

export default Login;
