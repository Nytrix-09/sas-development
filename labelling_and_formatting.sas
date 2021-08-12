/* Program to create SAS dataset Payroll  with 10 observations. */
data payroll;
input employeeID $ firstName $ lastName $ Gender $ jobTitle $ country $ Qualification $ birthDate yymmdd8. Salary hireDate yymmdd8.;
datalines;
1 Ruby Wharton F Manager England Undergrad 19981001 40000 20200605
2 Toby Brown M SalesRepI America Postgrad 19960520 60000 20200510
3 Decker Becker M SalesManager Russia Diploma 19980605 30000 20200207
4 Joseph Andrew M SalesRepII India Diploma 19950718 90000 20200316
5 Michael Scott M Manager England Postgrad 20000101 120000 20201209
6 Stormie Jenner F SalesRepII Russia Postgrad 19980306 40000 20201002
7 Floyd Mayweather M SalesRepI India Undergrad 19960607 50000 20200630
8 Vettel Sabastian M SalesRepII Russia Undergrad 19991201 20000 20200710
9 Richard Mills M SalesRepI England Diploma 20000228 50000 20200408
10 Rowley Preston F Manager America Postgrad 19980903 70000 20200608
run;

/* For above report generated Use appropriate Title and Footnote. */
proc sort data=work.payroll out=work.sortpayroll;
by country descending salary;
run;
title1 'Employee Salary Report by Country';
footnote 'Confidential';

/* For above report generated find the sum of salary */
proc print data=work.sortpayroll;
format birthDate DATE9. hireDate DATE9.;
sum salary;
by country;
run;

/*Implement Label and split option for given scenario. */
proc print data=payroll label;
title1 'Employee Details';
footnote 'Confidential';

var employeeID lastname salary;
label
employeeID='Employee ID'
lastname='Last Name';
run;

title;
footnote;
