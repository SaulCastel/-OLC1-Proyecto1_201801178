/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main;
import java.io.BufferedReader;
import java.util.HashMap;
import java.util.LinkedList;
import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author saulc
 */
public class ParserState {
    public static HashMap<String, HashMap> json_files = new HashMap<>();
    public static String file_name;
    public static LinkedList<String> output = new LinkedList<>();
    public static String rows = "";

    public static void parseJson(BufferedReader input){
        try{
            parsers.json.Lexer s = new parsers.json.Lexer(input);
            parsers.json.Parser p = new parsers.json.Parser(s);
            p.parse();
        }  
        catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void parseStatpy(BufferedReader input){
        try{
            parsers.statpy.Lexer ss = new parsers.statpy.Lexer(input);
            parsers.statpy.Parser sp = new parsers.statpy.Parser(ss);
            sp.parse();
            makeTokenTable();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    public static String getOutput(){
        String out = "";
        for (String s: output){
            out += s+"\n";
        }
        output.clear();
        return out;
    }

    public static void makeTokenTable(){
        String table = 
            """
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Tokens</title>
            </head>
            <body>
            """;
        table = "<table>";
        table += "<tr><th>TOKEN</th><th>LEXEMA</th><th>FILA</th><th>COLUMNNA</th></tr>";
        table += rows;
        table += "</table>";
        table += "</body></html>";
        try {
            FileWriter file = new FileWriter("tokens.html");
            file.write(table);
            file.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        rows = "";
    }
}
