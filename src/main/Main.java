package main;

import java.io.BufferedReader;
import java.io.FileReader;

public class Main{
    public static void main(String[] args) {
        String file = "/home/saulc/prueba.sp";
        parse(file);
    }
    
    private static void parse(String file){
        try{
            BufferedReader br = new BufferedReader(new FileReader(file));
            parsers.statpy.Lexer s = new parsers.statpy.Lexer(br);
            parsers.statpy.Parser p = new parsers.statpy.Parser(s);
            p.parse();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }
}