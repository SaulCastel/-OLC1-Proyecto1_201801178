package main;

import java.io.BufferedReader;
import java.io.FileReader;

public class Main{

    public static void main(String[] args) {
        String file = "/home/saulc/ejemplo.sp";
        parse(file);
        //barGraph();
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

    private static void barGraph(){
        Object[] valores = {1.0,2.0,3.0};
        String[] ejex = {"v1","v2","v3"};
        graph.general.barras("Grafica barras", "categorias", "valores", valores, ejex);
    }
}