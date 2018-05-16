import java.util.ArrayList;

public class Colorize {

    String color;
    String text;
    String ret = "\033[0m";

    public static void main(String[] args) {
        ArrayList<String> options = new ArrayList<>();
        options.add("red");
        options.add("green");
        options.add("yellow");
        options.add("blue");
        options.add("purple");
        options.add("cyan");
        options.add("white");
        int arglen = args.length;

        if (arglen > 1 && options.contains(args[0])) {

            String argtext = "";
            for (int i=1; i<arglen; i++) {
                argtext += args[i] + " ";
            }
            //Colorizer colorizer = new Colorizer(args[0], args[1]);
            new Colorize(args[0], argtext);

        } else System.out.println("1) color::" + options.toString() + "\n2) text");
    }

    public Colorize(String color, String text) {
            this.color = color;
            this.text = text;
            printColoredText();
    }

    public void printColoredText() {
        String colorCode = getColorCode(color);
        System.out.println(colorCode + text + ret);
    }

    public String getColorCode(String color) {
        switch(color) {
            case "red":
                return "\033[31m";
            case "green":
                return "\033[32m";
            case "yellow":
                return "\033[33m";
            case "blue":
                return "\033[34m";
            case "purple":
                return "\033[35m";
            case "cyan":
                return "\033[36m";
            case "white":
                return "\033[37m";
            default:
                return ret;
        }
    }
}
