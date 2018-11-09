pragma solidity ^0.4.23;

import { HealthcareHandler } from "./HealthcareHandler.sol";

// Logic contract - Upgradeable
contract Healthcare {
  function writeData(uint8 _age, string _name, string _history, address _sender) public returns (bool) {
    HealthcareHandler.User memory newData = HealthcareHandler.User(_age, _name, _history);
    HealthcareHandler.userData[_sender] = newData;

    return true;
  }

  function readData(address _patient) public returns (string) {
    return HealthcareHandler.userData[_patient].history;
  }
}
