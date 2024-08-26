programa
{
	
	inclua biblioteca Util --> u	

	funcao VerificarPlacar(cadeia &player1, cadeia &player2, inteiro &casaPlayer1, inteiro &casaPlayer2, inteiro &placarPlayer1, inteiro &placarPlayer2)
	{
		escreva(player1, " NA CASA ", casaPlayer1,"\n")
		escreva(player2, " NA CASA ", casaPlayer2,"\n")
		escreva("\nPARTIDAS VENCIDAS\n")
		escreva(placarPlayer1, " - ", player1, " - ", player2, " - ", placarPlayer2, "\n\n")
	}		
	funcao fecharJogo(inteiro &keepPlaying)
	{
		keepPlaying = 0
	}	
	funcao escolherPersonagem(inteiro &suaVez1, inteiro &suaVez2, cadeia &player1, cadeia &player2, inteiro &casaPlayer1, inteiro &casaPlayer2)
	{
		cadeia inputPlayer1 = "1", inputPlayer2 = "1"
		inteiro sorteioDado1 = 0, sorteioDado2 = 0, loopPersonagem = 1, numero = 0
		enquanto(loopPersonagem == 1)
		{	
			limpa()	
			se(player1 == "JOGADOR 1" e player2 == "JOGADOR 2")
			{
				escreva("\nJOGADOR 1, ESCOLHA SEU PERSONAGEM\n")	
				leia(inputPlayer1)
				player1 = inputPlayer1
				
				escreva("\nJOGADOR 2, ESCOLHA SEU PERSONAGEM\n")	
				leia(inputPlayer2)
				player2 = inputPlayer2			
			}
			escreva("\nSORTEIEM OS DADOS\n")					
			escreva("QUEM JOGAR O MAIOR DADO DEVE SAIR JOGANDO\n")			
			
			escreva("\n", player1,"\n")
			leia(inputPlayer1)
			sorteioDado1 = u.sorteia(1, 6)	

			escreva("\n", player2,"\n")
			leia(inputPlayer2)
			sorteioDado2 = u.sorteia(1, 6)
			
			enquanto(sorteioDado1 == sorteioDado2)
			{
				sorteioDado1 = u.sorteia(1, 6)
				sorteioDado2 = u.sorteia(1, 6) 
			}
			se(sorteioDado1 > sorteioDado2)
			{	
				escreva("\n", player1, "\n")
				numeroDado(sorteioDado1)
				escreva("\n", player2, "\n")
				numeroDado(sorteioDado2)
				escreva(player1, " VOCE JOGA PRIMEIRO\n")
				escreva("VOCE COMEÇA NA [CASA 1] E PERCORRERA O NUMERO DE CASAS SORTEADO. JOGUE O DADO!!\n")
				suaVez1 = 1
				leia(inputPlayer1)
				numero = u.sorteia (1,6)
				casaPlayer1 += numero
				numeroDado(numero)				
				loopPersonagem = 0		
			}
			se(sorteioDado2 > sorteioDado1)
			{
				escreva("\n", player1, "\n")
				numeroDado(sorteioDado1)
				escreva("\n", player2, "\n")
				numeroDado(sorteioDado2)
				escreva(player2, " VOCE JOGA PRIMEIRO\n")
				escreva("VOCE COMEÇA NA [CASA 1] E PERCORRERA O NUMERO DE CASAS SORTEADO. JOGUE O DADO!!\n")				
				suaVez2 = 1	
				leia(inputPlayer2)
				numero = u.sorteia (1,6)
				casaPlayer2 += numero
				numeroDado(numero)
				loopPersonagem = 0									
			}
		}		
	}	
	funcao jogo(inteiro &suaVez1, inteiro &suaVez2, inteiro &vencedor,cadeia &menuOpt, inteiro &keepPlaying, cadeia &player1, cadeia &player2, inteiro &casaPlayer1, inteiro &casaPlayer2, inteiro &placarPlayer1, inteiro &placarPlayer2)
	{
		inteiro troca = 0, credito1 = 0, credito2 = 0, penalidade1 = 0, penalidade2 = 0, numero = 0
		cadeia inputPlayer = "0", repitaOpcao = "1"	
		enquanto(vencedor == 0)
		{	
				se(casaPlayer1 > 19)
				{
					escreva("\n", player1, " VOCE CHEGOU NA [CASA 20], PARABENS!!! VOCE VENCEU O JOGO E ACRESCENTOU +1 PONTO NO SEU PLACAR\n")
					casaPlayer1 = 20
			   		placarPlayer1++
					VerificarPlacar(player1, player2, casaPlayer1, casaPlayer2, placarPlayer1, placarPlayer2)	
					vencedor = 1	
				}
				se(casaPlayer2 > 19)
				{
					escreva("\n", player2, " VOCE CHEGOU NA [CASA 20], PARABENS!!! VOCE VENCEU O JOGO E ACRESCENTOU +1 PONTO NO SEU PLACAR\n")
					casaPlayer2 = 20
			   		placarPlayer2++
					VerificarPlacar(player1, player2, casaPlayer1, casaPlayer2, placarPlayer1, placarPlayer2)	
					vencedor = 1					
				}								
			enquanto(suaVez1 >= 1 e casaPlayer1 < 20 e vencedor == 0)	
			{	
				se(suaVez1 >= 1 e casaPlayer1 != 2 e casaPlayer1 != 3 e casaPlayer1 != 7 e casaPlayer1 != 10 e casaPlayer1 != 12 e casaPlayer1 != 15 e casaPlayer1 != 19 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\n", player1, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer1, "]\n")
					suaVez2 = 1
					se(penalidade2 == 0 e suaVez2 > 0 ou penalidade2 == 3 e suaVez2 > 0)
					{ 
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6)	
						numeroDado(numero)		
						casaPlayer2 += numero				
						suaVez2 = 1	
					} senao {
						se(penalidade2 == 1)
						{
							credito2 = 0
							escreva(player2," NAO PODE JOGAR NESTA RODADA, PORTANTO, ", player1, " PODE JOGAR NOVAMENTE\n")
							escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
							leia(inputPlayer)	
							numero = u.sorteia(1, 6)	
							numeroDado(numero)		
							casaPlayer1 += numero
							credito1--
							suaVez2 = 1
							penalidade2 = 3
						}
					}					
					suaVez1--
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
						numero = u.sorteia(1, 6)
						numeroDado(numero)
						casaPlayer2 += numero			
						suaVez2 = 1				
					}
					suaVez1--							
				}	
				se(suaVez1 >= 1 e casaPlayer1 == 3 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n\n", player1, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer1, "]\n")
					escreva("AGORA VOCE PODE JOGAR MAIS UM DADO DE 3 LADOS\n")
					leia(inputPlayer)	
					numero = u.sorteia(1, 3) 
					numeroDado(numero)			
					casaPlayer1 += numero
					suaVez1 = 1	
				}	
				se(suaVez1 >= 1 e casaPlayer1 == 7 e casaPlayer2 < 20 e keepPlaying == 1)
				{	
					se(penalidade1 == 3 e casaPlayer1 == 7)
					{
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6)
						numeroDado(numero) 			
						casaPlayer1 += numero				
						suaVez1 = 1
					}
					se(penalidade1 == 0){		
						escreva("\n", player1, " PARECE QUE... VOCE CHEGOU NA [CASA ", casaPlayer1, "]\n")
						escreva("INFELIZMENTE, VOCE NAO PODERA JOGAR NA PROXIMA RODADA\n")	
						suaVez1 = 0
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)		
						numero = u.sorteia(1, 6) 
						numeroDado(numero)			
						casaPlayer2 += numero					
						suaVez2 = 2
						credito2 = 2
						penalidade1 = 1
					} senao {
						suaVez1 = 1
					}
				}	
				se(suaVez1 >= 1 e casaPlayer1 == 10 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n", player1, " VOCE CHEGOU NA [CASA ", casaPlayer1, "], E AGORA AS SUAS POSIÇOES FORAM TROCADAS!!\n")
					troca = casaPlayer1
					casaPlayer1 = casaPlayer2
					casaPlayer2 = troca
					escreva(player1, " VOCE AGORA ESTA NA CASA ", casaPlayer1, "\n")
					escreva(player2, " VOCE AGORA ESTA NA CASA ", casaPlayer2, "\n")
					se(suaVez1 != 2)
					{ 					
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)	
						numero = u.sorteia(1, 6) 
						numeroDado(numero)				
						casaPlayer2 += numero			
						suaVez2 = 1
					}
					suaVez1--					
				}	
				se(suaVez1 >= 1 e casaPlayer1 == 12 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n", player1, " VOCE CHEGOU NA [CASA 12], AGORA VOCE DEVE RETROCEDER 1 CASA\n")
					casaPlayer1 -= 1
					se(suaVez1 != 2)
					{ 					
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)	
						numero = u.sorteia(1, 6) 
						numeroDado(numero)				
						casaPlayer2 += numero
						suaVez2 = 1				
					}
					suaVez1--					
				}			
				se(suaVez1 >= 1 e casaPlayer1 == 15 e casaPlayer2 < 20 e keepPlaying == 1)
				{	
					repitaOpcao = "1"											
					enquanto(repitaOpcao == "1")
					{
						escreva("\n", player1, " VOCE CHEGOU NA [CASA 15], AGORA VOCE DEVE ESCOLHER ENTRE ")
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
								escreva(player1, " VOLTE PARA A [CASA ", casaPlayer1, "]\n")									
								repitaOpcao = "0"	
							} senao {
								repitaOpcao = "1"									
							}
						}
					}	
					se(suaVez1 != 2)
					{ 					
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6) 
						numeroDado(numero)					
						casaPlayer2 += numero	
						suaVez2 = 1
					}	
					suaVez1--										
				}			
				se(suaVez1 >= 1 e casaPlayer1 == 19 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n", player1, " VOCE CHEGOU NA [CASA 19], INFELIZMENTE PARECE QUE VOCE DEVE VOLTAR PARA A CASA 1\n")	
					casaPlayer1 = 1	
					se(suaVez1 != 2)
					{ 						
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6) 	
						numeroDado(numero)				
						casaPlayer2 += numero	
						suaVez2 = 1
					}	
					suaVez1--										
				}	
			}
//-----PLAYER2-----------------------------------------------------------------------------------------------------------------------------------------------------/
			enquanto(suaVez2 >= 1 e casaPlayer2 < 20 e vencedor == 0)	
			{
				se(suaVez2 >= 1 e casaPlayer2 != 2 e casaPlayer2 != 3 e casaPlayer2 != 7 e casaPlayer2 != 10 e casaPlayer2 != 12 e casaPlayer2 != 15 e casaPlayer2 != 19 e casaPlayer2 < 20 e keepPlaying == 1)
				{
					escreva("\n", player2, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer2, "]\n")
					suaVez1 = 1
					se(penalidade1 == 0 e suaVez1 > 0 ou penalidade1 == 3 e suaVez1 > 0)
					{ 
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6) 
						numeroDado(numero)				
						casaPlayer1 += numero				
						suaVez1 = 1	
					} senao {
						se(penalidade1 == 1)
						{
							credito1 = 0
							escreva(player1," NAO PODE JOGAR NESTA RODADA, PORTANTO, ", player2, " PODE JOGAR NOVAMENTE\n")
							escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
							leia(inputPlayer)		
							numero = u.sorteia(1, 6)
							numeroDado(numero) 			
							casaPlayer2 += numero
							credito2--
							suaVez1 = 1	
							penalidade1 = 3
						}
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
						numero = u.sorteia(1, 6) 
						numeroDado(numero)					
						casaPlayer1 += numero			
						suaVez1 = 1
					}				
					suaVez2--						
				}					
				se(suaVez2 >= 1 e casaPlayer2 == 3 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva(player2, " MUITO BOM! VOCE CHEGOU NA [CASA ", casaPlayer2, "]\n")
					escreva("AGORA VOCE PODE JOGAR MAIS UM DADO DE 3 LADOS\n")
					leia(inputPlayer)		
					numero = u.sorteia(1, 3)
					numeroDado(numero)		
					casaPlayer2 += numero
					suaVez2 = 1					
				}				
				se(suaVez2 >= 1 e casaPlayer2 == 7 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					se(penalidade2 == 3 e casaPlayer2 == 7)
					{
						escreva(player2, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)	
						numero = u.sorteia(1, 6)	
						numeroDado(numero)	
						casaPlayer2 += numero				
						suaVez2 = 1
					}
					se(penalidade2 == 0){
						escreva(player2, " PARECE QUE... VOCE CHEGOU NA [CASA ", casaPlayer2, "]\n")
						escreva("INFELIZMENTE, VOCE NAO PODERA JOGAR NA PROXIMA RODADA\n")	
						suaVez2 = 0
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6) 
						numeroDado(numero)					
						casaPlayer1 += numero				
						suaVez1 = 2	
						credito1 = 2
						penalidade2 = 1	
					} senao {
						suaVez2 = 1		
					}
				}				
				se(suaVez2 >= 1 e casaPlayer2 == 10 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\n", player2, " VOCE CHEGOU NA [CASA ", casaPlayer2, "], E AGORA AS SUAS POSIÇOES FORAM TROCADAS!!\n")
					troca = casaPlayer1
					casaPlayer1 = casaPlayer2
					casaPlayer2 = troca
					troca = penalidade1
					penalidade1 = penalidade2
					penalidade2 = troca
					escreva(player1, " VOCE AGORA ESTA NA CASA ", casaPlayer1, "\n")
					escreva(player2, " VOCE AGORA ESTA NA CASA ", casaPlayer2, "\n")
					se(suaVez2 != 2)
					{ 					
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6) 
						numeroDado(numero)					
						casaPlayer1 += numero				
						suaVez1 = 1
					}
					suaVez2--					
				}		
				se(suaVez2 >= 1 e casaPlayer2 == 12 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\n", player2, " VOCE CHEGOU NA [CASA 12], AGORA VOCE DEVE RETROCEDER 1 CASA\n")
					casaPlayer2 -= 1
					se(suaVez2 != 2)
					{					
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)	
						numero = u.sorteia(1, 6) 
						numeroDado(numero)				
						casaPlayer1 += numero  	
						suaVez1 = 1	
					}	
					suaVez2--					
				}			
				se(suaVez2 >= 1 e casaPlayer2 == 15 e casaPlayer1 < 20 e keepPlaying == 1)
				{	
					repitaOpcao = "1"		
					enquanto(repitaOpcao == "1")
					{
						escreva("\n", player2, " VOCE CHEGOU NA [CASA 15], AGORA VOCE DEVE ESCOLHER ENTRE ")
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
								escreva(player2, " VOLTE PARA A [CASA ", casaPlayer2, "]\n")								
								repitaOpcao = "0"	
							} senao {
								repitaOpcao = "1"									
							}
						}
					}	
					se(suaVez2 != 2)
					{						
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6)	
						numeroDado(numero)				
						casaPlayer1 += numero	
						suaVez1 = 1
					}
					suaVez2--					
				}			
				se(suaVez2 >= 1 e casaPlayer2 == 19 e casaPlayer1 < 20 e keepPlaying == 1)
				{
					escreva("\n", player2, " VOCE CHEGOU NA [CASA 19], INFELIZMENTE PARECE QUE VOCE DEVE VOLTAR PARA A CASA 1\n")	
					casaPlayer2 = 1	
					se(suaVez2 != 2)
					{						
						escreva(player1, " SUA VEZ! JOGUE O DADO\n")	
						leia(inputPlayer)
						numero = u.sorteia(1, 6)
						numeroDado(numero)					
						casaPlayer1 += numero	
						suaVez1 = 1
					}	
					suaVez2--						
				}			
			}											
		}		
	}

	funcao numeroDado(inteiro &numero) 
	{
		escreva("+-----+\n")
		se(numero == 1) {
			escreva("|     |\n")
			escreva("|  *  |\n")
			escreva("|     |\n")
		}
		se(numero == 2) {
			escreva("|*    |\n")
			escreva("|     |\n")
			escreva("|    *|\n")
		}
		se(numero == 3) {
			escreva("|*    |\n")
			escreva("|  *  |\n")
			escreva("|    *|\n")
		}
		se(numero == 4) {
			escreva("|*   *|\n")
			escreva("|     |\n")
			escreva("|*   *|\n")
			
		}
		se(numero == 5) {
			escreva("|*   *|\n")
			escreva("|  *  |\n")
			escreva("|*   *|\n")
		}
		se(numero == 6) {
			escreva("|*   *|\n")
			escreva("|*   *|\n")
			escreva("|*   *|\n")
		}
		escreva("+-----+\n")
		escreva("\n")
	}

	funcao inicio()
	{
		inteiro placarPlayer1 = 0, placarPlayer2 = 0
		inteiro keepPlaying = 1
		cadeia player1 = "JOGADOR 1", player2 = "JOGADOR 2"
		escreva("BEM VINDO AO JOGO DELIVEY MAN\n")
		escreva("MENU PRINCIPAL\n")		
		
		enquanto(keepPlaying == 1)
		{
			cadeia menuOpt
			inteiro vencedor = 0, casaPlayer1 = 1, casaPlayer2 = 1, suaVez1 = 0, suaVez2 = 0			 
			escreva("1 - JOGAR\n")	
			escreva("2 - VERIFICAR PLACAR\n")
			escreva("3 - FECHAR JOGO\n")	
			leia(menuOpt)	
			se(menuOpt == "1")
			{
				escolherPersonagem(suaVez1, suaVez2, player1, player2, casaPlayer1, casaPlayer2)
				jogo(suaVez1, suaVez2, vencedor, menuOpt, keepPlaying, player1, player2, casaPlayer1, casaPlayer2, placarPlayer1, placarPlayer2)
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
