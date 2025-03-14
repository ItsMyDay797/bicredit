require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.28",
};

require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
    solidity: "0.8.20",
    networks: {
        sepolia: {
            url: `https://sepolia.infura.io/v3/391a0680ed984e7c9418d0a0945e587f`,
            accounts: [process.env.PRIVATE_KEY]
        }
    }
};

