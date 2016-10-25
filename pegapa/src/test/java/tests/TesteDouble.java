package tests;

public class TesteDouble {
	
	public static void main(String[] args) {
		String stringPreco = "15.999,00";
		stringPreco = stringPreco.replaceAll("[.,]", "");
		StringBuilder sb = new StringBuilder(stringPreco);
		sb.insert(sb.length() - 2, '.');
		System.out.println(sb);
	}
	
}
