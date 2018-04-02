rm(list=ls(all=TRUE))
result<-matrix(0,ncol=500)
system.time(for (i in 1:500){
  
sd=sqrt(0.25)
a=rnorm(500,0,sd)
aleatorio=rep(a,each=365)
  
bo=1
mu=exp(bo+aleatorio)
y0=rgamma(182500,mu/2,scale=2)
  
bo1=4
mu1=exp(bo1+aleatorio)
y1=rgamma(182500,mu1/2,scale=2)
  
sorteio=1:182500
selecao=sample(sorteio,9125,replace=FALSE)
y=replace(y0,selecao,y1[selecao])
  
ind=rep(NA,1500)
id=seq(1,500,1)
ind1=c(rep(id,365))
ind=sort(ind1)
  
rec=rep(1:365,500)
  
dados=data.frame(ind,rec,y)
  
medias=tapply(dados$y,dados$ind,mean)
result<-rbind(result,medias)
resultado<-result[-1,]
rm(dados)
}
)
resultado
length(resultado)
m=as.numeric(resultado)
quantismedias<-quantile(m,probs=c(0.05,0.10,0.25,0.5,0.75,0.9,0.95))
quantismedias


rm(list=ls(all=TRUE))
result<-matrix(0,ncol=500)
system.time(for (i in 1:500){

sd=sqrt(0.25)
a=rnorm(500,0,sd)
aleatorio=rep(a,each=365)

bo=1
mu=exp(bo+aleatorio)
y0=rgamma(182500,mu/2,scale=2)

bo1=4
mu1=exp(bo1+aleatorio)
y1=rgamma(182500,mu1/2,scale=2)

sorteio=1:182500
selecao=sample(sorteio,9125,replace=FALSE)
y=replace(y0,selecao,y1[selecao])

ind=rep(NA,1500)
id=seq(1,500,1)
ind1=c(rep(id,365))
ind=sort(ind1)

rec=rep(1:365,500)

dados=data.frame(ind,rec,y)

medianas=tapply(dados$y,dados$ind,median)
result<-rbind(result,medianas)
resultado<-result[-1,]
rm(dados)
}
)
resultado
length(resultado)
m=as.numeric(resultado)
quantismedianas<-quantile(m,probs=c(0.05,0.10,0.25,0.5,0.75,0.9,0.95))
quantismedianas






