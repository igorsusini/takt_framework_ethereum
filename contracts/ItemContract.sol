pragma solidity ^0.4.0;

contract ItemContract {
 
  string private name; 

  string private description;

  function ItemContract(string nameConstr, string descriptionConstr) public {   
    name = nameConstr;
    description = descriptionConstr;
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

  function setDescription(string descriptionToSet) public {
    description = descriptionToSet;
  }

}