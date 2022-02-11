    
    // SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.10;

import "./FlywheelCore.sol";

contract FuseFlywheelCore is FlywheelCore {

    constructor(
        ERC20 _rewardToken, 
        IFlywheelRewards _flywheelRewards, 
        IFlywheelController _flywheelController, 
        IFlywheelBooster _flywheelBooster
    ) FlywheelCore(_rewardToken, _flywheelRewards, _flywheelController, _flywheelBooster) {}

    function flywheelPreSupplierAction(ERC20 market, address supplier) external {
        accrue(market, supplier);  
    }

    function flywheelPreBorrowerAction(ERC20 market, address borrower) external {}

    function flywheelPreTransferAction(ERC20 market, address src, address dst) external {
        accrue(market, src, dst);
    }
}