pragma solidity ^0.4.23;

// import { HealthcareStorage } from "./HealthcareStorage.sol";

// Logic contract - Upgradeable
contract HealthcareLogic {
  struct User{
    uint8  age;
    string name;
    string history;
  }

  mapping (address => User) public userData;

  function writeData(uint8 _age, string _name, string _history) public returns (bool) {
    User memory newData = User({age: _age, name: _name, history: _history});
    userData[msg.sender] = newData;

    return true;
  }

  function readData(address _patient) public returns (string) {
    User memory data =  userData[_patient];
    return data.history;
  }
}
