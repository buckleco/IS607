#Question 1

#a.
queue <- c("James", "Mary", "Steve", "Alex", "Patricia")
queue
#b.
queue[length(queue)+1] <- "Harold"
queue
#c.
delete.value1 <- "James"
queue <- queue[which(queue!=delete.value1)] 
queue
#d.
queue <- append(queue, "Pam", after=1)
queue
#e.
delete.value2 <- "Harold"
queue <- queue[which(queue!=delete.value2)] 
queue
#f.
delete.value3 <- "Alex"
queue <- queue[which(queue!=delete.value3)] 
queue
#g.
which(queue=="Patricia")
#h.
length(queue)

#Question 2
# Create a function called calc.quad.roots that takes three arguments.
# Based on the three arguments the function ouputs the quadratic roots.
calc.quad.roots <- function(a, b, c)
{
# Create a variable to store the discriminant
  desc <- ((b * b) - (4 * a * c))
  if (desc < 0)
  {
    print("There are no real roots.")
  } else if (desc == 0)
  {
    x <- (-b + desc) / (2 * a)  
    print(strwrap(paste("The only root is = ", x)))
  } else if (desc > 0)
  {
    x1 <- (-b + sqrt(desc)) / (2 * a)
    x2 <- (-b - sqrt(desc)) / (2 * a)
    print(strwrap(paste("Root 1 = ", x1)))
    print(strwrap(paste("Root 2 = ", x2)))
  } else
  {
    print("Error. Please try again")
  }
}
# Call the function with various parameters.
calc.quad.roots(1, -2, -4) # two real roots
calc.quad.roots(9, 12, 4) # one real root
calc.quad.roots(3, 4, 2) # no real roots

#Question 3

# Set variables and create a vector from 1:1000
total <- 1000
vec1 <- c(1:total)
final.count <- total
# For loop counts throught the vector subtracting 1 from the total when required.
for (i in vec1)
{
  if (i %% 3 == 0 || i %% 7 == 0 || i %% 11 == 0)
  {
    final.count <- final.count - 1
  }
}
final.count

#Question 4

# Create a function called pythagorean.triple that takes three arguments.
# The function checks if the inputs form a pythagorean triple.
pythagorean.triple <- function(f, g, h)
{
# Create variables to store the squares.
f2 <- (f * f)  
g2 <- (g * g)
h2 <- (h * h)
# If statement to test if parameters form a pythagorean triple.   
  if (((f2 + g2 == h2) || (f2 + h2 == g2) || (h2 + g2 == f2)) && f > 0 && g > 0 && h > 0)
  {
    print("Yes, this is a pythagorean triple.")
  } else
  {
    print("No, this is a NOT pythagorean triple.")
  }
}
# Call the function with various parameters.
pythagorean.triple(-3,-5,-4)
pythagorean.triple(0,0,0)
pythagorean.triple(3,5,4)
pythagorean.triple(96,247,265)
