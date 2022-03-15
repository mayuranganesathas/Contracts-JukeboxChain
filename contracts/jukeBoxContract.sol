pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract JukeBox {
    //declare variables here

    event NewSong(address indexed from, uint256 timestamp, string songLink);

    constructor() {
        console.log("JukeBox Contract Deployed");
    }

    struct Song {
        address waver; // The address of the user who waved.
        string _songLink; // songLink the user sent.
        uint256 timestamp; // The timestamp when the user waved.
    }

    Song[] songs;

    function jukeBoxPlay(string memory _currentSongLink) public {
        // add jukebox song to the contract
        console.log("Submitted a Token, song Loading", msg.sender);

        //store the song, sender and time for chain history
        songs.push(Song(msg.sender, _currentSongLink, block.timestamp));

        //emit event to be used
        emit NewSong(msg.sender, block.timestamp, _currentSongLink);
    }

    function getJukeBoxHistory() public view returns (Song[] memory) {
        return songs;
    }
}
