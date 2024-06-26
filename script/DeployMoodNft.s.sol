// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { Script } from "forge-std/Script.sol";
import { MoodNft } from "../src/MoodNft.sol";
import { Base64 } from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    using Base64 for bytes;
    MoodNft moodNft;

    string sadSvgUri = svgToImageURI(vm.readFile("./img/sad.svg"));
    string happySvgUri = svgToImageURI(vm.readFile("./img/happy.svg"));

    uint256 public DEFAULT_ANVIL_PRIVATE_KEY = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
    uint256 public deployerKey;

    function run() external returns(MoodNft){
        if (block.chainid == 31337) {
            deployerKey = DEFAULT_ANVIL_PRIVATE_KEY;
        } else {
            deployerKey = vm.envUint("PRIVATE_KEY");
        }

        vm.startBroadcast(deployerKey);
        moodNft = new MoodNft(sadSvgUri, happySvgUri);
        vm.stopBroadcast();

        return moodNft;
    }

    function svgToImageURI(string memory svg) public pure returns(string memory){
        string memory baseURI = "data:image/svg+xml;base64,";
        // string memory svgBase64Encoded = Base64.encode(
        //     bytes(string(abi.encodePacked(svg)))
        // );

        string memory svgBase64Encoded = bytes(string(abi.encodePacked(svg))).encode();
        
        return string(abi.encodePacked(baseURI, svgBase64Encoded));
        // return string.concat(baseURI, svgBase64Encoded);
    }
}