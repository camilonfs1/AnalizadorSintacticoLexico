package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[p-t]
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%


{espacio} {/*Ignore*/}/* Espacios en blanco */


( "//"(.)* ) {/*Ignore*/}/* Comentarios */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}           // Comillas 


( "┐" ) {return new Symbol(sym.Negacion, yychar, yyline, yytext());}           // Operador Negacion 
( "^" ) {return new Symbol(sym.And, yychar, yyline, yytext());}                 //Operador And 
( "|" ) {return new Symbol(sym.Or, yychar, yyline, yytext());}                  // Operador Or 
( "->" ) {return new Symbol(sym.Sientonces, yychar, yyline, yytext());}         // Operador Sientonces 
( "<->" ) {return new Symbol(sym.Siysolosi, yychar, yyline, yytext());}         // Operador Siysolosi 
( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}        // Parentesis de apertura 
( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}        // Parentesis de cierre 
{L} {return new Symbol(sym.Proposicion, yychar, yyline, yytext());}             // Proposicion 
/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
