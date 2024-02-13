import hre from "hardhat";
import dotenv from "dotenv";
async function main() {
  const SwapRouterMumbai = "0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45";
  const lock = await hre.ethers.deployContract("Avex", [SwapRouterMumbai]);

  await lock.waitForDeployment();
  console.log(lock.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
