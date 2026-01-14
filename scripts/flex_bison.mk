# Tools
LEX  := flex
YACC := bison -y

# flex bison config
LEX_SRC  := src/config.l
YACC_SRC := src/config.y

LEX_C  := $(OBJ_DIR)/src/lex.yy.c
YACC_C := $(OBJ_DIR)/src/y.tab.c
YACC_H := $(OBJ_DIR)/src/y.tab.h
CSRCS  += $(LEX_C) $(YACC_C)

# flex / bison
$(LEX_C): $(LEX_SRC) $(YACC_H)
	@echo + LEX $<
	@mkdir -p $(dir $@)
	@$(LEX) -o $@ $<

$(YACC_C) $(YACC_H): $(YACC_SRC)
	@echo + YACC $<
	@mkdir -p $(dir $@)
	@$(YACC) -d -o $(YACC_C) $<


