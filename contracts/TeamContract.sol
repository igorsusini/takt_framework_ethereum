pragma solidity ^0.4.0;

contract TeamContract {

  string private name;

  string private description;

  address[] private accountList;

  function TeamContract (string nameConstr, string descriptionConstr, address[] accountListConstr) {
    name = nameConstr;
    description = descriptionConstr;
    accountList = accountListConstr;
  }

  function getName() public returns (string) {
      return name;
  }

  function getDescription() public returns (string) {
    return description; 
  }

  function setName(string nameToSet) public {
    name = nameToSet;
  }

  function setDescription (string descriptionToSet) public {
    description = descriptionToSet;
  }

}