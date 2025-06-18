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
    // @dev The duration of lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    /* Events */
    event RaffleEnterd(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp; // current time
    }

    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee,"Not enough ETH sent!");
        // require(msg.value >= i_entranceFee, sendMoreToEnterRaffle());

        // most gas efficient way to handle errors
        if (msg.value < i_entranceFee) {
            revert Raffle__SendMoreToEnterRaffle();
        }
        s_players.push(payable(msg.sender));
        emit RaffleEnterd(msg.sender);
    }

    // 1.  get a random number
    // 2.  Use random number to pick a
    // 3. Be automatically called

    function pickWinner() external {
        // check if enough time has passed
        if ((block.timestamp - s_lastTimeStamp) < i_interval) {
            revert();
        }
    }

    // Getter Functions

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
