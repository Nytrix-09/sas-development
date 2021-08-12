/* Program to create SAS dataset Payroll  with 10 observations. */
data payroll;
input employeeID $ Fname $ Lname $ Gender $ jobTitle $ country $ Qualification $ birthDate yymmdd8. Salary hireDate yymmdd8.;
datalines;
1 Ruby Wharton F Manager UK Undergrad 19981001 40000 20200605
2 Toby Brown M SalesRepI USA Postgrad 19960520 60000 20200510
3 Decker Becker M SalesManager RU Diploma 19980605 30000 20200207
4 Joseph Andrew M SalesRepII IND Diploma 19950718 90000 20200316
5 Michael Scott M Manager UK Postgrad 20000101 120000 20201209
6 Stormie Jenner F SalesRepII RU Postgrad 19980306 40000 20201002
7 Floyd Mayweather M SalesRepI IND Undergrad 19960607 50000 20200630
8 Vettel Sabastian M SalesRepII RU Undergrad 19991201 20000 20200710
9 Richard Mills M SalesRepI UK Diploma 20000228 50000 20200408
10 Rowley Preston F Manager USA Postgrad 19980903 70000 20200608
run;

*Enhance variale values in report;
proc print data=payroll;
var lname fname Country jobTitle Salary hireDate;
run;

proc print data=payroll;
format hiredate ddmmyy10. salary dollar9.;
var lname fname Country jobTitle Salary hireDate;
run;


proc sort data = sashelp.stocks out=sortstock;
by descending volume;
run;

*formatting for SASHELP.stock dataset;

*Dollar9.2, Dollar8. Dollar12.,Dollar5.2;
proc print data = work.sortstock;
format high Dollar9.2 low Dollar8. close Dollar12. adjclose Dollar5.2;
var stock high low close volume adjclose;

*Comma12.2;
proc print data = work.sortstock;
format volume Comma12.2;
var stock volume;
run;
*Comma8.;
proc print data = work.sortstock;
format volume Comma8.;
var stock volume;
run;
*Comma5.2;
proc print data = work.sortstock;
format volume Comma5.2;
var stock volume;
run;


*Commax12.2;
proc print data = work.sortstock;
format volume Commax12.2;
var stock volume;
run;

*Commax8.2;
proc print data = work.sortstock;
format volume Commax8.2;
var stock volume;
run;

*Commax5.2;
proc print data = work.sortstock;
format volume Commax5.2;
var stock volume;
run

*MMDDYY8;
proc print data = work.sortstock;
format date MMDDYY8.;
run;

*MMDDYY6;
proc print data = work.sortstock;
format date MMDDYY6.;
run;

*DDMMYY10;
proc print data = sashelp.stocks;
format date DDMMYY10.;
run;

*date7 length;
proc print data = sashelp.stocks;
format date date7.;
run;

*date9 length;
proc print data = sashelp.stocks;
format date date9.;
run;

*month and year 7 length(monyy7);
proc print data = sashelp.stocks;
format date Monyy7.;
run;

*year length 4;
proc print data = sashelp.stocks;
format date Year4.;
run;

*Formatting country codes with full length country names in the payroll dataset;
proc print data=payroll;
var employeeId Lname Fname Country;
run;

proc format;
value $country  
'IND' = 'India' 
'UK' = 'England' 
'USA' = 'United States' 
'RU' = 'Russia';
run;

proc print data=payroll;
format country $country.;
var employeeId Lname Fname Country;
run;

*Creating tiers and class bifurcation for salary variable in payroll dataset;
proc format;
value tier 0 - 50000='Tier1'
		   50000 - 75000 ='Tier2'
		   75000 - 150000='Tier3';
run;
proc print data=payroll;
format salary tier.;
run;

proc format;
value class low-<50000='Class A'
            50000-<75000='Class B'
            75000-high='Class C';
run;

*Keeping length of first name to 2 characters;
proc print data=payroll;
format fname $2. salary class.;
run;
