package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[p-t]
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

{espacio}       {/*Ignore*/}                                                    // Espacios en blanco 
( "//"(.)* )    {/*Ignore*/}                                                    // Comentarios 
( "\n" )        {return Linea;}                                                 // Salto de linea 
( "\"" )        {lexeme=yytext(); return Comillas;}                             // Comillas 
( "┐")          {lexeme=yytext(); return Negacion;}                            // Operador Igual 
( "^" )         {lexeme=yytext(); return And;}                                  // Operador And 
( "|" )         {lexeme=yytext(); return Or;}                                   // Operador Or 
( "->" )        {lexeme=yytext(); return Sientonces;}                           // Operador SiEntonces 
( "<->" )       {lexeme=yytext(); return Siysolosi;}                            // Operador Siysolosi 
( "(" )         {lexeme=yytext(); return Parentesis_a;}                         // Parentesis de apertura 
( ")" )         {lexeme=yytext(); return Parentesis_c;}                         // Parentesis de cierre 
{L}             {lexeme=yytext(); return Proposicion;}                          // Proposicion 

 . {return ERROR;}                                                              // Error de analisis 
