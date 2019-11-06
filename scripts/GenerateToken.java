import java.security.SecureRandom;

public class GenerateToken {
    public static void main(String[] args) {
        String token = generateToken();
        System.out.println(token);
    }
    static SecureRandom random = new SecureRandom();
    static String generateToken() {
        long longToken = Math.abs( random.nextLong() );
        return Long.toString( longToken, 16 );
    }
}
