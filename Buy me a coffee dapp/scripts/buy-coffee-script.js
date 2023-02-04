//script to checkout contract working in local blockchain

//get hardhat
const hre = require("hardhat");

// Returns the Ether balance of a given address.
//this function is from hardhat
async function getBalance(address) {
  const balance = await hre.ethers.provider.getBalance(address);

  //convert the balamce in wei to ether
  return hre.ethers.utils.formatEther(balance);
}

// Logs the Ether balances for a  list of addresses.
//this is also provided by hardhat
//takes in an array of addresses
async function printBalances(addresses) {
  let i = 0;
  for (const address of addresses) {
    console.log(`Address ${i} balance: `, await getBalance(address));
    i++;
  }
}

// Logs the memos stored on-chain from coffee purchases.
async function printMemos(memos) {
  for (const memo of memos) {
    const timestamp = memo.timestamp;
    const tipper = memo.name;
    const tipperAddress = memo.senderAddress;
    const message = memo.message;
    const amount = hre.ethers.utils.formatEther(memo.amount);
    console.log(`At ${timestamp}, ${tipper} (${tipperAddress}) said: "${message}" and tipped ${amount} ETH`);
  }
}

async function main() {
  // get the accounts
  const [owner, tipper, tipper2, tipper3] = await hre.ethers.getSigners();

  //load the contratc
  const BuyMeACoffee = await hre.ethers.getContractFactory("BuyMeACoffee");
  //create the contarct instance , it calls the factory and starts deploy
  const buyMeACoffee = await BuyMeACoffee.deploy();

  // Deploy the contract., wait until actually deployed
  await buyMeACoffee.deployed();
  console.log("BuyMeACoffee deployed to:", buyMeACoffee.address);

  // Check balances before the coffee purchase.
  //store the addresses into an addresses array and pass it to function
  //getting address of owner , tipper and contract address
  const addresses = [owner.address, tipper.address, tipper2.address, tipper3.address, buyMeACoffee.address];
  console.log("== start ==");
  await printBalances(addresses);


  // Buy the owner a few coffees

  //set a tip vlaue in ether
  const tip = {value: hre.ethers.utils.parseEther("1")};

  //connecting to smart contract using account and calling buyCoffee() function
  //imn solidity fn call there is an option to add an optional array so we add 'tip' there with tip value
  await buyMeACoffee.connect(tipper).buyCoffee("John Rambo", "You're the best!", tip);
  await buyMeACoffee.connect(tipper2).buyCoffee("Jon Snow", "Amazing teacher", tip);
  await buyMeACoffee.connect(tipper3).buyCoffee("John Doe", "You rock", tip);

  // Check balances after the coffee purchase.
  console.log("== bought coffee ==");
  await printBalances(addresses);

  // Withdraw
  //anyone can call it , we r just using owner
  await buyMeACoffee.connect(owner).withdrawTips();

  // Check balances after withdrawal.
  console.log("== withdrawTips ==");
  await printBalances(addresses);

  // Check out the memos.
  console.log("== memos ==");
  const memos = await buyMeACoffee.getMemos();
  printMemos(memos);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
