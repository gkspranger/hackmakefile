.DEFAULT_GOAL := help

SHELL=/usr/bin/env bash

env =
role =

include dev-app.mk
include stage-ws.mk

doit:
	@echo "doing it"
	@echo "env: $(env)"
	@echo "role: $(role)"

help:
	@echo $(MAKEFILE_LIST)
