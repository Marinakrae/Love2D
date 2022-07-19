--Importar a biblioteca
local anim = require 'anim8'

local imagem, animation

local posX = 100
local direcao = true 

function love.load()
    imagem = love.graphics.newImage("Imagens/personagem.png")

    --Grid que definira os sprites para a animação
    local g = anim.newGrid(95, 189, imagem:getWidth(), imagem:getHeight())

    --função de animação: 1o ao ultimo sprite e a sua respectiva linha; e o tempo
    animation = anim.newAnimation(g('1-9', 1, '1-9', 2, '1-9', 3, '1-9', 4, '1-9', 5,
                                    '1-9', 6, '1-9', 7, '1-7', 8), 0.01)
end 

function love.update( dt )
    --Código para o movimento para a esquerda
    if love.keyboard.isDown('left') then 
        posX = posX - 150 * dt
        direcao = false 
        animation:update ( dt )
    end 
    if love.keyboard.isDown('right') then 
        posX = posX + 150 * dt
        direcao = true 
        animation:update ( dt )
    end   

end

function love.draw()
    love.graphics.setBackgroundColor(255, 255, 255)

    --Verficando o valor de direcao para imprimir as imagens de acordo
    if direcao then
        --Parametros: arquivo, posições nos eixos x e y, rotacao,
        --tamanho e o ponto pivot nos eixos x e y
        animation:draw(imagem, posX, 50, 0, 1, 1, 47, 0) --o 47.7 para centralizar
    elseif not direcao then
        animation.draw(imagem, posX, 50, 0, -1, 1, 47, 0) --inverte a img
    end    
end    