pragma solidity ^0.8.0;

import "@connext/nxtp-contracts/contracts/tunnel/INXTP.sol";

contract RandomPayment {
    INXTP public nxtp;
    address public tokenAddress;
    mapping (uint256 => address) public addresses;

    constructor(address _nxtpAddress, address _tokenAddress) {
        nxtp = INXTP(_nxtpAddress);
        tokenAddress = _tokenAddress;
        // Load the addresses from the file
        loadAddresses();
    }

    function payRandom(uint256 _amount, bytes calldata _userData) external {
        // Generate a random index to select an address
        uint256 index = uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % addresses.length;
        address recipient = addresses[index];

        // Initiate the cross-chain transfer request
        nxtp.initiateCrosschainRequest(
            tokenAddress,
            tokenAddress,
            _amount,
            address(this),
            recipient,
            "executeCrossChainTransfer",
            _userData
        );
    }

    function executeCrossChainTransfer(
        uint256 _amount,
        bytes calldata _userData
    ) external {
        require(msg.sender == address(nxtp), "Only the Connext Network can call this function");

        // Transfer the tokens to the recipient on the destination chain
        IERC20(tokenAddress).transfer(msg.sender, _amount);

        // Emit an event for logging purposes
        emit CrossChainTransferExecuted(_amount, _userData);
    }

    function loadAddresses() internal {
        // Load the addresses from the file
        string[] memory lines = readFile("ogrenciler.txt");

        for (uint i = 0; i < lines.length; i++) {
            addresses[i] = address(uint160(uint256(keccak256(abi.encodePacked(lines[i])))));
        }
    }

    function readFile(string memory filename) public view returns (string[] memory) {
        // Read the file from IPFS or another storage system
        // ...

        // Return the lines of the file as an array
        string[] memory lines;
        lines[0] = "0x123...";
        lines[1] = "0x456...";
        lines[2] = "0x789...";
        return lines;
    }

    event CrossChainTransferExecuted(uint256 amount, bytes userData);
}
