.PHONY: fmt
fmt:
	stylua *.lua lua/*

.PHONY: lint
lint:
	luacheck --config=".luacheckrc" *.lua lua/*
