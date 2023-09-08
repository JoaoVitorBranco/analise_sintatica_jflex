// CÓDIGO DO USUÁRIO
// Só vai ter package e import
package contador;

%%
// OPÇÕES E DECLARAÇÕES
// definir estados
// definir atributos
// definir métodos


%class Lexer
%public
%unicode
%standalone
%line
%column


%eof{
	System.out.printf("Contagem de caracteres: %d\n", cont_char);
	System.out.printf("Contagem de palavras: %d\n", cont_word);
	System.out.printf("Contagem de linhas: %d\n", cont_line);
    System.out.println("Fim da contagem!");
%eof}

%{
	// Aqui pode-se definir campos e métodos que serão automaticamente
	// inseridos na classe Java
	private int cont_char = 0;
	private int cont_word = 0;
	private int cont_line = 0;

// Macros - declare após a linha com %}
%}

// regex para char
char = .
// regex para word
word = [a-zA-Z0-9]+
// regex para line
line = \n


%%

// REGRAS LÉXICAS
// regras usadas no conceito de gramática léxica
/* Regras e ações */
{char}		{ cont_char++; }		    
{word}		{ cont_word++; cont_char += yytext().length();}
{line}	    { cont_line++;}