programa
{
	
	inclua biblioteca Util --> u

	funcao casa2()
	{
		//deve avançar o jogador para a casa 5.
	}

	funcao casa3()
	{
		//deve jogar um dado adicional de 3 lados.
	}

	funcao casa7()
	{
		//deve impedir que o jogador jogue o dado por 1 rodada.
	}

	funcao casa10()
	{
		//deve trocar as casa em que os jogadores estão.
	}

	funcao casa12()
	{
		//deve retroceder 1 casa
	}

	funcao casa15()
	{
		//deve cantar um trecho de uma música (na vida real) ou voltar 2 casas
	}

	funcao casa19()
	{
		//deve voltar para a casa 1
	}

	funcao casa20()
	{
		//recebe a mensagem de vencedor da partida
	}
	
	funcao escolherPersonagem()
	{
		cadeia inputPlayer1 = "1", inputPlayer2 = "1", player1 = "0", player2 = "0"
		inteiro sorteioDado1 = 0, sorteioDado2 = 0, LoopInicial = 1

		enquanto(LoopInicial == 1)
		{	
			escreva("SESSAO PARA ESCOLHA DE PERSONAGENS E QUEM JOGARA PRIMEIRO\n")
			escreva("QUEM JOGAR O MAIOR DADO DEVE\n-ESCOLHER O PERSONAGEM COM QUEM DESEJA JOGAR\n-SAIR JOGANDO\n")			
			escreva("\nSORTEIEM OS DADOS\n")
			
			escreva("JOGADOR 1\n")
			leia(inputPlayer1)
			sorteioDado1 = u.sorteia(1, 6)

			escreva("JOGADOR 2\n")
			leia(inputPlayer2)
			sorteioDado2 = u.sorteia(1, 6)
	
			enquanto(sorteioDado1 == sorteioDado2)
			{
				sorteioDado1 = u.sorteia(1, 6)
				sorteioDado2 = u.sorteia(1, 6) 
			}
	
			se(sorteioDado1 > sorteioDado2)
			{
				escreva("JOGADOR 1 TIROU O MAIOR DADO, ESCOLHA SEU PERSONAGEM\n")
				escreva("1- iFood\n")
				escreva("2- UberEats\n")	
				leia(inputPlayer1)
	
				se(inputPlayer1 == "1")
				{
					player1 = "iFood"
				}
	
				se(inputPlayer1 == "2")
				{
					player1 = "UberEats"
				}
				
				escreva(player1, "VOCE JOGA PRIMEIRO\n")	
			}
	
			se(sorteioDado2 > sorteioDado1)
			{
				escreva("JOGADOR 2 TIROU O MAIOR DADO, ESCOLHA SEU PERSONAGEM\n")
				escreva("1- iFood\n")
				escreva("2- UberEats\n")	
				leia(inputPlayer2)
	
				se(inputPlayer2 == "1")
				{
					player2 = "iFood"
				}
	
				se(inputPlayer2 == "2")
				{
					player2 = "UberEats"
				}
	
				escreva(player2, "VOCE JOGA PRIMEIRO\n")										
			}
		}		
	}

	funcao VerificarPlacar(cadeia player1, cadeia player2, inteiro casaPlayer1, inteiro casaPlayer2, inteiro placarPlayer1, inteiro placarPlayer2)
	{
		escreva("\nPLACARES\n")
		escreva(player1, "NA CASA ", casaPlayer1,"\n")
		escreva(player2, "NA CASA ", casaPlayer2,"\n")
		escreva("\nRODADAS VENCIDAS\n")
		escreva(placarPlayer1, " - ", player1, " - ", player2, " - ", placarPlayer2, "\n")
	}

	funcao fecharJogo(inteiro &keepPlaying)
	{
		keepPlaying = 0
	}

	funcao jogo(cadeia &menuOpt, inteiro keepPlaying, cadeia player1, cadeia player2, inteiro casaPlayer1, inteiro casaPlayer2, inteiro placarPlayer1, inteiro placarPlayer2)
	{
		se(menuOpt == "1")
		{
		escolherPersonagem()
		}
		
		se(menuOpt == "2")
		{
			VerificarPlacar(player1, player2, casaPlayer1, casaPlayer2, placarPlayer1, placarPlayer2)
		}
		
		se(menuOpt == "3")
		{
			fecharJogo(keepPlaying)	
		}				
	}

	funcao inicio()
	{
		cadeia menuOpt, player1 = "0", player2 = "0"
		inteiro keepPlaying = 1, casaPlayer1 = 0, casaPlayer2 = 0, placarPlayer1 = 0, placarPlayer2 = 0
		
		enquanto(keepPlaying == 1)
		{
			escreva("BEM VINDO AO JOGO DELIVEY MAN\n") 
			escreva("1 - JOGAR\n")	
			escreva("2 - VERIFICAR PLACAR\n")
			escreva("3 - FECHAR JOGO\n")	
			leia(menuOpt)
			
			se(menuOpt == "1")
			{
				jogo(menuOpt, keepPlaying, player1, player2, casaPlayer1, casaPlayer2, placarPlayer1, placarPlayer2)
			}
	
			se(menuOpt == "2")
			{
				VerificarPlacar(player1, player2, casaPlayer1, casaPlayer2, placarPlayer1, placarPlayer2)	
			}
	
			se(menuOpt == "3")
			{
				fecharJogo(keepPlaying)	
			}	
		}		
	}
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 700; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vet, 83, 10, 3}-{vet2, 83, 18, 4};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
