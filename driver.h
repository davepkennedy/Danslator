#ifndef __DRIVER_H__
#define __DRIVER_H__

#include <istream>
#include <ostream>
#include <string>

class FlexLexer;
namespace yy {
    class location;
}

class Driver {
private:
    FlexLexer*      _lexer;
    std::ostream*   _output;
    bool            _hasError;
    std::string     _error;
public:
    Driver      (std::istream* input, std::ostream* output);
    ~Driver     ();
public:
    int                 lex ();
    int                 lex (int*, yy::location*);
    int                 parse ();
    std::ostream&       output ();
    void                error (const std::string& msg);
    bool                hasError () const;
    const std::string&  getError () const;
};

#endif
