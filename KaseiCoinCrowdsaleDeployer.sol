pragma solidity ^0.5.5;

import "./KaseiCoin.sol";
import "./KaseiCoinCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";

contract KaseiCoinCrowdsaleDeployer {

    address public kaseiTokenAddress;
    address public kaseiCrowdSaleAddress;

    constructor(
       string memory name,
       string memory symbol,
       address payable wallet,
       uint conversionRateInWei,
       uint saleGoalInWei
    ) public {
        
        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        kaseiTokenAddress = address(token);

        KaseiCoinCrowdsale kaseiCrowdSale 
            = new KaseiCoinCrowdsale(
                conversionRateInWei, 
                wallet, 
                token,
                saleGoalInWei,
                now,                //crowd sale start
                now + 30 minutes);  //crowd sale end
        kaseiCrowdSaleAddress = address(kaseiCrowdSale);

        token.addMinter(kaseiCrowdSaleAddress);
        token.renounceMinter;
    }
}
