Dado("que eu informe os seguintes dados de autenticação da API:") do |table|
    @autenticacao = table.rows_hash  
end


# ------------------------Listar quantidade limitada de personagens-------------------------------------------------
Quando("que eu faço uma solicitação do tipo GET para o endpoint que lista {string} limitada de personagens da Marvel") do |quantidade|
    @personagens = listaPersonagens(@autenticacao['ts'], @autenticacao['apikey'], @autenticacao['hash'], quantidade)    
end

Então("o código de resposta HTTP deve ser igual a {string}") do |status_code|
    expect(@personagens.response.code).to eql status_code
end

Então("devo receber a {string} limitada de personagens") do |quantidade|
    expect(@personagens['data']['count']).to eql (quantidade.to_i)
    puts " \n Quantidade de Personagens exibidos: #{(@personagens['data']['count'])}"
    puts " \n ID: #{(@personagens['data']['results'][0]['id'])} - Nome: #{(@personagens['data']['results'][0]['name'])}"
    puts " \n ID: #{(@personagens['data']['results'][1]['id'])} - Nome: #{(@personagens['data']['results'][1]['name'])}"
    puts " \n ID: #{(@personagens['data']['results'][2]['id'])} - Nome: #{(@personagens['data']['results'][2]['name'])}"
    puts " \n ID: #{(@personagens['data']['results'][3]['id'])} - Nome: #{(@personagens['data']['results'][3]['name'])}"
    puts " \n ID: #{(@personagens['data']['results'][4]['id'])} - Nome: #{(@personagens['data']['results'][4]['name'])}"
end


# ------------------------Listar informações de um personagem---------------------------------------------------------
Quando("que eu faço uma solicitação do tipo GET para o endpoint que lista as informações do personagem {string}") do |nome|
  @personagens = listaPersonagemNome(@autenticacao['ts'], @autenticacao['apikey'], @autenticacao['hash'], nome)
  @personagens = listaInformacoesPersonagem(@autenticacao['ts'], @autenticacao['apikey'], @autenticacao['hash'], (@personagens['data']['results'][0]['id']))    
end

Então("devo receber as informações do personagem {string}") do |nome|
  expect(@personagens['data']['count']).to eql 1
  expect(@personagens['data']['results'][0]['name']).to eql nome
  puts " \n ID do Personagem: #{(@personagens['data']['results'][0]['id'])}"
  puts " \n Nome do Personagem: #{(@personagens['data']['results'][0]['name'])}"
  puts " \n Descrição do Personagem: #{(@personagens['data']['results'][0]['description'])}"
end


# ------------------------Listar comics de um personagem----------------------------------------------------------------

Quando("que eu faço uma solicitação do tipo GET para o endpoint que lista os comics de um personagem {string}") do |nome|
  @personagens = listaPersonagemNome(@autenticacao['ts'], @autenticacao['apikey'], @autenticacao['hash'], nome)
  @personagens = listaComicsPersonagem(@autenticacao['ts'], @autenticacao['apikey'], @autenticacao['hash'], (@personagens['data']['results'][0]['id']))    
end

Então("devo receber os comics do personagem") do
  expect(@personagens['status']).to eql "Ok"
  puts " \n Foram encontrados #{(@personagens['data']['count'])} comics do personagem selecionado"
end
