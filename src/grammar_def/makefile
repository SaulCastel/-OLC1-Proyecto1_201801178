jflex_path		:= ~/libraries/jflex-full-1.9.1.jar
cup_path		:= ~/libraries/java-cup-11b.jar
project_path	:= ~/Projects/2S2023/compi1/proyecto1
grammar_def		:= ${project_path}/src/grammar_def
src				:= ${project_path}/src/parsers

# ${wildcard ${src}/json/*.java} 
all: ${wildcard ${src}/statpy/*.java}

${src}/json/Lexer.java: ${grammar_def}/json/lexer.jflex
	java -jar ${jflex_path} -d ${src}/json/ --nobak $^

${src}/json/Parser.java: ${grammar_def}/json/parser.cup
	java -jar ${cup_path} -destdir ${src}/json/ -parser Parser $^

${src}/statpy/Lexer.java: ${grammar_def}/statpy/lexer.jflex
	java -jar ${jflex_path} -d ${src}/statpy/ --nobak $^

${src}/statpy/Parser.java: ${grammar_def}/statpy/parser.cup
	java -jar ${cup_path} -destdir ${src}/statpy/ -parser Parser $^
