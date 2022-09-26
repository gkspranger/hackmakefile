SHELL=/usr/bin/env bash

ENVS := dev stage prod
ROLES := app ws

MAKEFILEDIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
MAKEFILEFILE := $(MAKEFILEDIR)Makefile
MAKEFILECMD := make -f $(MAKEFILEDIR)Makefile

AVAIL_CMDS := Available Commands:
OPTS := Options:
USAGE := Usage:

aenv = $(if $(strip $(env)),$(if $(filter $(env),$(ENVS)),$(env),),EMPTY)
arole = $(if $(strip $(role)),$(if $(filter $(role),$(ROLES)),$(role),),EMPTY)

help:
	@echo $(AVAIL_CMDS)
	@./scripts/help.sh $(MAKEFILEFILE)

# MKHLP: show make all help
allhelp:
	@echo $(USAGE)
	@echo -e "  make all env=<environment> role=<role>\n"
	@echo -e "runs all processes\n"
	@echo $(OPTS)
	@echo "  env		$(ENVS)"
	@echo "  role		$(ROLES)"

# MKHLP: run make all
all:
ifneq ($(aenv),$(env))
	@echo -e "env ($(env)) is not valid\n" && $(MAKEFILECMD) allhelp
else ifneq ($(arole),$(role))
	@echo -e "role ($(role)) is not valid\n" && $(MAKEFILECMD) allhelp
else
	@$(MAKEFILEDIR)scripts/hello.sh $(aenv) $(arole)
endif
