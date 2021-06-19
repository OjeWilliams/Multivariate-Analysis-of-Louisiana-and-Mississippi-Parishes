/* Project */
TITLE 'Multiple Regression';
LIBNAME REGPROJ '/folders/myshortcuts/prof/Project';
/* NAME DATA FILE AS REGRESSION */
DATA REGRESSION;
/*  PERMANENTLY SET DATAFILE */
SET '/folders/myshortcuts/prof/Project/patrick.sas7bdat';
RUN;

TITLE 'Correlation Matrix';
PROC SGSCATTER;
MATRIX LIFE_EXPECTANCY MEDIAN_HOUSEHOLD_INCOME;
RUN;

TITLE 'Correlation Table';
PROC CORR;
VAR LIFE_EXPECTANCY MEDIAN_HOUSEHOLD_INCOME;
RUN;

/* CORRELATION TABLE OF All VARIABLES  */
PROC CORR DATA = regression;
VAR Life_Expectancy Population Population_Under_18 Population_African_American
  Population_Female Population_Rural Median_Household_Income Graduation_Rate 
  Some_College_Rate Child_Poverty_Rate Income_Ratio_80pt20pt Food_Insecure_Rate	
  Uninsured_Adults_Prev	Average_Healthcare_Costs Physically_Inactive_Rate	
  Excessive_Drinking_Rate Teen_Birth_Rate;
RUN;

/* MULTIPLE REGRESSION  */
PROC REG Data=regression;
  MODEL Life_Expectancy Median_Household_Income = Population_Under_18
  Population_African_American Child_Poverty_Rate Food_Insecure_Rate 
  Uninsured_Adults_Prev Physically_Inactive_Rate Excessive_Drinking_Rate
  Teen_Birth_Rate;
  OVERALL:  MTEST /PRINT CANPRINT;
  Partial1: MTEST Population_Under_18/PRINT  MSTAT=EXACT;
  Partial2: MTEST Population_African_American/PRINT  MSTAT=EXACT;
  Partial3: MTEST Child_Poverty_Rate/PRINT  MSTAT=EXACT;
  Partial4: MTEST Food_Insecure_Rate/PRINT  MSTAT=EXACT;
  Partial5: MTEST Uninsured_Adults_Prev/PRINT  MSTAT=EXACT;
  Partial6: MTEST Physically_Inactive_Rate/PRINT  MSTAT=EXACT;
  Partial7: MTEST Excessive_Drinking_Rate/PRINT  MSTAT=EXACT;
  Partial8: MTEST Teen_Birth_Rate/PRINT  MSTAT=EXACT;
  Partial12: MTEST Population_Under_18,Population_African_American/PRINT  MSTAT=EXACT;
  TITLE ' Multiple Regression ';
RUN;