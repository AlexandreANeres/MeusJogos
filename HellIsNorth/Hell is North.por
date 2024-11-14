programa
{
	inclua biblioteca Graficos --> g
	inclua biblioteca Util --> u
	inclua biblioteca Matematica --> mat
	inclua biblioteca Teclado --> tec
	inclua biblioteca Sons --> s
	inclua biblioteca Texto --> txt
	inclua biblioteca Arquivos --> exe
	inclua biblioteca Calendario --> date
	inclua biblioteca Mouse
	inclua biblioteca Objetos --> obj
	inclua biblioteca Tipos --> type

	//bibliotecas que permitem o cenário mais permissivo para a criação de um jogo frame-frame (Ex: Cuphead)

	const inteiro ScreenLenght = 1920
	const inteiro ScreenHigh = 1080 //Tamanho da Janela

	inteiro vetor_quadros[500]
	cadeia vetorTexto[237]
	cadeia espaco = "\n"

	inteiro Frame
	inteiro FrameX

	inteiro vida = 1 //se vida = 0 | O personagem morreu
	inteiro energia = 10 //se energia = 0 | Ações e ataques são inrealizáveis
	
	const inteiro ColorBackGround = 0x000000
	const inteiro ColorText = 0xf3f3f3 //Cores Jogo

     const inteiro IntervaloTexto = 150 // Intervalo de tempo entre as letras (em milissegundos)

	//variáveis universais
	
	funcao inicio()
	{

		cadeia local_logo_png = "Hell Is North Logo.png"
		inteiro local_logo = g.carregar_imagem(local_logo_png)
		
			g.iniciar_modo_grafico(verdadeiro)
         	 	g.definir_dimensoes_janela(ScreenLenght, ScreenHigh)
          	g.definir_titulo_janela("Hell is North")
          	
          	g.definir_icone_janela(local_logo)
          	g.definir_cor(ColorBackGround)
          	
          	g.limpar()
          	
          	g.entrar_modo_tela_cheia()
          	g.liberar_imagem(local_logo)
          	
//COMEÇA O JOGO

			cena_menu() 
			background_transicao()
			cena_beta() 

			background_transicao()

			inteiro Som_Intro = s.carregar_som("Innocent Moon.mp3")
			s.reproduzir_som(Som_Intro, verdadeiro)
					
			rodar_gif_veta()
			
			background_transicao()
			background_transicao()
			background_transicao()

			s.interromper_som(Som_Intro)
			title()

			background_transicao()

			s.liberar_som(Som_Intro)
			
			dialogo()

			background_transicao()
			cena_fim_da_beta()
	}

	funcao inicializar_louco() {
		
		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem
    		inteiro contador = 1

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50
		
		para (inteiro i = 0; i < XCaixaTexto + 480; i = i + 25) {

		inteiro XdoQuadradoInvisivel = XCaixaTexto
		inteiro YdoQuadradoInvisivel = YCaixaTexto
		
		inteiro velocidadeDoQuadradoEmX = 10
		inteiro velocidadeDoQuadradoEmY = 0

		inteiro TamanhoDoQuadradoInvisivel = 0

		inteiro x = XdoQuadradoInvisivel + i
		inteiro y = YImagem + 1

		inteiro xi = 0
		inteiro yi = 0

		inteiro Colisao_caixaX = 950 - i - XCaixaTexto + 478
		inteiro Tamanho_Linha_caixa = AlturaImagem

		inteiro largura = Colisao_caixaX
		inteiro altura = Tamanho_Linha_caixa

		desenhar_retangulo_texto()
		desenhar_retangulo_imagem()
		
		XdoQuadradoInvisivel = XdoQuadradoInvisivel + velocidadeDoQuadradoEmX
          YdoQuadradoInvisivel = YdoQuadradoInvisivel + velocidadeDoQuadradoEmY

          	se(XdoQuadradoInvisivel + i + TamanhoDoQuadradoInvisivel / 2 > XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
           	{
               	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}

            	se (XdoQuadradoInvisivel + i  - TamanhoDoQuadradoInvisivel / 2 < XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
            	{
                	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}
			
			contador++

			se (contador > 28) {
				contador = u.sorteia(1, 28)
			}

			cadeia zeros = "00"

			se (contador > 9) {
				zeros = "0"
			}
			
			cadeia local = "Louco Battle (" + contador + ").png"
			inteiro X = g.carregar_imagem(local)
			
			g.desenhar_porcao_imagem(XdoQuadradoInvisivel, YImagem + 1, 0, 0, 950, Tamanho_Linha_caixa - 2, X)

			g.definir_cor(0x000000)

			g.desenhar_retangulo(XdoQuadradoInvisivel + i, YImagem + 1, Colisao_caixaX, Tamanho_Linha_caixa - 2, falso, verdadeiro)
            	
            	g.renderizar()
            	g.liberar_imagem(X)

            	u.aguarde(50)
		
		}
	}

	funcao o_louco() {

		inteiro Som_Error = s.carregar_som("Error.mp3")
		s.reproduzir_som(Som_Error, verdadeiro)
		inteiro Som_Devil_Scream = s.carregar_som("Devil Scream.mp3")

		background_transicao()
		//nevoa()
		background_transicao()
		background_transicao()
		
		s.interromper_som(Som_Error)
		s.liberar_som(Som_Error)

		inteiro Som_Louco = s.carregar_som("Block Mind.mp3")
		s.reproduzir_som(Som_Louco, verdadeiro)
		s.definir_volume_reproducao(Som_Louco, 50)

		inteiro Som_50s = s.carregar_som("50's.mp3")
		
		inicializar_caixas()
		s.definir_volume_reproducao(Som_Louco, 75)
		s.definir_posicao_atual_musica(Som_Louco, 6000)
		inicializar_louco()
		inteiro Som_Relampago = s.carregar_som("Relâmpago.mp3")
		s.reproduzir_som(Som_Relampago, falso)
		s.definir_volume_reproducao(Som_Relampago, 100)

		background_transicao()
		
		s.reproduzir_som(Som_Devil_Scream, falso)
		s.definir_posicao_atual_musica(Som_Louco, 3700)

		background_transicao()

		s.reproduzir_som(Som_50s, falso)
		
		background_transicao()
		s.interromper_som(Som_Devil_Scream)
		s.definir_posicao_atual_musica(Som_Louco, 6000)
		background_transicao()
		s.definir_posicao_atual_musica(Som_Louco, 6000)
		background_transicao()

		s.interromper_som(Som_Louco)
		s.liberar_som(Som_Louco)
		
		olhos()

		s.interromper_som(Som_50s)
		s.liberar_som(Som_50s)

		relampago()
		s.reproduzir_som(Som_Devil_Scream, falso)
		s.definir_posicao_atual_musica(Som_Devil_Scream, 2800)
		background_transicao()
		intro_pos_relampago()
		relampago()

		intro_batalha()
		
		inteiro Som_Batalha = s.carregar_som("Silent Heaven.mp3")
		s.reproduzir_som(Som_Batalha, verdadeiro)
		batalha_louco()
		background_transicao()
		s.interromper_som(Som_Batalha)
		s.liberar_som(Som_Batalha)
		
	}

	funcao batalha_louco() {
		inteiro imagem_original, imagem_intermediaria, imagem_transformada
		inteiro fundo_transparente = g.criar_cor(255, 0, 255)
		
		para (inteiro i = 1; i < 29; i++)
			{

				inteiro numero = i
				cadeia local = "Layout Batalha (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}

			para (inteiro i = 20; i < 41; i++)
			{

				inteiro numero = i
				cadeia local = "Layout da Batalha (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}

			/* cadeia escolhas = processa_clique()

			se (escolhas == "Inventário") {
				g.limpar()
				desenhar_inventario()
			}

			se (escolhas == "Atacar") {
				g.limpar()
				desenhar_atacar()
			}

			se (escolhas == "Ações") {
				g.limpar()
				desenhar_acoes()
			}

			se (escolhas == "Fugir") {
			
			}

			se (escolhas == "Defender") {
			
			}
			*/
	}

	funcao intro_batalha() {
		
		inteiro imagem_original, imagem_intermediaria, imagem_transformada
		inteiro fundo_transparente = g.criar_cor(255, 0, 255)
		
		para (inteiro i = 1; i < 89; i++)
			{
			
				inteiro numero = i
				cadeia local = "Começo da Batalha (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}
	}

	funcao intro_pos_relampago() {

		inteiro imagem_original, imagem_intermediaria, imagem_transformada
		inteiro fundo_transparente = g.criar_cor(255, 0, 255)
		
		para (inteiro i = 1; i < 20; i++)
			{
			
				inteiro numero = i
				cadeia local = "Louco Intro Relampago (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso,0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}
	}

	funcao olhos() {
		
		inteiro imagem_original, imagem_intermediaria, imagem_transformada
		inteiro fundo_transparente = g.criar_cor(255, 0, 255)
		
		para (inteiro i = 1; i < 89; i++)
			{
			
				inteiro numero = i
				cadeia local = "Olhos no escuro (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso,0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}
		}

	funcao relampago() {

		inteiro imagem_original, imagem_intermediaria, imagem_transformada
		inteiro fundo_transparente = g.criar_cor(255, 0, 255)

		inteiro Som_Relampago = s.carregar_som("Relâmpago.mp3")
		s.reproduzir_som(Som_Relampago, verdadeiro)
		s.definir_volume_reproducao(Som_Relampago, 100)
		
		para (inteiro i = 1; i <52; i++)
			{
			
				inteiro numero = i
				cadeia local = "Relâmpago (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso,0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}
			
	s.interromper_som(Som_Relampago)
	s.liberar_som(Som_Relampago)
	
	}

	funcao desenhar(cadeia cenario, inteiro frame) {

		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50

		inteiro XdoQuadradoInvisivel = XCaixaTexto
		inteiro YdoQuadradoInvisivel = YCaixaTexto
		
		inteiro velocidadeDoQuadradoEmX = 10
		inteiro velocidadeDoQuadradoEmY = 0

		inteiro TamanhoDoQuadradoInvisivel = 0
		
		XdoQuadradoInvisivel = XdoQuadradoInvisivel + velocidadeDoQuadradoEmX
          YdoQuadradoInvisivel = YdoQuadradoInvisivel + velocidadeDoQuadradoEmY

			se (cenario == "Capela") {

				cadeia zeros = "00"

				se (frame > 9) {
					zeros = "0"
				}
			
				cadeia local = "1026 (1)_" + zeros + frame + ".png"
				inteiro X = g.carregar_imagem(local)
			
				g.desenhar_porcao_imagem(XdoQuadradoInvisivel, YImagem + 1, 0, 0, 950, 538, X)
			
            		g.liberar_imagem(X)
			}

			se (cenario == "Confessionario") {
		
				cadeia zeros = "00"


				se (frame > 9) {
					zeros = "0"
				}
			
				cadeia local = "Confessionario (" + frame + ").png"
				inteiro X = g.carregar_imagem(local)
			
				g.desenhar_porcao_imagem(XdoQuadradoInvisivel, YImagem + 1, 0, 0, 950, 538, X)
			
            		g.liberar_imagem(X)
			}

			se (cenario == "Maria") {
				
				cadeia zeros = "00"


				se (frame > 9) {
					zeros = "0"
				}
			
				cadeia local = "Maria (" + frame + ").png"
				inteiro X = g.carregar_imagem(local)
			
				g.desenhar_porcao_imagem(XdoQuadradoInvisivel, YImagem + 1, 0, 0, 950, 538, X)
			
            		g.liberar_imagem(X)
			}

			se (cenario == "Louco") {

				se (frame > 25 ) {
					frame = u.sorteia(1, 25)
				}
				cadeia local = "Louco Battle (" + frame + ").png"
				inteiro X = g.carregar_imagem(local)
			
				g.desenhar_porcao_imagem(XdoQuadradoInvisivel, YImagem + 1, 0, 0, 950, 538, X)
			
            		g.liberar_imagem(X)
			}

			se (cenario == "Louco Batalha") {
				
				se (frame > 28 ) {
					frame = u.sorteia(1, 28)
				}
				cadeia local = "Louco Battle (" + frame + ").png"
				inteiro X = g.carregar_imagem(local)
			
				g.desenhar_porcao_imagem(XdoQuadradoInvisivel - 30, YImagem - 25, 0, 0, 1000, 580, X)
			
            		g.liberar_imagem(X)
			}

			se (cenario == "") {
				
			}

            	u.aguarde(50)
		}

//COMEÇO DIÁLOGO

	funcao dialogo()
	{

			inteiro Som_Respiracao = s.carregar_som("Som Respiração.mp3")
			s.reproduzir_som(Som_Respiracao, verdadeiro)
			s.definir_volume_reproducao(Som_Respiracao, 100)

			inteiro Som_ChuvaForte = s.carregar_som("Chuva Forte.mp3")
			s.reproduzir_som(Som_ChuvaForte, verdadeiro)
			s.definir_volume_reproducao(Som_ChuvaForte, 75)
			
			inicializar_caixas()

			inteiro Som_Capela = s.carregar_som("White Noiz.mp3")
			s.reproduzir_som(Som_Capela, verdadeiro)
			s.definir_volume_reproducao(Som_Capela, 50)

			s.definir_volume_reproducao(Som_ChuvaForte, 85)

			inteiro Som_ChuvaLeve = s.carregar_som("Chuva leve e trovoadas.mp3")
			s.reproduzir_som(Som_ChuvaLeve, verdadeiro)
			s.definir_volume_reproducao(Som_ChuvaLeve, 100)

			inteiro Som_Ruido = s.carregar_som("Ruido.mp3")
			s.reproduzir_som(Som_Ruido, verdadeiro)
			s.definir_volume_reproducao(Som_Ruido, 75)
			
			inicializar_capela()
			
			cadeia texto_linha_1
			cadeia texto_linha_2
			cadeia texto_linha_3
			
			cadeia cenario

			cenario = "Capela"
			
			texto_linha_1 = "Um trovão cai de fundo, a chuva é tão forte e inconcebível que suas pupilas..."
			texto_linha_2 = "estremecem. Sente um calafrio subindo pela coluna."
	
			escrever_1("Você: Pai... Perdoe-me, pois eu pequei.", cenario)
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "- O que te traz aqui meu filho?  - O padre era um homem velho, robusto, "
			texto_linha_2 = "carregava consigo uma barba grande e esbelta, significante de muitos "
			texto_linha_3 = "anos de vida e sabedoria."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			escrever_1("este, porém, cheirava a cigarro, todos tem vícios...", cenario)

			cenario = "Confessionario"
			s.definir_volume_reproducao(Som_ChuvaForte, 45)
			s.definir_volume_reproducao(Som_ChuvaLeve, 45)
			s.definir_volume_reproducao(Som_Ruido, 100)

			texto_linha_1 = "Você: Pode te parecer tosco ou absurdo, pode até me chamar de louco,"
			texto_linha_2 = "acordei no cais sob uma noite estrelada estonteante."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Você:  E não me lembro de sequer uma instância do que me ocorreu"
			texto_linha_2 = "e de como me havia parado naquele lugar, largado ao chão, ao pó e"
			texto_linha_3 = "as traças. Ah.. Sim, não posso me esquecer desse destacável detalhe."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			escrever_1("Você: Não pude deixar de reparar lágrimas escorrendo de meus olhos. ", cenario)
			
			texto_linha_1 = "Você: De lá... Lembrei de algo... Mas não de algo como um objeto, uma garrafa "
			texto_linha_2 = "de bebida, um compromisso ou uma amante, digo algo como uma "
			texto_linha_3 = "felicidade, uma estranheza, uma esquisitice. "

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "Você: Senti de fato, algo horrível, tão horrível que não me coube nem a cabeça"
			texto_linha_2 = "para guardá-la."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "- Como podes admitir pecado sem ter lembrança de tê-lo praticado?"
			texto_linha_2 = "O que acha que fizeste?"

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Você: Não sei, talvez matado um homem, comido da maça proibida, desfrutado "
			texto_linha_2 = "da caixa de pandora, mas este algo foi tão assombroso, tão... horrendo e "
			texto_linha_3 = "desnatural que não sou capaz de coloca-lo em palavras,"

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "Você: sinto como se Lúcifer tocasse em meus ombros, sussurrasse em..."
			texto_linha_2 = "Em meus ouvidos e dançasse envolta de mim."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			escrever_1("- Só disso que lembra? ", cenario)

			texto_linha_1 = "Você: Sinto como se não só lembrasse, como se estivesse preso "
			texto_linha_2 = "naquela circunstância... Sinto que pequei padre, e quero me confessar. "

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			escrever_1("Você: Por todos os pecados que realizei e a todas as vezes futuras que pecarei.", cenario)

			texto_linha_1 = "O padre, com a voz rouca levanta um grave estridente, que rompe as"
			texto_linha_2 = "pequenas portinholas do confessionário, ecoando por toda a capela."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			cenario = "Capela"
			s.definir_volume_reproducao(Som_ChuvaForte, 95)
			s.definir_volume_reproducao(Som_ChuvaLeve, 85)
			s.definir_volume_reproducao(Som_Ruido, 100)

			texto_linha_1 = "A capela não era como as outras de definição, essa capela, "
			texto_linha_2 = "especificadamente, tinha seu encanto, não poderia ser destacada como "
			texto_linha_3 = "templo, poderia, contudo, como imensa."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "A chuva trazia ar de elegância para o local, eram escutáveis as gotas escorrendo "
			texto_linha_2 = "de parede a parede, batendo contra as vidraças de cristo "
			texto_linha_3 = "e as torres do pai todo poderoso, "

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "de fora, as pequenas luminárias faiscavam e piscavam entre si,"
			texto_linha_2 = "era inacreditável que ainda estavam fixas no chão, "
			texto_linha_3 = "o vento levava tudo que tocava. "

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "Cada sopro, cada suspiro, cada sussurro e oração silenciosa"
			texto_linha_2 = "podia ser escutada de qualquer um dos cantos,"

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "como se a capela fosse uma grande elipse e cada quina do local "
			texto_linha_2 = "fosse um dos centros da elipse em si."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Quanta harmonia, ó deus, ó pai que vos protegeis, peço que retifique "
			texto_linha_2 = "os pecadores da terra com as LÁGRIMAS DO SENHOR, lavrando-os,"
			texto_linha_3 = "atando-os a sua moral engrandecedora, protetora... Suprema."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
			
			cenario = "Confessionario"
			s.definir_volume_reproducao(Som_ChuvaForte, 45)
			s.definir_volume_reproducao(Som_ChuvaLeve, 45)
			s.definir_volume_reproducao(Som_Ruido, 100)

			texto_linha_1 = "- Pai nosso que estais no céu, santificado seja o vosso nome, venha nosso "
			texto_linha_2 = "vosso reino, seja feita a vossa vontade, assim na terra como no céu, o pão "
			texto_linha_3 = "nosso de cada dia nos dai hoje,"

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "- perdoai as nossas ofensas e pecados, assim como nós perdoamos"
			texto_linha_2 = "aos que vos ofenderam e aos que pecaram contra nós,"
			texto_linha_3 = "e não nos permita cair em tentação, livrai-vos do mal, amém."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "O vozeirão do religioso entoa envolta de tudo e todos,"
			texto_linha_2 = "poucos eram os que estavam presentes no local..."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Era uma noite tempestuosa, dia de tormenta era dia de medo, os poucos que"
			texto_linha_2 = "vinham a capela eram os assustados ao ponto de que, como cordeiros, "
			texto_linha_3 = "dependiam de seu pastor (pelo menos em crença) para sobreviver a tempestade."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "Você: Eu tenho medo padre – Medo do futuro, e por ventura do passado, "
			texto_linha_2 = "honestamente, tanto do passado quanto do futuro, talvez estes estejam "
			texto_linha_3 = "até equiparados."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "ESCOLHA SABIAMENTE..."

			escrever_1(texto_linha_1, "")

			texto_linha_1 = "DADO ESTE MOMENTO DO JOGO, TERÁS DE ESCOLHER O QUE FARÁ OU"
			texto_linha_2 = "FALARÁ, SUAS DECISÕES AFETAM O CAMINHO QUE O JOGO"
			texto_linha_3 = "VAI TOMAR, TOME CUIDADO. SUAS AÇÕES TERÃO CONSEQUÊNCIAS."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, "")

			texto_linha_1 = "PARA CONFIRMAR A ESCOLHA, APERTE O BOTÃO QUE"
			texto_linha_2 = "SE REFERE A ESCOLHA DUAS VEZES RAPIDAMENTE."

			escreverXX(texto_linha_1, texto_linha_2, "")

			texto_linha_1 = "1 - É crível que estejam equiparados."
			texto_linha_2 = "2 - Antes o futuro do que o passado."
			texto_linha_3 = "3 - Repetir diálogo"

			escolhas(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			se (tec.ler_tecla() == tec.TECLA_1 ou tec.ler_tecla() == tec.TECLA_1_NUM) {
				texto_linha_1 = "É crível que estejam equiparados."

				escrever_1(texto_linha_1, cenario)
			}

			senao se (tec.ler_tecla() == tec.TECLA_2 ou tec.ler_tecla() == tec.TECLA_2_NUM) {
				texto_linha_1 = "Antes o futuro do que o passado."

				escrever_1(texto_linha_1, cenario)
			}

			senao se (tec.ler_tecla() == tec.TECLA_3 ou tec.ler_tecla() == tec.TECLA_3_NUM) {
				
				texto_linha_1 = "Você: Eu tenho medo padre – Medo do futuro, e por ventura do passado, "
				texto_linha_2 = "honestamente, tanto do passado quanto do futuro, talvez estes estejam "
				texto_linha_3 = "até equiparados."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
				
				texto_linha_1 = "Escolha Sabiamente:"
				texto_linha_2 = "1 - É crível que estejam equiparados."
				texto_linha_3 = "2 - Antes o futuro do que o passado."

				escolhas(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				se (tec.ler_tecla() == tec.TECLA_1 ou tec.ler_tecla() == tec.TECLA_1_NUM) {
					texto_linha_1 = "É crível que estejam equiparados."

					escrever_1(texto_linha_1, cenario)
				}

				senao se (tec.ler_tecla() == tec.TECLA_2 ou tec.ler_tecla() == tec.TECLA_2_NUM) {
					texto_linha_1 = "Antes o futuro do que o passado."

					escrever_1(texto_linha_1, cenario)
				}
			}

			senao {

				texto_linha_1 = "Essa opção é inválida."
				
				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "Você: Eu tenho medo padre – Medo do futuro, e por ventura do passado, "
				texto_linha_2 = "honestamente, tanto do passado quanto do futuro, talvez estes estejam "
				texto_linha_3 = "até equiparados."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
				
				texto_linha_1 = "Escolha Sabiamente:"
				texto_linha_2 = "1 - É crível que estejam equiparados."
				texto_linha_3 = "2 - Antes o futuro do que o passado."

				escolhas(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				se (tec.ler_tecla() == tec.TECLA_1 ou tec.ler_tecla() == tec.TECLA_1_NUM) {
					texto_linha_1 = "É crível que estejam equiparados."

					escrever_1(texto_linha_1, cenario)
				}

				senao se (tec.ler_tecla() == tec.TECLA_2 ou tec.ler_tecla() == tec.TECLA_2_NUM) {
					texto_linha_1 = "Antes o futuro do que o passado."

					escrever_1(texto_linha_1, cenario)
				}
			}

			texto_linha_1 = "- Deve ter calma e paciência, de todo mal o senhor te isentará."
			texto_linha_2 = "E então o velho se aproxima, colocando a barba contra as rasuras do"
			texto_linha_3 = "tecido do confessionário e a janela por onde se confessa."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "Esta atravessa de maneira certamente desagradável e deselegante"
			texto_linha_2 = "os pequenos buracos pelos quais se passava o som. "

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "- Ainda que andasse pelo vale da sombra da morte, não temeria mal"
			texto_linha_2 = "algum, porque tu estás comigo; a tua vara e o teu cajado me consolam."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Mais uma vez, se escuta um dos trovões romper o céu. Era meia noite."

			escrever_1(texto_linha_1, cenario)

			relampago()
			s.interromper_som(Som_Capela)
			s.liberar_som(Som_Capela)
			s.definir_volume_reproducao(Som_ChuvaForte, 25)
			s.definir_volume_reproducao(Som_ChuvaLeve, 25)
			s.definir_volume_reproducao(Som_Ruido, 80)
			background_transicao()

			inicializar_caixas()
			inteiro Som_Maria = s.carregar_som("The Day Of Night.mp3")
			s.reproduzir_som(Som_Maria, verdadeiro)
			s.definir_volume_reproducao(Som_Maria, 100)
			inicializar_maria()

			cenario = "Maria"
			
			texto_linha_1 = "A tempestade tornava a ficar cada vez mais forte,"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "os dois agora se encontravam sozinhos, sentados"
			texto_linha_2 = "em um dos bancos da capela,"

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "De frente para uma estatueta pendurada por pilastras de"
			texto_linha_2 = "Nossa Senhora Aparecida."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Maria encarava-os com pena, como se chorasse, não lágrimas, como se"
			texto_linha_2 = "chorasse o suco da vida."

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Era deplorável."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "- Sabes que sou um homem velho, tenho memória de longa data e"
			texto_linha_2 = "apesar das rugas e verrugas por entre os membros, sou um homem de"
			texto_linha_3 = "muita experiência, conservador de modos arcaicos, simples,"

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "- Devoto a minha fé, dedicado à minha família. "

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "- Já vi de tudo, hoje fui surpreendido por 2 milagres, um homem que"
			texto_linha_2 = "admite pecado sem ter sequer um fragmento que demonstre que este o"
			texto_linha_3 = "cometeu fora um mal presságio, "

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "- E uma tormenta que seria capaz de levar 6 cavalos e uma carroça de"
			texto_linha_2 = "toneladas de peso, sinceramente, só deus sabe como essa capela"
			texto_linha_3 = "continua em pé."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "O padre alisa casualmente, em tom de reflexão, a sua longa e velha barba."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "1 - Devoto? Como consegue se devotar a isso?"
			texto_linha_2 = "2 - Como as pessoas podem seguir um texto tão... Cegamente?"
			texto_linha_3 = "3 - Já pecou padre?"

			escolhas(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			se (tec.ler_tecla() == tec.TECLA_1 ou tec.ler_tecla() == tec.TECLA_1_NUM) {
				texto_linha_1 = "Você: Devoto? – Como consegues, padre, ser devoto a alguém que nunca se"
				texto_linha_2 = "provou a ti, nunca apareceu em frente a tua pessoa e lhe aconselhou de "
				texto_linha_3 = "fato, e se só fores um louco com o consolo de que está orando?"

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- É aí que erras, creio que esteja mal interpretando devoção,"

				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "- Quando jesus pede que voltem a devoção a imagem dele, não é sua"
				texto_linha_2 = "aparência ou a autoridade que ele representa, mas sim o significado"
				texto_linha_3 = "por trás de suas mensagens."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
			}

			senao se (tec.ler_tecla() == tec.TECLA_2 ou tec.ler_tecla() == tec.TECLA_2_NUM) {
				texto_linha_1 = "Você: Esta é uma das poucas vezes que compareci a um ambiente religioso,"
				texto_linha_2 = "sou destacávelmente distante da figura e da imagem de Deus, tenho"
				texto_linha_3 = "mais dúvidas do que certezas..."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "Você: e colocaria com facilidade que os que seguem cegamente a bíblia"
				texto_linha_2 = "são tolos."

				escreverXX(texto_linha_1, texto_linha_2, cenario)

				texto_linha_1 = "Você: Amar o próximo como ama a ti... E se eu for um suicida... "
				texto_linha_2 = "Ou simplesmente lúcido a ponto de não me dar aos outros como se"
				texto_linha_3 = "fosse saco de batatas qualquer..."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- Jesus não destaca um tabu para idiotas agirem como cordeiros, jesus"
				texto_linha_2 = "destaca a necessidade do gesto de gentileza na sociedade... Não faltam"
				texto_linha_3 = "pessoas nas ruas que vivem apontadas para o próprio umbigo. "

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
				
				texto_linha_1 = "Aquele que vira a cabeça para o alto e supre a carência dos demais"
				texto_linha_2 = "realiza uma das verdadeiras vontades do amor de Jesus. Servir. É servindo"
				texto_linha_3 = "ao próximo, que materializamos o conceito tão abstrato que é o amor."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "É lindo... "

				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "Muito lindo mesmo... "

				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "Está mais do que certo em carregar consigo dúvidas, mas considero"
				texto_linha_2 = "importante que pare por um momento e reflita comigo, preferes acreditar"
				texto_linha_3 = "numa realidade cruel e fria como a apresentada até então...?"

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- Ou preferes acreditar que após apodrecermos sob o solo nos encontramos"
				texto_linha_2 = "com um velho amigo na cidade da luz? Junto com todos aqueles que nos são"
				texto_linha_3 = "importantes."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- Que seja um teste, que seja um purgatório, que seja destino... Não me"
				texto_linha_2 = "colocaria a sofrer por décadas sabendo que no fim não servirá de nada... "
				texto_linha_3 = "Tolos são aqueles que sofrem por um futuro incerto."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
				
			}

			senao se (tec.ler_tecla() == tec.TECLA_3 ou tec.ler_tecla() == tec.TECLA_3_NUM) {
				
				texto_linha_1 = "Você: Já pecou padre?"

				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "- Já pequei."

				escrever_1(texto_linha_1, cenario)
				
			}

			senao {

				texto_linha_1 = "Essa opção é inválida."
				
				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "1 - Devoto? Como consegue se devotar a isso?"
				texto_linha_2 = "2 - Como as pessoas podem seguir um texto tão... Cegamente?"
				texto_linha_3 = "3 - Já pecou padre?"

			escolhas(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			se (tec.ler_tecla() == tec.TECLA_1 ou tec.ler_tecla() == tec.TECLA_1_NUM) {
				texto_linha_1 = "Você: Devoto? – Como consegues, padre, ser devoto a alguém que nunca se"
				texto_linha_2 = "provou a ti, nunca apareceu em frente a tua pessoa e lhe aconselhou de "
				texto_linha_3 = "fato, e se só fores um louco com o consolo de que está orando?"

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- É aí que erras, creio que esteja mal interpretando devoção, com devoção,"
				texto_linha_2 = "Deus não nos solicitou que dedicássemos a vida a sua imagem, mas solicitou"
				texto_linha_3 = "que vivêssemos a vida seguros debaixo de sua força,"

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- Seguindo seus ensinamentos, afastando-se do pecado... "

				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "- Quando jesus pede que voltem a devoção a imagem dele, não é sua aparência"
				texto_linha_2 = "ou a autoridade que ele representa, mas sim o significado por trás de"
				texto_linha_3 = "suas mensagens."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
			}

			senao se (tec.ler_tecla() == tec.TECLA_2 ou tec.ler_tecla() == tec.TECLA_2_NUM) {
				texto_linha_1 = "Você: Esta é uma das poucas vezes que compareci a um ambiente religioso,"
				texto_linha_2 = "sou destacávelmente distante da figura e da imagem de Deus, tenho"
				texto_linha_3 = "mais dúvidas do que certezas..."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "Você: e colocaria com facilidade que os que seguem cegamente a bíblia"
				texto_linha_2 = "são tolos."

				escreverXX(texto_linha_1, texto_linha_2, cenario)

				texto_linha_1 = "Você: Amar o próximo como ama a ti... E se eu for um suicida... "
				texto_linha_2 = "Ou simplesmente lúcido a ponto de não me dar aos outros como se"
				texto_linha_3 = "fosse saco de batatas qualquer..."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- Jesus não destaca um tabu para idiotas agirem como cordeiros, jesus"
				texto_linha_2 = "destaca a necessidade do gesto de gentileza na sociedade... Não faltam"
				texto_linha_3 = "pessoas nas ruas que vivem apontadas para o próprio umbigo. "

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
				
				texto_linha_1 = "- Aquele que vira a cabeça para o alto e supre a carência dos demais"
				texto_linha_2 = "realiza uma das verdadeiras vontades do amor de Jesus. Servir. É servindo"
				texto_linha_3 = "ao próximo, que materializamos o conceito tão abstrato que é o amor."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- É lindo... "

				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "- Muito lindo mesmo... "

				escrever_1(texto_linha_1, cenario)

				texto_linha_1 = "- Está mais do que certo em carregar consigo dúvidas, mas considero"
				texto_linha_2 = "importante que pare por um momento e reflita comigo, preferes acreditar"
				texto_linha_3 = "numa realidade cruel e fria como a apresentada até então...?"

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- Ou preferes acreditar que após apodrecermos sob o solo nos encontramos"
				texto_linha_2 = "com um velho amigo na cidade da luz? Junto com todos aqueles que nos são"
				texto_linha_3 = "importantes."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

				texto_linha_1 = "- Que seja um teste, que seja um purgatório, que seja destino... Não me"
				texto_linha_2 = "colocaria a sofrer por décadas sabendo que no fim não servirá de nada... "
				texto_linha_3 = "Tolos são aqueles que sofrem por um futuro incerto."

				escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)
				
				}
			}

			texto_linha_1 = "(A Porta da capela se abre)"

			escrever_1(texto_linha_1, cenario)

//Chega o louco

			inteiro Som_Relampago = s.carregar_som("Relâmpago.mp3")

			s.definir_volume_reproducao(Som_Maria, 75)
			s.reproduzir_som(Som_Relampago, falso)
			s.definir_volume_reproducao(Som_Relampago, 90)

			cenario = ""

			texto_linha_1 = "Por toda a capela se espalha o ar frio e úmido, o vento empurra a água de " 
			texto_linha_2 = "fora com orgulho de sua própria força, molhando todos os primeiros bancos"
			texto_linha_3 = "da construção."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "O som da porta se abrindo é notável, como se a tranca fosse um rolo" 
			texto_linha_2 = "caindo contra pedregulhos, não demorou muito para que o vento empurrasse"
			texto_linha_3 = "as grandes portas contra a parede e fizesse um estouro, a capela estremece."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			s.definir_volume_reproducao(Som_Maria, 45)

			texto_linha_1 = "Pelo chão se escuta o arrastar de correntes velhas e molhadas, as gotas " 
			texto_linha_2 = "caindo do tecido de algum pano, é possível escutar também um murmúrio"
			texto_linha_3 = "como se alguém estivesse, aos sussurros, cantarolando."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "Ao virar para trás, o protagonista se vê paralisado."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Olhos amarelos brilhavam no escuro, encarando a alma do nosso personagem." 
			texto_linha_2 = "Por mais difícil que fosse enxergar naquele breu, era previsível que"
			texto_linha_3 = "o que quer que estivesse ali diante deles, era diferente…"

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			s.interromper_som(Som_Maria)
			relampago()
			inicializar_caixas()

			texto_linha_1 = "No topo da cabeça, por onde a luz entrava, jazia uma coroa de estacas, o " 
			texto_linha_2 = "sujeito carregava uma capa negra que cobria todo o corpo."
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Quanta estranheza…"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Quanta vulgaridade…"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Um sentimento de mal presságio sobe a coluna do nosso protagonista."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Uma luz nova emerge sobre a cabeça dos personagens, se escuta uma voz" 
			texto_linha_2 = "rouca tentando proferir frases, sem sucesso."
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "- O que fazes na minha capela? Com correntes e ar maligno? Peço que se vá," 
			texto_linha_2 = "este é um lugar sagrado - O padre parecia assustado, estava trêmulo, sua "
			texto_linha_3 = "expressão era de seriedade, mas a bíblia vibrava em sua mão direita."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "A coisa abria aos poucos o seu manto… Estendia suas longas mãos afastando" 
			texto_linha_2 = "as extremidades da lona que o cobria, seus nervos se torciam e a pele"
			texto_linha_3 = "junto as unhas necrosavam, cobertas de pequenos vermes."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "O sujeito revelava um sorriso, mas não um sorriso como qualquer outro, um" 
			texto_linha_2 = "sorriso maligno, estupefante, embasbacante… Tinha algo errado com aquilo,"
			texto_linha_3 = "era instintivo, o medo disparava com motivo, a coisa mentia."

			escreverXXX(texto_linha_1, texto_linha_2, texto_linha_3, cenario)

			texto_linha_1 = "A coisa parecia homem, ora parecia rapaz, ora bêbado… Impressões essas" 
			texto_linha_2 = "pouco assertivas…, o padre derruba a palavra do pai."
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "O corpo da coisa se estica, se espreme, aproximando-se dos protegidos, uma" 
			texto_linha_2 = "risada atordoante ecoa pela capela."
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "………. Um sentimento de mal presságio……. domina você…."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "As pupilas do padre vibram, o corpo do padre se curva, começa a ter..." 
			texto_linha_2 = "Espamos."
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "….. Um arrepio sobe pela coluna, passando de polegada por polegada até a" 
			texto_linha_2 = "nuca…"
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "O padre recolhe uma pequena lâmina, uma faca de cozinha barata, em " 
			texto_linha_2 = "desespero."
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "………….. Medo"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Ó pai que vos protegeis…….. Eu sinto medo…."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = ". . "

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = ". . ."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "- BASTA, SAIA DA MINHA CAPELA LOUCO - O padre berra," 
			texto_linha_2 = "mas a coisa continuava a se abrir, horripilantemente."
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "- Se não saíres, tirarei-te a força."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "A coisa para e estende a mão levemente, mantendo o cotovelo flexionado."
			texto_linha_2 = ""

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			relampago()
			inicializar_caixas()

			texto_linha_1 = "…. A tempestade se intensifica…"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "O padre se aproxima rapidamente."

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Seus pés… Seus pés…. Você não consegue dar um passo. UM PASSO" 
			texto_linha_2 = "SEQUER."
			
			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "De longe, você acompanha a coisa despedaçar o padre violentamente."
			texto_linha_2 = ""

			escreverXX(texto_linha_1, texto_linha_2, cenario)

			texto_linha_1 = "Agora…"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Os olhos…"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Os olhos te encaram…"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "O que diabos é isso?"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Essa sensação…"

			escrever_1(texto_linha_1, cenario)

			texto_linha_1 = "Você sente, SENTE…. Um sentimento de mal presságio devasta a capela."

			escrever_1(texto_linha_1, cenario)

			s.interromper_som(Som_Respiracao)
			s.interromper_som(Som_ChuvaForte)
			s.interromper_som(Som_ChuvaLeve)
			s.interromper_som(Som_Relampago)
			s.interromper_som(Som_Maria)
			s.interromper_som(Som_Ruido)
			

			o_louco()
			
	}

	funcao nevoa() {
		
		inteiro imagem_original, imagem_intermediaria, imagem_transformada
		inteiro fundo_transparente = g.criar_cor(255, 0, 255)
		
		para (inteiro i = 1; i < 52; i++)
			{
			
				inteiro numero = i
				cadeia local = "Névoa Transição (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}
	}
	

	funcao desenhar_botoes(cadeia cenario){
		
		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem
    		
    		Frame = 0

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 1920
    			AlturaImagem = 1080
    			
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 540
    			
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50
		
		para (inteiro i = 0; i < XCaixaTexto + 150; i = i + 25) {

//SEGURAR RETÂNGULOS

		desenhar_retangulo_texto()
		desenhar_retangulo_imagem()

			inteiro retorno = 0
			
//SUBTRAI FRAMES			

			se (Frame > 38) {
				Frame--
				retorno = 1

				se (Frame == 0) {
					retorno = 0
				}

				se (retorno == 1) {
					Frame--
				}
			}
			
//SOMA FRAMES

			se (retorno == 0) {
			
				se (Frame < 40) {
					Frame++
				}
			}

//RENDERIZAR

		desenhar(cenario, Frame)
/*
		inteiro mouse_x = Mouse.posicao_x()
		inteiro mouse_y = Mouse.posicao_y()

//DELIMITAÇÃO INVENTÁRIO

	inteiro inventario_x_min = 1070
	inteiro inventario_x_max = 1250

	inteiro inventario_y_min = 915
	inteiro inventario_y_max = 985

//DELIMITAÇÃO FUGIR

	inteiro fugir_x_min = 1300
	inteiro fugir_x_max = 1480

	inteiro fugir_y_min = 915
	inteiro fugir_y_max = 985
	
//DELIMITAÇÃO AÇÕES

	inteiro acoes_x_min = 920
	inteiro acoes_x_max = 1100

	inteiro acoes_y_min = 915
	inteiro acoes_y_max = 985
	
//DELIMITAÇÃO ATACAR

	inteiro atacar_x_min = 530
	inteiro atacar_x_max = 710

	inteiro atacar_y_min = 915
	inteiro atacar_y_max = 985
	
//DELIMITAÇÃO DEFENDER

	inteiro defender_x_min = 705
	inteiro defender_x_max = 885

	inteiro defender_y_min = 915
	inteiro defender_y_max = 985	
*/

		g.definir_fonte_texto("Ink Free")
		g.definir_tamanho_texto(34)

		g.definir_cor(ColorText)
		g.desenhar_retangulo(XCaixaTexto + 10, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
		g.desenhar_texto(XCaixaTexto + 50, YCaixaTexto - 215, "Atacar")
		g.desenhar_retangulo(XCaixaTexto + 200, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
		g.desenhar_texto(XCaixaTexto + 225, YCaixaTexto - 215, "Defender")
		g.desenhar_retangulo(XCaixaTexto + 390, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
		g.desenhar_texto(XCaixaTexto + 440, YCaixaTexto - 215, "Ações")
		g.desenhar_retangulo(XCaixaTexto + 580, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
		g.desenhar_texto(XCaixaTexto + 590, YCaixaTexto - 215, "Inventário")
		g.desenhar_retangulo(XCaixaTexto + 770, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
		g.desenhar_texto(XCaixaTexto + 820, YCaixaTexto - 215, "Fugir")

//VERIFICADOR

/*
		mouse_x = Mouse.posicao_x()
		mouse_y = Mouse.posicao_y()

		//INVENTARIO
		enquanto (mouse_x >= inventario_x_min e mouse_x <= inventario_x_max) {
			enquanto (mouse_y >= inventario_y_min e mouse_y <= inventario_y_max) {
					mouse_x = Mouse.posicao_x()
					mouse_y = Mouse.posicao_y()
					g.definir_cor(0xf8da45)
					g.desenhar_retangulo(XCaixaTexto + 580, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
			}
		}

		//FUGIR
		enquanto (mouse_x >= fugir_x_min e mouse_x <= fugir_x_max) {
			enquanto (mouse_y >= fugir_y_min e mouse_y <= fugir_y_max) {
					mouse_x = Mouse.posicao_x()
					mouse_y = Mouse.posicao_y()
					g.definir_cor(0xf8da45)
					g.desenhar_retangulo(XCaixaTexto + 770, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
			}
		}
		
		//AÇÕES
		enquanto (mouse_x >= acoes_x_min e mouse_x <= acoes_x_max) {
			enquanto (mouse_y >= acoes_y_min e mouse_y <= acoes_y_max) {
					mouse_x = Mouse.posicao_x()
					mouse_y = Mouse.posicao_y()
					g.definir_cor(0xf8da45)
					g.desenhar_retangulo(XCaixaTexto + 390, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
			}
		}
		
		//ATACAR
		enquanto (mouse_x >= atacar_x_min e mouse_x <= atacar_x_max) {
			enquanto (mouse_y >= atacar_y_min e mouse_y <= atacar_y_max) {
					mouse_x = Mouse.posicao_x()
					mouse_y = Mouse.posicao_y()
					g.definir_cor(0xf8da45)
					g.desenhar_retangulo(XCaixaTexto + 10, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
			}
		}
		
		//DEFENDER		
		enquanto (mouse_x >= defender_x_min e mouse_x <= defender_x_max) {
			enquanto (mouse_y >= defender_y_min e mouse_y <= defender_y_max) {
					mouse_x = Mouse.posicao_x()
					mouse_y = Mouse.posicao_y()
					g.definir_cor(0xf8da45)
					g.desenhar_retangulo(XCaixaTexto + 200, YCaixaTexto - 220, 180, 70, ArredondarPontasCaixa, CaixaPreenchida) 
					
			}
		}	
*/
		g.renderizar() // aguarda até que aconteça um clique

		}

		processa_clique()
		cadeia escolhas = processa_clique()

		se (escolhas == "Inventário") {
			g.limpar()
			desenhar_inventario()
		}

		se (escolhas == "Atacar") {
			g.limpar()
			desenhar_atacar()
		}

		se (escolhas == "Ações") {
			g.limpar()
			desenhar_acoes()
		}

		se (escolhas == "Fugir") {
			
		}

		se (escolhas == "Defender") {
			
		}
	}
	
	funcao desenhar_inventario() {
		
	}

	funcao desenhar_acoes() {
		
	}

	funcao desenhar_atacar() {
		
	}

	funcao vazio background_transicao(){
		g.definir_cor(ColorBackGround)
		g.limpar()
		g.renderizar()

		u.aguarde(1500)
	}

	funcao alma() { //se coração partido = morto, senão = vivo 
		
	}

	funcao vontade() { //sem vontade não há força
		
	}

	funcao pertences() { //Exibe a interface inventário do jogo
		
	}

	//funcao memoria() { //você ja veio aqui antes - Salva os dados do jogador em um arquivo txt
	//	
	//}

		funcao cadeia processa_clique()
	{
		Mouse.ler_botao() // aguarda até que aconteça um clique

		inteiro mouse_x = Mouse.posicao_x()
		inteiro mouse_y = Mouse.posicao_y()

//DELIMITAÇÃO INVENTÁRIO

	inteiro inventario_x_min = 1070
	inteiro inventario_x_max = 1250

	inteiro inventario_y_min = 915
	inteiro inventario_y_max = 985

//DELIMITAÇÃO FUGIR

	inteiro fugir_x_min = 1300
	inteiro fugir_x_max = 1480

	inteiro fugir_y_min = 915
	inteiro fugir_y_max = 985
	
//DELIMITAÇÃO AÇÕES

	inteiro acoes_x_min = 920
	inteiro acoes_x_max = 1100

	inteiro acoes_y_min = 915
	inteiro acoes_y_max = 985
	
//DELIMITAÇÃO ATACAR

	inteiro atacar_x_min = 530
	inteiro atacar_x_max = 710

	inteiro atacar_y_min = 915
	inteiro atacar_y_max = 985
	
//DELIMITAÇÃO DEFENDER

	inteiro defender_x_min = 705
	inteiro defender_x_max = 885

	inteiro defender_y_min = 915
	inteiro defender_y_max = 985

//VERIFICADOR

		cadeia escolhas = ""

		//INVENTARIO
		se (mouse_x >= inventario_x_min e mouse_x <= inventario_x_max e mouse_y >= inventario_y_min e mouse_y <= inventario_y_max) {
					escolhas = "Inventário"
		}

		//FUGIR
		se (mouse_x >= fugir_x_min e mouse_x <= fugir_x_max e mouse_y >= fugir_y_min e mouse_y <= fugir_y_max) {
					escolhas = "Fugir"
		}
		
		//AÇÕES
		se (mouse_x >= acoes_x_min e mouse_x <= acoes_x_max e mouse_y >= acoes_y_min e mouse_y <= acoes_y_max) {
					escolhas = "Ações"
		}
		
		//ATACAR
		se (mouse_x >= atacar_x_min e mouse_x <= atacar_x_max e mouse_y >= atacar_y_min e mouse_y <= atacar_y_max) {
					escolhas = "Atacar"
		}
		
		//DEFENDER		
		se (mouse_x >= defender_x_min e mouse_x <= defender_x_max e mouse_y >= defender_y_min e mouse_y <= defender_y_max) {
					escolhas = "Defender"
		}		

		//SEM RETORNO

					escreva(escolhas)
					retorne escolhas

	}

	funcao rodar_gif_veta() //Exibe a logo da VETA
	{
		inteiro imagem_original, imagem_intermediaria, imagem_transformada
		inteiro fundo_transparente = g.criar_cor(255, 0, 255) // ou inteiro fundo_transparente = 0xFF00FF
		
		//inteiro largura_png, altura_png
		
		para (inteiro i = 0; i < 87; i++)
		{

			inteiro numero = i + 1
			cadeia local = "vetapre (" + numero + ").png"

			imagem_original = g.carregar_imagem(local)

			imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

			g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

			imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
			g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

			vetor_quadros[i] = imagem_transformada
			g.desenhar_imagem(0, 0, vetor_quadros[i])
			g.renderizar()
			g.liberar_imagem(vetor_quadros[i])
			
		}
		//largura_png = g.largura_imagem(vetor_quadros[0])
		//altura_png = g.altura_imagem(vetor_quadros[0])
	}
	

	funcao cena_menu() { //Menu do jogo
		
		g.definir_cor(ColorBackGround)
		g.limpar()
		
		g.definir_tamanho_texto(18.0)
		g.definir_cor(ColorText)
		g.definir_estilo_texto(falso, falso, falso)

		g.desenhar_texto(600, 490, "Este jogo trata de conteúdos pesados e não é recomendado para menores de idade.")
		g.desenhar_texto(530, 505, "Essa história aborda temas impróprios para os tais, continue somente se tiver certeza do que está fazendo:")
		g.desenhar_texto(815, 560, "Pressione <ENTER> para continuar")
		
		g.renderizar()

		enquanto (tec.ler_tecla() != tec.TECLA_ENTER) { }
	}

	funcao cena_fim_da_beta() {

		g.definir_cor(ColorBackGround)
		g.limpar()
		
		g.definir_tamanho_texto(18.0)
		g.definir_cor(ColorText)
		g.definir_estilo_texto(falso, falso, falso)

		g.desenhar_texto(630, 490, "Obrigado por experimentar Hell is North. Espero que tenha se divertido!")
		g.desenhar_texto(500, 505, "O jogo seguirá com seus próximos capítulos gradualmente e lentamente, no fim do processo, aglomeraremos eles.")
		g.desenhar_texto(815, 560, "Pressione <ENTER> para continuar")
		
		g.renderizar()

		enquanto (tec.ler_tecla() != tec.TECLA_ENTER) { }
	}

	funcao cena_beta() { //Menu do jogo
		
		g.definir_cor(ColorBackGround)
		g.limpar()
		
		g.definir_tamanho_texto(18.0)
		g.definir_cor(ColorText)
		g.definir_estilo_texto(falso, falso, falso)

		g.desenhar_texto(630, 490, "Bem-vindo! Essa é a versão BETA de Hell Is North, se notar qualquer bug ou erro...")
		g.desenhar_texto(530, 505, "Envie um e-mail para: alexandreneres09@outlook.com ou alexandreneres.ifpr2024@gmail.com. Agradecimentos!")
		g.desenhar_texto(815, 560, "Pressione <ENTER> para continuar")
		
		g.renderizar()

		enquanto (tec.ler_tecla() != tec.TECLA_ENTER) { }
	}

	funcao desenhar_retangulo_texto() {
		
		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50

    			g.definir_cor(ColorText) // Cor branca para a borda
    			g.desenhar_retangulo(XCaixaTexto, YCaixaTexto, LarguraCaixaTexto, AlturaCaixaTexto, ArredondarPontasCaixa, CaixaPreenchida) //Retângulo Texto
	}

	funcao desenhar_retangulo_imagem() {
		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50

    			g.definir_cor(ColorText) // Cor branca para a borda
    			g.desenhar_retangulo(XImagem, YImagem, LarguraImagem, AlturaImagem, ArredondarPontasCaixa, CaixaPreenchida) //Retângulo Imagem

	}

	funcao inicializar_caixas() {
		
		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50

    			g.desenhar_retangulo(XCaixaTexto, YCaixaTexto, LarguraCaixaTexto, AlturaCaixaTexto, ArredondarPontasCaixa, CaixaPreenchida) //Retângulo Imagem
    			g.desenhar_retangulo(XImagem, YImagem, LarguraImagem, AlturaImagem, ArredondarPontasCaixa, CaixaPreenchida) //Retângulo Texto

    			g.definir_cor(ColorText) // Cor branca para a borda

    	//		enquanto (tamanhoTexto < 100 e vetorTexto[tamanhoTexto] != "")
    	//		{
     //  			vetorTexto[tamanhoTexto] = vetorTexto[tamanhoTexto]
	//     			tamanhoTexto = tamanhoTexto + 1
    	//		}
	//
    	//	escrever_texto_animado(XCaixaTexto + 20, YCaixaTexto + 50, vetorTexto, tamanhoTexto)

		posicao_textoX = XCaixaTexto + 20
		posicao_textoY = YCaixaTexto + 25

		para (inteiro i = 0; i <ScreenLenght; i = i + 25) {

		inteiro XdoQuadradoInvisivel = 0
		inteiro YdoQuadradoInvisivel = 0
		
		inteiro velocidadeDoQuadradoEmX = 10
		inteiro velocidadeDoQuadradoEmY = 0

		inteiro TamanhoDoQuadradoInvisivel = 0
		
		desenhar_retangulo_texto()
		desenhar_retangulo_imagem()
		
		XdoQuadradoInvisivel = XdoQuadradoInvisivel + velocidadeDoQuadradoEmX
          YdoQuadradoInvisivel = YdoQuadradoInvisivel + velocidadeDoQuadradoEmY

            	//se (YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > ClientSize.Height / 2)
            	//{
               // 	velocidadeDoQuadradoEmY = -velocidadeDoQuadradoEmY
            	//}

            	//se (YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < -ClientSize.Height / 2)
            	//{
               // 	velocidadeDoQuadradoEmY = -velocidadeDoQuadradoEmY
            	//}

            	//se (XdoQuadradoInvisivel < -ClientSize.Width / 2 ou XdoQuadradoInvisivel > ClientSize.Width / 2)
            	//{
               //	XdoQuadradoInvisivel = 0
               //	YdoQuadradoInvisivel = 0
            	//}

			g.definir_cor(ColorText)
			
			g.definir_cor(0x000000)
            	g.desenhar_retangulo(XdoQuadradoInvisivel + i, YdoQuadradoInvisivel + 5, 1920, 1080, falso, verdadeiro)
		
            	g.renderizar()

            	u.aguarde(100)
            	
		}
	}

	funcao escrever_1(cadeia texto, cadeia cenario) {

		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem

    		inteiro Som_Morse = s.carregar_som("Morse.mp3")
		s.definir_volume_reproducao(Som_Morse, 60)

		s.reproduzir_som(Som_Morse, falso)
    		
    		Frame = 0

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50
		
		para (inteiro i = 0; i < XCaixaTexto + 600; i = i + 25) {

		
		inteiro XdoQuadradoInvisivel = XCaixaTexto
		inteiro YdoQuadradoInvisivel = YCaixaTexto
		
		inteiro velocidadeDoQuadradoEmX = 10
		inteiro velocidadeDoQuadradoEmY = 0

		inteiro TamanhoDoQuadradoInvisivel = 0

		desenhar_retangulo_texto()
		desenhar_retangulo_imagem()
		
		XdoQuadradoInvisivel = XdoQuadradoInvisivel + velocidadeDoQuadradoEmX
          YdoQuadradoInvisivel = YdoQuadradoInvisivel + velocidadeDoQuadradoEmY

          	se(XdoQuadradoInvisivel + i + TamanhoDoQuadradoInvisivel / 2 > XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
           	{
               	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}

            	se (XdoQuadradoInvisivel + i  - TamanhoDoQuadradoInvisivel / 2 < XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
            	{
                	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}

			g.definir_cor(ColorText)
    		
    			inteiro tamanhoTexto = 24
    			
        		g.definir_fonte_texto("Alef")
       		g.definir_estilo_texto(falso, verdadeiro, falso)
       	
       		g.definir_tamanho_texto(tamanhoTexto)
       		
			g.desenhar_texto(XCaixaTexto + 20, YCaixaTexto + 25, texto)

			inteiro Colisao_caixaX = 950 - i - XCaixaTexto + 478
			inteiro Tamanho_Linha_caixa = 50

			g.definir_cor(0x000000)

			g.desenhar_retangulo(XdoQuadradoInvisivel + i, YdoQuadradoInvisivel + 5, Colisao_caixaX, Tamanho_Linha_caixa, falso, verdadeiro)

			inteiro retorno = 0
//SUBTRAI FRAMES			
			se (Frame > 38) {
				Frame--
				retorno = 1

				se (Frame == 0) {
					retorno = 0
				}

				se (retorno == 1) {
					Frame--
				}
			}
//SOMA FRAMES
			se (retorno == 0) {
			
				se (Frame < 40) {
					Frame++
				}
			}
			
			desenhar(cenario, Frame)
			g.renderizar()

			s.interromper_som(Som_Morse)
			s.liberar_som(Som_Morse)
			
		}
		
		FrameX = Frame

	}

	funcao escrever_2(cadeia texto, cadeia texto_linha_1, cadeia cenario) {

		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50

    		Frame = FrameX
		
		para (inteiro i = 0; i < XCaixaTexto + 480; i = i + 25) {

		inteiro XdoQuadradoInvisivel = XCaixaTexto
		inteiro YdoQuadradoInvisivel = YCaixaTexto
		
		inteiro velocidadeDoQuadradoEmX = 10
		inteiro velocidadeDoQuadradoEmY = 0

		inteiro TamanhoDoQuadradoInvisivel = 0

		desenhar_retangulo_texto()
		desenhar_retangulo_imagem()
		
		XdoQuadradoInvisivel = XdoQuadradoInvisivel + velocidadeDoQuadradoEmX
          YdoQuadradoInvisivel = YdoQuadradoInvisivel + velocidadeDoQuadradoEmY

          	se(XdoQuadradoInvisivel + i + TamanhoDoQuadradoInvisivel / 2 > XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
           	{
               	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}

            	se (XdoQuadradoInvisivel + i  - TamanhoDoQuadradoInvisivel / 2 < XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
            	{
                	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}

			g.definir_cor(ColorText)
    		
    			inteiro tamanhoTexto = 24
    			
        		g.definir_fonte_texto("Alef")
       		g.definir_estilo_texto(falso, verdadeiro, falso)
       	
       		g.definir_tamanho_texto(tamanhoTexto)

				g.desenhar_texto(XCaixaTexto + 20, YCaixaTexto + 65, texto)
				g.desenhar_texto(XCaixaTexto + 20, YCaixaTexto + 25, texto_linha_1)


			inteiro Colisao_caixaX = 950 - i - XCaixaTexto + 478
			inteiro Tamanho_Linha_caixa = 42

			g.definir_cor(0x000000)

			g.desenhar_retangulo(XdoQuadradoInvisivel + i, YdoQuadradoInvisivel + 60, Colisao_caixaX, Tamanho_Linha_caixa, falso, verdadeiro)

			inteiro retorno = 0
			
			se (Frame > 38) {
				Frame--
				retorno = 1
				Frame--

				se (Frame < 1) {
					retorno = 0
				}
			}

			se (retorno != 1) {
			
				se (Frame < 40) {
					Frame++
				}
			}
			
			desenhar(cenario, Frame)
			g.renderizar()

            	
		}

		FrameX = Frame
	}

	funcao escrever_3(cadeia texto, cadeia texto_linha_2, cadeia texto_linha_1, cadeia cenario) {

		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50

    		Frame = FrameX
		
		para (inteiro i = 0; i < XCaixaTexto + 480; i = i + 25) {

		inteiro XdoQuadradoInvisivel = XCaixaTexto
		inteiro YdoQuadradoInvisivel = YCaixaTexto
		
		inteiro velocidadeDoQuadradoEmX = 10
		inteiro velocidadeDoQuadradoEmY = 0

		inteiro TamanhoDoQuadradoInvisivel = 0

		desenhar_retangulo_texto()
		desenhar_retangulo_imagem()
		
		XdoQuadradoInvisivel = XdoQuadradoInvisivel + velocidadeDoQuadradoEmX
          YdoQuadradoInvisivel = YdoQuadradoInvisivel + velocidadeDoQuadradoEmY

          	se(XdoQuadradoInvisivel + i + TamanhoDoQuadradoInvisivel / 2 > XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
           	{
               	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}

            	se (XdoQuadradoInvisivel + i  - TamanhoDoQuadradoInvisivel / 2 < XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
            	{
                	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}
            	
			g.definir_cor(ColorText)
    		
    			inteiro tamanhoTexto = 24
    			
        		g.definir_fonte_texto("Alef")
       		g.definir_estilo_texto(falso, verdadeiro, falso)
       	
       		g.definir_tamanho_texto(tamanhoTexto)

				g.desenhar_texto(XCaixaTexto + 20, YCaixaTexto + 105, texto)
				g.desenhar_texto(XCaixaTexto + 20, YCaixaTexto + 65, texto_linha_2)
				g.desenhar_texto(XCaixaTexto + 20, YCaixaTexto + 25, texto_linha_1)


			inteiro Colisao_caixaX = 950 - i - XCaixaTexto + 478
			inteiro Tamanho_Linha_caixa = 36

			g.definir_cor(0x000000)

			g.desenhar_retangulo(XdoQuadradoInvisivel + i, YdoQuadradoInvisivel + 103, Colisao_caixaX, Tamanho_Linha_caixa, falso, verdadeiro)

			inteiro retorno = 0
			
			se (Frame > 38) {
				Frame--
				retorno = 1
				Frame--

				se (Frame < 1) {
					retorno = 0
				}
			}

			se (retorno != 1) {
			
				se (Frame < 40) {
					Frame++
				}
			}
			
			desenhar(cenario, Frame)
			g.renderizar()
			
		}


	}

		funcao inicializar_capela() {
		
		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem
    		inteiro contador = 1

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50
		
		para (inteiro i = 0; i < XCaixaTexto + 480; i = i + 25) {

		inteiro XdoQuadradoInvisivel = XCaixaTexto
		inteiro YdoQuadradoInvisivel = YCaixaTexto
		
		inteiro velocidadeDoQuadradoEmX = 10
		inteiro velocidadeDoQuadradoEmY = 0

		inteiro TamanhoDoQuadradoInvisivel = 0

		inteiro x = XdoQuadradoInvisivel + i
		inteiro y = YImagem + 1

		inteiro xi = 0
		inteiro yi = 0

		inteiro Colisao_caixaX = 950 - i - XCaixaTexto + 478
		inteiro Tamanho_Linha_caixa = AlturaImagem

		inteiro largura = Colisao_caixaX
		inteiro altura = Tamanho_Linha_caixa

		desenhar_retangulo_texto()
		desenhar_retangulo_imagem()
		
		XdoQuadradoInvisivel = XdoQuadradoInvisivel + velocidadeDoQuadradoEmX
          YdoQuadradoInvisivel = YdoQuadradoInvisivel + velocidadeDoQuadradoEmY

          	se(XdoQuadradoInvisivel + i + TamanhoDoQuadradoInvisivel / 2 > XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
           	{
               	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}

            	se (XdoQuadradoInvisivel + i  - TamanhoDoQuadradoInvisivel / 2 < XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
            	{
                	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}
			
			contador++

			se (contador > 41 ) {
				contador = 1
			}

			cadeia zeros = "00"

			se (contador > 9) {
				zeros = "0"
			}
			
			cadeia local = "1026 (1)_" + zeros + contador + ".png"
			inteiro X = g.carregar_imagem(local)
			
			g.desenhar_porcao_imagem(XdoQuadradoInvisivel, YImagem + 1, 0, 0, 950, Tamanho_Linha_caixa - 2, X)

			g.definir_cor(0x000000)

			g.desenhar_retangulo(XdoQuadradoInvisivel + i, YImagem + 1, Colisao_caixaX, Tamanho_Linha_caixa - 2, falso, verdadeiro)
            	
            	g.renderizar()
            	g.liberar_imagem(X)

            	u.aguarde(50)
		}
	}

	funcao inicializar_maria() {
		
		inteiro LarguraCaixaTexto, AlturaCaixaTexto, XCaixaTexto, YCaixaTexto
    		inteiro LarguraImagem, AlturaImagem, XImagem, YImagem
    		inteiro contador = 1

    		real posicao_textoX = 0.0
    		real posicao_textoY = 0.0
    		
    		logico CaixaPreenchida, ArredondarPontasCaixa

  			CaixaPreenchida = falso 
    			ArredondarPontasCaixa = falso

    			LarguraImagem = 960
    			AlturaImagem = 540
    			XImagem = (ScreenLenght - LarguraImagem) / 2
   			YImagem = (ScreenHigh - AlturaImagem) / 2 - 100

    			LarguraCaixaTexto = 960
    			AlturaCaixaTexto = 150
    			XCaixaTexto = (ScreenLenght - LarguraCaixaTexto) / 2
    			YCaixaTexto = YImagem + AlturaImagem + 50
		
		para (inteiro i = 0; i < XCaixaTexto + 480; i = i + 25) {

		inteiro XdoQuadradoInvisivel = XCaixaTexto
		inteiro YdoQuadradoInvisivel = YCaixaTexto
		
		inteiro velocidadeDoQuadradoEmX = 10
		inteiro velocidadeDoQuadradoEmY = 0

		inteiro TamanhoDoQuadradoInvisivel = 0

		inteiro x = XdoQuadradoInvisivel + i
		inteiro y = YImagem + 1

		inteiro xi = 0
		inteiro yi = 0

		inteiro Colisao_caixaX = 950 - i - XCaixaTexto + 478
		inteiro Tamanho_Linha_caixa = AlturaImagem

		inteiro largura = Colisao_caixaX
		inteiro altura = Tamanho_Linha_caixa

		desenhar_retangulo_texto()
		desenhar_retangulo_imagem()
		
		XdoQuadradoInvisivel = XdoQuadradoInvisivel + velocidadeDoQuadradoEmX
          YdoQuadradoInvisivel = YdoQuadradoInvisivel + velocidadeDoQuadradoEmY

          	se(XdoQuadradoInvisivel + i + TamanhoDoQuadradoInvisivel / 2 > XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
           	{
               	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}

            	se (XdoQuadradoInvisivel + i  - TamanhoDoQuadradoInvisivel / 2 < XCaixaTexto + 25
             	e YdoQuadradoInvisivel - TamanhoDoQuadradoInvisivel / 2 < YCaixaTexto
             	e YdoQuadradoInvisivel + TamanhoDoQuadradoInvisivel / 2 > YCaixaTexto)
            	{
                	velocidadeDoQuadradoEmX = -velocidadeDoQuadradoEmX
            	}
			
			contador++

			se (contador > 51 ) {
				contador = 1
			}

			cadeia zeros = "00"

			se (contador > 9) {
				zeros = "0"
			}
			
			cadeia local = "Maria (" + contador + ").png"
			inteiro X = g.carregar_imagem(local)
			
			g.desenhar_porcao_imagem(XdoQuadradoInvisivel, YImagem + 1, 0, 0, 950, Tamanho_Linha_caixa - 2, X)

			g.definir_cor(0x000000)

			g.desenhar_retangulo(XdoQuadradoInvisivel + i, YImagem + 1, Colisao_caixaX, Tamanho_Linha_caixa - 2, falso, verdadeiro)
            	
            	g.renderizar()
            	g.liberar_imagem(X)

            	u.aguarde(50)
		}
	}

	funcao escreverXXX(cadeia texto_linha_1, cadeia texto_linha_2, cadeia texto_linha_3, cadeia cenario) {

			escrever_1(texto_linha_1, cenario)
			escrever_2(texto_linha_2, texto_linha_1, cenario)

			escrever_3(texto_linha_3, texto_linha_2, texto_linha_1, cenario)
			
    			enquanto (tec.ler_tecla() != tec.TECLA_ENTER) { }
	}

	funcao escreverXX(cadeia texto_linha_1, cadeia texto_linha_2, cadeia cenario) {
		
			escrever_1(texto_linha_1, cenario)
			escrever_2(texto_linha_2, texto_linha_1, cenario)

			enquanto (tec.ler_tecla() != tec.TECLA_ENTER) { }
	}

	funcao escolhas(cadeia Alternativa_1, cadeia Alternativa_2, cadeia Alternativa_3, cadeia cenario) {
			
			escrever_1(Alternativa_1, cenario)
			escrever_2(Alternativa_2, Alternativa_1, cenario)

			escrever_3(Alternativa_3, Alternativa_2, Alternativa_1, cenario)
	}

	funcao title() //Exibe a Intro do Jogo
	{
		inteiro imagem_original, imagem_intermediaria, imagem_transformada
		inteiro fundo_transparente = g.criar_cor(255, 0, 255) // ou inteiro fundo_transparente = 0xFF00FF

		inteiro Som_Intro = s.carregar_som("Innocent Moon.mp3")
		s.reproduzir_som(Som_Intro, verdadeiro)
		s.definir_posicao_atual_musica(Som_Intro, 24000)

		inteiro Som_Trompeta = s.carregar_som("Trompeta.mp3")
		s.definir_volume_reproducao(Som_Trompeta, 100)

			para (inteiro i = 24; i > 5; i--)
			{
			
				inteiro numero = i
				cadeia local = "transitiontitle (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso,0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}

			para (inteiro i = 1; i < 12; i++)
			{
			
				inteiro numero = i
				cadeia local = "transitiontitle (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
				
					g.liberar_imagem(vetor_quadros[i])
			
			}

			s.reproduzir_som(Som_Trompeta, verdadeiro)

			para (inteiro i = 0; i < 73; i++)
			{
			
				inteiro numero = i + 1
				cadeia local = "startbutton (" + numero + ").png"

					imagem_original = g.carregar_imagem(local)
			

					imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

					imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
					
					g.liberar_imagem(vetor_quadros[i])
			}

		g.limpar()

			para (inteiro i = 0; i < 54; i++)
			{
				
				cadeia zeros = "00"
				inteiro numero = i + 1
				inteiro imagem_original_memory_spot, imagem_intermediaria_memory_spot, imagem_transformada_memory_spot

					se (numero > 100) {
				
						cadeia local = "Veta 1920x1080 (5)_" + numero + ".png"
				
							imagem_original_memory_spot = g.carregar_imagem(local)
			
							imagem_intermediaria_memory_spot = g.redimensionar_imagem(imagem_original_memory_spot, ScreenLenght, ScreenHigh, falso)

							g.liberar_imagem(imagem_original_memory_spot) //solta a imagem original e transforma-a na intermediária

							imagem_transformada_memory_spot = g.transformar_imagem(imagem_intermediaria_memory_spot, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
					
							g.liberar_imagem(imagem_intermediaria_memory_spot) //libera carregamento da próxima imagem

							vetor_quadros[i] = imagem_transformada_memory_spot
							g.desenhar_imagem(0, 0, vetor_quadros[i])
							g.renderizar()
							
							g.liberar_imagem(vetor_quadros[i])
					}

					se (numero < 100) {

						se (numero > 9) {
							zeros = "0"
						}

						cadeia local = "Veta 1920x1080 (5)_" + zeros + numero + ".png"

							imagem_original_memory_spot = g.carregar_imagem(local)
			
							imagem_intermediaria_memory_spot = g.redimensionar_imagem(imagem_original_memory_spot, ScreenLenght, ScreenHigh, falso)

							g.liberar_imagem(imagem_original_memory_spot) //solta a imagem original e transforma-a na intermediária

							imagem_transformada_memory_spot = g.transformar_imagem(imagem_intermediaria_memory_spot, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
							g.liberar_imagem(imagem_intermediaria_memory_spot) //libera carregamento da próxima imagem

							vetor_quadros[i] = imagem_transformada_memory_spot
							g.desenhar_imagem(0, 0, vetor_quadros[i])
							g.renderizar()
							
							g.liberar_imagem(vetor_quadros[i])

					}
			
			}
			
			enquanto(tec.ler_tecla() != tec.TECLA_ENTER) { }

			s.interromper_som(Som_Trompeta)
			s.liberar_som(Som_Trompeta)

//TRASIÇÃO


		para (inteiro i = 0; i < 60; i++)
		{
			
			inteiro numero = i + 1
			cadeia local = "transitiontitle (" + numero + ").png"

				imagem_original = g.carregar_imagem(local)
			

				imagem_intermediaria = g.redimensionar_imagem(imagem_original, ScreenLenght, ScreenHigh, falso)

				g.liberar_imagem(imagem_original) //solta a imagem original e transforma-a na intermediária

				imagem_transformada = g.transformar_imagem(imagem_intermediaria, falso, falso,0,  fundo_transparente) //transparente pra transição fluida
			
				g.liberar_imagem(imagem_intermediaria) //libera carregamento da próxima imagem

				vetor_quadros[i] = imagem_transformada
				g.desenhar_imagem(0, 0, vetor_quadros[i])
				g.renderizar()
			
				g.liberar_imagem(vetor_quadros[i])
			
		}

		para (inteiro i = 0; i < 54; i++)
		{
				
			cadeia zeros = "00"
			inteiro numero = i + 1
			inteiro imagem_original_memory_spot, imagem_intermediaria_memory_spot, imagem_transformada_memory_spot

					se (numero > 9) {
						zeros = "0"
					}

			cadeia local = "Veta 1920x1080 (6)_" + zeros + numero + ".png"

				imagem_original_memory_spot = g.carregar_imagem(local)
			
				imagem_intermediaria_memory_spot = g.redimensionar_imagem(imagem_original_memory_spot, ScreenLenght, ScreenHigh, falso)

				g.liberar_imagem(imagem_original_memory_spot) //solta a imagem original e transforma-a na intermediária

				imagem_transformada_memory_spot = g.transformar_imagem(imagem_intermediaria_memory_spot, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
				g.liberar_imagem(imagem_intermediaria_memory_spot) //libera carregamento da próxima imagem

				vetor_quadros[i] = imagem_transformada_memory_spot
				g.desenhar_imagem(0, 0, vetor_quadros[i])
				g.renderizar()
				
				g.liberar_imagem(vetor_quadros[i])
			
		}

		para (inteiro i = 0; i < 120; i++)
		{
				
			cadeia zeros = "00"
			inteiro numero = i + 1
			inteiro imagem_original_memory_spot, imagem_intermediaria_memory_spot, imagem_transformada_memory_spot

				se (numero > 100) {
				
					cadeia local = "GM_ST_" + numero + ".png"
				
						imagem_original_memory_spot = g.carregar_imagem(local)
			
						imagem_intermediaria_memory_spot = g.redimensionar_imagem(imagem_original_memory_spot, ScreenLenght, ScreenHigh, falso)

						g.liberar_imagem(imagem_original_memory_spot) //solta a imagem original e transforma-a na intermediária

						imagem_transformada_memory_spot = g.transformar_imagem(imagem_intermediaria_memory_spot, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
						g.liberar_imagem(imagem_intermediaria_memory_spot) //libera carregamento da próxima imagem

						vetor_quadros[i] = imagem_transformada_memory_spot
						g.desenhar_imagem(0, 0, vetor_quadros[i])
						g.renderizar()
						
						g.liberar_imagem(vetor_quadros[i])
				}

				se (numero < 100) {

					se (numero > 9) {
						zeros = "0"
					}

				cadeia local = "GM_ST_" + zeros + numero + ".png"

					imagem_original_memory_spot = g.carregar_imagem(local)
			
					imagem_intermediaria_memory_spot = g.redimensionar_imagem(imagem_original_memory_spot, ScreenLenght, ScreenHigh, falso)

					g.liberar_imagem(imagem_original_memory_spot) //solta a imagem original e transforma-a na intermediária

					imagem_transformada_memory_spot = g.transformar_imagem(imagem_intermediaria_memory_spot, falso, falso, 0,  fundo_transparente) //transparente pra transição fluida
			
					g.liberar_imagem(imagem_intermediaria_memory_spot) //libera carregamento da próxima imagem

					vetor_quadros[i] = imagem_transformada_memory_spot
					g.desenhar_imagem(0, 0, vetor_quadros[i])
					g.renderizar()
					
					g.liberar_imagem(vetor_quadros[i])

				}
		}
		s.interromper_som(Som_Intro)
		s.liberar_som(Som_Intro)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 43949; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */