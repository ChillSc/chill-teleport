-- config.lua

Config = {}

Config.Locale = 'en' -- 'tr' for Turkish, 'en' for English, etc.

-- Teleport noktaları ve ücretleri
Config.TeleportPoints = {
    { name = "Teleport Noktası 1", coords = vector3(100.0, 200.0, 300.0), price = 100 },
    { name = "Teleport Noktası 2", coords = vector3(400.0, 500.0, 600.0), price = 150 },
    -- İsterseniz buraya başka teleport noktaları ekleyebilirsiniz
}
