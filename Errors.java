

class Errors {
    static void fatal(int lineNum, int colNum, String msg) {
        System.err.println("Line:" + lineNum + " col:" + colNum + " **ERROR** " + msg);
        fatalError = true;
    }

    static void warn(int lineNum, int colNum, String msg) {
        System.err.println("Line:" + lineNum + " col:" + colNum + " **WARNING** " + msg);
    }
    static boolean fatalError = false;
}
