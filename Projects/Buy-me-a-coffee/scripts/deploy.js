// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.


//we use this file to deploy the contarct
const hre = require("hardhat");

async function main() {
  
  //load the contratc
  const BuyMeACoffee = await hre.ethers.getContractFactory("BuyMeACoffee");
  //create the contarct instance , it calls the factory and starts deploy
  const buyMeACoffee = await BuyMeACoffee.deploy();

  // Deploy the contract., wait until actually deployed
  await buyMeACoffee.deployed();
  console.log("BuyMeACoffee deployed to:", buyMeACoffee.address);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
