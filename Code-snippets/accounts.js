//use web3.js to see available accounts , its balance 

//use a anonymous async function
(async () => {

    //lets get the available accounts
    let accounts = await web3.eth.getAccounts();
    console.log(accounts, accounts.length);

    //get balance of the accounts
    //default balance is in wei
    let balance = await web3.eth.getBalance(accounts[0]);
    console.log(balance);

    //get the balance of accounts in ether
    let balanceInEther = await web3.utils.fromWei(balance, "ether");
    console.log(balanceInEther);

})()
