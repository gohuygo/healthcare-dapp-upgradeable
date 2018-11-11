pragma solidity ^0.4.23;

import { HealthcareStorage } from "./HealthcareStorage.sol";

// Logic contract - Upgradeable
contract HealthcareLogic {
  address public storageAddress;
  address public owner;

  constructor(address _storageAddress) public {
    storageAddress = _storageAddress;
    owner = msg.sender;
  }

  function updateContract(address _storageAddress) public returns (bool) {
    require(msg.sender == owner);
    storageAddress = _storageAddress;

    return true;
  }


  function writeUserData(uint8 _age, string _name, string _history) public returns (bool){
    address(storageAddress).call(bytes4(keccak256("writeUserData(uint8,string,string)",_age,_name,_history)));
    return true;
  }

  function readUserData(address _patient) public returns (string) {
    return address(storageAddress).call(bytes4(keccak256("readUserData(address)",_patient)));
  }


}
