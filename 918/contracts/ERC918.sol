pragma solidity ^0.4.15;
contract ERC918  {

   function mint(uint256 nonce) public returns (bool success);

   function getAdjustmentInterval() public view returns (uint);

   function getChallengeNumber() public view returns (bytes32);

   function getMiningDifficulty() public view returns (uint);

   function getMiningTarget() public view returns (uint);

   function getMiningReward() public view returns (uint);

   function hash(uint256 _nonce, address _minter) public returns (bytes32 digest);

   function _reward(address _minter) internal returns (uint);

   function _epoch() internal returns (uint);

   function _adjustDifficulty() internal returns (uint);
   function hash(uint256 nonce) public returns (bytes32 digest);
   function _reward() internal returns (uint);

   event Mint(address indexed from, uint rewardAmount, uint epochCount, bytes32 newChallengeNumber);
}
