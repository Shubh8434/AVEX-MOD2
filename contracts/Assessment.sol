// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// import "hardhat/console.sol";

contract AngshuWallet {
    
    address payable public owner;
    uint256 public balance;

    event onDeposit(uint256 amount);
    event onWithdraw(uint256 amount);
    event onBuyNFT(uint256 _number);

    error LowBalance(uint256 balance, uint256 withdrawAmount);

    constructor(uint initAmount) payable {
        owner = payable(msg.sender);
        balance = initAmount;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }

    function DepositToken(uint256 depositAmount) public payable {
        uint256 prevBalance = balance;
        require(msg.sender == owner, "You do not own the account");

        balance += depositAmount;
        assert(balance == prevBalance + depositAmount);

        emit onDeposit(depositAmount);
    }


    function WithdrawToken(uint256 withdrawAmount) public {
        require(msg.sender == owner, "You do not own the account");
        uint256 prevBalance = balance;

        if (balance < withdrawAmount) {
            revert LowBalance({
                balance: balance,
                withdrawAmount: withdrawAmount
            });
        }


        balance -= withdrawAmount;
        assert(balance == (prevBalance - withdrawAmount));

        emit onWithdraw(withdrawAmount);
    }

    function getContractAddress() public view returns (address) {
        return address(this);
    }

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function BuyNFT(uint256 _number) public {
        WithdrawToken(_number);

        emit onBuyNFT(_number);
    }
}
