# GNU Make project makefile autogenerated by Premake
ifndef config
  config=debug
endif

ifndef verbose
  SILENT = @
endif

ifndef CC
  CC = gcc
endif

ifndef CXX
  CXX = g++
endif

ifndef AR
  AR = ar
endif

ifeq ($(config),debug)
  OBJDIR     = ../../obj/macosx/debug/efsw-test
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/efsw-test-debug
  DEFINES   += -DDEBUG
  INCLUDES  += -I../../include -I../../src
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -std=c++11 -Wall -Wno-long-long -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../../lib
  LIBS      += -lefsw-static-debug -lpthread -framework CoreFoundation -framework CoreServices
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../lib/libefsw-static-debug.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = ../../obj/macosx/release/efsw-test
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/efsw-test-release
  DEFINES   += -DNDEBUG
  INCLUDES  += -I../../include -I../../src
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -std=c++11 -Wall -Wno-long-long -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -Wl,-x -L../../lib
  LIBS      += -lefsw-static-release -lpthread -framework CoreFoundation -framework CoreServices
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../lib/libefsw-static-release.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),relwithdbginfo)
  OBJDIR     = ../../obj/macosx/relwithdbginfo/efsw-test
  TARGETDIR  = ../../bin
  TARGET     = $(TARGETDIR)/efsw-test-reldbginfo
  DEFINES   += -DNDEBUG
  INCLUDES  += -I../../include -I../../src
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -g -std=c++11 -Wall -Wno-long-long -fPIC
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -L../../lib
  LIBS      += -lefsw-static-reldbginfo -lpthread -framework CoreFoundation -framework CoreServices
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += ../../lib/libefsw-static-reldbginfo.a
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/efsw-test.o \

RESOURCES := \

SHELLTYPE := msdos
ifeq (,$(ComSpec)$(COMSPEC))
  SHELLTYPE := posix
endif
ifeq (/bin,$(findstring /bin,$(SHELL)))
  SHELLTYPE := posix
endif

.PHONY: clean prebuild prelink

all: $(TARGETDIR) $(OBJDIR) prebuild prelink $(TARGET)
	@:

$(TARGET): $(GCH) $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking efsw-test
	$(SILENT) $(LINKCMD)
	$(POSTBUILDCMDS)

$(TARGETDIR):
	@echo Creating $(TARGETDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(TARGETDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(TARGETDIR))
endif

$(OBJDIR):
	@echo Creating $(OBJDIR)
ifeq (posix,$(SHELLTYPE))
	$(SILENT) mkdir -p $(OBJDIR)
else
	$(SILENT) mkdir $(subst /,\\,$(OBJDIR))
endif

clean:
	@echo Cleaning efsw-test
ifeq (posix,$(SHELLTYPE))
	$(SILENT) rm -f  $(TARGET)
	$(SILENT) rm -rf $(OBJDIR)
else
	$(SILENT) if exist $(subst /,\\,$(TARGET)) del $(subst /,\\,$(TARGET))
	$(SILENT) if exist $(subst /,\\,$(OBJDIR)) rmdir /s /q $(subst /,\\,$(OBJDIR))
endif

prebuild:
	$(PREBUILDCMDS)

prelink:
	$(PRELINKCMDS)

ifneq (,$(PCH))
$(GCH): $(PCH)
	@echo $(notdir $<)
	-$(SILENT) cp $< $(OBJDIR)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
endif

$(OBJDIR)/efsw-test.o: ../../src/test/efsw-test.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
