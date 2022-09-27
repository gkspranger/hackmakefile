SHELL := /usr/bin/env bash

MODULES := apps ops r53

fmt-%:
ifndef $(if $(strip $*),$(if $(filter $(strip $*),$(MODULES)),$(strip $*),),)
	@echo "did bad for $*"
else
	@echo "what am i: $(if $(strip $*),$(if $(filter $(strip $*),$(MODULES)),$(strip $*),),)"
	@echo "do fmt for $*"
endif
