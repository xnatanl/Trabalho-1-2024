programa
{
	
	inclua biblioteca Util --> u	

	funcao VerificarPlacar(cadeia &player1, cadeia &player2, inteiro &casaPlayer1, inteiro &casaPlayer2, inteiro &placarPlayer1, inteiro &placarPlayer2)
	{
		escreva("PLACAR\n")
		escreva(player1, " NA CASA ", casaPlayer1,"\n")
		escreva(player2, " NA CASA ", casaPlayer2,"\n")
		escreva("\nRODADAS VENCIDAS\n")
		escreva(placarPlayer1, " - ", player1, " - ", player2, " - ", placarPlayer2, "\n\n")
	}		

	funcao fecharJogo(inteiro &keepPlaying)
	{
		keepPlaying = 0
	}
	
	funcao escolherPersonagem(cadeia &player1, cadeia &player2)
	{
		cadeia inputPlayer1 = "1", inputPlayer2 = "1"
		inteiro sorteioDado1 = 0, sorteioDado2 = 0, loopPersonagem = 1

		enquanto(loopPersonagem == 1)
		{	
			limpa()
			escreva("\n-SESSAO PARA ESCOLHA DE PERSONAGENS E QUEM JOGARA PRIMEIRO-\n")
			escreva("\nQUEM JOGAR O MAIOR DADO DEVE\n-ESCOLHER O PERSONAGEM COM QUEM DESEJA JOGAR\n-SAIR JOGANDO\n")	
			escreva("\n-COMANDOS-\n2- PLACAR\n3- FECHAR JOGO\nOUTRA TECLA- JOGAR\n")		
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
				limpa()
				escreva("JOGADOR 1 TIROU O MAIOR DADO, ESCOLHA SEU PERSONAGEM\n")
				escreva("0- iFood\n")
				escreva("1- UberEats\n")	
				leia(inputPlayer1)
	
				se(inputPlayer1 == "0")
				{
					player1 = "iFood"
					player2 = "UberEats"
				}
	
				se(inputPlayer1 == "1")
				{
					player1 = "UberEats"
					player2 = "iFood"
				}
				
				escreva(player1, " VOCE JOGA PRIMEIRO\n")
				loopPersonagem = 0		
			}
	
			se(sorteioDado2 > sorteioDado1)
			{
				limpa()
				escreva("JOGADOR 2 TIROU O MAIOR DADO, ESCOLHA SEU PERSONAGEM\n")
				escreva("0- iFood\n")
				escreva("1- UberEats\n")	
				leia(inputPlayer2)
	
				se(inputPlayer2 == "0")
				{
					player2 = "iFood"
					player1 = "UberEats"
				}
	
				se(inputPlayer2 == "1")
				{
					player2 = "UberEats"
					player1 = "iFood"
				}
	
				escreva(player2, " VOCE JOGA PRIMEIRO\n")	
				loopPersonagem = 0									
			}
		}		
	}	

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

	funcao jogo(cadeia &menuOpt, inteiro &keepPlaying, cadeia &player1, cadeia &player2, inteiro &casaPlayer1, inteiro &casaPlayer2, inteiro &placarPlayer1, inteiro &placarPlayer2)
	{
		enquanto(casaPlayer1 < 20 ou casaPlayer2 < 20)
		{
			escolherPersonagem(player1, player2)
			
			se(casaPlayer1 == 2 e casaPlayer2 < 20)
			{
				
			}
			
			se(casaPlayer1 == 3 e casaPlayer2 < 20)
			{
				
			}
			
			se(casaPlayer1 == 7 e casaPlayer2 < 20)
			{
				
			}
			
			se(casaPlayer1 == 10 e casaPlayer2 < 20)
			{
				
			}	

			se(casaPlayer1 == 12 e casaPlayer2 < 20)
			{
				
			}			

			se(casaPlayer1 == 15 e casaPlayer2 < 20)
			{
				
			}			

			se(casaPlayer1 == 19 e casaPlayer2 < 20)
			{
				
			}

			se(casaPlayer1 == 20 e casaPlayer2 < 20)
			{
				
			}		

//-----PLAYER2-----------------------------------------------------------------------------------------------------------------------------------------------------/
			
			se(casaPlayer2 == 2 e casaPlayer1 < 20)
			{
				
			}
			
			se(casaPlayer2 == 3 e casaPlayer1 < 20)
			{
				
			}
			
			se(casaPlayer2 == 7 e casaPlayer1 < 20)
			{
				
			}
			
			se(casaPlayer2 == 10 e casaPlayer1 < 20)
			{
				
			}	

			se(casaPlayer2 == 12 e casaPlayer1 < 20)
			{
				
			}			

			se(casaPlayer2 == 15 e casaPlayer1 < 20)
			{
				
			}			

			se(casaPlayer2 == 19 e casaPlayer1 < 20)
			{
				
			}

			se(casaPlayer2 == 20 e casaPlayer1 < 20)
			{
				
			}					
													
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
				limpa()				
				VerificarPlacar(player1, player2, casaPlayer1, casaPlayer2, placarPlayer1, placarPlayer2)
				u.aguarde(4000)
			}
	
			se(menuOpt == "3")
			{
				fecharJogo(keepPlaying)	
			}

			se(menuOpt != "1" e menuOpt != "2" e menuOpt != "3")
			{
				limpa()
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
