package main;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.HashMap;

public class Main{
    public static void main(String[] args) {
        File statpy = new File("/home/saulc/OLC1_archivos/Proyecto 1/test.sp");
        File json = new File("/home/saulc/OLC1_archivos/Proyecto 1/archivo.json");
        file_name = json.getName();
        parse(json, statpy);
    }

    public static HashMap<String, HashMap> json_files = new HashMap<>();
    public static String file_name;
    
    private static void parse(File json, File statpy){
        try{
            BufferedReader br = new BufferedReader(new FileReader(json));
            parsers.json.Lexer s = new parsers.json.Lexer(br);
            parsers.json.Parser p = new parsers.json.Parser(s);
            p.parse();
            br = new BufferedReader(new FileReader(statpy));
            parsers.statpy.Lexer ss = new parsers.statpy.Lexer(br);
            parsers.statpy.Parser sp = new parsers.statpy.Parser(ss);
            sp.parse();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }
}