print_hello(){
  x=20

 echo HelloWorld
 echo Y value is $y
 }
 print_hello
 echo x value is $x
 y=30
 input_function(){
   echo First argument $0
   echo Second Argument $2
   echo All Arguments $*
   }
 input_function()
