%macro cenario99;
%do c=1 %to 500;
data sim&c;
seed1=895&c.;seed2=478&c.;seed3=65&c.;
  do nid=1 to 500;
    varsb2=0.5;
    call rannor(seed1,z2);
    sb2 = sqrt(varsb2)*z2;
        do day=1 to 3;
		 mu=exp(5+sb2);
		 z=rand('NORMAL',0,1)/cdf('NORMAL',4,0,1);
       y2=mu*((1+0.25*z)**2);
                                   if y2<=0 then y2=0.001;
        output;
        end;
  end;
keep sample y2 nid day;
run;
 %end;
 %mend;
 %cenario99;

 
libname mylib  "C:\Users\Giovana\Desktop\Dados consumo\cenario99";

 %macro estima;
%do c=1 %to 500;
data mylib.sim&c;
set sim&c;
run;
%end;
%mend;
%estima;


%macro estima;
%do c=1 %to 500;

proc iml;
use sim&c;
read all into sim&c;

%include "C:\Users\Giovana\Desktop\Dados consumo\mixtran_macro_v1.1[1].sas";
%include "C:\Users\Giovana\Desktop\Dados consumo\distrib_macro_v1.1.sas" ;

%mixtran (data=Sim&c,response=y2,foodtype=y2&c,subject=nid,
          repeat=day,covars_prob=  ,
          covars_amt= ,
          outlib=mylib,modeltype=amount,lambda=,replicate_var=,
          seq=,weekend=,vargroup=,numvargroups=,
          subgroup=,start_val1=,start_val2=, start_val3=,  
          vcontrol=,nloptions=qmax=61,titles=4,printlevel=2);  

run;
quit;
%end;
%mend;
%estima;

%Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y21, param=mylib._param_unc_y21,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio1);

%Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y22, param=mylib._param_unc_y22,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio2);

%Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y23, param=mylib._param_unc_y23,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio3);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y24, param=mylib._param_unc_y24,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio4);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y25, param=mylib._param_unc_y25,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio5);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y26, param=mylib._param_unc_y26,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio6);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y27, param=mylib._param_unc_y27,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio7);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y28, param=mylib._param_unc_y28,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio8);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y29, param=mylib._param_unc_y29,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio9);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y210, param=mylib._param_unc_y210,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio10);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y211, param=mylib._param_unc_y211,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio11);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y212, param=mylib._param_unc_y212,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio12);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y213, param=mylib._param_unc_y213,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio13);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y214, param=mylib._param_unc_y214,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio14);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y215, param=mylib._param_unc_y215,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio15);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y216, param=mylib._param_unc_y216,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio16);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y217, param=mylib._param_unc_y217,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio17);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y218, param=mylib._param_unc_y218,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio18);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y219, param=mylib._param_unc_y219,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio19);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y220, param=mylib._param_unc_y220,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio20);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y221, param=mylib._param_unc_y221,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio21);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y222, param=mylib._param_unc_y222,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio22);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y223, param=mylib._param_unc_y223,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio23);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y224, param=mylib._param_unc_y224,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio24);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y225, param=mylib._param_unc_y225,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio25);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y226, param=mylib._param_unc_y226,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio26);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y227, param=mylib._param_unc_y227,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio27);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y228, param=mylib._param_unc_y228,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio28);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y229, param=mylib._param_unc_y229,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio29);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y230, param=mylib._param_unc_y230,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio30);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y231, param=mylib._param_unc_y231,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio31);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y232, param=mylib._param_unc_y232,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio32);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y233, param=mylib._param_unc_y233,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio33);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y234, param=mylib._param_unc_y234,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio34);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y235, param=mylib._param_unc_y235,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio35);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y236, param=mylib._param_unc_y236,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio36);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y237, param=mylib._param_unc_y237,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio37);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y238, param=mylib._param_unc_y238,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio38);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y239, param=mylib._param_unc_y239,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio39);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y240, param=mylib._param_unc_y240,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio40);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y241, param=mylib._param_unc_y241,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio41);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y242, param=mylib._param_unc_y242,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio42);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y243, param=mylib._param_unc_y243,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio43);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y244, param=mylib._param_unc_y244,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio44);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y245, param=mylib._param_unc_y245,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio45);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y246, param=mylib._param_unc_y246,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio46);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y247, param=mylib._param_unc_y247,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio47);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y248, param=mylib._param_unc_y248,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio48);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y249, param=mylib._param_unc_y249,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio49);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y250, param=mylib._param_unc_y250,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio50);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y251, param=mylib._param_unc_y251,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio51);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y252, param=mylib._param_unc_y252,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio52);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y253, param=mylib._param_unc_y253,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio53);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y254, param=mylib._param_unc_y254,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio54);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y255, param=mylib._param_unc_y255,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio55);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y256, param=mylib._param_unc_y256,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio56);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y257, param=mylib._param_unc_y257,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio57);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y258, param=mylib._param_unc_y258,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio58);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y259, param=mylib._param_unc_y259,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio59);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y260, param=mylib._param_unc_y260,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio60);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y261, param=mylib._param_unc_y261,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio61);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y262, param=mylib._param_unc_y262,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio62);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y263, param=mylib._param_unc_y263,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio63);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y264, param=mylib._param_unc_y264,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio64);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y265, param=mylib._param_unc_y265,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio65);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y266, param=mylib._param_unc_y266,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio66);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y267, param=mylib._param_unc_y267,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio67);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y268, param=mylib._param_unc_y268,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio68);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y269, param=mylib._param_unc_y269,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio69);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y270, param=mylib._param_unc_y270,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio70);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y271, param=mylib._param_unc_y271,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio71);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y272, param=mylib._param_unc_y272,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio72);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y273, param=mylib._param_unc_y273,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio73);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y274, param=mylib._param_unc_y274,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio74);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y275, param=mylib._param_unc_y275,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio75);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y276, param=mylib._param_unc_y276,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio76);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y277, param=mylib._param_unc_y277,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio77);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y278, param=mylib._param_unc_y278,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio78);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y279, param=mylib._param_unc_y279,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio79);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y280, param=mylib._param_unc_y280,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio80);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y281, param=mylib._param_unc_y281,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio81);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y282, param=mylib._param_unc_y282,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio82);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y283, param=mylib._param_unc_y283,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio83);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y284, param=mylib._param_unc_y284,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio84);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y285, param=mylib._param_unc_y285,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio85);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y286, param=mylib._param_unc_y286,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio86);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y287, param=mylib._param_unc_y287,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio87);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y288, param=mylib._param_unc_y288,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio88);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y289, param=mylib._param_unc_y289,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio89);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y290, param=mylib._param_unc_y290,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio90);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y291, param=mylib._param_unc_y291,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio91);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y292, param=mylib._param_unc_y292,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio92);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y293, param=mylib._param_unc_y293,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio93);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y294, param=mylib._param_unc_y294,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio94);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y295, param=mylib._param_unc_y295,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio95);

		  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y296, param=mylib._param_unc_y296,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio96);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y297, param=mylib._param_unc_y297,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio97);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y298, param=mylib._param_unc_y298,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio98);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y299, param=mylib._param_unc_y299,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio99);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2100, param=mylib._param_unc_y2100,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio100);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2101, param=mylib._param_unc_y2101,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio101);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2102, param=mylib._param_unc_y2102,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio102);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2103, param=mylib._param_unc_y2103,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio103);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2104, param=mylib._param_unc_y2104,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio104);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2105, param=mylib._param_unc_y2105,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio105);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2106, param=mylib._param_unc_y2106,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio106);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2107, param=mylib._param_unc_y2107,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio107);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2108, param=mylib._param_unc_y2108,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio108);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2109, param=mylib._param_unc_y2109,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio109);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2110, param=mylib._param_unc_y2110,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio110);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2111, param=mylib._param_unc_y2111,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio111);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2112, param=mylib._param_unc_y2112,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio112);
	    
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2113, param=mylib._param_unc_y2113,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio113);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2114, param=mylib._param_unc_y2114,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio114);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2115, param=mylib._param_unc_y2115,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio115);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2116, param=mylib._param_unc_y2116,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio116);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2117, param=mylib._param_unc_y2117,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio117);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2118, param=mylib._param_unc_y2118,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio118);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2119, param=mylib._param_unc_y2119,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio119);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2120, param=mylib._param_unc_y2120,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio120);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2121, param=mylib._param_unc_y2121,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio121);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2122, param=mylib._param_unc_y2122,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio122);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2123, param=mylib._param_unc_y2123,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio123);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2124, param=mylib._param_unc_y2124,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio124);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2125, param=mylib._param_unc_y2125,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio125);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2126, param=mylib._param_unc_y2126,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio126);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2127, param=mylib._param_unc_y2127,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio127);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2128, param=mylib._param_unc_y2128,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio128);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2129, param=mylib._param_unc_y2129,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio129);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2130, param=mylib._param_unc_y2130,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio130);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2131, param=mylib._param_unc_y2131,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio131);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2132, param=mylib._param_unc_y2132,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio132);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2133, param=mylib._param_unc_y2133,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio133);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2134, param=mylib._param_unc_y2134,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio134);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2135, param=mylib._param_unc_y2135,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio135);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2136, param=mylib._param_unc_y2136,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio136);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2137, param=mylib._param_unc_y2137,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio137);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2138, param=mylib._param_unc_y2138,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio138);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2139, param=mylib._param_unc_y2139,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio139);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2140, param=mylib._param_unc_y2140,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio140);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2141, param=mylib._param_unc_y2141,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio141);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2142, param=mylib._param_unc_y2142,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio142);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2143, param=mylib._param_unc_y2143,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio143);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2144, param=mylib._param_unc_y2144,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio144);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2145, param=mylib._param_unc_y2145,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio145);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2146, param=mylib._param_unc_y2146,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio146);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2147, param=mylib._param_unc_y2147,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio147);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2148, param=mylib._param_unc_y2148,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio148);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2149, param=mylib._param_unc_y2149,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio149);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2150, param=mylib._param_unc_y2150,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio150);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2151, param=mylib._param_unc_y2151,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio151);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2152, param=mylib._param_unc_y2152,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio152);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2153, param=mylib._param_unc_y2153,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio153);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2154, param=mylib._param_unc_y2154,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio154);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2155, param=mylib._param_unc_y2155,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio155);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2156, param=mylib._param_unc_y2156,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio156);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2157, param=mylib._param_unc_y2157,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio157);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2158, param=mylib._param_unc_y2158,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio158);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2159, param=mylib._param_unc_y2159,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio159);
	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2160, param=mylib._param_unc_y2160,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio160);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2161, param=mylib._param_unc_y2161,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio161);

      %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2162, param=mylib._param_unc_y2162,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio162);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2163, param=mylib._param_unc_y2163,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio163);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2164, param=mylib._param_unc_y2164,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio164);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2165, param=mylib._param_unc_y2165,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio165);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2166, param=mylib._param_unc_y2166,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio166);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2167, param=mylib._param_unc_y2167,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio167);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2168, param=mylib._param_unc_y2168,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio168);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2169, param=mylib._param_unc_y2169,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio169);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2170, param=mylib._param_unc_y2170,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio170);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2171, param=mylib._param_unc_y2171,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio171);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2172, param=mylib._param_unc_y2172,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio172);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2173, param=mylib._param_unc_y2173,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio173);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2174, param=mylib._param_unc_y2174,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio174);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2175, param=mylib._param_unc_y2175,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio175);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2176, param=mylib._param_unc_y2176,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio176);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2177, param=mylib._param_unc_y2177,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio177);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2178, param=mylib._param_unc_y2178,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio178);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2179, param=mylib._param_unc_y2179,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio179);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2180, param=mylib._param_unc_y2180,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio180);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2181, param=mylib._param_unc_y2181,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio181);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2182, param=mylib._param_unc_y2182,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio182);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2183, param=mylib._param_unc_y2183,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio183);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2184, param=mylib._param_unc_y2184,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio184);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2185, param=mylib._param_unc_y2185,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio185);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2186, param=mylib._param_unc_y2186,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio186);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2187, param=mylib._param_unc_y2187,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio187);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2188, param=mylib._param_unc_y2188,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio188);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2189, param=mylib._param_unc_y2189,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio189);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2190, param=mylib._param_unc_y2190,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio190);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2191, param=mylib._param_unc_y2191,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio191);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2192, param=mylib._param_unc_y2192,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio192);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2193, param=mylib._param_unc_y2193,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio193);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2194, param=mylib._param_unc_y2194,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio194);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2195, param=mylib._param_unc_y2195,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio195);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2196, param=mylib._param_unc_y2196,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio196);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2197, param=mylib._param_unc_y2197,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio197);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2198, param=mylib._param_unc_y2198,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio198);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2199, param=mylib._param_unc_y2199,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio199);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2200, param=mylib._param_unc_y2200,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio200);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2201, param=mylib._param_unc_y2201,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio201);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2202, param=mylib._param_unc_y2202,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio202);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2203, param=mylib._param_unc_y2203,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio203);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2204, param=mylib._param_unc_y2204,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio204);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2205, param=mylib._param_unc_y2205,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio205);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2206, param=mylib._param_unc_y2206,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio206);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2207, param=mylib._param_unc_y2207,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio207);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2208, param=mylib._param_unc_y2208,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio208);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2209, param=mylib._param_unc_y2209,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio209);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2210, param=mylib._param_unc_y2210,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio210);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2211, param=mylib._param_unc_y2211,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio211);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2212, param=mylib._param_unc_y2212,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio212);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2213, param=mylib._param_unc_y2213,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio213);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2214, param=mylib._param_unc_y2214,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio214);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2215, param=mylib._param_unc_y2215,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio215);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2216, param=mylib._param_unc_y2216,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio216);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2217, param=mylib._param_unc_y2217,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio217);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2218, param=mylib._param_unc_y2218,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio218);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2219, param=mylib._param_unc_y2219,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio219);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2220, param=mylib._param_unc_y2220,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio220);

     %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2221, param=mylib._param_unc_y2221,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio221);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2222, param=mylib._param_unc_y2222,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio222);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2223, param=mylib._param_unc_y2223,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio223);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2224, param=mylib._param_unc_y2224,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio224);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2225, param=mylib._param_unc_y2225,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio225);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2226, param=mylib._param_unc_y2226,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio226);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2227, param=mylib._param_unc_y2227,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio227);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2228, param=mylib._param_unc_y2228,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio228);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2229, param=mylib._param_unc_y2229,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio229);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2230, param=mylib._param_unc_y2230,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio230);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2231, param=mylib._param_unc_y2231,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio231);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2232, param=mylib._param_unc_y2232,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio232);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2233, param=mylib._param_unc_y2233,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio233);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2234, param=mylib._param_unc_y2234,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio234);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2235, param=mylib._param_unc_y2235,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio235);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2236, param=mylib._param_unc_y2236,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio236);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2237, param=mylib._param_unc_y2237,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio237);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2238, param=mylib._param_unc_y2238,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio238);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2239, param=mylib._param_unc_y2239,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio239);

 %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2240, param=mylib._param_unc_y2240,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio240);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2241, param=mylib._param_unc_y2241,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio241);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2242, param=mylib._param_unc_y2242,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio242);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2243, param=mylib._param_unc_y2243,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio243);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2244, param=mylib._param_unc_y2244,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio244);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2245, param=mylib._param_unc_y2245,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio245);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2246, param=mylib._param_unc_y2246,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio246);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2247, param=mylib._param_unc_y2247,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio247);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2248, param=mylib._param_unc_y2248,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio248);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2249, param=mylib._param_unc_y2249,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio249);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2250, param=mylib._param_unc_y2250,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio250);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2251, param=mylib._param_unc_y2251,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio251);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2252, param=mylib._param_unc_y2252,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio252);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2253, param=mylib._param_unc_y2253,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio253);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2254, param=mylib._param_unc_y2254,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio254);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2255, param=mylib._param_unc_y2255,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio255);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2256, param=mylib._param_unc_y2256,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio256);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2257, param=mylib._param_unc_y2257,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio257);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2258, param=mylib._param_unc_y2258,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio258);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2259, param=mylib._param_unc_y2259,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio259);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2260, param=mylib._param_unc_y2260,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio260);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2261, param=mylib._param_unc_y2261,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio261);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2262, param=mylib._param_unc_y2262,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio262);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2263, param=mylib._param_unc_y2263,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio263);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2264, param=mylib._param_unc_y2264,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio264);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2265, param=mylib._param_unc_y2265,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio265);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2266, param=mylib._param_unc_y2266,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio266);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2267, param=mylib._param_unc_y2267,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio267);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2268, param=mylib._param_unc_y2268,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio268);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2269, param=mylib._param_unc_y2269,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio269);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2270, param=mylib._param_unc_y2270,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio270);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2271, param=mylib._param_unc_y2271,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio271);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2272, param=mylib._param_unc_y2272,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio272);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2273, param=mylib._param_unc_y2273,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio273);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2274, param=mylib._param_unc_y2274,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio274);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2275, param=mylib._param_unc_y2275,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio275);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2276, param=mylib._param_unc_y2276,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio276);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2277, param=mylib._param_unc_y2277,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio277);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2278, param=mylib._param_unc_y2278,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio278);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2279, param=mylib._param_unc_y2279,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio279);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2280, param=mylib._param_unc_y2280,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio280);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2281, param=mylib._param_unc_y2281,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio281);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2282, param=mylib._param_unc_y2282,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio282);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2283, param=mylib._param_unc_y2283,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio283);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2284, param=mylib._param_unc_y2284,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio284);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2285, param=mylib._param_unc_y2285,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio285);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2286, param=mylib._param_unc_y2286,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio286);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2287, param=mylib._param_unc_y2287,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio287);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2288, param=mylib._param_unc_y2288,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio288);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2289, param=mylib._param_unc_y2289,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio289);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2290, param=mylib._param_unc_y2290,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio290);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2291, param=mylib._param_unc_y2291,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio291);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2292, param=mylib._param_unc_y2292,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio292);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2293, param=mylib._param_unc_y2293,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio293);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2294, param=mylib._param_unc_y2294,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio294);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2295, param=mylib._param_unc_y2295,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio295);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2296, param=mylib._param_unc_y2296,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio296);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2297, param=mylib._param_unc_y2297,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio297);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2298, param=mylib._param_unc_y2298,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio298);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2299, param=mylib._param_unc_y2299,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio299);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2300, param=mylib._param_unc_y2300,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio300);
	   
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2301, param=mylib._param_unc_y2301,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio301);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2302, param=mylib._param_unc_y2302,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio302);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2303, param=mylib._param_unc_y2303,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio303);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2304, param=mylib._param_unc_y2304,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio304);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2305, param=mylib._param_unc_y2305,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio305);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2306, param=mylib._param_unc_y2306,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio306);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2307, param=mylib._param_unc_y2307,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio307);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2308, param=mylib._param_unc_y2308,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio308);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2309, param=mylib._param_unc_y2309,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio309);

%Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2310, param=mylib._param_unc_y2310,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio310);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2311, param=mylib._param_unc_y2311,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio311);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2312, param=mylib._param_unc_y2312,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio312);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2313, param=mylib._param_unc_y2313,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio313);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2314, param=mylib._param_unc_y2314,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio314);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2315, param=mylib._param_unc_y2315,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio315);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2316, param=mylib._param_unc_y2316,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio316);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2317, param=mylib._param_unc_y2317,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio317);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2318, param=mylib._param_unc_y2318,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio318);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2319, param=mylib._param_unc_y2319,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio319);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2320, param=mylib._param_unc_y2320,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio320);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2321, param=mylib._param_unc_y2321,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio321);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2322, param=mylib._param_unc_y2322,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio322);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2323, param=mylib._param_unc_y2323,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio323);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2324, param=mylib._param_unc_y2324,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio324);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2325, param=mylib._param_unc_y2325,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio325);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2326, param=mylib._param_unc_y2326,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio326);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2327, param=mylib._param_unc_y2327,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio327);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2328, param=mylib._param_unc_y2328,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio328);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2329, param=mylib._param_unc_y2329,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio329);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2330, param=mylib._param_unc_y2330,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio330);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2331, param=mylib._param_unc_y2331,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio331);
	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2332, param=mylib._param_unc_y2332,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio332);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2333, param=mylib._param_unc_y2333,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio333);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2334, param=mylib._param_unc_y2334,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio334);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2335, param=mylib._param_unc_y2335,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio335);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2336, param=mylib._param_unc_y2336,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio336);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2337, param=mylib._param_unc_y2337,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio337);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2338, param=mylib._param_unc_y2338,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio338);
	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2339, param=mylib._param_unc_y2339,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio339);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2340, param=mylib._param_unc_y2340,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio340);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2341, param=mylib._param_unc_y2341,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio341);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2342, param=mylib._param_unc_y2342,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio342);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2343, param=mylib._param_unc_y2343,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio343);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2344, param=mylib._param_unc_y2344,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio344);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2345, param=mylib._param_unc_y2345,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio345);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2346, param=mylib._param_unc_y2346,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio346);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2347, param=mylib._param_unc_y2347,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio347);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2348, param=mylib._param_unc_y2348,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio348);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2349, param=mylib._param_unc_y2349,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio349);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2350, param=mylib._param_unc_y2350,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio350);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2351, param=mylib._param_unc_y2351,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio351);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2352, param=mylib._param_unc_y2352,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio352);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2353, param=mylib._param_unc_y2353,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio353);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2354, param=mylib._param_unc_y2354,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio354);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2355, param=mylib._param_unc_y2355,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio355);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2356, param=mylib._param_unc_y2356,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio356);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2357, param=mylib._param_unc_y2357,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio357);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2358, param=mylib._param_unc_y2358,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio358);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2359, param=mylib._param_unc_y2359,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio359);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2360, param=mylib._param_unc_y2360,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio360);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2361, param=mylib._param_unc_y2361,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio361);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2362, param=mylib._param_unc_y2362,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio362);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2363, param=mylib._param_unc_y2363,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio363);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2364, param=mylib._param_unc_y2364,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio364);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2365, param=mylib._param_unc_y2365,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio365);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2366, param=mylib._param_unc_y2366,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio366);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2367, param=mylib._param_unc_y2367,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio367);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2368, param=mylib._param_unc_y2368,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio368);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2369, param=mylib._param_unc_y2369,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio369);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2370, param=mylib._param_unc_y2370,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio370);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2371, param=mylib._param_unc_y2371,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio371);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2372, param=mylib._param_unc_y2372,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio372);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2373, param=mylib._param_unc_y2373,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio373);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2374, param=mylib._param_unc_y2374,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio374);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2375, param=mylib._param_unc_y2375,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio375);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2376, param=mylib._param_unc_y2376,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio376);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2377, param=mylib._param_unc_y2377,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio377);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2378, param=mylib._param_unc_y2378,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio378);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2379, param=mylib._param_unc_y2379,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio379);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2380, param=mylib._param_unc_y2380,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio380);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2381, param=mylib._param_unc_y2381,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio381);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2382, param=mylib._param_unc_y2382,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio382);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2383, param=mylib._param_unc_y2383,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio383);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2384, param=mylib._param_unc_y2384,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio384);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2385, param=mylib._param_unc_y2385,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio385);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2386, param=mylib._param_unc_y2386,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio386);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2387, param=mylib._param_unc_y2387,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio387);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2388, param=mylib._param_unc_y2388,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio388);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2389, param=mylib._param_unc_y2389,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio389);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2390, param=mylib._param_unc_y2390,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio390);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2391, param=mylib._param_unc_y2391,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio391);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2392, param=mylib._param_unc_y2392,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio392);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2393, param=mylib._param_unc_y2393,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio393);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2394, param=mylib._param_unc_y2394,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio394);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2395, param=mylib._param_unc_y2395,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio395);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2396, param=mylib._param_unc_y2396,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio396);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2397, param=mylib._param_unc_y2397,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio397);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2398, param=mylib._param_unc_y2398,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio398);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2399, param=mylib._param_unc_y2399,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio399);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2400, param=mylib._param_unc_y2400,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio400);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2401, param=mylib._param_unc_y2401,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio401);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2402, param=mylib._param_unc_y2402,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio402);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2403, param=mylib._param_unc_y2403,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio403);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2404, param=mylib._param_unc_y2404,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio404);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2405, param=mylib._param_unc_y2405,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio405);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2406, param=mylib._param_unc_y2406,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio406);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2407, param=mylib._param_unc_y2407,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio407);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2408, param=mylib._param_unc_y2408,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio408);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2409, param=mylib._param_unc_y2409,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio409);

%Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2410, param=mylib._param_unc_y2410,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio410);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2411, param=mylib._param_unc_y2411,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio411);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2412, param=mylib._param_unc_y2412,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio412);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2413, param=mylib._param_unc_y2413,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio413);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2414, param=mylib._param_unc_y2414,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio414);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2415, param=mylib._param_unc_y2415,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio415);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2416, param=mylib._param_unc_y2416,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio416);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2417, param=mylib._param_unc_y2417,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio417);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2418, param=mylib._param_unc_y2418,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio418);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2419, param=mylib._param_unc_y2419,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio419);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2420, param=mylib._param_unc_y2420,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio420);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2421, param=mylib._param_unc_y2421,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio421);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2422, param=mylib._param_unc_y2422,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio422);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2423, param=mylib._param_unc_y2423,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio423);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2424, param=mylib._param_unc_y2424,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio424);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2425, param=mylib._param_unc_y2425,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio425);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2426, param=mylib._param_unc_y2426,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio426);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2427, param=mylib._param_unc_y2427,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio427);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2428, param=mylib._param_unc_y2428,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio428);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2429, param=mylib._param_unc_y2429,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio429);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2430, param=mylib._param_unc_y2430,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio430);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2431, param=mylib._param_unc_y2431,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio431);
	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2432, param=mylib._param_unc_y2432,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio432);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2433, param=mylib._param_unc_y2433,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio433);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2434, param=mylib._param_unc_y2434,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio434);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2435, param=mylib._param_unc_y2435,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio435);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2436, param=mylib._param_unc_y2436,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio436);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2437, param=mylib._param_unc_y2437,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio437);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2438, param=mylib._param_unc_y2438,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio438);
	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2439, param=mylib._param_unc_y2439,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio439);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2440, param=mylib._param_unc_y2440,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio440);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2441, param=mylib._param_unc_y2441,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio441);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2442, param=mylib._param_unc_y2442,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio442);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2443, param=mylib._param_unc_y2443,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio443);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2444, param=mylib._param_unc_y2444,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio444);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2445, param=mylib._param_unc_y2445,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio445);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2446, param=mylib._param_unc_y2446,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio446);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2447, param=mylib._param_unc_y2447,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio447);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2448, param=mylib._param_unc_y2448,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio448);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2449, param=mylib._param_unc_y2449,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio449);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2450, param=mylib._param_unc_y2450,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio450);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2451, param=mylib._param_unc_y2451,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio451);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2452, param=mylib._param_unc_y2452,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio452);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2453, param=mylib._param_unc_y2453,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio453);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2454, param=mylib._param_unc_y2454,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio454);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2455, param=mylib._param_unc_y2455,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio455);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2456, param=mylib._param_unc_y2456,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio456);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2457, param=mylib._param_unc_y2457,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio457);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2458, param=mylib._param_unc_y2458,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio458);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2459, param=mylib._param_unc_y2459,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio459);

	  
	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2460, param=mylib._param_unc_y2460,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio460);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2461, param=mylib._param_unc_y2461,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio461);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2462, param=mylib._param_unc_y2462,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio462);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2463, param=mylib._param_unc_y2463,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio463);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2464, param=mylib._param_unc_y2464,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio464);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2465, param=mylib._param_unc_y2465,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio465);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2466, param=mylib._param_unc_y2466,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio466);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2467, param=mylib._param_unc_y2467,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio467);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2468, param=mylib._param_unc_y2468,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio468);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2469, param=mylib._param_unc_y2469,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio469);

	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2470, param=mylib._param_unc_y2470,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio470);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2471, param=mylib._param_unc_y2471,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio471);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2472, param=mylib._param_unc_y2472,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio472);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2473, param=mylib._param_unc_y2473,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio473);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2474, param=mylib._param_unc_y2474,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio474);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2475, param=mylib._param_unc_y2475,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio475);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2476, param=mylib._param_unc_y2476,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio476);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2477, param=mylib._param_unc_y2477,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio477);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2478, param=mylib._param_unc_y2478,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio478);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2479, param=mylib._param_unc_y2479,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio479);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2480, param=mylib._param_unc_y2480,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio480);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2481, param=mylib._param_unc_y2481,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio481);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2482, param=mylib._param_unc_y2482,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio482);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2483, param=mylib._param_unc_y2483,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio483);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2484, param=mylib._param_unc_y2484,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio484);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2485, param=mylib._param_unc_y2485,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio485);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2486, param=mylib._param_unc_y2486,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio486);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2487, param=mylib._param_unc_y2487,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio487);

	    %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2488, param=mylib._param_unc_y2488,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio488);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2489, param=mylib._param_unc_y2489,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio489);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2490, param=mylib._param_unc_y2490,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio490);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2491, param=mylib._param_unc_y2491,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio491);

	  
	  %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2492, param=mylib._param_unc_y2492,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio492);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2493, param=mylib._param_unc_y2493,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio493);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2494, param=mylib._param_unc_y2494,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio494);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2495, param=mylib._param_unc_y2495,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio495);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2496, param=mylib._param_unc_y2496,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio496);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2497, param=mylib._param_unc_y2497,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio497);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2498, param=mylib._param_unc_y2498,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio498);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2499, param=mylib._param_unc_y2499,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio499);

	   %Distrib (seed=5454768, nsim_mc=100,modeltype=amount,                             
          pred=mylib._pred_unc_y2500, param=mylib._param_unc_y2500,outlib=mylib,
	  cutpoints=0 11, 
	  ncutpnt=2,
	  byvar=,subgroup=,subject=nid,titles=4,food=y2_gio500);

data append;
merge mylib.Descript_y2_gio1_ mylib.Descript_y2_gio2_ mylib.Descript_y2_gio3_
mylib.Descript_y2_gio4_ mylib.Descript_y2_gio5_ mylib.Descript_y2_gio6_
mylib.Descript_y2_gio7_ mylib.Descript_y2_gio8_ mylib.Descript_y2_gio9_
mylib.Descript_y2_gio10_ mylib.Descript_y2_gio11_ mylib.Descript_y2_gio12_ mylib.Descript_y2_gio13_
mylib.Descript_y2_gio14_ mylib.Descript_y2_gio15_ mylib.Descript_y2_gio16_
mylib.Descript_y2_gio17_ mylib.Descript_y2_gio18_ mylib.Descript_y2_gio19_ 
mylib.Descript_y2_gio20_ mylib.Descript_y2_gio21_ mylib.Descript_y2_gio22_
mylib.Descript_y2_gio23_ mylib.Descript_y2_gio24_ mylib.Descript_y2_gio25_ 
mylib.Descript_y2_gio26_ mylib.Descript_y2_gio27_ mylib.Descript_y2_gio28_
mylib.Descript_y2_gio29_ mylib.Descript_y2_gio30_ mylib.Descript_y2_gio31_ 
mylib.Descript_y2_gio32_ mylib.Descript_y2_gio33_ mylib.Descript_y2_gio34_
mylib.Descript_y2_gio35_ mylib.Descript_y2_gio36_ mylib.Descript_y2_gio37_ 
mylib.Descript_y2_gio38_ mylib.Descript_y2_gio39_ mylib.Descript_y2_gio40_
mylib.Descript_y2_gio41_ mylib.Descript_y2_gio42_ mylib.Descript_y2_gio43_ 
mylib.Descript_y2_gio44_ mylib.Descript_y2_gio45_ mylib.Descript_y2_gio46_
mylib.Descript_y2_gio47_ mylib.Descript_y2_gio48_ mylib.Descript_y2_gio49_
mylib.Descript_y2_gio50_ mylib.Descript_y2_gio51_ mylib.Descript_y2_gio52_
mylib.Descript_y2_gio53_ mylib.Descript_y2_gio54_ mylib.Descript_y2_gio55_ 
mylib.Descript_y2_gio56_ mylib.Descript_y2_gio57_ mylib.Descript_y2_gio58_
mylib.Descript_y2_gio59_ mylib.Descript_y2_gio60_ mylib.Descript_y2_gio61_
mylib.Descript_y2_gio62_ mylib.Descript_y2_gio63_ mylib.Descript_y2_gio64_
mylib.Descript_y2_gio65_ mylib.Descript_y2_gio66_ mylib.Descript_y2_gio67_
mylib.Descript_y2_gio68_ mylib.Descript_y2_gio69_
mylib.Descript_y2_gio70_ mylib.Descript_y2_gio71_ mylib.Descript_y2_gio72_
mylib.Descript_y2_gio73_  mylib.Descript_y2_gio74_
mylib.Descript_y2_gio75_ mylib.Descript_y2_gio76_ mylib.Descript_y2_gio77_ 
mylib.Descript_y2_gio78_ mylib.Descript_y2_gio79_ mylib.Descript_y2_gio80_
mylib.Descript_y2_gio81_ mylib.Descript_y2_gio82_ mylib.Descript_y2_gio83_ 
mylib.Descript_y2_gio84_ mylib.Descript_y2_gio85_ mylib.Descript_y2_gio86_
mylib.Descript_y2_gio87_ mylib.Descript_y2_gio88_ mylib.Descript_y2_gio89_ 
mylib.Descript_y2_gio90_ mylib.Descript_y2_gio91_ mylib.Descript_y2_gio92_
mylib.Descript_y2_gio93_ mylib.Descript_y2_gio94_ mylib.Descript_y2_gio95_
mylib.Descript_y2_gio96_ mylib.Descript_y2_gio97_ mylib.Descript_y2_gio98_
mylib.Descript_y2_gio99_ mylib.Descript_y2_gio100_
mylib.Descript_y2_gio101_ mylib.Descript_y2_gio102_ mylib.Descript_y2_gio103_
mylib.Descript_y2_gio104_ mylib.Descript_y2_gio105_ mylib.Descript_y2_gio106_
mylib.Descript_y2_gio107_ mylib.Descript_y2_gio108_ mylib.Descript_y2_gio109_
mylib.Descript_y2_gio110_ mylib.Descript_y2_gio111_ mylib.Descript_y2_gio112_  mylib.Descript_y2_gio113_ 
mylib.Descript_y2_gio114_ mylib.Descript_y2_gio115_ mylib.Descript_y2_gio116_
mylib.Descript_y2_gio117_ mylib.Descript_y2_gio118_ mylib.Descript_y2_gio119_ 
mylib.Descript_y2_gio120_ mylib.Descript_y2_gio121_ mylib.Descript_y2_gio122_
mylib.Descript_y2_gio123_ mylib.Descript_y2_gio124_ mylib.Descript_y2_gio125_ 
mylib.Descript_y2_gio126_ mylib.Descript_y2_gio127_ mylib.Descript_y2_gio128_
mylib.Descript_y2_gio129_ mylib.Descript_y2_gio130_ mylib.Descript_y2_gio131_ 
mylib.Descript_y2_gio132_ mylib.Descript_y2_gio133_ mylib.Descript_y2_gio134_
mylib.Descript_y2_gio135_ mylib.Descript_y2_gio136_ mylib.Descript_y2_gio137_ 
mylib.Descript_y2_gio138_ mylib.Descript_y2_gio139_ mylib.Descript_y2_gio140_
mylib.Descript_y2_gio141_ mylib.Descript_y2_gio142_ mylib.Descript_y2_gio143_ 
mylib.Descript_y2_gio144_ mylib.Descript_y2_gio145_ mylib.Descript_y2_gio146_
mylib.Descript_y2_gio147_ mylib.Descript_y2_gio148_ mylib.Descript_y2_gio149_
mylib.Descript_y2_gio150_ mylib.Descript_y2_gio151_ mylib.Descript_y2_gio152_
mylib.Descript_y2_gio153_ mylib.Descript_y2_gio154_ mylib.Descript_y2_gio155_ 
mylib.Descript_y2_gio156_ mylib.Descript_y2_gio157_ mylib.Descript_y2_gio158_
mylib.Descript_y2_gio159_ mylib.Descript_y2_gio160_ mylib.Descript_y2_gio161_
mylib.Descript_y2_gio162_ mylib.Descript_y2_gio163_ mylib.Descript_y2_gio164_
mylib.Descript_y2_gio165_ mylib.Descript_y2_gio166_ mylib.Descript_y2_gio167_
mylib.Descript_y2_gio168_ mylib.Descript_y2_gio169_
mylib.Descript_y2_gio170_ mylib.Descript_y2_gio171_ mylib.Descript_y2_gio172_
mylib.Descript_y2_gio173_ mylib.Descript_y2_gio174_
mylib.Descript_y2_gio175_ mylib.Descript_y2_gio176_ mylib.Descript_y2_gio177_ 
mylib.Descript_y2_gio178_ mylib.Descript_y2_gio179_ mylib.Descript_y2_gio180_
mylib.Descript_y2_gio181_ mylib.Descript_y2_gio182_ mylib.Descript_y2_gio183_ 
mylib.Descript_y2_gio184_ mylib.Descript_y2_gio185_ mylib.Descript_y2_gio186_
mylib.Descript_y2_gio187_ mylib.Descript_y2_gio188_ mylib.Descript_y2_gio189_ 
mylib.Descript_y2_gio190_ mylib.Descript_y2_gio191_ mylib.Descript_y2_gio192_
mylib.Descript_y2_gio193_ mylib.Descript_y2_gio194_ mylib.Descript_y2_gio195_
mylib.Descript_y2_gio196_ mylib.Descript_y2_gio197_ mylib.Descript_y2_gio198_
mylib.Descript_y2_gio199_  mylib.Descript_y2_gio200_
mylib.Descript_y2_gio201_ mylib.Descript_y2_gio202_ mylib.Descript_y2_gio203_
mylib.Descript_y2_gio204_ mylib.Descript_y2_gio205_ mylib.Descript_y2_gio206_
mylib.Descript_y2_gio207_ mylib.Descript_y2_gio208_ mylib.Descript_y2_gio209_
mylib.Descript_y2_gio210_ mylib.Descript_y2_gio211_ mylib.Descript_y2_gio212_  mylib.Descript_y2_gio213_ 
mylib.Descript_y2_gio214_ mylib.Descript_y2_gio215_ mylib.Descript_y2_gio216_
mylib.Descript_y2_gio217_ mylib.Descript_y2_gio218_ mylib.Descript_y2_gio219_ 
mylib.Descript_y2_gio220_ mylib.Descript_y2_gio221_ mylib.Descript_y2_gio222_
mylib.Descript_y2_gio223_ mylib.Descript_y2_gio224_ mylib.Descript_y2_gio225_ 
mylib.Descript_y2_gio226_ mylib.Descript_y2_gio227_ mylib.Descript_y2_gio228_
mylib.Descript_y2_gio229_ mylib.Descript_y2_gio230_ mylib.Descript_y2_gio231_ 
mylib.Descript_y2_gio232_ mylib.Descript_y2_gio233_ mylib.Descript_y2_gio234_
mylib.Descript_y2_gio235_ mylib.Descript_y2_gio236_ mylib.Descript_y2_gio237_ 
mylib.Descript_y2_gio238_ mylib.Descript_y2_gio239_ mylib.Descript_y2_gio240_
mylib.Descript_y2_gio241_ mylib.Descript_y2_gio242_ mylib.Descript_y2_gio243_ 
mylib.Descript_y2_gio244_ mylib.Descript_y2_gio245_ mylib.Descript_y2_gio246_
mylib.Descript_y2_gio247_ mylib.Descript_y2_gio248_ mylib.Descript_y2_gio249_
mylib.Descript_y2_gio250_ mylib.Descript_y2_gio251_ mylib.Descript_y2_gio252_
mylib.Descript_y2_gio253_ mylib.Descript_y2_gio254_ mylib.Descript_y2_gio255_ 
mylib.Descript_y2_gio256_ mylib.Descript_y2_gio257_ mylib.Descript_y2_gio258_
mylib.Descript_y2_gio259_ mylib.Descript_y2_gio260_ mylib.Descript_y2_gio261_
mylib.Descript_y2_gio262_ mylib.Descript_y2_gio263_ mylib.Descript_y2_gio264_
mylib.Descript_y2_gio265_ mylib.Descript_y2_gio266_ mylib.Descript_y2_gio267_
mylib.Descript_y2_gio268_ mylib.Descript_y2_gio269_
mylib.Descript_y2_gio270_ mylib.Descript_y2_gio271_ mylib.Descript_y2_gio272_
mylib.Descript_y2_gio273_ mylib.Descript_y2_gio274_
mylib.Descript_y2_gio275_ mylib.Descript_y2_gio276_ mylib.Descript_y2_gio277_ 
mylib.Descript_y2_gio278_ mylib.Descript_y2_gio279_ mylib.Descript_y2_gio280_
mylib.Descript_y2_gio281_ mylib.Descript_y2_gio282_ mylib.Descript_y2_gio283_ 
mylib.Descript_y2_gio284_ mylib.Descript_y2_gio285_ mylib.Descript_y2_gio286_
mylib.Descript_y2_gio287_ mylib.Descript_y2_gio288_ mylib.Descript_y2_gio289_ 
mylib.Descript_y2_gio290_ mylib.Descript_y2_gio291_ mylib.Descript_y2_gio292_
mylib.Descript_y2_gio293_ mylib.Descript_y2_gio294_ mylib.Descript_y2_gio295_
mylib.Descript_y2_gio296_ mylib.Descript_y2_gio297_ mylib.Descript_y2_gio298_
mylib.Descript_y2_gio299_  mylib.Descript_y2_gio300_
mylib.Descript_y2_gio301_ mylib.Descript_y2_gio302_ mylib.Descript_y2_gio303_
mylib.Descript_y2_gio304_ mylib.Descript_y2_gio305_ mylib.Descript_y2_gio306_
mylib.Descript_y2_gio307_ mylib.Descript_y2_gio308_ mylib.Descript_y2_gio309_
mylib.Descript_y2_gio310_ mylib.Descript_y2_gio311_ mylib.Descript_y2_gio312_  mylib.Descript_y2_gio313_ 
mylib.Descript_y2_gio314_ mylib.Descript_y2_gio315_ mylib.Descript_y2_gio316_
mylib.Descript_y2_gio317_ mylib.Descript_y2_gio318_ mylib.Descript_y2_gio319_ 
mylib.Descript_y2_gio320_ mylib.Descript_y2_gio321_ mylib.Descript_y2_gio322_
mylib.Descript_y2_gio323_ mylib.Descript_y2_gio324_ mylib.Descript_y2_gio325_ 
mylib.Descript_y2_gio326_ mylib.Descript_y2_gio327_ mylib.Descript_y2_gio328_
mylib.Descript_y2_gio329_ mylib.Descript_y2_gio330_ mylib.Descript_y2_gio331_ 
mylib.Descript_y2_gio332_ mylib.Descript_y2_gio333_ mylib.Descript_y2_gio334_
mylib.Descript_y2_gio335_ mylib.Descript_y2_gio336_ mylib.Descript_y2_gio337_ 
mylib.Descript_y2_gio338_ mylib.Descript_y2_gio339_ mylib.Descript_y2_gio340_
mylib.Descript_y2_gio341_ mylib.Descript_y2_gio342_ mylib.Descript_y2_gio343_ 
mylib.Descript_y2_gio344_ mylib.Descript_y2_gio345_ mylib.Descript_y2_gio346_
mylib.Descript_y2_gio347_ mylib.Descript_y2_gio348_ mylib.Descript_y2_gio349_
mylib.Descript_y2_gio350_ mylib.Descript_y2_gio351_ mylib.Descript_y2_gio352_
mylib.Descript_y2_gio353_ mylib.Descript_y2_gio354_ mylib.Descript_y2_gio355_ 
mylib.Descript_y2_gio356_ mylib.Descript_y2_gio357_ mylib.Descript_y2_gio358_
mylib.Descript_y2_gio359_ mylib.Descript_y2_gio360_ mylib.Descript_y2_gio361_
mylib.Descript_y2_gio362_ mylib.Descript_y2_gio363_ mylib.Descript_y2_gio364_
mylib.Descript_y2_gio365_ mylib.Descript_y2_gio366_ mylib.Descript_y2_gio367_
mylib.Descript_y2_gio368_ mylib.Descript_y2_gio369_
mylib.Descript_y2_gio370_ mylib.Descript_y2_gio371_ mylib.Descript_y2_gio372_
mylib.Descript_y2_gio373_ mylib.Descript_y2_gio374_
mylib.Descript_y2_gio375_ mylib.Descript_y2_gio376_ mylib.Descript_y2_gio377_ 
mylib.Descript_y2_gio378_ mylib.Descript_y2_gio379_ mylib.Descript_y2_gio380_
mylib.Descript_y2_gio381_ mylib.Descript_y2_gio382_ mylib.Descript_y2_gio383_ 
mylib.Descript_y2_gio384_ mylib.Descript_y2_gio385_ mylib.Descript_y2_gio386_
mylib.Descript_y2_gio387_ mylib.Descript_y2_gio388_ mylib.Descript_y2_gio389_ 
mylib.Descript_y2_gio390_ mylib.Descript_y2_gio391_ mylib.Descript_y2_gio392_
mylib.Descript_y2_gio393_ mylib.Descript_y2_gio394_ mylib.Descript_y2_gio395_
mylib.Descript_y2_gio396_ mylib.Descript_y2_gio397_ mylib.Descript_y2_gio398_
mylib.Descript_y2_gio399_  mylib.Descript_y2_gio400_
mylib.Descript_y2_gio401_ mylib.Descript_y2_gio402_ mylib.Descript_y2_gio403_
mylib.Descript_y2_gio404_ mylib.Descript_y2_gio405_ mylib.Descript_y2_gio406_
mylib.Descript_y2_gio407_ mylib.Descript_y2_gio408_ mylib.Descript_y2_gio409_
mylib.Descript_y2_gio410_ mylib.Descript_y2_gio411_ mylib.Descript_y2_gio412_  mylib.Descript_y2_gio413_ 
mylib.Descript_y2_gio414_ mylib.Descript_y2_gio415_ mylib.Descript_y2_gio416_
mylib.Descript_y2_gio417_ mylib.Descript_y2_gio418_ mylib.Descript_y2_gio419_ 
mylib.Descript_y2_gio420_ mylib.Descript_y2_gio421_ mylib.Descript_y2_gio422_
mylib.Descript_y2_gio423_ mylib.Descript_y2_gio424_ mylib.Descript_y2_gio425_ 
mylib.Descript_y2_gio426_ mylib.Descript_y2_gio427_ mylib.Descript_y2_gio428_
mylib.Descript_y2_gio429_ mylib.Descript_y2_gio430_ mylib.Descript_y2_gio431_ 
mylib.Descript_y2_gio432_ mylib.Descript_y2_gio433_ mylib.Descript_y2_gio434_
mylib.Descript_y2_gio435_ mylib.Descript_y2_gio436_ mylib.Descript_y2_gio437_ 
mylib.Descript_y2_gio438_ mylib.Descript_y2_gio439_ mylib.Descript_y2_gio440_
mylib.Descript_y2_gio441_ mylib.Descript_y2_gio442_ mylib.Descript_y2_gio443_ 
mylib.Descript_y2_gio444_ mylib.Descript_y2_gio445_ mylib.Descript_y2_gio446_
mylib.Descript_y2_gio447_ mylib.Descript_y2_gio448_ mylib.Descript_y2_gio449_
mylib.Descript_y2_gio450_ mylib.Descript_y2_gio451_ mylib.Descript_y2_gio452_
mylib.Descript_y2_gio453_ mylib.Descript_y2_gio454_ mylib.Descript_y2_gio455_ 
mylib.Descript_y2_gio456_ mylib.Descript_y2_gio457_ mylib.Descript_y2_gio458_
mylib.Descript_y2_gio459_ mylib.Descript_y2_gio460_ mylib.Descript_y2_gio461_
mylib.Descript_y2_gio462_ mylib.Descript_y2_gio463_ mylib.Descript_y2_gio464_
mylib.Descript_y2_gio465_ mylib.Descript_y2_gio466_ mylib.Descript_y2_gio467_
mylib.Descript_y2_gio468_ mylib.Descript_y2_gio469_
mylib.Descript_y2_gio470_ mylib.Descript_y2_gio471_ mylib.Descript_y2_gio472_
mylib.Descript_y2_gio473_ mylib.Descript_y2_gio474_
mylib.Descript_y2_gio475_ mylib.Descript_y2_gio476_ mylib.Descript_y2_gio477_ 
mylib.Descript_y2_gio478_ mylib.Descript_y2_gio479_ mylib.Descript_y2_gio480_
mylib.Descript_y2_gio481_ mylib.Descript_y2_gio482_ mylib.Descript_y2_gio483_ 
mylib.Descript_y2_gio484_ mylib.Descript_y2_gio485_ mylib.Descript_y2_gio486_
mylib.Descript_y2_gio487_ mylib.Descript_y2_gio488_ mylib.Descript_y2_gio489_ 
mylib.Descript_y2_gio490_ mylib.Descript_y2_gio491_ mylib.Descript_y2_gio492_
mylib.Descript_y2_gio493_ mylib.Descript_y2_gio494_ mylib.Descript_y2_gio495_
mylib.Descript_y2_gio496_ mylib.Descript_y2_gio497_ mylib.Descript_y2_gio498_
mylib.Descript_y2_gio499_  mylib.Descript_y2_gio500_;
by mean_mc_t;
run;

proc means mean data=append;
var tpercentile5   tpercentile10  tpercentile25  tpercentile50  tpercentile75  tpercentile90  tpercentile95;
run;

data EQM;
set append;
E5=((tpercentile5-49.18420)/49.18420)**2;
E10=((tpercentile10-63.59358)/63.59358)**2;
E25=((tpercentile25-97.91166)/97.91166)**2;
E50=((tpercentile50-157.8359)/157.8359)**2;
E75=((tpercentile75-254.63562)/254.63562)**2;
E90=((tpercentile90-390.95223)/390.95223)**2;
E95=((tpercentile95-505.34492)/505.34492)**2;
run;
proc means mean data=EQM;
var E5 E10 E25 E50 E75 E90 E95;
run;





