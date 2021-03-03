#NAME: Shubham Sharma
#Msc PhD OR
#Roll no: 18i190002
set N := 1..6;
#The values of Data
set DATA within {N cross N cross N};
#Defining the variable
var x{N,N,N} binary ;
#The value of z will tell the solution
var z{N,N};

# only one of each digit in each column
subject to Columns{j in N, k in N}:sum{i in N}(x[i,j,k])=1;

# only one of each digit in each row
subject to Rows{i in N, k in N}: sum{j in N}(x[i,j,k])=1;

# Only one of each digit will be each rectangle
subject to retangles{k in N, p in 1..3 ,q in 1..2}:sum{i in (2*p -1) ..(2*p),j in (3*q -2) ..(3*q) }x[i,j,k]=1;

#every row and column should have every digit
subject to all_filled{i in N, j in N}: sum{k in N}x[i,j,k]=1;
subject to known {(i,j,k) in DATA }:(x[i,j,k])=1;
subject to con1{i in N,j in N}:sum{k in N}k*x[i,j,k] = z[i,j];