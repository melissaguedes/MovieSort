// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation

let banner = """
        
888b     d888                d8b         .d8888b.                888
8888b   d8888                Y8P        d88P  Y88b               888
88888b.d88888                           Y88b.                    888
888Y88888P888 .d88b. 888  888888 .d88b.  "Y888b.   .d88b. 888d888888888
888 Y888P 888d88""88b888  888888d8P  Y8b    "Y88b.d88""88b888P"  888
888  Y8P  888888  888Y88  88P88888888888      "888888  888888    888
888   "   888Y88..88P Y8bd8P 888Y8b.    Y88b  d88PY88..88P888    Y88b.
888       888 "Y88P"   Y88P  888 "Y8888  "Y8888P"  "Y88P" 888     "Y888
"""

func resetSeenMovies() { // Essa função serve para esvaziar o arquivo de filmes ja vistos.
    try? Persistence.savePlainText(content: [], path: "seen.txt")
}
func showSeenMovies() {  // Essa função serve para printar todos o filmes ja vistos pelo usuario.
    let seen: [String] = (try? Persistence.readPlainText(path: "seen.txt")) ?? []
    for (index, elemento) in seen.enumerated() {
        sleep(1)
        print("\(index+1): \(elemento)\n")
    }
}
    struct GenreList {
        static var acao = [
            "Bullitt(1968)", "Duro de Matar(1998)", "Intriga Internacional(1959)", "Seven Samurai(1954)", "Operacao Dragao(1973)", "Tres Homens em Conflito(1966)", "O tigre e o Dragao(2000)", "RRR: Revolta, Rebelião, Revolução(2022)", "Mad Max: Estrada da Fúria(2015)", "Desejo de Matar(1974)", "Dredd(2012)", "John Wick(2014)", "O Profissional(1994)", "Duro de Matar 2(1990)", "O Profissional(1994)", "Desejo de Matar 2(1982)", "John Wick: De Volta ao Jogo(2014)", "Mad Max 2: A Caçada Continua(1981)", "Dredd(2012)", "Velocidade Máxima(1994)", "Operação Invasão(2011)", "O Homem das Sombras(2004)", "O Protetor(2014)", "O Grande Dragão Branco(1988)"]
        static var romance = [
            "Forrest Gump(1994)",
            "A Bela e a Fera(1991)",
            "E o Vento Levou(1939)",
            "Edward Mãos de Tesoura(1990)",
            "Orgulho e Preconceito(2005)",
            "Titanic(1997)",
            "Diario de uma paixao(2004)",
            "La La Land (2016)",
            "Antes do Amanhecer(1995)",
            "Simplesmente Amor(2003)",
            "500 Dias com Ela(2009)",
            "Amor à Flor da Pele(2000)",
            "Um Lugar Chamado Notting Hill(1999)",
            "Doce Novembro(2001)",
            "Amor e Inocência(2007)",
            "Encontros e Desencontros(2003)",
            "Um Amor para Recordar(2002)",
            "Cidade dos Anjos(1998)",
            "O Fabuloso Destino de Amélie Poulain(2001)",
            "Questão de Tempo(2013)",
            "Apenas Uma Vez(2006)",
            "O Segredo de Brokeback Mountain(2005)",
            "Amor Sem Escalas(2009)"]
        static var scifi = [
            "Duna(2021)",
            "Efeito Borboleta(2004)",
            "Interestelar(2014)",
            "A Chegada(2016)",
            "O Dia em que a Terra Parou(1951)",
            "Desculpa Te Incomodar(2018)",
            "Wall-E(2008)",
            "Blade Runner 2049(2017)",
            "Mad Max: Estrada da Fúria(2015)",
            "Sunshine(2007)",
            "The Fountain(2006)",
            "V for Vendetta(2005)",
            "Eu, Robô(2004)",
            "Elysium(2013)",
            "Inception(2010)",
            "Gravidade(2013)",
            "Ex Machina(2014)",
            "O Quinto Elemento(1997)",
            "Matrix(1999)",
            "O Planeta dos Macacos(1968)",
            "A Origem(2010)",
            "O Exterminador do Futuro(1984)",
            "O Homem Bicentenário(1999)"]
        static var terror = [
            "Hereditário (2018)",
            "O Farol (2019)",
            "Corra! (2017)",
            "O Babadook (2014)",
            "A Bruxa (2015)",
            "O Sexto Sentido (1999)",
            "O Iluminado (1980)",
            "A Casa do Medo (2019)",
            "A Órfã (2009)",
            "O Chamado (2002)",
            "O Exorcista (1973)",
            "O Bebê de Rosemary (1968)",
            "O Silêncio dos Inocentes (1991)",
            "O Hospedeiro (2006)",
            "O Enigma de Outro Mundo (1982)",
            "A Noite dos Mortos-Vivos (1968)",
            "O Massacre da Serra Elétrica (1974)",
            "O Ritual (2011)",
            "O Segredo da Cabana (2011)",
            "O Homem nas Trevas (2016)"]
        static var suspense = [
            "A Ilha do Medo (2010)",
            "O Abutre (2014)",
            "Um Contratempo (2016)",
            "O que ficou para trás (2020)",
            "Fragmentado (2016)",
            "Bird Box (2018)",
            "O convite (2015)",
            "Fuja (2020)",
            "Sleeping Dogs(2024)",
            "Love Lies Bleeding(2008)",
            "Ballerina(2016)",
            "Vínculo Mortal(2024)",
            "Wolfs(2023)",
            "Joker: Folie à Deux(2024)",
            "Wise Guys(2024)",
            "The Surfer(2024)",
            "The Amateur(1981)",
            "Reptile(2023)",
            "Black Flies(2024)",
            "Alice Darling(2022)",
            "The Mother(2003)",
            "Stars at Noon(2023)",
            "In the Land of Saints and Sinners(2023)",
            "Superposition(2023)",
            "Sharper(2022)",
            "Inside(2023)"]}
    struct SagaList {
        static var acao = [
            "John Wick (2014), John Wick: Um Novo Dia para Matar (2017), John Wick: Parabellum (2019)", "Mad Max (1979), Mad Max 2: A Caçada Continua (1981), Mad Max: Além da Cúpula do Trovão (1985)", "O Resgate (2020), O Resgate 2 (2023)", "Duro de Matar (1988), Duro de Matar 2 (1990), Duro de Matar 3: A Vingança (1995)",
            "Velozes e Furiosos (2001), Velozes e Furiosos 2 (2003), Velozes e Furiosos: Desafio em Tóquio (2006)",
            "Missão Impossível (1996), Missão Impossível 2 (2000), Missão Impossível 3 (2006)",
            "Rambo (1982), Rambo II: A Missão (1985), Rambo III (1988)",
            "Exterminador do Futuro (1984), Exterminador do Futuro 2: O Julgamento Final (1991), Exterminador do Futuro 3: A Rebelião das Máquinas (2003)",
            "Bourne (Identidade Bourne, Supremacia Bourne, Ultimato Bourne)",
            "Matrix (1999), Matrix Reloaded (2003), Matrix Revolutions (2003)"]
        static var romance = [
            "After (2019), After - Depois da Verdade (2020), After - Depois do Desencontro (2021), After - Depois da Promessa (2022), After - Para Sempre (2023)", "Crepúsculo (2008), Lua Nova (2009), Eclipse (2010), Amanhecer: Parte 1 (2011), Amanhecer: Parte 2 (2012)", "Através da minha janela (2016), Através de você (2017), Através da chuva (2018)",
            "Para Todos os Garotos que Já Amei (2018), Para Todos os Garotos: PS. Ainda Amo Você (2020), Para Todos os Garotos: Agora e Para Sempre (2021)",
            "Amor e Outras Drogas (2010), Amor à Toda Prova (2011)",
            "Simplesmente Acontece (2014), Um Dia (2011)",
            "Antes do Amanhecer (1995), Antes do Pôr do Sol (2004), Antes da Meia-Noite (2013)",
            "Diário de uma Paixão (2004), Noites de Tormenta (2008)",
            "Um Amor para Recordar (2002), Querido John (2010)",
            "Orgulho e Preconceito (2005), Razão e Sensibilidade (1995)"]
        static var scifi = [
            "Homem de Ferro (2008), O Incrível Hulk (2008), Homem de Ferro 2 (2010), Thor (2011), Capitão América: O Primeiro Vingador (2011), Os Vingadores (2012)",
            "O Hobbit: Uma Jornada Inesperada (2012), O Hobbit: A Desolação de Smaug (2013), O Hobbit: A Batalha dos Cinco Exércitos (2014), O Senhor dos Anéis: A Sociedade do Anel (2001), O Senhor dos Anéis: As Duas Torres (2002), O Senhor dos Anéis: O Retorno do Rei (2003)",
            "Harry Potter e a Pedra Filosofal (2001), Harry Potter e a Câmara Secreta (2002), Harry Potter e o Prisioneiro de Azkaban (2004), Harry Potter e o Cálice de Fogo (2005), Harry Potter e a Ordem da Fênix (2007), Harry Potter e o Enigma do Príncipe (2009), Harry Potter e as Relíquias da Morte(2010)",
            "Star Wars: Episódio I - A Ameaça Fantasma (1999), Star Wars: Episódio II - Ataque dos Clones (2002), Star Wars: Episódio III - A Vingança dos Sith (2005), Star Wars: Episódio IV - Uma Nova Esperança (1977), Star Wars: Episódio V - O Império Contra-Ataca (1980), Star Wars: Episódio VI - O Retorno de Jedi (1983), Star Wars: Episódio VII - O Despertar da Força (2015), Star Wars: Episódio VIII - Os Últimos Jedi (2017), Star Wars: Episódio IX - A Ascensão Skywalker (2019)",
            "Matrix (1999), Matrix Reloaded (2003), Matrix Revolutions (2003)",
            "Jurassic Park (1993), O Mundo Perdido: Jurassic Park (1997), Jurassic Park III (2001), Jurassic World (2015), Jurassic World: Reino Ameaçado (2018), Jurassic World: Dominion (2022)",
            "Alien: O Oitavo Passageiro (1979), Aliens: O Resgate (1986), Alien 3 (1992), Alien: A Ressurreição (1997), Prometheus (2012), Alien: Covenant (2017)",
            "De Volta para o Futuro (1985), De Volta para o Futuro II (1989), De Volta para o Futuro III (1990)",
            "O Exterminador do Futuro (1984), O Exterminador do Futuro 2: O Julgamento Final (1991), O Exterminador do Futuro 3: A Rebelião das Máquinas (2003), O Exterminador do Futuro: A Salvação (2009), O Exterminador do Futuro: Gênesis (2015), O Exterminador do Futuro: Destino Sombrio (2019)",
            "Blade Runner (1982), Blade Runner 2049 (2017)",
            "Guerra nas Estrelas (1977), O Império Contra-Ataca (1980), O Retorno de Jedi (1983), A Ameaça Fantasma (1999), Ataque dos Clones (2002), A Vingança dos Sith (2005)"]
        static var terror = [
            "Pânico (1996), Pânico 2 (1997), Pânico 3 (2000), Pânico 4 (2011), Pânico (2022)", "A Freira (2018), Annabelle 2: A Criação do Mal (2017), A Freira 2 (2023), Annabelle (2014), Invocação do Mal (2013)",
            "Jogos Mortais (2004), Jogos Mortais X (2023), Jogos Mortais 2 (2005), Jogos Mortais 3 (2006), Jogos Mortais 4 (2007)",
            "O Chamado (2002), O Chamado 2 (2005), O Chamado 3 (2017), O Chamado vs. O Grito (2016)",
            "Atividade Paranormal (2007), Atividade Paranormal 2 (2010), Atividade Paranormal 3 (2011), Atividade Paranormal 4 (2012), Atividade Paranormal: Marcados pelo Mal (2014), Atividade Paranormal: Dimensão Fantasma (2015)",
            "A Noiva de Chucky (1998), O Filho de Chucky (2004), A Maldição de Chucky (2013), O Culto de Chucky (2017), Chucky (2021)",
            "Halloween (1978), Halloween II (1981), Halloween III: A Noite das Bruxas (1982), Halloween 4: O Retorno de Michael Myers (1988), Halloween 5: A Vingança de Michael Myers (1989), Halloween: A Maldição de Michael Myers (1995), Halloween H20: 20 Anos Depois (1998), Halloween: Ressurreição (2002), Halloween (2007), Halloween II (2009), Halloween (2018), Halloween Ends (2022)",
            "A Casa dos Horrores (2003), A Casa dos Horrores 2 (2007), A Casa dos Horrores 3 (2021)",
            "O Massacre da Serra Elétrica (1974), O Massacre da Serra Elétrica 2 (1986), O Massacre da Serra Elétrica 3: O Massacre Final (1990), O Massacre da Serra Elétrica: O Retorno (1994), O Massacre da Serra Elétrica: O Início (2006), O Massacre da Serra Elétrica 3D: A Lenda Continua (2013)",
            "A Maldição de Amityville (1979), Amityville II: A Possessão (1982), Amityville 3-D (1983), Amityville 4: A Fuga do Mal (1989), Amityville: O Despertar (2017)"]
        static var suspense = [
            "Psicose (1960), Psicose II (1983), Psicose III (1986), Psicose IV: A Revelação (1990)",
            "O Colecionador de Ossos (1999), O Colecionador de Ossos 2: O Atirador de Elite (2001), O Colecionador de Ossos 3: O Colecionador (2006)",
            "O Exorcista (1973), O Exorcista II: O Herege (1977), O Exorcista III (1990), O Exorcista: O Início (2004), O Exorcista: O Início (2005)",
            "O Silêncio dos Inocentes (1991), Hannibal (2001), Dragão Vermelho (2002), Hannibal: A Origem do Mal (2007)",
            "Seven: Os Sete Crimes Capitais (1995), Seven: Os Sete Crimes Capitais (1995)",
            "Janela Indiscreta (1954), Janela Indiscreta (1954)",
            "Os Outros (2001), Os Outros (2001)",
            "Sexto Sentido (1999), Corpo Fechado (2000), Fragmentado (2016), Vidro (2019)",
            "Garota Exemplar (2014), Garota Exemplar (2014)",
            "Ilha do Medo (2010), Ilha do Medo (2010)"]}
    
    struct Clean: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Clear the list of movies already watched.")
        func run () {
            Persistence.projectName = "moviesort"
            resetSeenMovies()
            print("The list of movies has been successfully cleared!")
        }
    }
    struct Show: ParsableCommand {
        static var configuration = CommandConfiguration(abstract: "Show the list of movies watched.")
        func run () {
            Persistence.projectName = "moviesort"
            print(banner)
            print("\nList of watched movies: \n")
            print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
            showSeenMovies()
            print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
        }
    }
    @main
    struct MovieSort: ParsableCommand {
        
        static var configuration = CommandConfiguration(
            abstract: banner,
            usage: """
    moviesort [OPTIONS]
    """,
            discussion: """
This tool is used to randomly select a movie based on a genre chosen by the user through an input. The user enters the genre (such as "romance" or "action"), and MovieSort displays a movie of that genre. Each time a movie is selected, a new one is shown so that the user can fully enjoy the variety of available films.
""",
            subcommands: [
                Clean.self,
                Show.self
            ]
        )
        
        @Option(help: "Movie Genrer (1 - Action, 2 - Horror, 3- Sci-Fi, 4-Thriller, 5-Romance)")
        var genre: Int?
        
        @Option(help: "Choose as many movies as you’d like.")
        var n: Int = 0
        
        @Flag(help: "Be surprised by a random movie of an unknown genre.")
        var s: Bool = false
        
        @Flag(help: "Use it to randomly select a saga of your chosen genre.")
        var saga: Bool = false
        
        mutating func run() throws {
            Persistence.projectName = "moviesort"
            if saga {
                if s {
                    print(banner)
                    interact()
                    print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
                    surpriseSaga()
                    print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
                } else {
                    print(banner)
                    interact()
                    print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
                    sortsaga()
                    print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
                }
            } else {
                if s {
                    print(banner)
                    interact()
                    print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
                    surprise()
                    print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
                } else {
                    print(banner)
                    interact()
                    print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
                    sortFilme()
                    print("˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜")
                }
            }
        }
        func surprise() {
            let num: [Int] = [1, 2, 3, 4, 5]
            var chosen: Int?
            chosen = num.randomElement()
            if chosen==1 {
                let acao: [String] = GenreList.acao
                print("The chosen genre was action! ")
                sort(acao, quantidade: n)
            }
            if chosen==2 {
                let romance: [String] = GenreList.romance
                print("The chosen genre was romance! ")
                sort(romance, quantidade: n)
            }
            if chosen==3 {
                let scifi: [String] = GenreList.scifi
                print("The chosen genre was science fiction! ")
                sort(scifi, quantidade: n)
            }
            if chosen==4 {
                let terror: [String] = GenreList.terror
                print("The chosen genre was terror! ")
                sort(terror, quantidade: n)
            }
            if chosen==5 {
                let suspense: [String] = GenreList.suspense
                print("The chosen genre was thriller! ")
                sort(suspense, quantidade: n)
            }
        }
        func sortFilme() {
            switch genre {
            case 1:
                let acao: [String] = GenreList.acao
                sort(acao, quantidade: n)
            case 2:
                let romance: [String] = GenreList.romance
                sort(romance, quantidade: n)
            case 3:
                let scifi: [String] = GenreList.scifi
                sort(scifi, quantidade: n)
            case 4:
                let terror: [String] = GenreList.terror
                sort(terror, quantidade: n)
            case 5:
                let suspense: [String] = GenreList.suspense
                sort(suspense, quantidade: n)
            default:
                print("Gender not found.")
            }
        }
        func surpriseSaga() {
            let num: [Int] = [1, 2, 3, 4, 5]
            var chosen: Int?
            chosen = num.randomElement()
            if chosen == 1 {
                let acao: [String] = SagaList.acao
                print("The chosen genre was action! \n")
                sort(acao, quantidade: n)
            }
            if chosen == 2 {
                let romance: [String] = SagaList.romance
                print("The chosen genre was romance! \n")
                sort(romance, quantidade: n)
            }
            if chosen == 3 {
                let scifi: [String] = SagaList.scifi
                print("The chosen genre was science fiction! \n")
                sort(scifi, quantidade: n)
            }
            if chosen == 4 {
                let terror: [String] = SagaList.terror
                print("The chosen genre was terror! \n")
                sort(terror, quantidade: n)
            }
            if chosen == 5 {
                let suspense: [String] = SagaList.suspense
                print("The chosen genre was thriller! \n")
                sort(suspense, quantidade: n)
            }
        }
        func sortsaga () {
            switch genre {
            case 1:
                let acao: [String] = SagaList.acao
                sort(acao, quantidade: n)
            case 2:
                let romance: [String] = SagaList.romance
                sort(romance, quantidade: n)
            case 3:
                let scifi: [String] = SagaList.scifi
                sort(scifi, quantidade: n)
            case 4:
                let terror: [String] = SagaList.terror
                sort(terror, quantidade: n)
            case 5:
                let suspense: [String] = SagaList.suspense
                sort(suspense, quantidade: n)
            default:
                print("Please enter a number from 1 to 5 to choose your genre.")
            }
        }
        func interact() {
            sleep(1)
            print("\nGenerating your list of movies...\n")
            sleep(2)
            print("The list is almost ready...\n")
            sleep(2)
            print("Grab your popcorn because the show is about to start! 🍿🎬\n")
            sleep(1)
            print("The list of movies is:\n ")
        }
        func sort(_ filmes: [String], quantidade: Int) { // embaralha filmes
            var copy = filmes.shuffled()  // leitura do plain text, armazenar num array
            var seen: [String] = (try? Persistence.readPlainText(path: "seen.txt")) ?? [] // excluir os vistos do array (só no array)
            copy.removeAll { seen.contains($0) }    // para cada filme em copy, se ele estiver contido em seen, remove do array de copy
            var newSeen: [String] = []// sorteio
            for (index, elemento) in copy.prefix(quantidade).enumerated() {
                sleep(1)
                print("\(index+1): \(elemento)\n")
                newSeen.append(elemento)// persistir os vistos
            }
            do {
                seen.append(contentsOf: newSeen)
                try Persistence.savePlainText(content: seen, path: "seen.txt")
            } catch {
                print(error)
            }
        }
    }
