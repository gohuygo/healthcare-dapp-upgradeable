pragma solidity ^0.4.23;

// Storage contract
contract HealthcareStorage {
  struct User{
    uint8  age;
    string name;
    string history;
  }

  mapping (address => User) public userData;
  address public contractFunctions;
  address public owner;

  constructor(address _contractFunctions) public {
    contractFunctions = _contractFunctions;
    owner = msg.sender;
  }

  function updateContract(address _newAddress) public returns (bool) {
    require(msg.sender == owner);
    contractFunctions = _newAddress;

    return true;
  }


  function writeData(uint8 _age, string _name, string _history) public {
    contractFunctions.delegatecall(bytes4(keccak256("writeData(uint8,string,string,address)",_age,_name,_history,msg.sender)));
  }

  function readData(address _patient) public returns (string) {
    return contractFunctions.delegatecall(bytes4(keccak256("readData(address)",_patient)));
  }
}
