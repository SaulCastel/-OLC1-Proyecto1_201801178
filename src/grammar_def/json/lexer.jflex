package parsers.json;
import java_cup.runtime.*;

%%

%class Lexer
%public
%unicode
%cup
%line
%column

%{
    private Symbol symbol(String value, int type) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

LineTerminator  = \r|\n|\r\n
WhiteSpace      = {LineTerminator} | [ \t\f]

Comment = "/*"~"*/"
String = "\""~"\""
Double = [0-9]+"."[0-9]+

%%

<YYINITIAL> {
    /* identifiers */ 
    {String}                { return symbol(yytext(), sym.STRING); }
    {Double}                { return symbol(yytext(), sym.DOUBLE); }
    "{"                     { return symbol(yytext(), sym.LBRACKET); }
    "}"                     { return symbol(yytext(), sym.RBRACKET); }
    ","                     { return symbol(yytext(), sym.COMMA); }
    ":"                     { return symbol(yytext(), sym.COLON); }

    /* comments */
    {Comment}               { /* ignore */ }

    /* whitespace */
    {WhiteSpace}            { /* ignore */ }
}

/* error fallback */
[^]                 { throw new Error("Illegal character <"+ yytext()+">"); }
