import java.io.*;
import java_cup.runtime.*;

%%

%public
%class Scanner
%implements sym

%line
%column

%cup
%cupdebug

%{
  StringBuffer string = new StringBuffer();
  
  private Symbol symbol(int type) {
    return new MySymbol(type, yyline+1, yycolumn+1);
  }

  private Symbol symbol(int type, Object value) {
    return new MySymbol(type, yyline+1, yycolumn+1, value);
  } 
%}

/* main character classes */

LineTerminator = \r|\n|\r\n
WhiteSpace = {LineTerminator} | [ \t\f]

Identifier = [a-zA-Z_][a-zA-Z0-9_]*


IntegerLiteral = 0 | [1-9][0-9]*

HexLiteral = [0-9]x[a-f0-9]*

CComment = "/*" ([^*]|"*"[^/])* "*/"
CPComment = "//" [^\n\r]*

StringLiteral = \"([^\"])*\"

%%

<YYINITIAL> {

  /* keywords */
  "int"                          { return symbol(INT); }
  "return"                       { return symbol(RETURN); }
  "void"                         { return symbol(VOID); }   
  "if"                           { return symbol(IF); }   
  "else"                         { return symbol(ELSE); }  
  "auto"						 { return symbol(AUTO); }
  "break"						 { return symbol(BREAK); }
  "case"						 { return symbol(CASE); }
  "char"						 { return symbol(CHAR); }
  "const"						 { return symbol(CONST); }
  "continue"					 { return symbol(CONTINUE); }
  "default"						 { return symbol(DEFAULT); }
  "do"							 { return symbol(DO); }
  "double"						 { return symbol(DOUBLE); }
  "enum"						 { return symbol(ENUM); }
  "extern"						 { return symbol(EXTERN); }
  "float"						 { return symbol(FLOAT); }
  "for" 						 { return symbol(FOR); }
  "goto"						 { return symbol(GOTO); }
  "long"						 { return symbol(LONG); }
  "register"					 { return symbol(REGISTER); }
  "short"						 { return symbol(SHORT); }
  "signed"						 { return symbol(SIGNED); }
  "sizeof"						 { return symbol(SIZEOF); }
  "static"						 { return symbol(STATIC); }
  "struct"						 { return symbol(STRUCT); }
  "switch"						 { return symbol(SWITCH); }
  "typedef"						 { return symbol(TYPEDEF); }
  "union"						 { return symbol(UNION); }
  "unsigned"					 { return symbol(UNSIGNED); }
  "volatile"					 { return symbol(VOLATILE); }
  "while"						 { return symbol(WHILE); }
  
  
  /* punctuators */
  "("                            { return symbol(LPAREN); }
  ")"                            { return symbol(RPAREN); }
  "{"                            { return symbol(LCURLY); }
  "}"                            { return symbol(RCURLY); }
  "["                            { return symbol(LSQBRACKET); }
  "]"                            { return symbol(RSQBRACKET); }
  ";"                            { return symbol(SEMICOLON); }
  ","                            { return symbol(COMMA); }
  "."							 { return symbol(PERIOD); }
  
  "%"							 { return symbol(PERCENT); }
  
  "<"                            { return symbol(LESS); }
  "<="							 { return symbol(LESSEQ); }
  ">"                            { return symbol(GREATER); }
  ">="							 { return symbol(GREATEREQ); }
  "+"                            { return symbol(PLUS); }
  "+="							 { return symbol(PLUSEQL); }
  "-"                            { return symbol(MINUS); }
  "-="							 { return symbol(MINUSEQL); }
  "/"                            { return symbol(DIVIDE); }
  "/="							 { return symbol(DIVEQL); }
  "*"                            { return symbol(TIMES); }
  "*="							 { return symbol(TIMESEQL); }
  "="                            { return symbol(ASSIGN); }
  
  "=="                           { return symbol(EQUALS); }
  "!="							 { return symbol(NOTEQUALS); }
  "!"							 { return symbol(NOT); }
  "&&"							 { return symbol(AND); }
  "||"							 { return symbol(OR); }
  "&"							 { return symbol(ADDROF); }
  "NULL"						 { return symbol(NULL); }
		
  "->"							 { return symbol(STRDEREF); }
  "<<"							 { return symbol(WRITE); }
  ">>"							 { return symbol(READ); }
  
  {IntegerLiteral}               { return symbol(INTLITERAL, new Integer(yytext())); }
  {HexLiteral}					 
  { 
	String s = yytext().substring(2);
	s = s.toUpperCase();
	Integer t = Integer.parseInt(s , 16);
	return symbol(HEXLITERAL, t);
  }

  {WhiteSpace}                   { /* ignore */ }

  /* identifiers */ 
  {Identifier}                   { return symbol(ID, yytext()); }  
  
  {StringLiteral}				 { return symbol(STRINGLITERAL, yytext()); }
  
  {CComment}					 { return symbol(COMMENT);}
  
  {CPComment}					 { return symbol(COMMENT); }
  
}

.                              { Errors.fatal(yyline+1, yycolumn+1, "Illegal character \"" + yytext()+ "\""); 
       System.exit(-1); } 
<<EOF>>                          { return symbol(EOF); }
