pragma solidity 0.7.6;

interface IWNative {
  function deposit() external payable;

  function transfer(address to, uint256 value) external returns (bool);

  function withdraw(uint256) external;

  function balanceOf(address wallet) external returns (uint256);

  function approve(address guy, uint wad) external returns (bool);
}
