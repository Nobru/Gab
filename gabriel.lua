gabriel = {
  x = 0, y = 0, w = 32, h = 64, maxVelocity = 100, force = 300
}
velocity = {x = 0, y = 0}
force = 0

function gabriel:draw()
  love.graphics.setColor(193, 47, 14)
  love.graphics.rectangle("fill", gabriel.body:getX(), gabriel.body:getY(), gabriel.w, gabriel.h)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print("Velocity X: " .. velocity.x, 10, 10)
  love.graphics.print("Velocity Y: " .. velocity.y, 10, 25)
  love.graphics.print("Force: " .. force, 10, 50)
end

function gabriel:update()
  force = gabriel.body:getMass() * velocity.x * 2
  if love.keyboard.isDown("right") and force <= gabriel.force then
    gabriel.body:applyForce(gabriel.force, 0)
    gabriel.body:setFixedRotation(true)
  elseif love.keyboard.isDown("left") and force >= -gabriel.force then
    gabriel.body:applyForce(-gabriel.force, 0)
  end
  if love.keyboard.isDown("up") and math.floor(velocity.y) == 0 then
   gabriel.body:applyLinearImpulse(0, -200)
   gabriel.body:applyForce(force, 0)
  end
  velocity.x, velocity.y = gabriel.body:getLinearVelocity()
end

return gabriel