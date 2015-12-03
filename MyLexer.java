import java.io.*;
import java_cup.runtime.Symbol;

/**
 * Simple test driver for the java lexer. Just runs it on some
 * input files and produces debug output. Needs Symbol class from
 * parser. 
 */
public class MyLexer {

  public static void main(String argv[]) {
      try {
	    if(argv.length == 1)
		{
			System.out.println("Lexing ["+argv[0]+"]");
			Scanner scanner = new Scanner(new FileReader(argv[0]));
			Symbol s;
			do {
			  s = scanner.debug_next_token();
			} while (s.sym != sym.EOF);
			
			System.out.println("No errors.");
		}
		else
		{
			System.out.println("Input error!");
			System.out.println("Usage: command <input> <output>" );
		}
      }
      catch (Exception e) {
        e.printStackTrace(System.out);
        System.exit(1);
      }
  }
}
