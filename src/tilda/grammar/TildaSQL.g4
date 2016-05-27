/* ===========================================================================
 * Copyright (C) 2016 CapsicoHealth Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

grammar TildaSQL;




where
 : expr EOF
 ;


expr
 : bool_expr
 | bin_expr
 | isnull_expr
 | between_expr
 | expr_sub
 ;
 
expr_sub
 : '(' expr ')'
 ;
 
bool_expr
 : l_expr=bool_expr op=bool_op r_expr=bool_expr     
 | s_expr=bin_expr                                                                
 | bool_expr_sub                                                                  
 ;

bool_op
 : K_AND K_NOT?
 | K_OR K_NOT?
 ;
 
bool_expr_sub
 : '(' bool_expr ')'
 ; 

bin_expr
 : column bin_op aryth_expr
 ;

bin_op: K_LT | K_LTE | K_GT | K_GTE | K_EQ | K_NEQ | (K_NOT)? K_LIKE;

aryth_expr
 : l_expr=aryth_expr op=aryth_op_mul r_expr=aryth_expr      # ArythExprAddExpr
 | l_expr=aryth_expr op=aryth_op_add r_expr=aryth_expr      # ArythExprMultExpr
 | val=value                                                # ArythExprVal
 | s_expr=aryth_expr_sub                                    # ArythExprSub
 ;
 
aryth_expr_sub
 : '(' s_expr=aryth_expr ')'
 ;

aryth_op_add: '+' | '-';
aryth_op_mul: '*' | '/';
 

isnull_expr
 : col=column op=isnull_op
 ;

isnull_op
 : K_IS K_NOT? K_NULL
 ;

between_expr
 : col=column op=between_op val1=value K_AND val2=value
 ;

between_op
 : K_NOT? K_BETWEEN
 ;

value
 : num=NUMERIC_LITERAL                  #ValueLiteralNumeric
 | tim=TIMESTAMP_LITERAL                #ValueLiteralTimestamp
 | str=STRING_LITERAL                   #ValueLiteralString
 | nul=K_NULL                           #ValueLiteralNull
 | bnd=BIND_PARAMETER                   #ValueBind
 | col=column   #ValueColumn
 ; 

NUMERIC_LITERAL
 : DIGIT+ ( '.' DIGIT* )? ( E [-+]? DIGIT+ )?
 | '.' DIGIT+ ( E [-+]? DIGIT+ )?
 ;
 
TIMESTAMP_LITERAL // ISO: '2011-12-03T10:15:30+01:00'.
 : '\'' YEAR_LITERAL '-' MONTH_LITERAL '-' DAY_LITERAL ('T' HOUR_LITERAL_24 ':' MINUTE_LITERAL (':' SECOND_LITERAL ([+-] HOUR_LITERAL_12 ':' MINUTE_LITERAL)?)?)? '\''
 | CURRENT_TIMESTAMP
 | TIMESTAMP_RELATIVE
 ;
 
CURRENT_TIMESTAMP : C U R R E N T '_' T I M E S T A M P;
TIMESTAMP_RELATIVE : T I M E S T A M P '_' (Y E S T E R D A Y | T O D A Y | T O M O R R O W) ('_' L A S T)?;

STRING_LITERAL
 : '\'' ( ~'\'' | '\'\'' )* '\''
 ;
 
BIND_PARAMETER
 : '?{' IDENTIFIER '}'
 ;


function
 : IDENTIFIER '(' ( aryth_expr ( ',' aryth_expr )* )? ')'
 ;

column
 : ( IDENTIFIER '.' )? IDENTIFIER
 ;



K_AND : A N D  | '&' '&';
K_BETWEEN : B E T W E E N;
K_IN : I N;
K_IS : I S;
K_LIKE : L I K E;
K_NOT : N O T;
K_NULL : N U L L;
K_ON : O N;
K_OR : O R | '|' '|';
K_REGEXP : R E G E X P;
K_LT: '<';
K_LTE: '<' '=';
K_GT: '>';
K_GTE: '>' '=';
K_EQ: '=';
K_NEQ: '<' '>' | '!' '=';


IDENTIFIER
 : [a-zA-Z_] [a-zA-Z_0-9]* 
 ;

 
YEAR_LITERAL // 1800-2199
// : ([0-9])|('2'[0-1]) DIGIT DIGIT
 : DIGIT DIGIT DIGIT DIGIT
 ;
 
MONTH_LITERAL
// : ('0'[1-9])|('1'[0-2])
 : DIGIT DIGIT
 ;
 
DAY_LITERAL
// : ('0'[1-9])|([1-2][0-9])|('3'[0-1]) 
 : DIGIT DIGIT
 ;
 
HOUR_LITERAL_24
// : ([0-1][0-9]) | ('2'[0-3])
 : DIGIT DIGIT
 ;
 
MINUTE_LITERAL
// : ([0-5][0-9])
 : DIGIT DIGIT
 ;
 
SECOND_LITERAL
// : ([0-5][0-9])
 : DIGIT DIGIT
 ;
 
HOUR_LITERAL_12
// : ('0'[0-9])|('1'[0-2])
 : DIGIT DIGIT
 ;
 

SPACES
 : [ \u000B\t\r\n] -> channel(HIDDEN)
 ;

UNEXPECTED_CHAR
 : .
 ;


fragment DIGIT : [0-9];
fragment A : [aA];
fragment B : [bB];
fragment C : [cC];
fragment D : [dD];
fragment E : [eE];
fragment F : [fF];
fragment G : [gG];
fragment H : [hH];
fragment I : [iI];
fragment J : [jJ];
fragment K : [kK];
fragment L : [lL];
fragment M : [mM];
fragment N : [nN];
fragment O : [oO];
fragment P : [pP];
fragment Q : [qQ];
fragment R : [rR];
fragment S : [sS];
fragment T : [tT];
fragment U : [uU];
fragment V : [vV];
fragment W : [wW];
fragment X : [xX];
fragment Y : [yY];
fragment Z : [zZ];
