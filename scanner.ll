%option c++
%option noyywrap

%{
#include "parser.tab.hh"
#undef yylex
typedef yy::parser::token token;
%}
%%
daddy   { return token::DADDY; }
mommee  { return token::MUMMY; }
ammy    { return token::ADULT; }
dilly   { return token::DILLY; }
om      { return token::NOM; }
nom     { return token::NOM; }
maow    { return token::CAT; }
bish    { return token::BUBBLE; }
biss    { return token::BUS; }
ball    { return token::BALL; }
boh     { return token::BOY; }
elly    { return token::TELLY; }
dodo    { return token::JOEY; }
doh     { return token::DOG; }
dut     { return token::DUCK; }
mmm     { return token::COW; }
wish    { return token::WISH; }
toot    { return token::TOOT; }
bear    { return token::BEAR; }
chee    { return token::CHEESE; }
buhh    { return token::BUNNY; }
hallo   { return token::HELLO; }
bye     { return token::BYE; }
nee     { return token::NEE; }
naw     { return token::NAW; }
.       {}
%%
