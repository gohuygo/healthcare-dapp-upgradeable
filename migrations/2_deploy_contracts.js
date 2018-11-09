var Healthcare = artifacts.require("./Healthcare.sol");
var HealthcareHandler = artifacts.require("./HealthcareHandler.sol");

module.exports = function(deployer) {
  deployer.deploy(Healthcare);

  deployer.deploy(HealthcareHandler, Healthcare.address());
};
