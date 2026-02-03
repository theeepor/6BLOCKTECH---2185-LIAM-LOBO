// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ServiceFeeCalculator {
    // Service Fee variable
    uint public serviceFee;
    bytes32 public uniqueHash;

    // Function to calculate service fee
    function calculateServiceFee(uint serviceCode) public returns (uint, bytes32) {
        require(serviceCode == 1 || serviceCode == 2, "Invalid service code");

        string memory firstName = "Jose";
        string memory middleName = "Balsa";
        string memory lastName = "Rizal";

        if (serviceCode == 1) {
            // Consultation: 20,000 + 15% tax
            serviceFee = 20000 + (20000 * 15 / 100);
            
            // Hash using abi.encode
            uniqueHash = keccak256(
                abi.encode(
                    bytes1(bytes(firstName)[bytes(firstName).length - 1]), // last char of first name
                    bytes1(bytes(middleName)[0]),                          // first char of middle name
                    bytes1(bytes(lastName)[bytes(lastName).length - 1]),   // last char of last name
                    serviceCode,
                    uint8(serviceFee / 10000)                              // first digit of service fee
                )
            );
        } else {
            // Documents: 3,000 + 8% service charge + 15% tax
            uint baseFee = 3000;
            uint serviceCharge = baseFee * 8 / 100;
            serviceFee = baseFee + serviceCharge + ((baseFee + serviceCharge) * 15 / 100);

            // Hash using abi.encodePacked
            uniqueHash = keccak256(
                abi.encodePacked(
                    bytes1(bytes(firstName)[bytes(firstName).length - 1]),
                    bytes1(bytes(middleName)[0]),
                    bytes1(bytes(lastName)[bytes(lastName).length - 1]),
                    serviceCode,
                    uint8(serviceFee / 1000)  // first digit of service fee
                )
            );
        }

        return (serviceFee, uniqueHash);
    }
}
