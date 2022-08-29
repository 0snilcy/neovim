local status, gps = pcall(require, "nvim-gps")
if not status then
	return
end

gps.setup()
