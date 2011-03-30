CPPFLAGS := -lfl

.INTERMEDIATE: parser.tab.c lex.yy.c parser.tab.h


danslator: lex.yy.c parser.tab.c parser.tab.h
	gcc -o $@ $? $(CPPFLAGS)

lex.yy.c: lexer.l
	flex $? 

parser.tab.c: parser.y
	bison -d $?

