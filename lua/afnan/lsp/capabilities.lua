local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

local cmp_lsp = prequire("cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)

capabilities = {
	textDocument = {
		callHierarchy = {
			dynamicRegistration = false,
		},
		codeAction = {
			codeActionLiteralSupport = {
				codeActionKind = {
					valueSet = {
						"",
						"quickfix",
						"refactor",
						"refactor.extract",
						"refactor.inline",
						"refactor.rewrite",
						"source",
						"source.organizeImports",
					},
				},
			},
			dataSupport = true,
			dynamicRegistration = true,
			isPreferredSupport = true,
			resolveSupport = {
				properties = {
					"edit",
					"command",
				},
			},
		},
		completion = {
			completionItem = {
				deprecatedSupport = true,
				documentationFormat = {
					"markdown",
					"plaintext",
				},
				insertReplaceSupport = true,
				insertTextModeSupport = { valueSet = { 1, 2 } },
				resolveAdditionalTextEditsSupport = true,
				resolveSupport = {
					properties = {
						"documentation",
						"details",
						"additionalTextEdits",
						"command",
					},
				},
				snippetSupport = true,
			},
			contextSupport = true,
		},
		declaration = {
			linkSupport = true,
		},
		definition = {
			linkSupport = true,
		},
		documentLink = {
			dynamicRegistration = true,
			tooltipSupport = true,
		},
		documentSymbol = {
			hierarchicalDocumentSymbolSupport = true,
			symbolKind = {
				valueSet = {
					1,
					2,
					3,
					4,
					5,
					6,
					7,
					8,
					9,
					10,
					11,
					12,
					13,
					14,
					15,
					16,
					17,
					18,
					19,
					20,
					21,
					22,
					23,
					24,
					25,
					26,
				},
			},
		},
		foldingRange = {
			dynamicRegistration = true,
		},
		formatting = {
			dynamicRegistration = true,
		},
		hover = {
			contentFormat = {
				"markdown",
				"plaintext",
			},
		},
		implementation = {
			linkSupport = true,
		},
		linkedEditingRange = {
			dynamicRegistration = true,
		},
		publishDiagnostics = {
			relatedInformation = true,
			tagSupport = {
				valueSet = {
					1,
					2,
				},
			},
			versionSupport = true,
		},
		rangeFormatting = {
			dynamicRegistration = true,
		},
		rename = {
			dynamicRegistration = true,
			prepareSupport = true,
		},
		signatureHelp = {
			signatureInformation = {
				parameterInformation = {
					labelOffsetSupport = true,
				},
			},
		},
		synchronization = {
			didSave = true,
			willSave = true,
			willSaveWaitUntil = true,
		},
		typeDefinition = {
			linkSupport = true,
		},
	},
	window = {
		showDocument = {
			support = true,
		},
		workDoneProgress = true,
	},
	workspace = {
		applyEdit = true,
		codeLens = {
			refreshSupport = true,
		},
		configuration = true,
		executeCommand = {
			dynamicRegistration = false,
		},
		fileOperations = {
			didCreate = false,
			didDelete = false,
			didRename = false,
			willCreate = false,
			willDelete = false,
			willRename = false,
		},
		symbol = {
			symbolKind = {
				valueSet = {
					1,
					2,
					3,
					4,
					5,
					6,
					7,
					8,
					9,
					10,
					11,
					12,
					13,
					14,
					15,
					16,
					17,
					18,
					19,
					20,
					21,
					22,
					23,
					24,
					25,
					26,
				},
			},
		},
		workspaceEdit = {
			documentChanges = true,
			resourceOperations = {
				"create",
				"rename",
				"delete",
			},
		},
		workspaceFolders = true,
	},
}

return capabilities
