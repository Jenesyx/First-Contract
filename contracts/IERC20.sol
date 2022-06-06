// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// IERC20

interface IERC20 {
    
    // Functions //
    // return total Supply
    function totalSupply () external view returns(uint256);

    // return balance token of address account
    function balanceOf (address account) external view returns(uint256);

    
    // transfer from msg.sender to  (address to)
    function transfer (address to, uint256 amount) external view returns(bool); // return true if address and amount are correct 
    
    // function allowance
    function allowance ( address owner, address spender) external view returns(uint256);

    // function approve
    function approve (address spender, uint256 amount) external view returns(bool);
    
    // function transfer from
    function trasferfrom (
        address from,
        address to,
        uint256 amount
    ) external view returns(bool); // return true if transfer was done


    // Events //

    // Transfer
    event Transfer (address indexed from, address indexed to, uint256 value);

    // event arpproval
    event arpprovall (address indexed owner, address indexed spender, uint256 value);
}



