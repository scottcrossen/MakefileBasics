# Makefile by Scott Leland Crossen
# @Copyright 2017 Scott Leland Crossen

# ==== Definitions ====

COMP = c++
BINDIR = bin
SOURCEDIR = source
RELDIR = rel
OBJS = ${BINDIR}/dot.o ${BINDIR}/graph.o ${BINDIR}/random.o ${BINDIR}/generate.o
COMPFLAGS =
LINKFLAGS =

# ==== Recipes ====

.PHONY: default
.DEFAULT: default
default: ${RELDIR}/generate

.PHONY: clean
clean:
	rm -rf $(BINDIR) $(RELDIR)

# ==== Targets ====

.PRECIOUS: ${BINDIR}/%.o
${BINDIR}/%.o: ${SOURCEDIR}/%.cpp
	mkdir -p $(@D)
	$(COMP) -c $< -o $@ $(COMPFLAGS)

${RELDIR}/%: $(OBJS)
	mkdir -p $(@D)
	$(COMP) $^ -o $@ $(LINKFLAGS)
