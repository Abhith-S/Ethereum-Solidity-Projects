import logo from "./logo.svg";
import "./App.css";
import { useState } from "react";
import Web3 from "web3";
import simpleStorage from "./SimpleStorage.json";

function App() {
  const [message, setMessage] = useState("Message from blockchain");
  const [input, setInput] = useState("");

  const web3 = new Web3(window.ethereum);
  const contractInstance = new web3.eth.Contract(
    simpleStorage.abi,
    simpleStorage.networks["11155111"].address
  );

  const retrieve = async () => {
    const result = await contractInstance.methods.retrieve().call();
    setMessage(result);
  };

  const store = async () => {
    const account = await window.ethereum.request({
      method: "eth_requestAccounts",
    });
    const result = await contractInstance.methods
      .store(input)
      .send({ from: account[0], gasLimit: 500000 });
    //console.log(result);
    alert("Success");
  };

  return (
    <div className="App">
      <h1>Simple Storage Dapp</h1>

      <h3>{message}</h3>
      <button onClick={retrieve}>View Message</button>

      <p>Change Message</p>
      <input
        placeholder="Enter new message"
        onChange={(e) => setInput(e.target.value)}
      />
      <button onClick={store}>Change</button>
    </div>
  );
}

export default App;
