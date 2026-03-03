// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// OpenZeppelin Imports
import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


/*
 * ---------------------------------------------------------
 * MockGold Token (ERC20)
 * This is the underlying asset of the vault
 * ---------------------------------------------------------
 */
contract MockGold is ERC20 {

    constructor() ERC20("Mock Gold", "GOLD") {
        // Mint 1,000,000 GOLD to the deployer
        _mint(msg.sender, 1_000_000 * 10**18);
    }
}


/*
 * ---------------------------------------------------------
 * SimpleGoldVault (ERC4626 Vault)
 * Users deposit GOLD and receive vGOLD shares
 * ---------------------------------------------------------
 */
contract SimpleGoldVault is ERC4626 {

    // Constructor takes the address of the ERC20 asset (MockGold)
    constructor(IERC20 _asset)
        ERC20("Vault Gold Shares", "vGOLD")   // Vault share token
        ERC4626(_asset)                       // Underlying asset
    {}
}