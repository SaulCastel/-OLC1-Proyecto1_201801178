package main;

import parsers.json.*;
import java.io.BufferedReader;
import java.io.FileReader;

public class Main{
    public static void main(String[] args) {
        String file = "/home/saulc/prueba.json";
        //test_lexer(file);
        parse(file);
    }
    
    private static void parse(String file){
        try{
            BufferedReader br = new BufferedReader(new FileReader(file));
            Lexer s = new Lexer(br);
            Parser p = new Parser(s);
            p.parse();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }
}