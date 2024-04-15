// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import { Test, console } from "forge-std/Test.sol";
import { DeployBasicNft } from "../script/DeployBasicNft.s.sol";
import { BasicNft } from "../src/BasicNft.sol";

contract BasicNftTest is Test{
    DeployBasicNft public deployer;
    BasicNft public basicNft;

    address public USER = makeAddr("user");
    string public constant BABYBOO = "ipfs://bafybeihjyotci6kduji3glrfanpqzqr5wlfbkm3wzoqp7mbcfij3uslzo4/";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        // assertEq(expectedName, actualName);
        assert(
            keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName))
        );
    }

    function testFunctionCanMintAndHaveABalance() public{
        vm.prank(USER);
        basicNft.mintNFT(BABYBOO);

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(BABYBOO)) == keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}