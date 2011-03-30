#include <FlexLexer.h>
#include "driver.h"
#include "parser.tab.hh"
    
Driver::Driver (std::istream* input, std::ostream* output)
: _lexer (new yyFlexLexer (input))
, _output (output)
, _hasError (false)
{
}

Driver::~Driver ()
{
    delete _lexer;
}

#undef yylex
int Driver::lex (int*, yy::location*)
{
    return _lexer->yylex ();
}

int Driver::lex ()
{
    return lex (NULL, NULL);
}

std::ostream& Driver::output () 
{
    return *_output;
}

int Driver::parse ()
{
    yy::parser parser (*this);
    return parser.parse ();
}

void Driver::error (const std::string& msg) 
{
    _error = msg;
    _hasError = true;
}

bool Driver::hasError () const 
{
    return _hasError;
}

const std::string& Driver::getError () const
{
    return _error;
}
