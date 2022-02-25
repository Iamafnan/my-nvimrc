local M = {}

local function prequire(...)
	local status, lib = pcall(require, ...)
	if status then
		return lib
	end
	return nil
end

M.capabilities = function()
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
end

M.on_attach = function(client)
	local wk = prequire("whick-key")

	-- Signature Help
	require("lsp_signature").on_attach()

	local cmd = vim.api.nvim_command

	-- Disable formatting
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

	-- document highlights
	if client.resolved_capabilities.document_highlight then
		cmd([[ augroup document_highlight ]])
		cmd([[ autocmd! * <buffer> ]])
		cmd([[ autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight() ]])
		cmd([[ autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references() ]])
		cmd([[ augroup END ]])
	end

	-- Some keymaps for jsonls
	if client.name == "jsonls" then
		local mappings = {
			P = {
				name = "Package Info",
				s = { ":lua require('package-info').show()<CR>", "Show Package Version" },
				h = { ":lua require('package-info').hide()<CR>", "Hide Package Version" },
				u = { ":lua require('package-info').update()<CR>", "Update Package" },
				d = { ":lua require('package-info').delete()<CR>", "Delete Package" },
				i = { ":lua require('package-info').install()<CR>", "Install New Package" },
				r = { ":lua require('package-info').reinstall()<CR>", "Reinstall Package" },
				c = { ":lua require('package-info').change_version()<CR>", "Change Package Version" },
			},
		}
		local opts = { prefix = ",", icons = { group = "➜" } }
		wk.register(mappings, opts)
	end
end

M.borders = function()
	return {
		{ " " },
		{ " " },
		{ " " },
		{ " " },
		{ " " },
		{ " " },
		{ " " },
		{ " " },
	}
end

M.diagnosticsCode = function()
	return {
		no_matching_function = {
			message = " Can't find a matching function",
			"redundant-parameter",
			"ovl_no_viable_function_in_call",
		},
		empty_block = {
			message = " That shouldn't be empty here",
			"empty-block",
		},
		missing_symbol = {
			message = " Here should be a symbol",
			"miss-symbol",
		},
		expected_semi_colon = {
			message = " Remember the `;` or `,`",
			"expected_semi_declaration",
			"miss-sep-in-table",
			"invalid_token_after_toplevel_declarator",
		},
		redefinition = {
			message = " That variable was defined before",
			"redefinition",
			"redefined-local",
		},
		no_matching_variable = {
			message = " Can't find that variable",
			"undefined-global",
			"reportUndefinedVariable",
		},
		trailing_whitespace = {
			message = " Remove trailing whitespace",
			"trailing-whitespace",
			"trailing-space",
		},
		unused_variable = {
			message = " Don't define variables you don't use",
			"unused-local",
		},
		unused_function = {
			message = " Don't define functions you don't use",
			"unused-function",
		},
		useless_symbols = {
			message = " Remove that useless symbols",
			"unknown-symbol",
		},
		wrong_type = {
			message = " Try to use the correct types",
			"init_conversion_failed",
		},
		undeclared_variable = {
			message = " Have you delcared that variable somewhere?",
			"undeclared_var_use",
		},
		lowercase_global = {
			message = " Should that be a global? (if so make it uppercase)",
			"lowercase-global",
		},
	}
end

M.kind = function()
	return {
		Text = "  ",
		Method = "  ",
		Function = "  ",
		Constructor = "  ",
		Field = "  ",
		Variable = "[]",
		Class = " פּ ",
		Interface = " 蘒 ",
		Module = "  ",
		Property = "  ",
		Unit = "  ",
		Value = "  ",
		Enum = "  ",
		Keyword = "  ",
		Snippet = "  ",
		Color = "  ",
		File = "  ",
		Reference = "  ",
		Folder = "  ",
		EnumMember = "  ",
		Constant = "  ",
		Struct = "  ",
		Event = "  ",
		Operator = "  ",
		TypeParameter = "  ",
	}
end

return M
