# Project Title  
Solidity Functions and Error Handling

## Problem Statement
write a smart contract that implements the require(), assert() and revert() statements.

## Description  
The smart contract demonstrates the use of require(), assert(), and revert() statements. 

**Mint Function:**
Increases totalSupply and updates the balance of the specified address. Can only be called by the owner.

**Burn Function:**
Decreases totalSupply and updates the balance of the specified address. Reverts with a custom error if the balance is insufficient. Can only be called by the owner.

**Transfer Function:**
Transfers tokens from the caller's address to another address. Uses require() to ensure the sender has enough balance.

## Getting Started

### Installing  
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., HelloWorld.sol). Copy and paste the following code into the file:
```javascript
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyToken {
    address public owner;

// Constructor to set the contract deployer as the owner
   
    constructor(){
        owner = msg.sender;
    }

//public variables
 
  string public name = "Sunidhi";
  string public abbrv = "SUNN";
  uint public total_supply = 0;
  mapping(address => uint)public balances;

//events
 
  event Mint(address indexed to, uint amount);
  event Burn(address indexed from, uint amount);
  event Transfer(address indexed from, address indexed to, uint amount );

// Custom error
 
  error InsufficientBalance(uint balance, uint withdrawlAmount);

// Modifier to restrict access to the owner
   
modifier onlyOwner{
    assert(msg.sender == owner);
    _;
}

// mint function

function mint(address a_address, uint v_value) public onlyOwner{
     total_supply += v_value;
        balances[a_address] +=v_value;
        emit Mint(a_address, v_value);
}

// burn function

function burn(address a_address, uint v_value) public onlyOwner{
    if(balances[a_address] <= v_value){
        revert InsufficientBalance({balance: balances[a_address], withdrawlAmount: v_value});
    } else{
         total_supply -= v_value;
           balances[a_address] -= v_value;
           emit Burn(a_address, v_value);
    }          
}

// transfer function

function transfer(address r_reciever, uint v_value) public {
    require(balances[msg.sender]>= v_value, "Account balance must be greater than transfered value");
    balances[msg.sender] -= v_value;
    balances[r_reciever] += v_value;
    emit Transfer(msg.sender, r_reciever, v_value);
}
}
```
## Executing program    
### How to Run the Program      
Navigate to the project directory  
Compile the Solidity contract  
Deploy the contract using your preferred Ethereum development environment   

#### For Remix:    
Open Remix IDE.  
Upload Function&Errors.sol.  
Compile and deploy the contract.  


## Authors  
Sunidhi Singh @Sunidhi2430

## License  
This project is licensed under the MIT License - see the LICENSE.md file for details.  

We have established a solidity contract with this code. 

