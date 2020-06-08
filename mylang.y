%{
#include<stdio.h> 
#include<math.h>
extern FILE *yyin;
#define PI 3.14
#define CONST 1.33
#define CONST1 0.33
%} 
%union{
int integer;
float real;
}
%token <integer> NUMBER <real>	FLOAT
%token give me conversion of to  byte kilobyte megabyte gigabyte end
%type <real> S E U F X Q

%%
//ResultExpression:S{printf("Your Answer is %f",$$);};
S:end {printf("Exit");return 0;}
|give me conversion of E{$$=$5;};
E: byte to  X {$$=$3;}
   |kilobyte to U            {$$=$3;}
   |megabyte to F           {$$=$3;}
   |gigabyte to Q           {$$=$3;}
   ;
X: kilobyte of NUMBER      {$$=$3/pow(2 , 10); printf("Kilobyte of %d  is %f\n",$3,$$);};
  |megabyte of NUMBER      {$$=$3/pow(2 , 20); printf("Megabyte of %d  is %f\n",$3,$$);};
  |gigabyte of NUMBER	   {$$=$3/pow(2 , 30); printf("Gigabyte of %d  is %f\n",$3,$$);};
  
U: byte of NUMBER          {$$=$3*pow(2 , 10); printf("Byte of %d  is %f\n",$3,$$);};
  |megabyte of NUMBER      {$$=$3/pow(2 , 10); printf("Megabyte of %d  is %f\n",$3,$$);};
  |gigabyte of NUMBER      {$$=$3/pow(2 , 20); printf("Gigabyte of %d  is %f\n",$3,$$);};
  
F: byte of NUMBER          {$$=$3*pow(2 , 20); printf("Byte of %d  is %f\n",$3,$$);};
  |kilobyte of NUMBER      {$$=$3*pow(2 , 10); printf("Kilobyte of %d  is %f\n",$3,$$);};
  |gigabyte of NUMBER      {$$=$3/pow(2 , 10); printf("Gigabyte of %d  is %f\n",$3,$$);};
  

Q: byte of NUMBER          {$$=$3/pow(2 , 30); printf("Byte of %d  is %f\n",$3,$$);};
  |kilobyte of NUMBER      {$$=$3/pow(2 , 20); printf("Kilobyte of %d  is %f\n",$3,$$);};
  |megabyte of NUMBER      {$$=$3/pow(2 , 10); printf("Megabyte of %d  is %f\n",$3,$$);};
  

%%

	
void yyerror(const char *s) {
  
}


char* main(int argc, char *argv[]) 
{
int i;
for(i=0;i<5;i++){
yyparse();}


return 0;
}