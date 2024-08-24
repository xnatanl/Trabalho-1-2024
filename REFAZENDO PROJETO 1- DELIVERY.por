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
	
	funcao escolherPersonagem(inteiro &suaVez1, inteiro &suaVez2, cadeia &player1, cadeia &player2, inteiro casaPlayer1, inteiro casaPlayer2)
	{
		cadeia inputPlayer1 = "1", inputPlayer2 = "1"
		inteiro sorteioDado1 = 0, sorteioDado2 = 0, loopPersonagem = 1

		enquanto(loopPersonagem == 1)
		{	
			limpa()
			escreva("\n-SESSAO PARA ESCOLHA DE PERSONAGENS E QUEM JOGARA PRIMEIRO-\n")
						
			escreva("\nJOGADOR 1, ESCOLHA SEU PERSONAGEM\n")	
			leia(inputPlayer1)
			player1 = inputPlayer1
			
			escreva("\nJOGADOR 2, ESCOLHA SEU PERSONAGEM\n")	
			leia(inputPlayer2)
			player2 = inputPlayer2			

			escreva("\nSORTEIEM OS DADOS\n")					
			escreva("\nQUEM JOGAR O MAIOR DADO DEVE\n-SAIR JOGANDO\n")			
			
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
				escreva(player1, " VOCE JOGA PRIMEIRO\n")
				escreva("VOCE PERCORRERA O NUMERO DE CASAS SORTEADO NO DADO\n")
				suaVez1 = 1
				leia(inputPlayer1)
				casaPlayer1 = u.sorteia (1,6)				
				loopPersonagem = 0		
			}
	
			se(sorteioDado2 > sorteioDado1)
			{
				limpa()
				escreva(player2, " VOCE JOGA PRIMEIRO\n")
				escreva("VOCE PERCORRERA O NUMERO DE CASAS SORTEADO NO DADO\n")				
				suaVez2 = 1	
				leia(inputPlayer2)
				casaPlayer2 = u.sorteia (1,6)
				loopPersonagem = 0									
			}
		}		
	}	

	funcao jogo(cadeia &menuOpt, inteiro &keepPlaying, cadeia &player1, cadeia &player2, inteiro &casaPlayer1, inteiro &casaPlayer2, inteiro &placarPlayer1, inteiro &placarPlayer2)
	{
		inteiro suaVez1 = 0, suaVez2 = 0, troca = 0
		cadeia inputPlayer = "0", repitaOpcao = "1"
		
		escolherPersonagem(suaVez1, suaVez2, player1, player2, casaPlayer1, casaPlayer2)
		escreva("\n-COMANDOS-\n2- PLACAR\n3- FECHAR JOGO\nOUTRA TECLA- JOGAR\n")
		
		enquanto(casaPlayer1 < 20 e keepPlaying == 1 ou casaPlayer2 < 20 e keepPlaying == 1)
		{			
			//se chamar placar => VerificarPlacar(player1, player2, casaPlayer1, casaPlayer2, placarPlayer1, placarPlayer2)
			//se chamar sair => fecharJogo(keepPlaying)
			enquanto(suaVez1 >= 1 e casaPlayer1 < 20)	
			{	
				se(suaVez1 >= 1 e casaPlayer1 != 2 e casaPlayer1 != 3 e casaPlayer1 != 7 e casaPlayer1 != 10 e casaPlayer1 != 12 e casaPlayer1 != 15 e casaPlayer1 != 19 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\n", player1, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer1, "]\n")
					se(suaVez1 != 2)
					{ 
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer2 += u.sorteia(1, 6)				
						suaVez2 = 1	
					}	
						
					suaVez1--
					//jogue o dado e casaPlayer2 += u.sorteia(1,6)
				}
				
				se(suaVez1 >= 1 e casaPlayer1 == 2 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n", player1, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer1, "]\n")
					escreva("AGORA VOCE DEVE AVANÇAR PARA A [CASA 5]\n")
					casaPlayer1 = 5
					se(suaVez1 != 2)
					{ 						
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer2 += u.sorteia(1, 6)			
						suaVez2 = 1				
					} //deve avançar o jogador para a casa 5.
					suaVez1--							
				}
				
				se(suaVez1 >= 1 e casaPlayer1 == 3 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n", player1, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer1, "]\n")
					escreva("AGORA VOCE DEVE JOGAR MAIS UM DADO DE 3 LADOS\n")
					leia(inputPlayer)				
					casaPlayer1 += u.sorteia(1, 3)
					suaVez1 = 1	
				}
				
				se(suaVez1 >= 1 e casaPlayer1 == 7 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n", player1, " PARECE QUE... VOCE CHEGOU NA [CASA ", casaPlayer1, "]\n")
					escreva("INFELIZMENTE, VOCE NAO PODERA JOGAR NA PROXIMA RODADA\n")	
					suaVez1 = 0
					escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
					leia(inputPlayer)					
					casaPlayer2 += u.sorteia(1, 6)					
					suaVez2 = 2
					//deve impedir que o jogador jogue o dado por 1 rodada.
				}
				
				se(suaVez1 >= 1 e casaPlayer1 == 10 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\nAS SUAS POSIÇOES FORAM TROCADAS!!\n")
					troca = casaPlayer1
					casaPlayer1 = casaPlayer2
					casaPlayer2 = troca
					escreva(player1, " VOCE AGORA ESTA NA CASA ", casaPlayer1, "\n")
					escreva(player2, " VOCE AGORA ESTA NA CASA ", casaPlayer2, "\n")

					se(suaVez1 != 2)
					{ 					
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer2 += u.sorteia(1, 6)				
						suaVez2 = 1
					}//deve trocar as casa em que os jogadores estão.
					suaVez1--					
				}	
	
				se(suaVez1 >= 1 e casaPlayer1 == 12 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\nVOCE CHEGOU NA [CASA 12], AGORA VOCE DEVE RETROCEDER 1 CASA\n")
					casaPlayer1 -= 1
					se(suaVez1 != 2)
					{ 					
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer2 += u.sorteia(1, 6)	
						suaVez2 = 1				
					}//deve retroceder 1 casa
					suaVez1--					
				}			
	
				se(suaVez1 >= 1 e casaPlayer1 == 15 e casaPlayer2 < 20 e keepPlaying == 1)
				{	
					repitaOpcao = "1"	
													
					enquanto(repitaOpcao == "1")
					{
						escreva("\nVOCE CHEGOU NA [CASA 15], AGORA VOCE DEVE ESCOLHER ENTRE ")
						escreva("CANTAR UM TRECHO DE UMA MUSICA OU VOLTAR 2 CASAS\n")	
						escreva("1- CANTAR O TRECHO DE UMA MUSICA\n")
						escreva("2- VOLTAR 2 CASAS\n")
						leia(inputPlayer)
						se(inputPlayer == "1")
						{
							escreva("*TRECHO DA MUSICA*\n")
							u.aguarde(5000)
							repitaOpcao = "0"		
						} senao {
							se(inputPlayer == "2")
							{
								casaPlayer1 -= 2
								repitaOpcao = "0"	
							} senao {
								repitaOpcao = "1"									
							}
						}
						//deve cantar um trecho de uma música (na vida real) ou voltar 2 casas
					}
					
					se(suaVez1 != 2)
					{ 					
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer2 += u.sorteia(1, 6)	
						suaVez2 = 1
					}	
					suaVez1--										
				}			
	
				se(suaVez1 >= 1 e casaPlayer1 == 19 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\nVOCE CHEGOU NA [CASA 19], INFELIZMENTE PARECE QUE VOCE DEVE VOLTAR PARA A CASA 1\n")	
					casaPlayer1 = 1	
					se(suaVez1 != 2)
					{ 						
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer2 += u.sorteia(1, 6)	
						suaVez2 = 1
					}	
					suaVez1--										
					//deve voltar para a casa 1
				}
	
				se(suaVez1 >= 1 e casaPlayer1 > 19 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\nVOCE CHEGOU NA [CASA 20], PARABENS!!! VOCE VENCEU O JOGO E ACRESCENTOU +1 PONTO NO SEU PLACAR\n")
					//recebe a mensagem de vencedor da partida
				}		
			}
//-----PLAYER2-----------------------------------------------------------------------------------------------------------------------------------------------------/
			enquanto(suaVez2 >= 1 e casaPlayer2 < 20)	
			{
				se(suaVez2 >= 1 e casaPlayer2 != 2 e casaPlayer2 != 3 e casaPlayer2 != 7 e casaPlayer2 != 10 e casaPlayer2 != 12 e casaPlayer2 != 15 e casaPlayer2 != 19 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n", player2, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer2, "]\n")
					se(suaVez2 != 2)
					{ 
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer1 += u.sorteia(1, 6)				
						suaVez1 = 1	
					}	
						
					suaVez2--
				}
							
				se(suaVez2 >= 1 e casaPlayer2 == 2 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva(player2, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer2, "]\n")
					escreva("AGORA VOCE DEVE AVANÇAR PARA A [CASA 5]\n")
					casaPlayer2 = 5
					se(suaVez2 != 2)
					{ 				
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer1 += u.sorteia(1, 6)			
						suaVez1 = 1
					}				
					suaVez2--						
				}
					
				se(suaVez2 >= 1 e casaPlayer2 == 3 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva(player2, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer2, "]\n")
					escreva("AGORA VOCE DEVE JOGAR MAIS UM DADO DE 3 LADOS\n")
					leia(inputPlayer)				
					casaPlayer2 += u.sorteia(1, 3)
					suaVez2 = 1					
				}
				
				se(suaVez2 >= 1 e casaPlayer2 == 7 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva(player2, " PARECE QUE... VOCE CHEGOU NA [CASA ", casaPlayer2, "]\n")
					escreva("INFELIZMENTE, VOCE NAO PODERA JOGAR NA PROXIMA RODADA\n")	
					suaVez2 = 0
					escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
					leia(inputPlayer)					
					casaPlayer1 += u.sorteia(1, 6)				
					suaVez1 = 2				
				}
				
				se(suaVez2 >= 1 e casaPlayer2 == 10 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\nAS SUAS POSIÇOES FORAM TROCADAS!!\n")
					troca = casaPlayer1
					casaPlayer1 = casaPlayer2
					casaPlayer2 = troca
					escreva(player1, " VOCE AGORA ESTA NA CASA ", casaPlayer1, "\n")
					escreva(player2, " VOCE AGORA ESTA NA CASA ", casaPlayer2, "\n")
					se(suaVez2 != 2)
					{ 					
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer1 += u.sorteia(1, 6)				
						suaVez1 = 1
					}
					suaVez2--					
				}	
	
				se(suaVez2 >= 1 e casaPlayer2 == 12 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\nVOCE CHEGOU NA [CASA 12], AGORA VOCE DEVE RETROCEDER 1 CASA\n")
					casaPlayer2 -= 1
					se(suaVez2 != 2)
					{					
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer1 += u.sorteia(1, 6)	
						suaVez1 = 1	
					}	
					suaVez2--					
				}			
	
				se(suaVez2 >= 1 e casaPlayer2 == 15 e casaPlayer1 < 20 e keepPlaying == 1)
				{	
					repitaOpcao = "1"		
						
					enquanto(repitaOpcao == "1")
					{
						escreva("\nVOCE CHEGOU NA [CASA 15], AGORA VOCE DEVE ESCOLHER ENTRE ")
						escreva("CANTAR UM TRECHO DE UMA MUSICA OU VOLTAR 2 CASAS\n")	
						escreva("1- CANTAR O TRECHO DE UMA MUSICA\n")
						escreva("2- VOLTAR 2 CASAS\n")
						leia(inputPlayer)
						se(inputPlayer == "1")
						{
							escreva("*TRECHO DA MUSICA*\n")
							u.aguarde(5000)
							repitaOpcao = "0"		
						} senao {
							se(inputPlayer == "2")
							{
								casaPlayer2 -= 2
								repitaOpcao = "0"	
							} senao {
								repitaOpcao = "1"									
							}
						}
						//deve cantar um trecho de uma música (na vida real) ou voltar 2 casas
					}
					
					se(suaVez2 != 2)
					{						
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer1 += u.sorteia(1, 6)	
						suaVez1 = 1
					}
					suaVez2--					
				}			
	
				se(suaVez2 >= 1 e casaPlayer2 == 19 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\nVOCE CHEGOU NA [CASA 19], INFELIZMENTE PARECE QUE VOCE DEVE VOLTAR PARA A CASA 1\n")	
					casaPlayer2 = 1	
					se(suaVez2 != 2)
					{						
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)					
						casaPlayer1 += u.sorteia(1, 6)	
						suaVez1 = 1
					}	
					suaVez2--						
				}
	
				se(suaVez2 >= 1 e casaPlayer2 > 19 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\nVOCE CHEGOU NA [CASA 20], PARABENS!!! VOCE VENCEU O JOGO E ACRESCENTOU +1 PONTO NO SEU PLACAR\n")					
				}
			}														
		}
		
		se(casaPlayer1 >= 20)
		{
			casaPlayer1 = 20
			placarPlayer1++
		}

		se(casaPlayer2 >= 20)
		{
			casaPlayer2 = 20
			placarPlayer2++
		}		
	}

	funcao inicio()
	{
		inteiro keepPlaying = 1
		escreva("BEM VINDO AO JOGO DELIVEY MAN\n")
		escreva("MENU PRINCIPAL\n")		
		
		enquanto(keepPlaying == 1)
		{
			cadeia menuOpt, player1 = "0", player2 = "0"
			inteiro casaPlayer1 = 1, casaPlayer2 = 1, placarPlayer1 = 0, placarPlayer2 = 0	
					 
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
				escreva("MENU PRINCIPAL\n")
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
