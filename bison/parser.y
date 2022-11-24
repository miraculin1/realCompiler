%{
  #include <stdio.h>
  #include "ast.h"
%}

%union {
  int token;
  int int_value;
  float float_value;
  char *id_name;
};

%token <int_value> num_INT
%token <float_value> num_FLOAT
%token <id_name> Y_ID

%token <token> Y_INT
%token <token> Y_VOID
%token <token> Y_CONST
%token <token> Y_IF
%token <token> Y_ELSE
%token <token> Y_WHILE
%token <token> Y_BREAK
%token <token> Y_CONTINUE
%token <token> Y_RETRUN

%token <token> Y_ADD
%token <token> Y_SUB
%token <token> Y_MUL
%token <token> Y_DIV
%token <token> Y_MODULO
%token <token> Y_LESS
%token <token> Y_LESSEQ
%token <token> Y_GREAT
%token <token> Y_GREATEQ
%token <token> Y_NOTEQ
%token <token> Y_EQ
%token <token> Y_NOT
%token <token> Y_AND
%token <token> Y_OR
%token <token> Y_ASSIGN

%token <token> Y_LPAR
%token <token> Y_RPAR
%token <token> Y_LBRACKET
%token <token> Y_RBRACKET
%token <token> Y_LSQUARE
%token <token> Y_RSQUARE
%token <token> Y_COMMA
%token <token> Y_SEMICOLON

%token <token> Y_FLOAT

// TODO else shell be here
%type <pAst> Exp LVal ArraySubscripts PrimaryExp UnaryExp
%type <pAst> CallParams MulExp AddExp

%%
   Exp: AddExp

   LVal: Y_ID
       | Y_ID ArraySubscripts

   ArraySubscripts: Y_LSQUARE Exp Y_RSQUARE
                  | Y_LSQUARE Exp Y_RSQUARE ArraySubscripts

   PrimaryExp: Y_LPAR Exp Y_RPAR
             | LVal
             | num_INT
             | num_FLOAT

   UnaryExp: PrimaryExp
           | Y_ID Y_LPAR Y_RPAR
           | Y_ID Y_LPAR CallParams Y_RPAR
           | Y_ADD UnaryExp
           | Y_SUB UnaryExp
           | Y_NOT UnaryExp

   CallParams: Exp
             | Exp Y_COMMA CallParams

   MulExp: UnaryExp
         | MulExp Y_MUL UnaryExp
         | MulExp Y_DIV UnaryExp
         | MulExp Y_MODULO UnaryExp

   AddExp: MulExp
         | AddExp Y_ADD MulExp
         | AddExp Y_SUB MulExp
%%
