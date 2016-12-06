data demonitization;
 infile '/folders/myfolders/SAS Intro/TwoWayAnova/Demonitization.csv' dlm=',' firstobs=2;
 input Week $ Industry $ CityType $ ProductiveHours;
    run;
/*
Week 0: Sept16 to Sept22(randam week)=mu0
Week 1: oct 24 to Oct 28 =mu1
Week 2: oct 31 to 4th Nov =mu2
Week 3: Nov 7 to 11th Nov =mu3
Week 4: Nov 14 to nov 18 =mu4
Ho: Productive hours mu0=mu1=mu2=mu3=mu4
HA: Atleast one pair is means are different

If Ho is rejected, we have to do some post-hoc tests
*/
proc GLM data=demonitization;
 class Week Industry CityType;
 model ProductiveHours = Week Industry CityType Week*Industry;
 means Week Industry CityType  / tukey;
run;
proc GLM data=demonitization;
 class Week ;
 model ProductiveHours = Week ;
 means Week  / tukey;
run;
proc GLM data=demonitization;
 class Week Industry ;
 model ProductiveHours = Week Industry Week*Industry;
 means Week Industry  / tukey;
run;
proc GLM data=demonitization;
 class Week CityType;
 model ProductiveHours = Week CityType Week*CityType;
 means Week CityType/ tukey;
run;
;