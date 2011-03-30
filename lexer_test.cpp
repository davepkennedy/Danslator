#include <FlexLexer.h>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <string>

using namespace std;

void parse_stream (istream& stream);
void parse_file (const string& path);

int main (int argc, char* argv []) {
    if (argc > 1) {
        for (int i = 1; i < argc; i++) {
            parse_file (argv [i]);
        }
    }
    else {
        parse_stream (cin);
    }
    return 0;
}

void parse_stream (istream& stream) {
    yyFlexLexer lexer (&stream);
    int yytoken;

    while ((yytoken = lexer.yylex ()) != 0) {
        cout << setw (5) << yytoken << setw (10) << lexer.YYText () << endl;
    }
}

void parse_file (const string& path) {
    ifstream stream (path.c_str ());
    if (stream.is_open ()) {
        parse_stream (stream);
    }
}
