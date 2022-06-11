// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";
import "./SafeMath.sol";
import "./Context.sol";
import "./Ownable.sol";

contract ERC20 is IERC20, Context, Ownable  {

    using SafeMath for uint256;

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

    // Functions fot errors //
    // transfer function
    function _transfer 
    (address from, address to, uint256 amount)
    internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "NO no no");

        _balances[from] = _balances[from].sub(amount);
        _balances[to] = _balances[to].add(amount);

        emit Transfer(from, to, amount);
    }
    // approve function
    function _approve
    (address owner, address spender, uint256 amount)
    internal virtual {
        require(owner != address(0), "This is not correct");
        require(spender != address(0), "This is not correct");
        _allowances[owner][spender] = amount;
        emit arpprovall(owner, spender, amount);
    }


    // Functions override //

    function transfer 
    (address to, uint256 amount)
    public virtual override 
    returns(bool) {
        address from = _msgSender();
        _transfer(from, to, amount);

        return true;
    }

    function allowance 
    ( address owner, address spender) 
    public view virtual override 
    returns(uint256) {
        return _allowances[owner][spender];
    }

    function approve
    (address spender, uint256 amount) 
    public virtual override 
    returns(bool)
    {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }
    
    function trasferFrom (
        address from,
        address to,
        uint256 amount
    ) public virtual override 
    returns(bool)
    {
        address spender = _msgSender();
        require(amount <= _allowances[from][spender]);
        _allowances[from][spender] = _allowances[from][spender].sub(amount);
        
        _transfer(from, to, amount);

        return true;
    }

}