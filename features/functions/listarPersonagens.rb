
def listaPersonagens(ts, apikey, hash, quatidade)

    endpoint = 'https://gateway.marvel.com:443/v1/public/characters?'

    HTTParty.get(
        "#{endpoint}orderBy=name&limit=#{quatidade}&ts=#{ts}&apikey=#{apikey}&hash=#{hash}"
    )    
end

def listaPersonagemNome(ts, apikey, hash, nome)

    endpoint = 'https://gateway.marvel.com:443/v1/public/characters?'

    HTTParty.get(
        "#{endpoint}name=#{nome}&ts=#{ts}&apikey=#{apikey}&hash=#{hash}"
    )    
end


def listaInformacoesPersonagem(ts, apikey, hash, id)

    endpoint = 'https://gateway.marvel.com:443/v1/public/characters/'

    HTTParty.get(
        "#{endpoint}#{id}?ts=#{ts}&apikey=#{apikey}&hash=#{hash}"
    )    
end


def listaComicsPersonagem(ts, apikey, hash, id)

    endpoint = 'https://gateway.marvel.com:443/v1/public/characters/'

    HTTParty.get(
        "#{endpoint}#{id}/comics?ts=#{ts}&apikey=#{apikey}&hash=#{hash}"
    )    
end