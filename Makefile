# https://aoterodelaroza.github.io/devnotes/modern-fortran-makefiles/
.SUFFIXES:

FC:=gfortran -c
LINKER:=gfortran
#COMPILE.f08 = $(FC) $(FCFLAGS) $(TARGET_ARCH) -c
BUILDDIR := .
SOURCEDIR := .

SOURCES := $(shell find $(SOURCEDIR) -name '*.f90')
OBJECTS := $(addprefix $(BUILDDIR)/,$(SOURCES:%.f90=%.o))
APPLICATION := Application

$(info $$SOURCES is [${SOURCES}])
$(info $$OBJECTS is [${OBJECTS}])

%.o %.mod %.smod: %.f90
        $(FC) -o $*.o $<

main: $(OBJECTS) $(APPLICATION)

$(APPLICATION): $(OBJECTS)
        $(LINKER) $(OBJECTS) -o $(APPLICATION)

.PHONY:  
clean:
        -rm -f *.o *.mod *.smod main $(APPLICATION)