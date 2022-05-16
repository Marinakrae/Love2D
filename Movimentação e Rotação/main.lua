--[[Variáveis de: posição nos eixos x e y, angulo inicial, tamanho
 e origem da imagem a ser renderizada. A origem diz respeito ao
 eixo em que ela sera girada, então deve corresponder exatamente 
 à fileira central de pixels --]]

posX = 250
posY = 300
angulo = 0
tam = 1
origem = 56 --a origem padrão da imagem é sempre o canto sup esq

--Funções básicas para um jogo em Love2D:

--Carrega os assets do jogo, imagens, sons
function love.load() 
    imagem = love.graphics.newImage("Imagens/Cursor.png")
    love.mouse.setVisible(false)
end

--Será o loop no qual o jogo rodará até ser fechado. Aqui ocorrerão os eventos em tempo real.
function love.update(dt)

    --quando a seta da esquerda for pressionada
    if love.keyboard.isDown("left") then
        --[[ dt é uma constante que contra os frames da tela
        ele move a posX para 100 frames pro lado ]]--
        posX = posX - 100 * dt
        --girando a imagem
        angulo = angulo - dt * 2.5
    end 
    
    --seta direita
    if love.keyboard.isDown("right") then
        --[[ dt é uma constante que contra os frames da tela
        ele move a posX para 100 frames pro lado ]]--
        posX = posX + 100 * dt
        --girando a imagem
        angulo = angulo + dt * 2.5
    end 
end

--Apresenta as imagens do jogo
function love.draw()
    rot = angulo --variavel utilizada na rotação
    love.graphics.draw(imagem, posX, posY, rot, tam, tam, origem, origem)
end    