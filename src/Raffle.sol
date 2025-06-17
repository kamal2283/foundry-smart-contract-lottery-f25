// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title A sample Raffle Contract
 * @author Kamal Shah
 * @notice This contract is for creatign a sampple raffle
 * @dev Implements Chainlink VRFv2.5
 */
contract Raffle {
    /* Errors */
    error Raffle__SendMoreToEnterRaffle();
    uint256 private immutable i_entranceFee;
    address payable[] private s_players;

    /* Events */
    event RaffleEnterd(address indexed player);

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {
        // require(msg.value >= i_entranceFee,"Not enough ETH sent!");
        // require(msg.value >= i_entranceFee, sendMoreToEnterRaffle());

        // most gas efficient way to handle errors
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEnterd(msg.sender);
    }

    function pickWinner() public {}

    // Getter Functions

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
