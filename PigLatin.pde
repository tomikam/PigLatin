import java.util.*;

public void setup() {
	String lines[] = loadStrings("LowellHymn.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatinLine(lines[i]));
	}
}
public void draw()
{

}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	if (sWord.equals(" ") || sWord.equals(",") || sWord.equals(".")) {return -2;}
	int vowelLoc = -1;
	if (sWord.length() > 0) {
		for (int i = 0; i < sWord.length(); i ++) {
			char c = sWord.charAt(i);
			if (c == 'a' || c == 'A' || c == 'e' || c == 'E' || c == 'i' || c == 'I' || c == 'o' || c == 'O' || c == 'u' || c == 'U') {
				vowelLoc = i;
				break;
			}

		}
	}
	return vowelLoc;
}

public String pigLatinWord(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if (findFirstVowel(sWord) == -1) {
		return sWord + "ay";
	} else if (findFirstVowel(sWord) == -2) {
		return " ";
	} else if (findFirstVowel(sWord) == 0) {
		return sWord + "way";
	} else if (sWord.charAt(0) == 'q') {
		return sWord.substring(2) + "qu" + "ay";
	} else if (findFirstVowel(sWord) > 0) {
		return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
	} else {
		return "ERROR!";
	}
}

public String pigLatinLine(String sWord) {
	int previousWord = 0;
	String translatedString = "";
	String endingChar = ",";
	for (int i = 0; i < sWord.length(); i ++) {
		if (sWord.substring(i, i + 1).equals(",") || sWord.substring(i, i + 1).equals(".") ) {
			endingChar = sWord.substring(i, i + 1);
		}
		if (sWord.substring(i, i + 1).equals(" ") || sWord.substring(i, i + 1).equals(",") || sWord.substring(i, i + 1).equals(".")) {
			translatedString = translatedString + " " + pigLatinWord(sWord.substring(previousWord, i));
			previousWord = i + 1;
		}
	}
	if (translatedString.equals("")) {return "LINE_ERROR";}
	return translatedString + endingChar;
}
//Another function that uses pigLatinWord for each word.