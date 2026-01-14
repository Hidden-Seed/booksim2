.DEFAULT_GOAL := app

PROG = $(BUILD_DIR)/$(NAME)

# Tools
CC  := gcc
CXX := g++
LD  := $(CXX)

# Falgs for cpp
INCLUDES  = $(addprefix -I, $(INC_PATH))
CPPFLAGS += -O2 -MMD -g -Wall -Werror $(INCLUDES)
LDFLAGS  += -O2

# Compile C/C++
$(OBJ_DIR)/%.o: %.cpp
	@echo + CXX $<
	@mkdir -p $(dir $@)
	@$(CXX) $(CPPFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: %.c
	@echo + CC $<
	@mkdir -p $(dir $@)
	@$(CC) $(CPPFLAGS) -c $< -o $@

# build/xxx.o
OBJS := $(CSRCS:%.c=$(OBJ_DIR)/%.o) $(CXXSRCS:%.cpp=$(OBJ_DIR)/%.o)

.PHONY: app clean

app: $(PROG)

$(PROG): $(OBJS)
	@echo + LD $@
	@$(LD) $(LFLAGS) $^ -o $@

-include $(OBJS:.o=.d)

clean:
	-rm -rf $(PROG) $(OBJ_DIR)
