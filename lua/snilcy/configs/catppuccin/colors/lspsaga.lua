local cp = require("catppuccin.palettes").get_palette() -- fetch colors from palette
cp.none = "NONE"

local M = {
	DiagnosticError = {
		fg = cp.red,
	 },
	DiagnosticWarning = {
		fg = cp.yellow,
	 },
	DiagnosticInformation = {
		fg = cp.blue,
	 },
	DiagnosticHint = {
		fg = cp.rosewater,
	 },
	LspFloatWinNormal = {
		bg = cp.none,
	 },
	LspFloatWinBorder = {
		fg = cp.sapphire,
	 },
	LspSagaBorderTitle = {
		fg = cp.flamingo,
	 },
	LspSagaHoverBorder = {
		fg = cp.sapphire,
	 },
	LspSagaRenameBorder = {
		fg = cp.mauve,
	 },
	LspSagaDefPreviewBorder = {
		fg = cp.sapphire,
	 },
	LspSagaCodeActionBorder = {
		fg = cp.sapphire,
	 },
	LspSagaFinderSelection = {
		fg = cp.surface1,
	 },
	LspSagaCodeActionTitle = {
		fg = cp.blue,
	 },
	LspSagaCodeActionContent = {
		fg = cp.lavender,
	 },
	LspSagaSignatureHelpBorder = {
		fg = cp.red,
	 },
	ReferencesCount = {
		fg = cp.lavender,
	 },
	DefinitionCount = {
		fg = cp.lavender,
	 },
	DefinitionIcon = {
		fg = cp.blue,
	 },
	ReferencesIcon = {
		fg = cp.blue,
	 },
	TargetWord = {
		fg = cp.flamingo,
	 },
}

return M
