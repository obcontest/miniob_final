#!/usr/bin/env sh
cd src/observer/sql/parser && flex lex_sql.l && bison -d -b yacc_sql yacc_sql.y && cd ../../../../ && cd cmake-build-debug && cmake .. -DDEBUG=ON && make  && cd ../ 