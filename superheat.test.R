library(superheat); library(readxl)
getwd(); 
setwd("~/Desktop")

tmp.f <- read_excel("superheat.example.xlsx", sheet="sig"); row.names(tmp.f) <- tmp.f$genes ; tmp.f[,1] <- NULL ; tmp.f[is.na(tmp.f)] <- ""
tmp.p <- read_excel("superheat.example.xlsx", sheet="values"); row.names(tmp.p) <- tmp.p$genes ; tmp.p[,1] <- NULL
tmp.g <- read_excel("superheat.example.xlsx", sheet="groups"); row.names(tmp.g) <- tmp.g$genes ; tmp.g[,1] <- NULL

my.max <- c( max(tmp.p), abs( min(tmp.p) ) ) 

png("my.heatmap.png",  width = 6000, height = 100* nrow(tmp.p) + 1500 ) # This is in a loop in my full dataset, so png size will vary

superheat(  as.matrix(tmp.p), X.text=as.matrix(na.omit(tmp.f)), 
            pretty.order.rows = FALSE,
            pretty.order.cols = FALSE,
            heat.lim=c( (round(max(my.max), 2)*-1 )-0.1, round(max(my.max), 2)+0.1 ), 
            bottom.label.col = "white",  
            legend.text.size = 22, 
            bottom.label.text.size=16,  
            left.label.text.size=16,   
            X.text.size = 16,
            
            left.label.text.alignment="right", 
            bottom.label.text.alignment = "right",  
            
            bottom.label.size= 0.90, 
            left.label.size = 0.80,
            
            legend=TRUE, 
            legend.vspace = 0.1,  
            legend.height=1,  
            legend.width=4, # I wish this could be near bottom left corner near 0,0
            
            grid.vline = TRUE, 
            grid.vline.size = 1, 
            grid.hline = TRUE, 
            grid.hline.size = 1, 
            grid.vline.col = "white",  
            grid.hline.col = "white",
            
            bottom.label.text.angle=90,  
            heat.pal = c("#3B9AB2", "white", "#F21A00"),  
            heat.pal.values = c(0, 0.5, 1),  
            
            yr=as.numeric(tmp.g$group.number), # tmp.g$group.name doesn't work!
            yr.axis.name = "",
            yr.point.size = 10,
            yr.obs.col = rep("wheat3", nrow(tmp.g)),
            yr.breaks = c(0, 1, 2, 3, 4),
            yr.break.labels = c("A", "B", "C", "D", "E"),
            yr.axis.size=16, 
            yr.axis.name.size=16,
            
            scale=FALSE, 
            force.left.label = TRUE,  
            left.label.col = "white"
            ); dev.off()