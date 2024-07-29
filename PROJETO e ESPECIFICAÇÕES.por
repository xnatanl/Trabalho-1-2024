programa
{
	
inclua biblioteca Util --> u
	
	funcao inicio()
	{
		
		
		inteiro vet[3], vet2[3] // vetores para sorteio
		inteiro repita=1, i=-509, a=1, fechar=3, achei=1, j=1 // laços de repetiçao
		inteiro comando, comando2=3, iniciar, jogar = 1, entregador=0 // comandos de entrada e comparação
		inteiro placarEscolhePrimeiro=0, placarEscolheSegundo=0, novoPlacar1 // placares
		inteiro escolhePrimeiro=0, escolheSegundo=0, novoEscolhePrimeiro // jogadores
		
		//--------- Menu Principal
		
		escreva("Bem-vindo ao jogo iFood vs Uber Eats\n") 
		escreva("1 - Jogar\n")	
		escreva("2 - Verificar Placar\n")
		escreva("3 - Fechar jogo\n")		
		
			
			
		enquanto(a==1){ 

		leia(iniciar)

			se(iniciar==fechar){ // caso digita 3, encerra o jogo
			a=fechar
			escolhePrimeiro=1
			escolheSegundo=2	
			}

			se(iniciar==2){ // caso digita 2, mostra o placar
			escreva("\nPLACAR:\nPlayer01:0\nPlayer02:0\n")
			escreva("\n1 - Jogar\n")
			escreva("2 - Verificar Placar\n")
			escreva("3 - Fechar jogo\n")	
			}
		
			se(iniciar==1){ // caso digita 1, inicia o jogo
			
				enquanto(i==-509){

				escreva("\nPlayer01, para jogar o dado, digite 1: ")
				leia(comando)

					se(comando==2){ // caso digita 2, mostra o placar
					escreva("\nPLACAR:\nPlayer01:0\nPlayer02:0\n")	
					}

					se(comando==fechar){ // caso digita 3, encerra o jogo
					escolhePrimeiro=1
					escolheSegundo=2
					}
		
				vet[0] = (u.sorteia (1,6)) //sorteia o dado para o jogador comparar o maior dado e decidir quem começa primeiro
			
					se(comando == jogar){ // só continua o jogo caso digite 1
					i=1
					escreva("Player01, o número sorteado foi: ",vet[0],"\n")
					}senao{
						se(comando != 1 e comando !=3){ // só continua se digitar uma opção válida
						i=-509
						}senao{
							i=0 // senão, se entrada igual a 3, jogo encerra
						}
					}
						
						enquanto(i>0){ 
			
						escreva("\nPlayer02, para jogar o dado, digite 1: ") 
						leia(comando)

							se(comando==2){
							escreva("\nPLACAR:\nPlayer01:0\nPlayer02:0\n")	
							}
						
							se(comando==fechar){
							escolhePrimeiro=1
							escolheSegundo=2
							}
						
						vet2[0] = (u.sorteia (1,6)) //sorteia o dado para o jogador comparar o maior dado e decidir quem começa primeiro
									
							se(comando == jogar ou comando==3){
							i=-1
							
								se(comando !=fechar){
								escreva("Player02, o número sorteado foi: ",vet2[0],"\n")
			
									se(vet[0] == vet2[0]){
									escreva("\nOs números sorteados foram iguais, joguem novamente")
									i=-509
				
									}senao{
									i=0
									}

									enquanto(i==0){

										se(vet[0] > vet2[0]){
										escolhePrimeiro = 1
										escolheSegundo = 2
						
										}senao{
										escolhePrimeiro = 2	
										escolheSegundo = 1
										
										}
			
										enquanto(j==1){

										escreva("\nPlayer0", escolhePrimeiro, " com qual entregador deseja jogar? ")
										escreva("\n0 - iFood\n1 - Uber Eats\n")
										leia(entregador)
				
											se(entregador!=0 e entregador!=1 e entregador!=fechar e entregador!=2){
											escreva("\nDigite uma opção válida\n")
											j=1
											}senao{
												se(entregador==2){
												escreva("\nPLACAR:\nPlayer01:0\nPlayer02:0\n")
												j=1	
												}senao{
												j=0
												}
											}

											se(entregador == 0){
											escreva("\nO Player0", escolhePrimeiro, " é: iFood")
											escreva("\nO Player0", escolheSegundo, " é: Uber Eats")
											escreva("\nO Player0", escolhePrimeiro, " começa\n")
											}

											se(entregador == 1){
											escreva("\nO Player0", escolhePrimeiro, " é: Uber Eats")
											escreva("\nO Player0", escolheSegundo, " é: iFood")
											escreva("\nO Player0", escolhePrimeiro, " começa\n")
											}								
										}
											//CONTINUAÇÃO DA CASA ANTERIOR
											//SE COMANDO!=3 (FECHAR) - FAÇA:

											
										
									placarEscolhePrimeiro=15	//simulação e teste para começo da casa 15 ou 12, senão, se !=15 ou !=12 jogo continua
										
										
									
									repita=1
									enquanto(i!=fechar e entregador !=fechar e repita==1){	
										
										se(placarEscolhePrimeiro==12){
											escreva("\nCASA 12: player0", escolhePrimeiro, " você deve retroceder 1 casa.")
											placarEscolhePrimeiro=placarEscolhePrimeiro-1

											//troca de jogadores com seus placares:
											novoPlacar1=placarEscolhePrimeiro
											placarEscolhePrimeiro=placarEscolheSegundo
											placarEscolheSegundo=novoPlacar1
			
											novoEscolhePrimeiro=escolhePrimeiro
											escolhePrimeiro=escolheSegundo
											escolheSegundo=novoEscolhePrimeiro
											
											//------
												
										}																
											
										
										
										enquanto(entregador !=fechar e placarEscolhePrimeiro==15){ 

											se(achei==1){
										   
												se(entregador !=fechar e placarEscolhePrimeiro==15 e comando!=fechar e achei==1){
													i=1
													
													faca{
		
													escreva("\nCASA 15: player0",escolhePrimeiro," volte 2 casas ou cante um trecho de uma música")
													escreva("\n0 - Voltar 2 casas\n1 - Cantar trecho de uma música\n")
													leia(comando)
			
														se(comando==0){
														placarEscolhePrimeiro=placarEscolhePrimeiro-2//voltar 2 casas
														i=0//e passar para o proximo jogador
															
														}
														se(comando==1){										
														escreva("\nCante trecho de uma música\n")//cantar trecho de uma musica
														i=0//e passar para o proximo jogador
														achei=0//achei=0
														
															
														}
														se(comando==2){
														escreva("\nPLACAR:\nPlayer0", escolhePrimeiro, ":", placarEscolhePrimeiro)
														escreva("\nPlayer0", escolheSegundo, ":", placarEscolheSegundo,"\n")
														//mostrar placar
														i=1//repetir laço de repetição para comando
														
														}
														se(comando==3){												
														i=fechar//fechar o jogo
															
														}
														se(comando!= 0 e comando!=1 e comando!=2 e comando!=3){
														i=1//repetir laço de repetição para comando 
														escreva("\nOpção inválida, digite novamente\n")//imprimir 'digite uma opçao valida'
													
														}
														
														se(comando==0 ou comando==1){ //troca de jogadores com seus placares:
														novoPlacar1=placarEscolhePrimeiro
														placarEscolhePrimeiro=placarEscolheSegundo
														placarEscolheSegundo=novoPlacar1
			
														novoEscolhePrimeiro=escolhePrimeiro
														escolhePrimeiro=escolheSegundo
														escolheSegundo=novoEscolhePrimeiro	
														}

														//--------
																							
													}enquanto(i==1)
		
													
													
												}
											
											}
										}
										
									
																					
																								
													
										se(i!=fechar e entregador!=fechar e comando!=fechar){
											
											i=1
											faca{											
												enquanto(i==1){

													se(comando!=fechar){														
														
														escreva("\nCASA ",placarEscolhePrimeiro,": player0",escolhePrimeiro,", sua vez, jogue o dado\n")
														leia(comando)														
														
														se(comando==1){										
														vet[2] = u.sorteia(1,6)
														placarEscolhePrimeiro=placarEscolhePrimeiro+vet[2]
																											
														escreva("\nPlayer0", escolhePrimeiro, " seu dado foi de número: ", vet[2],"\n")
														escreva("Prossiga para a casa ", placarEscolhePrimeiro,"\n")
														//e passar para o proximo jogador													
														
														} 

														//pode-se colocar demais casas aqui
	
														se(placarEscolhePrimeiro==12){ // caso caia na casa 12
														escreva("\nCASA 12: player0", escolhePrimeiro, " você deve retroceder 1 casa\n")
														placarEscolhePrimeiro=placarEscolhePrimeiro-1
														i=0
														
														}
	
														
														se(comando==2){
														escreva("\nPLACAR:\nPlayer0", escolhePrimeiro, ":", placarEscolhePrimeiro)
														escreva("\nPlayer0", escolheSegundo, ":", placarEscolheSegundo,"\n")
														//mostrar placar
														i=1//repetir laço de repetiçao para comando
														
														}
														se(comando==3){												
														i=fechar//fechar o jogo
															
														}
														se(comando!=1 e comando!=2 e comando!=3){
														i=1//repetir laço de repetiçao para comando 
														escreva("\nOpção inválida, digite novamente\n")//imprimir 'digite uma opçao valida'
													
														}

														//------------------ caso caia na casa 15
														se(placarEscolhePrimeiro==15 e comando!=2 e achei==1){

														escreva("\nCASA 15: player0",escolhePrimeiro," volte 2 casas ou cante um trecho de uma música")
														escreva("\n0 - Voltar 2 casas\n1 - Cantar trecho de uma música\n")
														leia(comando2)
			
															se(comando2==0){
															placarEscolhePrimeiro=placarEscolhePrimeiro-2//voltar 2 casas
															i=0//e passar para o proximo jogador
																
															}
															se(comando2==1){										
															escreva("\nCante o trecho de uma música\n")//cantar trecho de uma musica
															i=0//e passar para o proximo jogador
														
															
															}																
															se(comando==2){
															escreva("\nPLACAR:\nPlayer0", escolhePrimeiro, ":", placarEscolhePrimeiro)
															escreva("\nPlayer0", escolheSegundo, ":", placarEscolheSegundo,"\n")
															//mostrar placar
															i=1//repetir laço de repetiçao para comando
															
															}			
															se(comando==3){												
															i=fechar//fechar o jogo
																
															}

														achei=1
												
														}													          												          
													

														//------------encerra casa 15
														
													}

													se(comando2==0 ou comando==1){ // caso troque de jogador
														se(comando!=2){ // nao trocar se querer querer mostra placar 
														novoPlacar1=placarEscolhePrimeiro
														placarEscolhePrimeiro=placarEscolheSegundo
														placarEscolheSegundo=novoPlacar1
			
														novoEscolhePrimeiro=escolhePrimeiro
														escolhePrimeiro=escolheSegundo
														escolheSegundo=novoEscolhePrimeiro
														} 
													}
												}
												
													
												
													
													
											}enquanto(i!=fechar e i!=0 e comando!=3)
											
										}
																																			
									}	
										
								i=-11
								j=0
									}
			
							}senao{
									i=-1
							}			
							}
						}

				}a=0
			}senao{
				se(iniciar !=3 e iniciar!=2){
				escreva("Opção inválida, digite novamente.\n") // repetição para começo do jogo
				a=1	
				}
			}		 

		}
			escreva("\nPLACAR:\nPlayer0", escolhePrimeiro, ":", placarEscolhePrimeiro)
			escreva("\nPlayer0", escolheSegundo, ":", placarEscolheSegundo,"\n")
			escreva("\n\nJogo finalizado")
	}
	
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11309; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {vet, 10, 10, 3}-{vet2, 10, 18, 4};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */