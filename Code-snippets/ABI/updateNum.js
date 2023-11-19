//script file to get the value of num from ABITest contract and also update it

(async ()=> {

    //address of ABITest contract
    const address = "paste Contract address here";

    //paste the abi from the contract
    const abiArray = //paste abi here

    const contractInstance = new web3.eth.Contract(abiArray, address);

    //get the methods in abiArray
    console.log(await contractInstance.methods.num().call());

    //get the accounts
    let accounts = await web3.eth.getAccounts();

    //overrite num
    let txResult = await contractInstance.methods.changeNum(300).send({from : accounts[0]});

    console.log(await contractInstance.methods.num().call());

    console.log(txResult);

})()
