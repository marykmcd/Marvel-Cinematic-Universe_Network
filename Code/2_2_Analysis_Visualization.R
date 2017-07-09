rm(list=ls())
gc()

library(gplots)
library(ExPosition)

source('PlottingHelperFunctions.R')

load('../Data/ForAnalyses/base.cols2.rda')
load('../Data/ForAnalyses/movie.mats.nogs_min2.rda')
load('../Data/ForAnalyses/movie.mats.nogs_min1.rda')
load('../Data/ForAnalyses/movie.mats.nogs.rda')
load('../Data/ForAnalyses/global.signal.rda')
load('../Data/ForAnalyses/movie.mats_min2.rda')
load('../Data/ForAnalyses/movie.mats_min1.rda')
load('../Data/ForAnalyses/movie.mats.rda')
load('../Data/ForAnalyses/unique.movies.rda')
load('../Data/ForAnalyses/appearances.rda')

# he's special.
appearances["Stan Lee"] <- (length(base.cols2$gc)-1)


	#OK awesome the triangular images are done.


##

ca.res <- epCA(movie.mats$thresh_load_diag,graphs=F)
	# ## we don't want "inverse dimensions" which(diag(cor(ca.res$ExPosition.Data$fi,ca.res$ExPosition.Data$fj))==1)
	# which(diag(cor(ca.res3$ExPosition.Data$fi,ca.res3$ExPosition.Data$fj))==1)	
	thisPlotter(ca.res,appearances[rownames(ca.res$ExPosition.Data$fi)],base.cols2,1,2,leg.pos="bottomleft")
	thisPlotter(ca.res,rep(3,nrow(ca.res$ExPosition.Data$fi)),base.cols2,1,2,leg.pos="topleft")	
	
	thisPlotter(ca.res,rep(1,nrow(ca.res$ExPosition.Data$fi)),base.cols2,7,8,leg.pos="topleft")
	thisPlotter(ca.res,log(appearances[rownames(ca.res$ExPosition.Data$fi)]+1),base.cols2,1,2,leg.pos="topleft")
		
# dica.res <- epCA(t(makeNominalData(as.matrix(base.cols2$oc[rownames(movie.mats$thresh_load_diag),]))) %*% movie.mats$thresh_load_diag,graphs=F)
# res <- isoMDS(dist(dica.res$ExPosition.Data$fj %*% diag(1/dica.res$ExPosition.Data$pdq$Dv)))
# plot(res$points,pch=20,col=base.cols2$oc[rownames(res$points),])
		
		
		prettyPlot(ca.res$ExPosition.Data$fi,display_names=F,col=base.cols2$oc[rownames(ca.res $ExPosition.Data$fi),],cex= log((appearances[rownames(ca.res$ExPosition.Data$fi)]/2)+1),axes=F,pch=20,x_axis=1,y_axis=2)
		
		## I need to have a dual set of colors and sizes
			## color and size should be set to alpha=.5 and cex=.75  for all ividuals not in nogs_min2
				## then nogs_min2 individuals will have alpha=1 and cex= # appearances (or connections?)
		## but the first one should be just as is.
		plot(ca.res$ExPosition.Data$fi,axes=F,pch=20,col=base.cols2$oc[rownames(ca.res $ExPosition.Data$fi),],xlab="",ylab="",cex= log((appearances[rownames(ca.res$ExPosition.Data$fi)]/2)+1))
		
		
		
#		plot(ca.res$ExPosition.Data$fi,axes=F,pch=20,col=base.cols2$oc[rownames(ca.res $ExPosition.Data$fi),],xlab="",ylab="",cex= log((appearances[rownames(ca.res$ExPosition.Data$fi)]/2)+1))
		## now just these people.

		gc()		
		all.inds <- rownames(movie.mats$counts)
		nogs_min2.inds <- rownames(movie.mats.nogs_min2$counts)
		diff.inds <- setdiff(all.inds,nogs_min2.inds)
		
		
		
		# plot(ca.res$ExPosition.Data$fi[all.inds,],axes=F,pch=20,col=add.alpha("white",0),xlab="",ylab="")
		# abline(v=0,lwd=5,col='grey35',lty=3)
		# abline(h=0,lwd=5,col='grey35',lty=3)	
		# points(ca.res$ExPosition.Data$fi[all.inds,],pch=20,col=add.alpha(base.cols2$oc[all.inds,],.35),xlab="",ylab="",cex=1.5)
		# spread.labels(ca.res$ExPosition.Data$fi[all.inds,1],ca.res$ExPosition.Data$fi[all.inds,2],labels= all.inds,col=add.alpha(base.cols2$oc[all.inds,],.7),cex=.5,between=T)	
		
		png("../Pictures/CA_12__NetworkConfig.png",width=28000,height=28000,pointsize=132)
		plot(ca.res$ExPosition.Data$fi[all.inds,],axes=F,pch=20,col=add.alpha("white",0),xlab="",ylab="")
		abline(v=0,lwd=10,col='black',lty=3)
		abline(h=0,lwd=10,col='black',lty=3)	
		points(ca.res$ExPosition.Data$fi[all.inds,],pch=20,col=add.alpha(base.cols2$oc[all.inds,],.35),cex=1.5)
		text(ca.res$ExPosition.Data$fi[all.inds,1],ca.res$ExPosition.Data$fi[all.inds,2],labels= all.inds,col=add.alpha(base.cols2$oc[all.inds,],.7),cex=.5,pos=1)		
		
		# points(ca.res$ExPosition.Data$fi[diff.inds,],pch=20,col=add.alpha(base.cols2$oc[diff.inds,],.25),xlab="",ylab="",cex=1.5)
		# text(ca.res$ExPosition.Data$fi[diff.inds,1],ca.res$ExPosition.Data$fi[diff.inds,2],labels= diff.inds,col=add.alpha(base.cols2$oc[diff.inds,],.7),cex=.5,pos=1)
		
		# points(ca.res$ExPosition.Data$fi[nogs_min2.inds,],pch=21,col="black",bg=base.cols2$oc[nogs_min2.inds,],xlab="",ylab="",cex=log(rowSums(movie.mats.nogs_min2$counts[nogs_min2.inds,nogs_min2.inds]>0)-1)+1)
		# text(ca.res$ExPosition.Data$fi[diff.inds,1],ca.res$ExPosition.Data$fi[diff.inds,2],labels= diff.inds,col=add.alpha(base.cols2$oc[diff.inds,],.7),cex=.5,pos=1)		
		# shadowtext(ca.res$ExPosition.Data$fi[nogs_min2.inds,1],ca.res$ExPosition.Data$fi[nogs_min2.inds,2],labels=nogs_min2.inds,col=base.cols2$oc[nogs_min2.inds,],bg=add.alpha("grey60",.5),cex=.75)
		
		legend("top",legend=rownames(base.cols2$gc),col=base.cols2$gc,pch=20,cex=2.5,pt.cex=3,text.col=base.cols2$gc,bty="n")
		dev.off()		
		gc()
		
		png("../Pictures/CA_12__NoGS_Min2_Network.png",width=28000,height=28000,pointsize=132)
		plot(ca.res$ExPosition.Data$fi,axes=F,pch=20,col=add.alpha("white",0),xlab="",ylab="")
		abline(v=0,lwd=10,col='black',lty=3)
		abline(h=0,lwd=10,col='black',lty=3)				
		for(i in 1:nrow(movie.mats.nogs_min2$thresh_zero.diag)){
			this.point <- ca.res$ExPosition.Data$fi[rownames(movie.mats.nogs_min2$thresh_zero.diag)[i],1:2]
			those.names <- names(which(which(movie.mats.nogs_min2$thresh_zero.diag[i,]==1)>i))
			if(length(those.names)>0){
				for(j in 1:length(those.names)){
					that.point <- ca.res$ExPosition.Data$fi[those.names[j],1:2]
					points(rbind(this.point,that.point),type="l",col=add.alpha("black",.5),lwd=3,lty=1)
				}
			}
		}
		points(ca.res$ExPosition.Data$fi[diff.inds,],pch=20,col=add.alpha(base.cols2$oc[diff.inds,],.25),xlab="",ylab="",cex=1.5)
		text(ca.res$ExPosition.Data$fi[diff.inds,1],ca.res$ExPosition.Data$fi[diff.inds,2],labels= diff.inds,col=add.alpha(base.cols2$oc[diff.inds,],.7),cex=.5,pos=1)
		
		points(ca.res$ExPosition.Data$fi[nogs_min2.inds,],pch=21,col="black",bg=base.cols2$oc[nogs_min2.inds,],xlab="",ylab="",cex=log(rowSums(movie.mats.nogs_min2$counts[nogs_min2.inds,nogs_min2.inds]>0)-1)+1)
		shadowtext(ca.res$ExPosition.Data$fi[nogs_min2.inds,1],ca.res$ExPosition.Data$fi[nogs_min2.inds,2],labels=nogs_min2.inds,col=base.cols2$oc[nogs_min2.inds,],bg=add.alpha("grey60",.5),cex=.75)
		
		legend("top",legend=rownames(base.cols2$gc),col=base.cols2$gc,pch=20,cex=2.5,pt.cex=3,text.col=base.cols2$gc,bty="n")		
		dev.off()
		gc()
		
		
		#prettyPlot(res$ExPosition.Data$fi,display_names=T,display_points=F,col=cols$oc[rownames(res$ExPosition.Data$fi),],text.cex=(appears/2)/2,axes=F,x_axis=xa,y_axis=ya)		
		
		
		
		

## then dive into NoGS with min connections @ 2; 1 is cool, too. Should build up.
ca.res1 <- epCA(movie.mats.nogs_min1$thresh_load_diag,graphs=F)
	# ## we don't want "inverse dimensions" which(diag(cor(ca.res$ExPosition.Data$fi,ca.res$ExPosition.Data$fj))==1)
	# which(diag(cor(ca.res3$ExPosition.Data$fi,ca.res3$ExPosition.Data$fj))==1)	
	thisPlotter(ca.res1,appearances[rownames(ca.res1$ExPosition.Data$fi)],base.cols2,3,4,leg.pos="bottomleft")
	thisPlotter(ca.res1,rep(2,nrow(ca.res1$ExPosition.Data$fi)),base.cols2,3,4,leg.pos="bottomleft")	
		
ca.res2 <- epCA(movie.mats.nogs_min2$thresh_load_diag,graphs=F)
	# ## we don't want "inverse dimensions" which(diag(cor(ca.res$ExPosition.Data$fi,ca.res$ExPosition.Data$fj))==1)
	# which(diag(cor(ca.res3$ExPosition.Data$fi,ca.res3$ExPosition.Data$fj))==1)	
	thisPlotter(ca.res2,appearances[rownames(ca.res2$ExPosition.Data$fi)],base.cols2,3,4,leg.pos="bottomleft")
	thisPlotter(ca.res2,rep(4,nrow(ca.res2$ExPosition.Data$fi)),base.cols2,3,4,leg.pos="bottomleft")	


## then dive into the old code to connect individuals.
