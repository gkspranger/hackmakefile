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

define husg
@echo $(USAGE)
@printf "  %s\n\n" $(1)
@printf "%s\n\n" $(2)
@echo $(OPTS)
endef

define hopt
@printf "  %-12s%s\n" $(1) "$(2)"
endef

define hinv
@printf "%s (%s) is not valid\n\n" $(1) $(2)
@$(MAKEFILECMD) $(3)
endef

help:
	@echo $(AVAIL_CMDS)
	@$(MAKEFILEDIR)scripts/help.sh $(MAKEFILEFILE)

# MKHLP: show make all help
allhelp:
	$(call husg, "make all env=<environment> role=<role>", "runs all processes")
	$(call hopt, env, $(ENVS))
	$(call hopt, role, $(ROLES))

# MKHLP: run make all
all:
ifneq ($(aenv),$(env))
	$(call hinv, env, $(env), allhelp)
else ifneq ($(arole),$(role))
	$(call hinv, role, $(role), allhelp)
else
	@$(MAKEFILEDIR)scripts/hello.sh $(aenv) $(arole)
endif
