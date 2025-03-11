const hre = require("hardhat");

async function main() {
    const LoanContract = await hre.ethers.getContractFactory("LoanContract");
    const loanContract = await LoanContract.deploy();

    await loanContract.waitForDeployment();

    console.log("LoanContract deployed to:", loanContract.target);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
