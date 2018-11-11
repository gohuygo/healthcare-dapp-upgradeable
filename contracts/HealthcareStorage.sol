pragma solidity ^0.4.23;

// Storage contract
contract HealthcareStorage {
  struct User{
    uint8  age;
    string name;
    string history;
  }

  // TODO: Protect against other contracts trying to update
  mapping (address => User) public userData;

  function writeUserData(uint8 _age, string _name, string _history) public {
    User memory newData = User(_age, _name, _history);
    userData[msg.sender] = newData;
  }

  function readUserData(address _patient) public returns (string) {
    User memory data =  userData[_patient];
    return data.history;
  }

}
