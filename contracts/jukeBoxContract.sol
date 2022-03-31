pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract JukeBox {
    event NewSong(
        address indexed from,
        string songLink,
        uint256 timestamp,
        string songTitle,
        string artistName,
        string albumImage
    );

    constructor() {
        console.log("JukeBox Contract Deployed");
    }

    struct SpotifySong {
        address jukeboxPlayer; // The address of the user who waved.
        string songLink; // songLink the user sent.
        uint256 timestamp; // The timestamp when the user waved.
        string songTitle; //holds place for song title
        string artistName; //holds place for artist name
        string albumImage; // holds place for album image
    }

    SpotifySong[] songs;

    // TODO: add function parameters to accept from FE
    function jukeBoxPlay(
        string memory songLink,
        string memory songTitle,
        string memory artistName,
        string memory albumImage
    ) public {
        console.log("Submitted a Token, song Loading", msg.sender);

        //store the song, sender and time for chain history
        songs.push(
            SpotifySong(
                msg.sender,
                songLink,
                block.timestamp,
                songTitle,
                artistName,
                albumImage
            )
        );

        emit NewSong(
            msg.sender,
            songLink,
            block.timestamp,
            songTitle,
            artistName,
            albumImage
        );
    }

    function getJukeBoxData() public view returns (SpotifySong[] memory) {
        return songs;
    }
}
