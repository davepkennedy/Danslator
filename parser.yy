%skeleton "lalr1.cc"
%debug
%locations
%parse-param {Driver& driver}

%{
#include <stdio.h>
#include "driver.h"
#include <string>

#undef  yylex
#define yylex   driver.lex
%}

%token DADDY
%token MUMMY
%token ADULT
%token DILLY
%token NOM
%token CAT
%token BUBBLE
%token BUS
%token BALL
%token BOY
%token TELLY
%token JOEY
%token DOG
%token DUCK
%token COW
%token WISH
%token TOOT
%token BEAR
%token CHEESE
%token BUNNY
%token HELLO
%token BYE
%token NEE
%token NAW

%%

statement:
        person request
    |   person observation
    |   person salutation
    |   salutation person
    |   salutation
    ;

person:
        MUMMY   { driver.output () << "mummy "; }
    |   DADDY   { driver.output () << "daddy "; }
    |   ADULT   { driver.output () << "adult "; }
    |   DILLY   { driver.output () << "Ellie "; }
    ;

salutation:
        HELLO   { driver.output () << "hello "; }
    |   BYE     { driver.output () << "bye-bye "; }
    ;
observation:
        vehicle_observation
    |   animal_observation
    |   person_observation
    ;

vehicle_observation:
        BUS                     { driver.output () << " there's a bus"; }
    |   car_observation
    |   fireengine_observation
    ;

fireengine_observation:
        NEE NAW                         { driver.output () << " there's a fire engine!"; }
    |   fireengine_observation NEE NAW
    ;
car_observation:
        TOOT                    { driver.output () << " there's a car"; }
    |   car_observation TOOT
    ;
    
animal_observation:
        DOG                     { driver.output () << " there's a dog"; }
    |   DUCK                    { driver.output () << " there's a duck"; }
    |   COW                     { driver.output () << " there's (toy) cow"; }
    |   BEAR                    { driver.output () << " there's (cuddly) bear"; }
    |   BUNNY                   { driver.output () << " there's a bunny rabbit"; }
    ;

person_observation:
        MUMMY   { driver.output () << " it's mummy!"; }
    |   DADDY   { driver.output () << " it's daddy!"; }
    |   ADULT   { driver.output () << " it's someone I know"; }
    |   DILLY   { driver.output () << " it's aunie Ellie!"; }
    |   BOY     { driver.output () << " it's a boy"; }
    ;

request:
        food_request
    |   bubble_request
    |   cat_request
    |   telly_request
    |   wash_request
    ;

food_request:
        NOM                 { driver.output () << "I'm hungry"; }
    |   food_request NOM
    ;

bubble_request:
        BUBBLE              { driver.output () << "blow me bubbles"; }
    ;

cat_request:
        JOEY CAT            { driver.output () << "I want to hug Joey cat"; }
    |   CAT                 { driver.output () << "a cat"; }
    ;

telly_request:
        TELLY               { driver.output () << "I want to watch telly"; }
    |   telly_request TELLY
    ;

wash_request:
        WISH                { driver.output () << "I want to play hand-wash"; }
    |   wash_request WISH
    ; 

%%

void yy::parser::error (const location_type& loc, const std::string& msg)
{   
    driver.error (msg);
}
