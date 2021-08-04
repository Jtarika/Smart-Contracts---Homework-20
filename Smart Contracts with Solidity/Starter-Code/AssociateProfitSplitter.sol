pragma solidity >=0.4.21 <0.6.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one; // 0x28B4F9852280912299fDEfbf105A743fef59E545
        employee_two = _two;  // 0x7830030Bb2Eb9789dc66600ee38831656445b5f7
        employee_three = _three; // 0x3c57F309348df6E95C12Bdb13bd6c9b2609Ef298
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint amount = msg.value / 3;

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        msg.sender.transfer(msg.value - amount * 3);
    }

    function() external payable {
        deposit();
    }

}
