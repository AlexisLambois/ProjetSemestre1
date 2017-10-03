public class main{
	public static void main(String [] arg) {
		String mail = "lambois16@gmail.com";
		System.out.println(mail.matches("^[a-zA-Z0-9_]*@[a-z]*[.][a-z]*$"));
	}
}