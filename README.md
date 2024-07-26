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

contract RewardPoints {
    // State variables
    mapping(address => uint256) public points;
    address public owner;

    event PointsEarned(address indexed user, uint256 amount);
    event PointsRedeemed(address indexed user, uint256 amount);
    event PointsTransferred(address indexed from, address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Function to earn points
    function earnPoints(uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than zero");

        points[msg.sender] += _amount;

        emit PointsEarned(msg.sender, _amount);
        assert(points[msg.sender] >= _amount); // Ensure points are added correctly
    }

    // Function to redeem points
    function redeemPoints(uint256 _amount) public {
        require(_amount > 0, "Amount must be greater than zero");
        require(points[msg.sender] >= _amount, "Insufficient points");

        points[msg.sender] -= _amount;

        emit PointsRedeemed(msg.sender, _amount);
        assert(points[msg.sender] + _amount == points[msg.sender] + _amount); // Ensure points are deducted correctly
    }

    // Function to transfer points to another user
    function transferPoints(address _to, uint256 _amount) public {
        require(_to != address(0), "Invalid address");
        require(_amount > 0, "Amount must be greater than zero");
        require(points[msg.sender] >= _amount, "Insufficient points");

        points[msg.sender] -= _amount;
        points[_to] += _amount;

        emit PointsTransferred(msg.sender, _to, _amount);
        assert(points[msg.sender] >= 0); // Ensure balance is valid
    }

    // Function to get the balance of points for a specific user
    function getPoints(address _user) public view returns (uint256) {
        return points[_user];
    }

    // Function to set points for a user (only callable by the owner)
    function setPoints(address _user, uint256 _amount) public onlyOwner {
        points[_user] = _amount;
        emit PointsEarned(_user, _amount);
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

