
Dado("que acesse a api characters Marvel") do
  @marvel = MarvelChacarters.new
end


Quando("busco por cinco personagens") do
  @marvel.buscar_por_cinco_personagens
end

Quando("buscar as comics de um único personagem") do
  @marvel.buscar_comics
end


Quando("buscar por pelo personagem com id {string}") do |id|
  @personagem_id = @marvel.buscar_personagem(id)
end

Então("devo visualizar as informações dos 5 personagens") do
  json = @marvel.buscar_por_cinco_personagens.parsed_response
  personagens = @marvel.valida_5_personagens(json)
  status_code = @marvel.buscar_por_cinco_personagens.code
  expect(status_code).to be(200)
  expect(personagens).to be(5)
end

Então("devo visualizar a informação do personagem") do
  json = @personagem_id.parsed_response
  historia = @marvel.validar_personagem(json)
  status_code = @personagem_id.code
  expect(status_code).to be(200)
  expect(historia).to eq("Hulk (2008) #55")
end

Então("devo visualizar as comics do personagem") do
  json = @marvel.buscar_comics.parsed_response
  comics = @marvel.valida_comics(json)
  status_code = @marvel.buscar_comics.code
  binding.pry
  expect(status_code).to be(200)
  expect(comics).to be(3)
  
end



