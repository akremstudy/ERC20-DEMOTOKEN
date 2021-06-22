// SPDX-License-Identifier: MIT

pragma solidity ^0.5.0;

import "OpenZeppelin/openzeppelin-contracts@2.5.0/contracts/token/ERC20/ERC20Detailed.sol";
import "OpenZeppelin/openzeppelin-contracts@2.5.0/contracts/token/ERC20/ERC20.sol";
import "OpenZeppelin/openzeppelin-contracts@2.5.0/contracts/token/ERC20/ERC20Mintable.sol";
import "OpenZeppelin/openzeppelin-contracts@2.5.0/contracts/ownership/Ownable.sol";
import "OpenZeppelin/openzeppelin-contracts@2.5.0/contracts/math/SafeMath.sol";


contract DemoToken is ERC20, ERC20Detailed, ERC20Mintable, Ownable {
    using SafeMath for uint;


    address payable owner_address = msg.sender;
    uint initial_supply = 1e23;
    uint256 public lastClaimedAt;
    

    constructor() 
    ERC20Detailed("DemoToken", "DT", 18) 
    public {
        mint(owner_address, initial_supply);
        lastClaimedAt=block.timestamp;
        
    }
    function claimed() external view returns (uint256){
        return block.timestamp.sub(lastClaimedAt).mul(1e18).div(3600);
        
    }

    function claim() public payable onlyOwner {
        uint256 hours_passed=block.timestamp.sub(lastClaimedAt).mul(1e18).div(3600);
        _mint(owner_address, hours_passed);
        lastClaimedAt=block.timestamp;
    }
    
    
}