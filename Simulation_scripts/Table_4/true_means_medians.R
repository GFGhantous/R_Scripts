rm(list=ls(all=TRUE))
result<-matrix(0,ncol=500)
system.time(for (i in 1:500){
ind=rep(NA,1500)
id=seq(1,500,1)
ind1=c(rep(id,365))
ind=sort(ind1)
rec=rep(1:365,500)
sb2=sqrt(0.3897)
a=rnorm(500,0,sb2)
aleatorio=rep(a,each=365)
sb2=sqrt(1.2186)
erro=rnorm(182500,0,sb2)
x=7.4056+aleatorio+erro
vita0=((x*0.0371)+1)^(1/0.0371)
x1=9+aleatorio+erro
vita1=((x1*0.0371)+1)^(1/0.0371)
sorteio=1:182500
selecao=sample(sorteio,9125,replace=FALSE)
y=replace(vita0,selecao,vita1[selecao])
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
ind=rep(NA,1500)
id=seq(1,500,1)
ind1=c(rep(id,365))
ind=sort(ind1)
rec=rep(1:365,500)
sb2=sqrt(0.3897)
a=rnorm(500,0,sb2)
aleatorio=rep(a,each=365)
sb2=sqrt(1.2186)
erro=rnorm(182500,0,sb2)
x=7.4056+aleatorio+erro
vita0=((x*0.0371)+1)^(1/0.0371)
x1=9+aleatorio+erro
vita1=((x1*0.0371)+1)^(1/0.0371)
sorteio=1:182500
selecao=sample(sorteio,9125,replace=FALSE)
y=replace(vita0,selecao,vita1[selecao])
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



