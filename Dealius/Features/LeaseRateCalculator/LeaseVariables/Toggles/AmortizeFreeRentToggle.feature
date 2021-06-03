﻿Feature: AmortizeFreeRentToggle


Scenario Outline: When Amortize Free Rent toggle is on, it spreads the Rent Abatement Months eaqually 
	Given a Tenant Rep Deal is created
	| Company Name | DealName | EstCloseDate |
	| NewCompany   | AutoDeal | 03.20.2021   |
	And deal info <Start Date> <Lease Type> <Term> <Space Required> is entered
	And lease rate calculator page is opened
	When the user enters Rent Abatement Months <Months>
	And the user clicks the AmortizeFreeRent toggle
	And the user generates schedule
	Then 1st row of RentsGrid table has <FreeRentMonths> Free Rent Months
	Then 2nd row of RentsGrid table has <FreeRentMonths> Free Rent Months

	#use the toggles INPUT correct value of the NAME attribute for step
	#[And the user clicks the (name) toggle]
	#(toggles input attribute name = "LeaseExpansion", "ExcludeARI", "AmortizeFreeRent", "IncludeExpensesInCalculation"...)

Examples: 
	| Start Date | Lease Type | Term | Space Required | Months | FreeRentMonths |
	| 01/01/2020 | Assignment | 24   | 100            | 4      | 2              |


Scenario Outline: Rent Abatement Amount input field, adds Free Amount to the first row (annual year) of the table
	Given a Tenant Rep Deal is created
	And deal info <Start Date> <Lease Type> <Term> <Space Required> is entered
	And lease rate calculator page is opened
	And user enters <Rate Per Sf> for Rates Per Sf
	When the user selects Amount for Rent Abatement type
	And enters Rent Abatement Amount <Amount>
	And the user clicks the AmortizeFreeRent toggle
	And the user generates schedule
	Then 1st row of RentsGrid table has <Free Rent Amount> Free Rent Amount
	Then 2nd row of RentsGrid table has <Free Rent Amount> Free Rent Amount

Examples: 
	| Start Date | Lease Type | Term | Space Required | Rate Per Sf | Amount | Free Rent Amount |
	| 01/01/2020 | Assignment | 24   | 100            | 10          | 20     | 10               |