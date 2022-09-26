SHELL=/usr/bin/env bash

ENVS := dev stage prod

sweet_new_fn = Variable Name: $(0) First: $(1) Second: $(2) Empty Variable: $(3)

define myfun
echo "Variable Name: $(0) First: $(1) Second: $(2) Empty Variable: $(3)"
endef

define testme
hello = $(strip $1)
	@echo $(hello)
endef


all:
	$(call testme, "hello", "hello")
	@echo world

# define generate_file
# 	echo $(1)
# endef

# all:
# 	$(call generate_file,John Doe,101)
# 	$(call generate_file,Peter Pan,102)
