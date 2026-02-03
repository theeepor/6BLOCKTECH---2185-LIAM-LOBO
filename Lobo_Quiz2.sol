// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LoboQuiz2 {
    // State variables
    string public fullName;
    string public barangayChars;
    string public cityChars;
    string public provinceChars;
    string public countryChars;
    string public concatenatedString;
    bytes32 public hashAbiEncode;
    bytes32 public hashAbiEncodePacked;

    // Constructor accepts Full Name, Barangay, City, Province, Country
    constructor(
        string memory _fullName,
        string memory _barangay,
        string memory _city,
        string memory _province,
        string memory _country
    ) {
        fullName = _fullName;

        // Extract first 2 characters of Barangay and City
        barangayChars = substring(_barangay, 0, 2);
        cityChars = substring(_city, 0, 2);

        // Extract last 2 characters of Province and Country
        provinceChars = substring(_province, bytes(_province).length - 2, bytes(_province).length);
        countryChars = substring(_country, bytes(_country).length - 2, bytes(_country).length);

        // Concatenate all extracted strings
        concatenatedString = string(abi.encodePacked(barangayChars, cityChars, provinceChars, countryChars));

        // Generate Keccak-256 hashes
        hashAbiEncode = keccak256(abi.encode(concatenatedString));
        hashAbiEncodePacked = keccak256(abi.encodePacked(concatenatedString));
    }

    // Utility function to get substring of a string
    function substring(string memory str, uint startIndex, uint endIndex) internal pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex - startIndex);
        for (uint i = startIndex; i < endIndex; i++) {
            result[i - startIndex] = strBytes[i];
        }
        return string(result);
    }

    // Function to get all info at once
    function getInfo() public view returns (
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        string memory,
        bytes32,
        bytes32
    ) {
        return (
            fullName,
            barangayChars,
            cityChars,
            provinceChars,
            countryChars,
            concatenatedString,
            hashAbiEncode,
            hashAbiEncodePacked
        );
    }
}
