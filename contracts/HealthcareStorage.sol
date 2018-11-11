pragma solidity ^0.4.23;

// Storage contract
contract HealthcareStorage {
  struct User{
    uint8  age;
    string name;
    string history;
  }

  mapping (address => User) public userData;
  address public logicContract;
  address public owner;

  constructor(address _logicContract) public {
    logicContract = _logicContract;
    owner = msg.sender;
  }

  function updateContract(address _newAddress) public returns (bool) {
    require(msg.sender == owner);
    logicContract = _newAddress;

    return true;
  }


  function writeData(uint8 _age, string _name, string _history) public {
    logicContract.delegatecall(bytes4(keccak256("writeData(uint8,string,string)")), _age, _name, _history);
  }

  function readData(address _patient) public  {
    logicContract.delegatecall(bytes4(keccak256("readData(address)")), _patient);
  }
}
