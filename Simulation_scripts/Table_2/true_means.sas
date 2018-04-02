data simBCCG;
seed1=895;seed2=478;seed3=65;
do sample=1 to 500;
seed1=seed1+(sample*3); seed2=seed2+(sample); seed3=seed3+(sample*4);
 do nid=1 to 500;
    varsb2=0.5;
    call rannor(seed1,z2);
    sb2 = sqrt(varsb2)*z2;
        do day=1 to 365;
		 mu=exp(5+sb2);
		 z=rand('NORMAL',0,1)/cdf('NORMAL',4,0,1);
       y2=mu*((1+0.25*z)**2);
                                   if y2<=0 then y2=0.001;
        output;
        end;
		end;
end;
keep sample y2 nid day;
run;

 
proc transpose data=simBCCG out=foravgamt prefix=amt; var y2; by sample nid; run;
 
data foravgs; set foravgamt;
amt_365=mean(of amt1-amt365);
amt_2=mean(of amt1-amt2);
drop amt1-amt365;
run;

 
proc univariate pctldef=3 data=foravgs; var amt_365;
output out=all365 pctlpre=truth_ pctlpts=0 to 100 by 1;
run;

