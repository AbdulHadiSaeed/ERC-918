pragma solidity ^0.4.15;

import "AbstractERC918.sol";
contract ERC918Merged is AbstractERC918 {
    /*
     * @notice Externally facing merge function that is called by miners to validate challenge digests, calculate reward,
     * populate statistics, mutate state variables and adjust the solution difficulty as required. Additionally, the
     * merge function takes an array of target token addresses to be used in merged rewards. Once complete,
     * a Mint event is emitted before returning a success indicator.
     *
     * @param _nonce the solution nonce
     **/
    function merge(uint256 _nonce, address[] memory _mineTokens) public returns (bool) {
      for (uint i = 0; i < _mineTokens.length; i++) {
        address  tokenAddress = _mineTokens[i];
        ERC918(tokenAddress).mint(_nonce);
      }
    }}
