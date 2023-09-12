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
ID = [a-z][a-z0-9_]*

%%

<YYINITIAL> {
    /* identifiers */ 
    "int"                   { return symbol(yytext(), sym.INTEGER); }
    "double"                { return symbol(yytext(), sym.DOUBLE); }
    "char"                  { return symbol(yytext(), sym.CHAR); }
    "bool"                  { return symbol(yytext(), sym.BOOL); }
    "string"                { return symbol(yytext(), sym.STRING); }
    "void"                  { return symbol(yytext(), sym.VOID); }
    "true"                  { return symbol(yytext(), sym.TRUE); }
    "false"                 { return symbol(yytext(), sym.FALSE); }
    "main"                  { return symbol(yytext(), sym.MAIN); }
    "switch"                { return symbol(yytext(), sym.SWITCH); }
    "case"                  { return symbol(yytext(), sym.CASE); }
    "default"               { return symbol(yytext(), sym.DEFAULT); }
    "break"                 { return symbol(yytext(), sym.BREAK); }
    "for"                   { return symbol(yytext(), sym.FOR); }
    "while"                 { return symbol(yytext(), sym.WHILE); }
    "do"                    { return symbol(yytext(), sym.DO); }
    "if"                    { return symbol(yytext(), sym.IF); }
    "else"                  { return symbol(yytext(), sym.ELSE); }
    "DefinirGlobales"       { return symbol(yytext(), sym.DEFINIR_GLOBALES); }
    "GraficaBarras"         { return symbol(yytext(), sym.GRAFICA_BARRAS); }
    "GraficaPie"            { return symbol(yytext(), sym.GRAFICA_PIE); }
    "TituloX"               { return symbol(yytext(), sym.TITULOX); }
    "TituloY"               { return symbol(yytext(), sym.TITULOY); }
    "Titulo"                { return symbol(yytext(), sym.TITULO); }
    "EjeX"                  { return symbol(yytext(), sym.EJEX); }
    "Valores"               { return symbol(yytext(), sym.VALORES); }
    "NewValor"              { return symbol(yytext(), sym.NEW_VALOR); }
    "console.write"         { return symbol(yytext(), sym.PRINT); }
    {ID}                    { return symbol(yytext(), sym.ID); }
    {String}                { return symbol(yytext(), sym.STRING_LITERAL); }
    {Double}                { return symbol(yytext(), sym.DOUBLE_LITERAL); }
    {Integer}               { return symbol(yytext(), sym.INTEGER_LITERAL); }
    "+"                     { return symbol(yytext(), sym.ADD); }
    "-"                     { return symbol(yytext(), sym.SUB); }
    "/"                     { return symbol(yytext(), sym.DIV); }
    "*"                     { return symbol(yytext(), sym.TIMES); }
    "++"                    { return symbol(yytext(), sym.INC); }
    "="                     { return symbol(yytext(), sym.ASSIGN); }
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
    "{"                     { return symbol(yytext(), sym.LBRACKET); }
    "}"                     { return symbol(yytext(), sym.RBRACKET); }
    ";"                     { return symbol(yytext(), sym.SEMICOLON); }
    ","                     { return symbol(yytext(), sym.COMMA); }
    "[]"                    { return symbol(yytext(), sym.SQR_BRACKETS); }
    "$"                     { return symbol(yytext(), sym.DOLLAR); }
    {Char}                  { return symbol(yytext(), sym.CHAR_LITERAL); }

    /* comments */
    {Comment}               { /* ignore */ }

    /* whitespace */
    {WhiteSpace}            { /* ignore */ }
}

/* error fallback */
[^]                 { throw new Error("Illegal character <"+ yytext()+">"); }
