pragma solidity ^0.4.23;

// import { HealthcareStorage } from "./HealthcareStorage.sol";

// Logic contract - Upgradeable
contract HealthcareLogic {
  struct User{
    uint8  age;
    string name;
    string history;
  }

  function writeData(uint8 _age, string _name, string _history, address _sender) public returns (bool) {
    User memory newData = User(_age, _name, _history);
    userData[_sender] = newData;

    return true;
  }

  function readData(address _patient) public returns (string) {
    User memory data =  userData[_patient];
    return data.history;
  }
}
