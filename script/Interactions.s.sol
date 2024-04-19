// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { Script } from "forge-std/Script.sol";
import { DevOpsTools} from "foundry-devops/src/DevOpsTools.sol";
import { BasicNft} from "../src/BasicNft.sol";
import { MoodNft} from "../src/MoodNft.sol";

contract MintBasicNft is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    string public constant BABYBOO = "ipfs://bafybeihjyotci6kduji3glrfanpqzqr5wlfbkm3wzoqp7mbcfij3uslzo4/";

    function run() public{
        address recentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft", block.chainid
        );

        mintNftOnContract(recentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        // BasicNft(contractAddress).mintNFT(BABYBOO);
        BasicNft(contractAddress).mintNFT(PUG_URI);
        vm.stopBroadcast();
    }

}


contract MintMoodNft is Script {
    
    function run() public{
        address recentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "MoodNft", block.chainid
        );

        mintNftOnContract(recentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).mintNFT();
        // BasicNft(contractAddress).mintNFT(PUG_URI);
        vm.stopBroadcast();
    }

}