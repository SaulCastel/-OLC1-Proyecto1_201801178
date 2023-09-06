package parsers.statpy;
import java_cup.runtime.*;

%%

%class Lexer
%public
%unicode
%cup
%line
%column
%caseless

%{
    private Symbol symbol(String value, int type) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

LineTerminator  = \r|\n|\r\n
WhiteSpace      = {LineTerminator} | [ \t\f]
SComment = "//"[^\r\n]*
MComment = "/*"~"*/"
Comment = {SComment} | {MComment}
Integer = [0-9]+
Double = [0-9]+"."[0-9]+
Char = ["'].["']
String = "\""~"\""

%%

<YYINITIAL> {
    /* identifiers */ 
    "int"                   { return symbol(yytext(), sym.INTEGER); }
    "double"                { return symbol(yytext(), sym.DOUBLE); }
    "char"                  { return symbol(yytext(), sym.CHAR); }
    "bool"                  { return symbol(yytext(), sym.BOOL); }
    "string"                { return symbol(yytext(), sym.STRING); }
    "true"                  { return symbol(yytext(), sym.TRUE); }
    "false"                 { return symbol(yytext(), sym.FALSE); }
    "console.write"         { return symbol(yytext(), sym.PRINT); }
    {String}                { return symbol(yytext(), sym.STRING_LITERAL); }
    {Double}                { return symbol(yytext(), sym.DOUBLE_LITERAL); }
    {Integer}               { return symbol(yytext(), sym.INTEGER_LITERAL); }
    "+"                     { return symbol(yytext(), sym.ADD); }
    "-"                     { return symbol(yytext(), sym.SUB); }
    "/"                     { return symbol(yytext(), sym.DIV); }
    "*"                     { return symbol(yytext(), sym.TIMES); }
    ">"                     { return symbol(yytext(), sym.GREATER); }
    "<"                     { return symbol(yytext(), sym.LESS); }
    ">="                    { return symbol(yytext(), sym.GREATER_EQUAL); }
    "<="                    { return symbol(yytext(), sym.LESS_EQUAL); }
    "=="                    { return symbol(yytext(), sym.EQUAL); }
    "!="                    { return symbol(yytext(), sym.NOT_EQUAL); }
    "&&"                    { return symbol(yytext(), sym.AND); }
    "||"                    { return symbol(yytext(), sym.OR); }
    "!"                     { return symbol(yytext(), sym.NOT); }
    "("                     { return symbol(yytext(), sym.LPAREN); }
    ")"                     { return symbol(yytext(), sym.RPAREN); }
    ";"                     { return symbol(yytext(), sym.SEMICOLON); }
    {Char}                  { return symbol(yytext(), sym.CHAR_LITERAL); }

    /* comments */
    {Comment}               { /* ignore */ }

    /* whitespace */
    {WhiteSpace}            { /* ignore */ }
}

/* error fallback */
[^]                 { throw new Error("Illegal character <"+ yytext()+">"); }
