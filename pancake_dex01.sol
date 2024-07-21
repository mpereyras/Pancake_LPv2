// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./IERC20.sol";
import "./IPancakeRouter.sol";

contract LiquidityManager {
    address private owner;
    IPancakeRouter private pancakeRouter;
    address private tokenA;
    address private tokenB;
    address private lpToken;

    constructor(address _pancakeRouter, address _tokenA, address _tokenB, address _lpToken) {
        owner = msg.sender;
        pancakeRouter = IPancakeRouter(_pancakeRouter);
        tokenA = _tokenA;
        tokenB = _tokenB;
        lpToken = _lpToken;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    function addLiquidity(uint amountADesired, uint amountBDesired, uint amountAMin, uint amountBMin, uint deadline) external onlyOwner {
        IERC20(tokenA).transferFrom(msg.sender, address(this), amountADesired);
        IERC20(tokenB).transferFrom(msg.sender, address(this), amountBDesired);

        IERC20(tokenA).approve(address(pancakeRouter), amountADesired);
        IERC20(tokenB).approve(address(pancakeRouter), amountBDesired);

        pancakeRouter.addLiquidity(
            tokenA,
            tokenB,
            amountADesired,
            amountBDesired,
            amountAMin,
            amountBMin,
            address(this),
            deadline
        );
    }

    function removeLiquidity(uint liquidity, uint amountAMin, uint amountBMin, uint deadline) external onlyOwner {
        IERC20(lpToken).approve(address(pancakeRouter), liquidity);

        pancakeRouter.removeLiquidity(
            tokenA,
            tokenB,
            liquidity,
            amountAMin,
            amountBMin,
            address(this),
            deadline
        );
    }

    function withdrawTokens(address token, uint amount) external onlyOwner {
        IERC20(token).transfer(owner, amount);
    }
}
