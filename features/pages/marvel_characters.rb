class MarvelChacarters
  include HTTParty
  base_uri 'gateway.marvel.com/v1/public/characters'

  def generate_body
    ts = Time.now
    ts = ts.to_s
    pri_key = "107469394574aea82766d1717306b48773ebde38"
    api_key = "bea7f07677c6d97f3c0d2aa6a8b2e50d"
    hash = Digest::MD5.hexdigest ts + pri_key + api_key
    return hash, api_key, ts
  end
  
  def buscar_por_cinco_personagens
    offset = rand(20..100)
    api = generate_body
    self.class.get("?limit=5&ts=#{api[2]}&apikey=#{api[1]}&hash=#{api[0]}")
  end

  def buscar_personagem(id)
    api = generate_body
    self.class.get("/#{id}?ts=#{api[2]}&apikey=#{api[1]}&hash=#{api[0]}")
  end

  def buscar_comics
    api = generate_body
    self.class.get("/1017100/comics?ts=#{api[2]}&apikey=#{api[1]}&hash=#{api[0]}")
  end

  def valida_5_personagens(body)
    binding.pry
    contador = body["data"]["results"].count
    for i in 0..contador - 1
      puts data["results"][i]["name"]
    end
    return contador
  end

  def validar_personagem(body)
    body["data"]["results"][0]["stories"]["items"][0]["name"]
  end

  def valida_comics(body)
    contador = body["data"]["results"].count
    for i in 0..contador - 1
      puts body["data"]["results"][i]["title"]
    end
    return contador
  end


end