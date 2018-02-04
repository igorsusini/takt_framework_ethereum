pragma solidity ^0.4.0;

contract QueueContract {
 
  string private name; 

  string private description; 

  address private itemAddress;

  uint private qtd;

  function QueueContract(string queueNameConstr, string descriptionConstr, address itemAddressConstr, uint qtoConstr) public {   
    name = queueNameConstr;
    description = descriptionConstr;
    itemAddress = itemAddressConstr;
    qtd = qtoConstr;
  }

  function getName() public returns (string) {
    return name;
  } 

  function getDescription() public returns (string) {
    return description;
  }

  function getItemAddress() public returns (address) {
    return itemAddress;
  }

  function getQtd() public returns (uint) {
    return qtd;
  } 

  function setName(string nameToSet) public {
    name = nameToSet;
  }

  function setDescription(string descriptionToSet) public {
    description = descriptionToSet;
  }

  function setItemAddress(address itemAddressToSet) public {
    itemAddress = itemAddressToSet;
  }

  function increaseQtd(uint qtdParameter) public {
    qtd = qtd + qtdParameter;
    //alertDestinyAddressToProduce(destinyAddress);
  }
  
  function decreaseQtd(uint qtdParameter) public {
    qtd = qtd - qtdParameter;
  }

}