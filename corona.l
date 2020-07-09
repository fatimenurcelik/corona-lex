%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <assert.h>
  #include <string.h>
  #include <regex.h>
  #include <errno.h>
  int yydebug = 0;
  FILE* result;
  extern FILE* yyin;
  extern int errno;
%}

/* Booleans */
DOGRULUK		("DOGRU"|"YANLIS")

/* brackets for parameters	*/
PARANTEZ_AC	    (()
PARANTEZ_KAPA	())

/* "ise" is for { and "." is for }	*/
ISE		        ISE
NOKTA			NOKTA

/* conditional statements	*/
EGER			EGER
YADA			YADA
YOKSA			YOKSA

/* for multiple lines, you will use YORUM_AC and YORUM_KAPA, for a single line it is YORUM	*/
YORUM		    YORUM
YORUM_AC		YORUM_AC
YORUM_KAPA		YORUM_KAPA

/* Assigning and initialization of the values */
ESITTIR			ESITTIR

/* Logical operators */

ANCAKVEANCAK	(ANCAKVEANCAK|<=>)
VE			    (VE|&&)
VEYA			(VEYA| |)
DEGIL			(DEGIL|^)
DEMEK			(DEMEK|=>)
KUCUKESIT		(KUCUKESIT| <=)
KUCUKTUR		(KUCUK| <)
BUYUKESIT		(BUYUKESIT| >=)
BUYUKTUR		(BUYUK| >)
ESIT			(ESIT| ==)

/* Print and scan functions for IO */
EKRANAYAZ		EKRANAYAZ
TARA			TARA		

/* While loop */
DONGU			DONGU	

/* Operators */
ARTI			(ARTI| +)			
EKSI			(EKSI| -)
BOLU			(BOLU| /)
CARPI			(CARPI| *)
KALAN			(KALAN| %)

/* Functions and classes, BOLUM equals class, CALISTIR equals functions */
CALISTIR		CALISTIR
BOLUM			BOLUM


/* Variables and constants	*/
YAZIDIZISI		[a-zA-Z]+
SAYI			[0-9]+
DEGISKEN		[a-zA-Z][a-zA-Z]*[0-9]*


%%


{DOGRULUK}							printf("DOGRULUK IBARESI ");
YAZIDIZISI								printf("YAZIDIZISI ");
SAYI								printf("SAYI ");
DEGISKEN							printf("DEGISKEN ");
{PARANTEZ_AC}							printf("AC PARANTEZ ");
{PARANTEZ_KAPA}							printf("KAPA PARANTEZ ");
{ISE}								printf("ISE \n");
{NOKTA}								printf(". \n");
{EGER}								printf("EGER ");
{YADA}								printf("YA DA ");
{YOKSA}								printf("YOKSA ");
{YORUM}							printf("YORUM: ");
{YORUM_AC}								printf("YORUM BASI ");
{YORUM_KAPA}								printf("YORUM SONU	");
{ESITTIR}							printf("ESITTIR	");
{VEYA}								printf("VEYA ");
{DEGIL}								printf("DEGIL ");
{DEMEK}								printf("DEMEK ");
{ANCAKVEANCAK}							printf("ANCAKVEANCAK ");
{VE}								printf("VE ");
{KUCUKESIT}							printf("KUCUKESIT	");
{KUCUKTUR}							printf("KUCUKTUR	");
{BUYUKESIT}							printf("BUYUKESIT	");
{BUYUKTUR}							printf("BUYUKTUR	");
{ESIT}								printf("ESIT ");
{EKRANAYAZ}							printf("ŞUNU EKRANAYAZ: ");
{TARA}								printf("ŞUNU OKU: ");
{DONGU}							printf("DONGU: ");
{ARTI}								printf("ARTI ");
{EKSI}								printf("EKSI ");
{BOLU}								printf("BOLU ");
{CARPI}								printf("CARPI ");
{KALAN}								printf("KALAN ");
{CALISTIR}							printf("CALISTIR ");
{BOLUM}								printf("BOLUM ");
[ \t\n]  							;
";"								printf("SON \n");
.								printf("ANLASILMAYAN KARAKTER ");
%%

int yywrap(void)
{
	return 1;
}
