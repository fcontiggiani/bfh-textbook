require(shape)
pdf(file = "competitionmarkets/makost_market1.pdf", width = 9, height = 7)

#Set parameters for graphics
axislabelsize <- 1.5
labelsize <- 1.5
graphlinewidth <- 3
segmentlinewidth <- 2

COL <- c("#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666")
COLA <- c("#e0f3db", "#99d8c9","#66c2a4","#41ae76", "#238b45", "#005824")
COLB <- c("#c6dbef", "#4eb3d3", "#2b8cbe", "#0868ac","#084081")
COLC <- c("#fcfbfd", "#efedf5", "#dadaeb", "#bcbddc", "#9e9ac8", "#807dba", "#6a51a3", "#54278f", "#3f007d")

par(mar =  c(5, 5, 2, 2))

Demand <- function(x, rmax = 20, xmax = 12, n = 10) {
  rmax - (rmax/(n*xmax))*x
}

mrsA <- function(x, rmax = 20, xmax = 10) {
  rmax - (rmax/xmax)*x
}

uA <- function(x, y, rmax, rmax = 20, xmax = 10) {
  y + rmax*x - (1/2)(rmax/xmax)*x^2
}


Supply <- function(x, c1 = 0, c2 = 0.05){
  c1 + 2*c2*x
}

xlims <- c(0, 2)
ylims <- c(0, 4)

npts <- 501 

plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
     xlab = expression(paste("")),
     ylab = expression(paste("")), 
     xaxt = "n", 
     yaxt = "n", 
     cex.lab = axislabelsize, 
     bty = "n",
     xaxs="i", 
     yaxs="i")

# ticksy <- seq(from = 0, to = ylims[2], by = 2)
# ylabels <- seq(from = 0, to = ylims[2], by = 2)
# ticksx <- seq(from = 0, to = xlims[2], by = 2)
# xlabels <- seq(from = 0, to = xlims[2], by = 2)
ticksy <- c(0, 1, 3, ylims[2])
ylabels <- c(NA, expression(paste(c[1])), expression(paste(r[max])), NA)
ticksx <- c(0, 1, xlims[2])
xlabels <- c(NA, 1, NA)

axis(1, at = ticksx, pos = 0, labels = xlabels, cex.axis = axislabelsize)
axis(2, at = ticksy, pos = 0, labels = ylabels, las = 1, cex.axis = axislabelsize)

npts <- 500 
xx1 <- seq(xlims[1], xlims[2], length.out = npts)

#Draw the polygon for producer surplus
# xpoly1 <- c(0, 75, 0, 0)
# ypoly1 <- c(0, 7.5, 7.5, 0)
# polygon(x = xpoly1, y = ypoly1, col=COLB[1], density=NULL, border = NA)

# #Draw the polygon for consumer surplus
# xpoly2 <- c(0, 75, 0, 0)
# ypoly2 <- c(7.5, 7.5, 20, 7.5)
# polygon(x = xpoly2, y = ypoly2, col=COLA[1], density=NULL, border = NA)
# text(25, 6, expression(paste("Producer Surplus")), xpd = TRUE, cex = labelsize) 
# text(25, 11.5, expression(paste("Consumer Surplus")), xpd = TRUE, cex = labelsize) 

#Lines for mrs graph
# lines(xx1, Demand(xx1), col = COLA[4], lwd = graphlinewidth)
# lines(xx1, Supply(xx1), col = COLB[4], lwd = graphlinewidth)
#lines(xx1, mrsA(xx1, rmax = 20, xmax = 10), col = COLA[4], lwd = graphlinewidth)

#Line for Demand
segments(0, 3, 1, 3, lty = 1, col = COLA[4] , lwd = segmentlinewidth)
segments(1, 0, 1, 3, lty = 1, col = COLA[4] , lwd = segmentlinewidth)

#Line for Supply
segments(0, 1, 0.98, 1, lty = 1, col = COLB[4] , lwd = segmentlinewidth)
segments(0.98, 1, 0.98, 4, lty = 1, col = COLB[4] , lwd = segmentlinewidth)

#Label axes
mtext(expression(paste("Quantity of output, ", x)), side=1, line = 2.5, cex = axislabelsize)
text(-0.2, 0.5*ylims[2], expression(paste("Price per unit of x, ", p[X])), xpd = TRUE, cex = axislabelsize, srt = 90) 
# 
# points(50, 10, pch = 16, col = "black", cex = 1.5)
# text(52, 10.5, expression(M))

#segments(4.11765, 6.17647, 5.88, 8.88, lty = 1, col = COL[2] , lwd = graphlinewidth)
text(1.26, 0.65, expression("Single"), cex = labelsize)
text(1.26, 0.5, expression("Buyer's Demand"), cex = labelsize)
text(1.21, 3.65, expression("Single"), cex = labelsize)
text(1.21, 3.5, expression("Seller's Supply"), cex = labelsize)

text(0.27, 2.1, expression("Equilibrium price"), cex = labelsize)
text(0.27, 1.9, expression("falls in this range"), cex = labelsize)
Arrows(0.55, 1.1, 0.55, 2.9, col = "black", code =3, lty = 1, lwd = 2, arr.type = "triangle", arr.lwd = 0.5)


dev.off()
