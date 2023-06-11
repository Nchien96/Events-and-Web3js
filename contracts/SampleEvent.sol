//SPDX-License0Identifier : none
pragma solidity 0.8.19;

contract eventExample {
  mapping (address => uint) public tokenBalance;
  event tokensSent(address _from, address _to, uint _amount);

  constructor(){
    tokenBalance[msg.sender] = 100;
  }

  function sendToken(address _to,uint _amount) public returns(bool) {
    require(tokenBalance[msg.sender] >= _amount,"Not enough tokens");
    tokenBalance[msg.sender] -= _amount;
    tokenBalance[_to] += _amount;
    emit tokensSent(msg.sender, _to, _amount);

    return true;
  }
}