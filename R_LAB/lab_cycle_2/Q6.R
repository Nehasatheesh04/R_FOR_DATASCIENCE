# Load the mtcars dataset
data(mtcars)

# Define colors for carburetors
unique_carb <- unique(mtcars$carb)
colors <- c("blue", "red", "green", "purple", "orange", "cyan", "magenta", "yellow") 
carb_colors <- colors[match(mtcars$carb, unique_carb)] # Map colors to carburetors

# Define sizes for carburetors
carb_sizes <- as.numeric(as.factor(mtcars$carb)) * 0.5 + 1

# Create the scatter plot
plot(mtcars$wt, mtcars$disp,
     col = carb_colors,              
     pch = 19,                       
     cex = carb_sizes,              
     xlab = "Weight (wt)", 
     ylab = "Displacement (disp)",
     main = "Scatter Plot of Displacement vs. Weight with Carburetors")

# Add a smooth line to show the trend
smooth_line <- loess.smooth(mtcars$wt, mtcars$disp)
lines(smooth_line, col = "black", lwd = 2)

# Add a legend
legend("topright", legend = unique_carb, 
       col = colors[1:length(unique_carb)],
       pch = 19, 
       pt.cex = seq(1, 2, length.out = length(unique_carb)),
       title = "Carburetors")


