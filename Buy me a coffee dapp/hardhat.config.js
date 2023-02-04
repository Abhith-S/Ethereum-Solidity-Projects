// hardhat.config.js
//in this file we can set which network to deploy to, what wallet to use etc
require("@nomiclabs/hardhat-ethers");
//require("@nomiclabs/hardhat-waffle");

//for keeping our secrets secret
require("dotenv").config()

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

//we are using these as variables to keep them private
const GOERLI_URL = process.env.GOERLI_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: GOERLI_URL,
      accounts: [PRIVATE_KEY]
    }
  }
};
