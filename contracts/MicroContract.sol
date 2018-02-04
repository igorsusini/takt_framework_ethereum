pragma solidity ^0.4.0;

import "browser/QueueContract.sol";

contract MicroContract {

  string private name;

  enum EnumMicroContractState { Sleeping, Planned, Active, InProgress, Completed }

  EnumMicroContractState private microContractState;

  struct QueueOriginQtd {
    QueueContract queueOrigin;
    uint qtdToTake;
  }

  QueueOriginQtd[] private queueOriginQtdPerUint;

  mapping (address => QueueOriginQtd) private queueOriginQtdPerAddr;

  QueueContract private queueDestiny; 
  
  address private teamAddress;
 
  uint private qtdTotalPlanned; 
  uint private qtdTotalActive;
  uint private qtdTotalInProgress;
  uint private qtdTotalCompleted;
  
  function MicroContract(string nameConstr, address[] queueAddressConstr, uint[] qtd, address addQueueDestinyConstr) public {
    
    name = nameConstr;
    
    microContractState = EnumMicroContractState.Sleeping;
    
    for (uint n = 0; n < queueAddressConstr.length; n++) { 

      queueOriginQtdPerUint.push(QueueOriginQtd({
                queueOrigin: QueueContract(queueAddressConstr[n]),
                qtdToTake: qtd[n]
            }));
      
      queueOriginQtdPerAddr[queueAddressConstr[n]] = queueOriginQtdPerUint[n];
    }
    
    queueDestiny = QueueContract(addQueueDestinyConstr); 
    
    qtdTotalActive = 0;
    qtdTotalCompleted = 0;
    qtdTotalInProgress = 0;
    qtdTotalCompleted = 0;
  }

  function getName() public returns (string) {
      return name;
  }

  function setName(string nameToSet) public {
    name = nameToSet;
  }
  
   function getState() public returns (EnumMicroContractState) {
    return microContractState;
  }

  function getQtdTotalPlanned() public returns (uint) {
    return qtdTotalPlanned;
  }

  function getQtdTotalActive() public returns (uint) {
    return qtdTotalActive;
  }

  function getQtdTotalInProgress() public returns (uint) {
    return qtdTotalInProgress;
  }

  function getQtdTotalCompleted() public returns (uint) {
    return qtdTotalCompleted;
  }

  //this is a public function that returns nothing. It just change the micro contract state. The word public bellow is not compulsory.
  function awakeMicroContract() public {
    microContractState = EnumMicroContractState.Planned;
  }

  function turnContractActive() public {
    microContractState = EnumMicroContractState.Active;
  }

  //LUB Action
  function takeItemsFromQueues() public {

    for (uint n = 0; n < queueOriginQtdPerUint.length; n++) {
          queueOriginQtdPerUint[n].queueOrigin.decreaseQtd(queueOriginQtdPerUint[n].qtdToTake);
    }
    
    qtdTotalInProgress++;
    microContractState = EnumMicroContractState.InProgress;
    
  }

  //DUB Action
  function concludeProduction() public returns (string) {
  
   if (qtdTotalInProgress == 0) {
        return;
    }
    
    qtdTotalInProgress--;
    qtdTotalCompleted++;
    
    queueDestiny.increaseQtd;

    if (qtdTotalInProgress == 0) {
      microContractState = EnumMicroContractState.Completed;
    } 

  }
}