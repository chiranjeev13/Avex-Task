// SPDX-License-Identifier: MIT-LICENSE
pragma solidity 0.7.6;
pragma abicoder v2;

import "../contracts/IUniswapV3Pool.sol";

import "../contracts/IWNative.sol";

contract Avex {
  IV3SwapRouter public immutable swapRouter;
  

  constructor(IV3SwapRouter _swapRouter) {
    swapRouter = _swapRouter;
  }

  address wmatic = 0x9c3C9283D3e44854697Cd22D3Faa240Cfb032889;
  address USDC = 0xe6b8a5CF854791412c1f6EFC7CAf629f5Df1c747;

  function maticToUSDC(uint256 val) public payable returns (uint256 amountOut) {
    IWNative(wmatic).deposit{value: msg.value}();
    IWNative(wmatic).approve(address(swapRouter), msg.value);
    require(msg.value >= 0.1 ether, "Minmum Fee is 0.1 MATIC");

    IV3SwapRouter.ExactInputSingleParams memory params = IV3SwapRouter
      .ExactInputSingleParams({
        tokenIn: wmatic,
        tokenOut: USDC,
        fee: 3000,
        recipient: msg.sender,
        amountIn: msg.value,
        amountOutMinimum: 0,
        sqrtPriceLimitX96: 0
      });

    amountOut = IV3SwapRouter(swapRouter).exactInputSingle(params);
    return amountOut;
  }
}
