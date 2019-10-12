pragma solidity ^0.4.15;
import "ERC918.sol";

contract AbstractERC918 is ERC918 {

    // the amount of time between difficulty adjustments
    uint public adjustmentInterval;

    // generate a new challenge number after a new reward is minted
    bytes32 public challengeNumber;

    // the current mining target
    uint public miningTarget;

    // cumulative counter of the total minted tokens
    uint public tokensMinted;

    // number of blocks per difficulty readjustment
    uint public blocksPerReadjustment;

    //number of 'blocks' mined
    uint public epochCount;

    /*
     * Externally facing mint function that is called by miners to validate challenge digests, calculate reward,
     * populate statistics, mutate epoch variables and adjust the solution difficulty as required. Once complete,
     * a Mint event is emitted before returning a success indicator.
     **/
    function mint(uint256 nonce) public returns (bool success) {
        require(msg.sender != address(0));

        // perform the hash function validation
        hash(nonce);

        // calculate the current reward
        uint rewardAmount = _reward();

        // increment the minted tokens amount
        tokensMinted += rewardAmount;

        epochCount = _epoch();

        //every so often, readjust difficulty. Don't readjust when deploying
        if(epochCount % blocksPerReadjustment == 0){
            _adjustDifficulty();
        }

        // send Mint event indicating a successful implementation
        emit Mint(msg.sender, rewardAmount, epochCount, challengeNumber);

        return true;
    }
}
