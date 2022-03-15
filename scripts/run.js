const main = async () => {
  //Create "Fake Users" to test our contract
  const [owner, randomPerson] = await hre.ethers.getSigners();

  const jukeBoxContractFactory = await hre.ethers.getContractFactory("JukeBox");
  const jukeBoxContract = await jukeBoxContractFactory.deploy();
  await jukeBoxContract.deployed();
  console.log("Contract deployed to:", jukeBoxContract.address);
  console.log("Contract Owner:", owner.address);

  let message = "test";
  let jukeBoxHistory;
  jukeBoxHistory = await jukeBoxContract.getJukeBoxData();

  let jukeBoxPlayerTxn;
  jukeBoxPlayerTxn = await jukeBoxContract.jukeBoxPlay(message);
  await jukeBoxPlayerTxn.wait();

  jukeBoxHistory = await jukeBoxContract.getJukeBoxData();
};

const runMain = async () => {
  try {
    await main();
    process.exit(0); // exit Node process without error
  } catch (error) {
    console.log(error);
    process.exit(1); // exit Node process while indicating 'Uncaught Fatal Exception' error
  }
  // Read more about Node exit ('process.exit(num)') status codes here: https://stackoverflow.com/a/47163396/7974948
};

runMain();
