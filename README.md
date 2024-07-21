# Pancake_Liquid
Interfase con Pancake  LP v2
# Liquidity Manager

Este contrato de Solidity permite añadir y retirar liquidez de un par de tokens en PancakeSwap V2 en la red de BNB-Testnet

## Descripción

El contrato `LiquidityManager` interactúa con la interfaz `IPancakeRouter` para agregar y retirar liquidez de un par de tokens en PancakeSwap V2. 

## Interfaces

### IERC20

La interfaz `IERC20` se usa para interactuar con tokens ERC20.

### IPancakeRouter

La interfaz `IPancakeRouter` se usa para interactuar con el contrato de enrutamiento de PancakeSwap V2.

## Constructor

El constructor del contrato toma las siguientes direcciones como parámetros:

- `_pancakeRouter`: Dirección del contrato PancakeRouter => 0xD99D1c33F9fC3444f8101754aBC46c52416550D1
- `_tokenA`: Dirección del primer token del par => 0x3F8dbf428056DEDA4dEb13399c66d343f7E23D24
- `_tokenB`: Dirección del segundo token del par => 0x60e9be4ad46Cd10E66F03841D9A5eD2bdA2d1dc2
- `_lpToken`: Dirección del token de liquidez (LP token) para el par de tokens => 0xda35e63763ae44b9a77DfbC4302840BDD10BD76f

## Funciones

### addLiquidity

```solidity
function addLiquidity(
    uint amountADesired,
    uint amountBDesired,
    uint amountAMin,
    uint amountBMin,
    uint deadline
) external returns (uint amountA, uint amountB, uint liquidity);

### RemoveLiquidity
function removeLiquidity(
    uint liquidity,
    uint amountAMin,
    uint amountBMin,
    uint deadline) external onlyOwner

### RemoveLiquidity
function withdrawTokens
