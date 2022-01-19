pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {
  string public purpose = "Building Unstoppable Apps!!!";
  mapping(address => string) private messages;

  // this is an error handler
  //error EmptyPurposeError(uint code, string message);

  constructor() {
    // what should we do on deploy?
  }

  // this is an event for the function below
  event SetPurpose(address sender, string purpose);
  event NewMessage(address sender, string newMessage);

  function setPurpose(string memory newPurpose) public payable {
    purpose = newPurpose;
    console.log(msg.sender, "set purpose to", purpose);
    emit SetPurpose(msg.sender, purpose);
  }

  function addMessage(string memory _newMessage) external {
    messages[msg.sender] = _newMessage;
    console.log(msg.sender, "added a new message ", _newMessage);
    emit NewMessage(msg.sender, _newMessage);
  }
}
