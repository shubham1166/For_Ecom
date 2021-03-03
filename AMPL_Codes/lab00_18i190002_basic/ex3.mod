#declaring the variables
var xa1 >= 0, <= 50;
var xa2 >= 0, <= 70;

#declaring objecive function
minimize cost:10*xa1 + 5*xa2 + 5850;

#subject to constraints:
s.t. con1:xa1 + xa2 >= 75;
s.t. con2:xa1 + xa2 <= 80;