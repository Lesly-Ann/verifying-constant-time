export WD          ?= ${PWD}
export LIBS        ?= 
export EXAMPLE     ?= donna.c
export ENTRYPOINTS ?= curve25519_donna_wrapper
export UNROLL      ?= 45
export LOOPLIMIT   ?= 64

.PHONY: donna

donna:
	make -C ../../bin verify

donna-%:
	@make -C ../../bin $*
