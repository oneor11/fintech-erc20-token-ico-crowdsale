pragma solidity ^0.5.5;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

contract KaseiCoinCrowdsale is 
    Crowdsale, 
    MintedCrowdsale, 
    CappedCrowdsale, 
    TimedCrowdsale, 
    RefundablePostDeliveryCrowdsale {

    constructor (
        uint conversionRateInWei,
        address payable wallet,
        KaseiCoin token,
        uint saleGoalInWei,
        uint saleOpenTimeInPosix,
        uint saleCloseTimeInPosix
    ) 
        Crowdsale(conversionRateInWei, wallet, token) 
        CappedCrowdsale(saleGoalInWei)
        TimedCrowdsale (saleOpenTimeInPosix, saleCloseTimeInPosix) 
        RefundableCrowdsale(saleGoalInWei) public { }
}
