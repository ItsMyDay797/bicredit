// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LoanContract {
    enum LoanStatus { Requested, Funded, Repaid, Defaulted }

    struct Loan {
        address borrower;
        address lender;
        uint256 amount;
        uint256 interest;
        uint256 dueDate;
        LoanStatus status;
    }

    Loan[] public loans;
    mapping(uint256 => address) public loanToLender;
    
    event LoanRequested(uint256 loanId, address borrower, uint256 amount, uint256 interest, uint256 dueDate);
    event LoanFunded(uint256 loanId, address lender);
    event LoanRepaid(uint256 loanId);
    event LoanDefaulted(uint256 loanId);

    function requestLoan(uint256 _amount, uint256 _interest, uint256 _duration) external {
        uint256 dueDate = block.timestamp + _duration;
        loans.push(Loan(msg.sender, address(0), _amount, _interest, dueDate, LoanStatus.Requested));
        emit LoanRequested(loans.length - 1, msg.sender, _amount, _interest, dueDate);
    }

    function fundLoan(uint256 _loanId) external payable {
        Loan storage loan = loans[_loanId];
        require(loan.status == LoanStatus.Requested, "Loan not available");
        require(msg.value == loan.amount, "Incorrect funding amount");

        loan.lender = msg.sender;
        loan.status = LoanStatus.Funded;
        loanToLender[_loanId] = msg.sender;
        payable(loan.borrower).transfer(msg.value);

        emit LoanFunded(_loanId, msg.sender);
    }

    function repayLoan(uint256 _loanId) external payable {
        Loan storage loan = loans[_loanId];
        require(msg.sender == loan.borrower, "Only borrower can repay");
        require(loan.status == LoanStatus.Funded, "Loan not funded");
        
        uint256 repaymentAmount = loan.amount + loan.interest;
        require(msg.value == repaymentAmount, "Incorrect repayment amount");

        payable(loan.lender).transfer(msg.value);
        loan.status = LoanStatus.Repaid;

        emit LoanRepaid(_loanId);
    }

    function checkDefault(uint256 _loanId) external {
        Loan storage loan = loans[_loanId];
        require(loan.status == LoanStatus.Funded, "Loan not funded");
        require(block.timestamp > loan.dueDate, "Loan is not overdue");

        loan.status = LoanStatus.Defaulted;
        emit LoanDefaulted(_loanId);
    }
}

