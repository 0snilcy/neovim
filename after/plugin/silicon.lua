local status, silicon = pcall(require, "silicon")
if not status then
	return
end

silicon.setup({
	font = "JetBrainsMono NF=16",
	theme = "Visual Studio Dark+",
})
