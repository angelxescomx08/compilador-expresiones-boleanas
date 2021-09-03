%{
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE char

void yyerror (char *s);
int yylex ();
%}
%name parse

%token boolean
%left 'v' 
%left '^'
%left '-'

%%
program:
program statement '\n'
|
;
statement:
exp { printf("%c\n", $1);}

exp: boolean
    |exp 'v' exp    {if('t' == $1 || 't' == $3){$$='t';}else{$$='f';} }
    |exp '^' exp    {if('t' == $1 && 't' == $3){$$='t';}else{$$='f';}}
    |'-' exp        {if($2=='t'){$$='f';}else{$$='t';}}
    |'(' exp ')'    {$$ = $2;}
    ;
%%

#include <stdio.h>
int lineno = 1;

void main (int argc, char *argv[]){
  	yyparse ();
}
int yylex (){
  	int c;

  	while ((c = getchar ()) == ' ' || c == '\t');
 	if (c == EOF)                            
    		return 0;
  	if (c == 'f' || c == 't') {
		ungetc (c, stdin);
      	scanf ("%c", &yylval);
	    return boolean;
    }
  	if(c == '\n')
		lineno++;
  	return c;                                
}
void yyerror (char *s) {
    printf("Error\n");
}