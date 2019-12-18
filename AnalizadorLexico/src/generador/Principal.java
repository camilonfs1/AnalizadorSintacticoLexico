package generador;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Camilo Vargas
 * 
 */
public class Principal {
    public static void main(String[] args) throws Exception {
        String ruta1 = "C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\src\\codigo\\Lexer.flex";
        String ruta2 = "C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\src\\codigo\\LexerCup.flex";
        String[] rutaS = {"-parser", "Sintactico", "C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\src\\codigo\\Sintactico.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        jflex.Main.generate(archivo);
        archivo = new File(ruta2);
        jflex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\src\\codigo\\sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\sym.java"), 
                Paths.get("C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\src\\codigo\\sym.java")
        );
        Path rutaSin = Paths.get("C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\src\\codigo\\Sintactico.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\Sintactico.java"), 
                Paths.get("C:\\Users\\camilo\\Downloads\\AnalizadorLexico\\src\\codigo\\Sintactico.java")
        );
    }
}
