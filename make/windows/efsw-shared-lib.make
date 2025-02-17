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
  OBJDIR     = ../../obj/windows/debug/efsw-shared-lib
  TARGETDIR  = ../../lib
  TARGET     = $(TARGETDIR)/efsw-debug.dll
  DEFINES   += -DEFSW_DYNAMIC -DEFSW_EXPORTS -DDEBUG
  INCLUDES  += -I../../include -I../../src
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -g -std=c++11 -Wall -Wno-long-long
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -shared -Wl,--out-implib="../../lib/libefsw-debug.a"
  LIBS      += 
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),release)
  OBJDIR     = ../../obj/windows/release/efsw-shared-lib
  TARGETDIR  = ../../lib
  TARGET     = $(TARGETDIR)/efsw.dll
  DEFINES   += -DEFSW_DYNAMIC -DEFSW_EXPORTS -DNDEBUG
  INCLUDES  += -I../../include -I../../src
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -std=c++11 -Wall -Wno-long-long
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -s -shared -Wl,--out-implib="../../lib/libefsw.a"
  LIBS      += 
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

ifeq ($(config),relwithdbginfo)
  OBJDIR     = ../../obj/windows/relwithdbginfo/efsw-shared-lib
  TARGETDIR  = ../../lib
  TARGET     = $(TARGETDIR)/efsw.dll
  DEFINES   += -DEFSW_DYNAMIC -DEFSW_EXPORTS -DNDEBUG
  INCLUDES  += -I../../include -I../../src
  CPPFLAGS  += -MMD -MP $(DEFINES) $(INCLUDES)
  CFLAGS    += $(CPPFLAGS) $(ARCH) -O2 -g -std=c++11 -Wall -Wno-long-long
  CXXFLAGS  += $(CFLAGS) 
  LDFLAGS   += -shared -Wl,--out-implib="../../lib/libefsw.a"
  LIBS      += 
  RESFLAGS  += $(DEFINES) $(INCLUDES) 
  LDDEPS    += 
  LINKCMD    = $(CXX) -o $(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(ARCH) $(LIBS)
  define PREBUILDCMDS
  endef
  define PRELINKCMDS
  endef
  define POSTBUILDCMDS
  endef
endif

OBJECTS := \
	$(OBJDIR)/Debug.o \
	$(OBJDIR)/DirWatcherGeneric.o \
	$(OBJDIR)/DirectorySnapshot.o \
	$(OBJDIR)/DirectorySnapshotDiff.o \
	$(OBJDIR)/FileInfo.o \
	$(OBJDIR)/FileSystem.o \
	$(OBJDIR)/FileWatcher.o \
	$(OBJDIR)/FileWatcherCWrapper.o \
	$(OBJDIR)/FileWatcherGeneric.o \
	$(OBJDIR)/FileWatcherImpl.o \
	$(OBJDIR)/FileWatcherWin32.o \
	$(OBJDIR)/Log.o \
	$(OBJDIR)/Mutex.o \
	$(OBJDIR)/String.o \
	$(OBJDIR)/System.o \
	$(OBJDIR)/Watcher.o \
	$(OBJDIR)/WatcherGeneric.o \
	$(OBJDIR)/WatcherWin32.o \
	$(OBJDIR)/Thread.o \
	$(OBJDIR)/FileSystemImpl.o \
	$(OBJDIR)/MutexImpl.o \
	$(OBJDIR)/SystemImpl.o \
	$(OBJDIR)/ThreadImpl.o \

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
	@echo Linking efsw-shared-lib
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
	@echo Cleaning efsw-shared-lib
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

$(OBJDIR)/Debug.o: ../../src/efsw/Debug.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DirWatcherGeneric.o: ../../src/efsw/DirWatcherGeneric.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DirectorySnapshot.o: ../../src/efsw/DirectorySnapshot.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/DirectorySnapshotDiff.o: ../../src/efsw/DirectorySnapshotDiff.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileInfo.o: ../../src/efsw/FileInfo.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileSystem.o: ../../src/efsw/FileSystem.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileWatcher.o: ../../src/efsw/FileWatcher.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileWatcherCWrapper.o: ../../src/efsw/FileWatcherCWrapper.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileWatcherGeneric.o: ../../src/efsw/FileWatcherGeneric.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileWatcherImpl.o: ../../src/efsw/FileWatcherImpl.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileWatcherWin32.o: ../../src/efsw/FileWatcherWin32.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Log.o: ../../src/efsw/Log.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Mutex.o: ../../src/efsw/Mutex.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/String.o: ../../src/efsw/String.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/System.o: ../../src/efsw/System.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Watcher.o: ../../src/efsw/Watcher.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/WatcherGeneric.o: ../../src/efsw/WatcherGeneric.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/WatcherWin32.o: ../../src/efsw/WatcherWin32.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/Thread.o: ../../src/efsw/Thread.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/FileSystemImpl.o: ../../src/efsw/platform/win/FileSystemImpl.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/MutexImpl.o: ../../src/efsw/platform/win/MutexImpl.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/SystemImpl.o: ../../src/efsw/platform/win/SystemImpl.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"
$(OBJDIR)/ThreadImpl.o: ../../src/efsw/platform/win/ThreadImpl.cpp
	@echo $(notdir $<)
	$(SILENT) $(CXX) $(CXXFLAGS) -o "$@" -c "$<"

-include $(OBJECTS:%.o=%.d)
