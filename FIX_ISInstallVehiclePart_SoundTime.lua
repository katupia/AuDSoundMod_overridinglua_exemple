
require "Vehicles/TimedActions/ISInstallVehiclePart"
-----------------------------------------------------------------------------------------------------------------------------------------------------------
local upperLayer = {}
upperLayer.ISInstallVehiclePart = {}

upperLayer.ISInstallVehiclePart.update = ISInstallVehiclePart.update
function ISInstallVehiclePart:update()
    upperLayer.ISInstallVehiclePart.update(self)
    if self.sound ~= 0 and not self.character:getEmitter():isPlaying(self.sound) then
        self.sound = self.character:playSound("Meca3")
    end
end

upperLayer.ISInstallVehiclePart.start = ISInstallVehiclePart.start
function ISInstallVehiclePart:start()
    self.sound = self.character:playSound("Meca3")--I put it before upperlayer as you did but in doubt always put your alterations after the upper layer. putting it before can be used as a clue that there is a tricky thing going on.
    upperLayer.ISInstallVehiclePart.start(self)
end

upperLayer.ISInstallVehiclePart.stop = ISInstallVehiclePart.stop
function ISInstallVehiclePart:stop()
    upperLayer.ISInstallVehiclePart.stop(self)
    if self.sound ~= 0 then
        self.character:getEmitter():stopSound(self.sound)
    end
    self.sound = self.character:playSound("MecaStop")
end

upperLayer.ISInstallVehiclePart.perform = ISInstallVehiclePart.perform
function ISInstallVehiclePart:perform()
    if self.sound ~= 0 then
        self.character:getEmitter():stopSound(self.sound)
    end
    self.sound = self.character:playSound("MecaStop")--I put it before upperlayer as you did but in doubt always put your alterations after the upper layer. putting it before can be used as a clue that there is a tricky thing going on.

    upperLayer.ISInstallVehiclePart.perform(self)
end

upperLayer.ISInstallVehiclePart.new = ISInstallVehiclePart.new
function ISInstallVehiclePart:new(character, part, item, time)
    local o = upperLayer.ISInstallVehiclePart.new(self,character, part, item, time)

    if not ISVehicleMechanics.cheat then o.maxTime = o.maxTime + 750; end
    return o
end
