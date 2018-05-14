# Makefile by Scott Leland Crossen
# @Copyright 2017 Scott Leland Crossen

# ==== Definitions ====

COMP = c++
TMPDIR = tmp
SOURCEDIR = source
RELDIR = rel
OBJS = ${TMPDIR}/dot.o ${TMPDIR}/graph.o ${TMPDIR}/random.o ${TMPDIR}/generate.o
COMPFLAGS =
LINKFLAGS =

# ==== Recipes ====

.PHONY: default
.DEFAULT: default
default: ${RELDIR}/generate

.PHONY: clean
clean:
	rm -rf $(TMPDIR) $(RELDIR)

# ==== Targets ====

.PRECIOUS: ${TMPDIR}/generate.o
${TMPDIR}/generate.o: ${SOURCEDIR}/generate.cpp
	mkdir -p $(@D)
	$(COMP) -c $< -o $@ $(COMPFLAGS)

.PRECIOUS: ${TMPDIR}/%.o
${TMPDIR}/%.o: ${SOURCEDIR}/%.cpp ${SOURCEDIR}/%.h
	mkdir -p $(@D)
	$(COMP) -c $< -o $@ $(COMPFLAGS)

${RELDIR}/%: $(OBJS)
	mkdir -p $(@D)
	$(COMP) $^ -o $@ $(LINKFLAGS)
