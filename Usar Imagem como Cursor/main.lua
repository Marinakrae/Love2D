function love.load()
    imagem = love.graphics.newImage("Imagens/Cursor.png")
    love.mouse.setVisible(false)
end

function love.draw()
    love.graphics.setBackgroundColor(255, 255, 255) 
    love.graphics.draw(imagem, love.mouse.getX(), love.mouse.getY())
end     