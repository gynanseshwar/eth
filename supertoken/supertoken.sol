
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SuperToken {
  string public tokenName;
  uint256 public totalTokens;

  mapping(address => uint256) public tokenHoldings;

  constructor(string memory _name, uint256 _initialTokens) {
    tokenName = _name;
    totalTokens = _initialTokens;
    tokenHoldings[msg.sender] = _initialTokens;
  }

  function Mint (address _receiver, uint256 _amount) public {
    require(_amount > 0, "Amount must be greater than zero");
    totalTokens += _amount;
    tokenHoldings[_receiver] += _amount;
  }

  function  Burn (uint256 _amount) public {
    require(_amount > 0, "Amount must be greater than zero");
    require(tokenHoldings[msg.sender] >= _amount, "Insufficient token holdings");
    totalTokens -= _amount;
    tokenHoldings[msg.sender] -= _amount;
  }
}
