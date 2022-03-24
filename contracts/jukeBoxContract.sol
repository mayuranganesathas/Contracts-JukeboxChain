pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract JukeBox {
    //declare variables here

    event NewSong(
        address indexed from,
        string songLink,
        uint256 timestamp,
        string albumImage,
        string songTitle,
        string artistName
    );

    constructor() {
        console.log("JukeBox Contract Deployed");
    }

    struct SpotifySong {
        address jukeboxPlayer; // The address of the user who waved.
        string songLink; // songLink the user sent.
        uint256 timestamp; // The timestamp when the user waved.
        string albumImage; // holds place for album image
        string songTitle; //holds place for song title
        string artistName; //holds place for artist name
    }

    SpotifySong[] songs;

    // TODO: add function parameters to accept from FE
    function jukeBoxPlay(
        string memory songLink,
        string memory albumImage,
        string memory songTitle,
        string memory artistName
    ) public {
        // add jukebox song to the contract
        console.log("Submitted a Token, song Loading", msg.sender);

        //store the song, sender and time for chain history
        songs.push(
            SpotifySong(
                msg.sender,
                songLink,
                block.timestamp,
                albumImage,
                songTitle,
                artistName
            )
        );

        //emit event to be used
        emit NewSong(
            msg.sender,
            songLink,
            block.timestamp,
            albumImage,
            songTitle,
            artistName
        );
    }

    function getJukeBoxData() public view returns (SpotifySong[] memory) {
        return songs;
    }
}
