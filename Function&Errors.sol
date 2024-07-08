// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    address public owner;
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

  error InsufficientBalance(uint balance, uint withdrawlAmount);

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
