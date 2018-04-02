rm(list=ls(all=TRUE))

library(foreach)
library(doParallel)
workers <- makeCluster(8) 
registerDoParallel(workers)

parproc<-function(g){

library(gamlss)
library(stats)
library(statmod)
library(bbmle)

result<-matrix(0,ncol=17)

for (i in 1:10){

ind=rep(NA,1500)
id=seq(1,500,1)
ind1=c(rep(id,3))
ind=sort(ind1)

rec=rep(1:3,500)

sb2=sqrt(0.3897)
a=rnorm(500,0,sb2)
 
aleatorio=rep(a,each=3)

sb2=sqrt(1.2186)
erro=rnorm(1500,0,sb2)

x=7.4056+aleatorio+erro

vita0=((x*0.0371)+1)^(1/0.0371)

x1=9+aleatorio+erro
vita1=((x1*0.0371)+1)^(1/0.0371)

sorteio=1:1500
selecao=sample(sorteio,75,replace=FALSE)
vita=replace(vita0,selecao,vita1[selecao])

dados1=data.frame(ind,rec,vita)


m1<-gamlss(vita~1,data=dados1,family=BCT(mu.link=log))

estiniciaisBCT<-c(m1$mu.lp[2],m1$sigma.lp[2],m1$nu.lp[2],m1$tau.lp[2])

m3<-lme(vita~1,random=~1|ind,data=dados1)

estinic<-as.vector(sqrt(getVarCov(m3)))
estinicialaleatorio<-ifelse(estinic>=10,0.5,estinic)

lambdainicial<-log(1/estinicialaleatorio)


dados<-data.frame(dados1$vita,dados1$ind)

BCT.Int<-function(b,beta.fixo,sigma,nu,tau,lambda,X,Z,Y,log=TRUE){
zeta=exp(lambda)
ll=sapply(b,function(bi){
preditor<-as.matrix(X)%*%beta.fixo+as.matrix(Z)%*%bi
mu=exp(preditor)
sigma=exp(sigma)
tau=exp(tau)
sum(dBCT(Y,mu=mu,sigma=sigma,nu=nu,tau=tau,log=TRUE))+
dnorm(bi,0,sd=1/zeta,log=TRUE)
})
if(log==FALSE){ll<-exp(ll)}
return(ll)}

gauss.hermite<-function(BCT.Int,n.pontos,beta.fixo,sigma,nu,tau,lambda,X,Z,Y,log=FALSE){
pontos<-gauss.quad(n.pontos,kind="hermite")
integral<-sum(pontos$weights*BCT.Int(pontos$nodes,beta.fixo,sigma,nu,tau,lambda,X,Z,Y,log=FALSE)/
exp(-pontos$nodes^2))
return(integral)
}

veroM<-function(modelo,formu.X,formu.Z,beta.fixo,sigma,nu,tau,lambda,
integral,pontos,dados){
dados.id<-split(dados,dados$dados1.ind)
ll<-c()
for(i in 1:length(dados.id)){
X<-model.matrix(as.formula(formu.X),data=dados.id[[i]])
Z<-model.matrix(as.formula(formu.Z),data=dados.id[[i]])
ll[i]<-gauss.hermite(modelo,n.pontos=pontos,X=X,Z=Z,
Y=dados.id[[i]]$dados1.vita,
beta.fixo=beta.fixo,sigma=sigma,nu=nu,tau=tau,lambda=lambda,
log=FALSE)
}
return(sum(log(ll)))
}
mod.BCT<-function(b0,sigma0,nu0,tau0,lambda0,integral,pontos,dados){
ll<-veroM(modelo=BCT.Int,formu.X="~1",formu.Z="~1",beta.fixo=b0,
sigma=sigma0,nu=nu0,tau=tau0,lambda=lambda0,integral=integral,pontos=pontos,dados=dados)
return(-ll)
}

P.GH=try(mle2(mod.BCT,start=list(b0=estiniciaisBCT[1],sigma0=estiniciaisBCT[2],nu0=estiniciaisBCT[3],tau0=estiniciaisBCT[4],
lambda0=lambdainicial),data=list(integral="GH",pontos=100,dados=dados)))

if(class(P.GH)!="try-error"){
estimativas<-c(as.numeric(coef(P.GH)[1]),exp(as.numeric(coef(P.GH)[2])),
as.numeric(coef(P.GH)[3]),exp(as.numeric(coef(P.GH)[4])),
1/exp(as.numeric(coef(P.GH)[5])))
errospadroes<-c(as.numeric(sqrt(diag(vcov(P.GH)))[1]),
as.numeric(sqrt(diag(vcov(P.GH)))[2]), 
as.numeric(sqrt(diag(vcov(P.GH)))[3]),
as.numeric(sqrt(diag(vcov(P.GH)))[4]),
as.numeric(sqrt(diag(vcov(P.GH)))[5]))

yest0<-matrix(0,ncol=100)
simulacao<-function(beta_0,sigmaest,nuest,tauest,lambdaest){
for (j in 1:500){
gammasim<-rnorm(100,0,lambdaest)
muest<-exp(beta_0+gammasim)
if(nuest>0){
z<-qt((1-(0.5*pt(1/(sigmaest*abs(nuest)),tauest))),tauest)}
else{
z<-qt((0.5*pt(1/(sigmaest*abs(nuest)),tauest)),tauest)}
if(nuest!=0){
yest<-muest*((1+sigmaest*nuest*z)^(1/nuest))}
else{
yest<-muest*exp(sigmaest*z)}
yest0<-rbind(yest0,yest)
resultado1<-yest0[-1,]
rm(gammasim)
}
return(resultado1)
}
A=simulacao(as.numeric(coef(P.GH)[1]),exp(as.numeric(coef(P.GH)[2])),
as.numeric(coef(P.GH)[3]),exp(as.numeric(coef(P.GH)[4])),1/exp(as.numeric(coef(P.GH)[5])))
resultado<-c(as.numeric(quantile(A,probs=c(0.05,0.10,0.25,0.5,0.75,0.9,0.95))),
estimativas,errospadroes)
}
else 
{resultado=c(-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)}
result<-rbind(result,resultado)
resultadofinal<-result[-1,]
rm(dados1)
}
resultadofinal
}
times<-50

T1<-system.time(A1<-foreach(j=1:times,.combine=rbind) %dopar% parproc(j)) 
A1
T1

k=0
n<-10
times<-50
l<-n*times
resultadoparcial<-A1
resultadoparcial
resultadofinalc<-matrix(0,ncol=17)
for (j in 1:l){
if (resultadoparcial[j,1]!=-1) {
resultadofinalc<-rbind(resultadofinalc,resultadoparcial[j,])
resultadofinal<-resultadofinalc[-1,]}
else
{k=k+1}
}
resultadofinal
k
percentis=c(mean(resultadofinal[,1]),mean(resultadofinal[,2]),
mean(resultadofinal[,3]),mean(resultadofinal[,4]),
mean(resultadofinal[,5]),mean(resultadofinal[,6]),
mean(resultadofinal[,7]))
percentis

estimativasfinais<-c(mean(resultadofinal[,8]),mean(resultadofinal[,9]),
mean(resultadofinal[,10]),mean(resultadofinal[,11]),mean(resultadofinal[,12]))
estimativasfinais

verdadeiroperc<-c(320.87,384.82,521.16,728.18,1013.36,1359.03,1617.61)
viesrpercentis<-c(((-verdadeiroperc[1]+percentis[1])/verdadeiroperc[1])*100,
((-verdadeiroperc[2]+percentis[2])/verdadeiroperc[2])*100,
((-verdadeiroperc[3]+percentis[3])/verdadeiroperc[3])*100,
((-verdadeiroperc[4]+percentis[4])/verdadeiroperc[4])*100,
((-verdadeiroperc[5]+percentis[5])/verdadeiroperc[5])*100,
((-verdadeiroperc[6]+percentis[6])/verdadeiroperc[6])*100,
((-verdadeiroperc[7]+percentis[7])/verdadeiroperc[7])*100)
viesrpercentis

EQMrpercentis=c(sqrt((sum(((resultadofinal[,1]-verdadeiroperc[1])/verdadeiroperc[1])^2))/l),
sqrt((sum(((resultadofinal[,2]-verdadeiroperc[2])/verdadeiroperc[2])^2))/l),
sqrt((sum(((resultadofinal[,3]-verdadeiroperc[3])/verdadeiroperc[3])^2))/l),
sqrt((sum(((resultadofinal[,4]-verdadeiroperc[4])/verdadeiroperc[4])^2))/l),
sqrt((sum(((resultadofinal[,5]-verdadeiroperc[5])/verdadeiroperc[5])^2))/l),
sqrt((sum(((resultadofinal[,6]-verdadeiroperc[6])/verdadeiroperc[6])^2))/l),
sqrt((sum(((resultadofinal[,7]-verdadeiroperc[7])/verdadeiroperc[7])^2))/l))
EQMrpercentis

errospadroesest<-c(mean(resultadofinal[,13]),mean(resultadofinal[,14]),
mean(resultadofinal[,15]),mean(resultadofinal[,16]),mean(resultadofinal[,17]))
errospadroesest
