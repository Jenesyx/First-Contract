// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";
import "./SafeMath.sol";
import "./Context.sol";
import "./Ownable.sol";

contract ERC20 is Context, Ownable, IERC20 {

    // Mappings //

    // return balance 
    mapping (address => uint256) 
    _balances;

    // allowances
    mapping (address => mapping(address => uint256)) 
    _allowances;

    // Uint //
    uint private _totalsupply; // our max supply(our tokens)
    uint private _decimalse; // until for coin or token

    // Strings //

    string private _name; // name of coin or token
    string private _symbol; // symbol of coin or token

    // Constructor //

    constructor (
        string memory name_,
        string memory symbole_,
        uint totalsupply_,
        uint decimalse_
    )
    {
        _name = name_;
        _symbol = symbole_;
        _totalsupply = totalsupply_;
        _decimalse = decimalse_;
    }

    // Functions views //

    function name 
    () public view virtual 
    returns(string memory) {
        return _name;
    } 

    function symbol 
    () 
    public view virtual
    returns(string memory) {
        return _symbol;
    }
    
    function decimalse 
    ()
    public view virtual
    returns(uint) {
        return _decimalse;
    }

    function totalSupply
    () public view virtual override 
    returns(uint) {
        return _totalsupply;
    }

    function balanceOf 
    (address account) 
    public view virtual override 
    returns(uint256) {
        return _balances[account];
    }


}