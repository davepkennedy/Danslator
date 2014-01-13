CPPFLAGS := -lfl

.INTERMEDIATE: parser.tab.cc lex.yy.cc parser.tab.h


danslator: lex.yy.cc parser.tab.cc
	gcc -o $@ $? $(CPPFLAGS)

lex.yy.c: scanner.ll
	flex $? 

parser.tab.cc: parser.yy
	bison -d $?

