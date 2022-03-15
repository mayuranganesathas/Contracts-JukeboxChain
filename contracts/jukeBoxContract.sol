pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract JukeBox {
    //declare variables here

    event NewWave(address indexed from, uint256 timestamp, string _songLink);

    constructor() {
        console.log("JukeBox Contract Deployed");
    }

    function jukeBoxPlay(string memory _currentSongLink) public view {
        // add jukebox song to the contract
        console.log(_currentSongLink);
        console.log("Submitted a Token, song Loading", msg.sender);
    }

    function getJukeBoxHistory() public view returns (uint256) {
        // return the entire jukebox history chain
    }
}
