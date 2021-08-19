*Employee Dataset;
data Employee;
input EmpID EmpFName $ EmpLName $ EmpGen $ Salary;
datalines;
1 Markk Twain Male 95000
2 Jack Frost Male 79500
3 Linda Brooks Female 88800
Melinda Jones Female  72000
Joel Sinfried Male 82000
;

proc print data = WORK.Employee noobs;
run;

proc contents data = WORK.Employee;
run;

*Creating and Displaying Company Dataset;
data Company;
input CompID CompName $ Country $ CMMLevel $ NumberofHeadquarter;
datalines;
1 Netflix Washington 6 2
2 Amazon Seattle 8 6 
3 Google California 7 8 
5 IBM NewYork 5 2
6 Sigma6 Texas 4 1
;

proc print data = WORK.Company noobs;
run;

proc contents data = WORK.Company;
run;

*Examining the dataset;

*with nods;
proc contents data=sashelp.stocks nods;
run;

*without nods;
proc contents data=sashelp.stocks ;
run;

*Accessing Stock dataset;
proc print data=sashelp.stocks;
var stock open date;
run;


*Design report with operators;

*In operator;
proc print data=sashelp.stocks;
var stock date open volume;
where stock in ("Microsoft","IBM");
run;

*Like operator to include observation of stock containing  word “soft”;
proc print data=sashelp.stocks;
var stock date open volume;
where stock like '%soft';
run;

*Contains operator;
proc print data=sashelp.stocks;
var stock date open volume;
where stock contains 'IBM';
run;

*NULL opearator;
proc print data=sashelp.stocks;
var stock date open volume;
where stock is null;
run;


*SAS to subset the all the observations having stock date less the 02NOV88;
proc print data=sashelp.stocks;
var stock date open volume;
where date<='2NOV88'd;
run;

*subset observations having stock name IBM and Microsoft;
proc print data=sashelp.stocks;
var stock date open volume;
where stock= "IBM";
run;

proc print data=sashelp.stocks;
var stock date open volume;
where stock="Microsoft";
run;

*Examine datasets stock,Air,Cars and display description info.;
proc print data=sashelp.stocks;
run;
proc contents data = sashelp.stocks;
run;

proc print data=sashelp.air;
run;
proc contents data = sashelp.air;
run;

proc print data=sashelp.cars;
run;
proc contents data = sashelp.cars;
run;


proc contents data = sashelp.stocks;
run;

*SASHELP library with option to suppress the descriptor portion.;
*with nods;
proc contents data=sashelp.stocks nods;
run;



*Employee Dataset;
data Employee;
input EmpID EmpFName $ EmpLName $ EmpGen $ Salary;
datalines;
1 Markk Twain Male 95000
2 Jack Frost Male 79500
3 Linda Brooks Female 88800
4 Melinda Jones Female  72000
5 Joel Sinfried Male ""
;


*NULL opearator;
proc print data=WORK.Employee noobs;
where Salary is null;
run;
