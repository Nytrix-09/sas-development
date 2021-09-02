*Creating sales dataset;
data sales;
input EmployeeId FName $ LName $ Gender $ JobTitle $ Country $ Birthdate  ddmmyy10.  Salary Hiredate ddmmyy10.;
datalines;
1 Alan Tims M Developer USA 12/08/1985 126000 4/07/2017
2 Ruby Wharton F QA UK 07/06/1992 88000 09/09/2018
3 Jayshree Ramesh F HR India 09/01/1989 94500 20/07/2011
4 Morgan Stanley M Accountant USA 31/12/1995 69000 07/07/2015
5 Ed Helms M Broker UK 04/06/1994 78450 22/10/2018  
6 Jim Halpert M Representative UK 09/07/2000 54500 11/12/2020
7 Dwight Schrute M Salesman Ireland 15/06/1988 128000 05/11/2010
8 Michael Scott M Manager USA 01/04/1970 150000 27/08/2007
9 Andrew Bernard M Salesman USA 21/09/1986 69500 25/02/2011
10 Meredith Palmer F Accountant India 09/05/1979 56800 25/01/2009
;

*Subset Information with Operators;
*Employee residential in more than one country;
proc print data = work.sales noobs;
format birthdate DATE9. hireDate DATE9.;
where country IN ('USA','India');
run;

*subset all observations that contain 'Rep';
proc print data = work.sales noobs;
format birthdate DATE9. hireDate DATE9.;
where jobtitle like '%Rep%';
run;

*subset all observations with salary between 50000 and 100000;
proc print data = work.sales noobs;
format birthDate DATE9. hireDate DATE9.;
where salary>5000 & salary<100000;
run;

*sorting dataset by country;
proc sort data = work.sales out=work.sortsales;
by country;
run;
proc print data = work.sortsales noobs;
format birthDate DATE9. hireDate DATE9.;
run;

*Sales employees grouped by country, in descending salary order within country;
proc sort data = work.sales out = work.sortsales;
by country descending salary;
run;
title1 'Employee Salary Report By Country';
footnote 'Confidential';

proc print data=work.sortsales noobs;
format birthDate DATE9. hireDate DATE9.;
sum salary;
by country;
run;

title;
footnote;
