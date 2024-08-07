SUBDIRS = resources

AM_CPPFLAGS = $(WX_CXXFLAGS) \
			$(CB_SQUIRREL_CFLAGS) \
			-I$(top_srcdir)/src/sdk/wxscintilla/include \
			-I$(top_srcdir)/src/include

if GTK_NOTEBOOK
GTK_NOTEBOOK_FLAGS = -DUSE_GTK_NOTEBOOK
endif

if CODEBLOCKS_LINUX
AM_CPPFLAGS += -DENABLE_BINRELOC -DAPP_PREFIX="\"@prefix@\"" $(WX_GTK_CFLAGS) $(GTK_NOTEBOOK_FLAGS)
endif

bin_PROGRAMS = codeblocks

# wxMac resource fork/unbundled app
install-exec-hook:
	$(POSTLINK_COMMAND) $(DESTDIR)$(bindir)/codeblocks$(EXEEXT) \
	                    $(srcdir)/resources/icons/app.r
	$(MACSETFILE) -a C $(DESTDIR)$(bindir)/codeblocks$(EXEEXT)

# wxAUI uses GTK+ libraries on wxGTK
# codeblocks_LDFLAGS = $(WX_GTK_LIBS)

codeblocks_LDADD =  ../sdk/libcodeblocks.la \
			$(WX_LIBS) \
			$(WX_GTK_LIBS) \
			$(CB_SQUIRREL_LIBS)

codeblocks_SOURCES = app.cpp \
			appglobals.cpp \
			backtracedlg.cpp \
			breakpointsdlg.cpp \
			compilersettingsdlg.cpp \
			cpuregistersdlg.cpp \
			crashhandler.cpp \
			debugger_interface_creator.cpp \
			debuggermenu.cpp \
			debuggersettingscommonpanel.cpp \
			debuggersettingsdlg.cpp \
			debuggersettingspanel.cpp \
			disassemblydlg.cpp \
			dlgabout.cpp \
			dlgaboutplugin.cpp \
			editkeywordsdlg.cpp \
			editorconfigurationdlg.cpp \
			editprojectglobsdlg.cpp \
			environmentsettingsdlg.cpp \
			examinememorydlg.cpp \
			find_replace.cpp \
			goto_file.cpp \
			infopane.cpp \
			main.cpp \
			manageglobsdlg.cpp \
			notebookstyles.cpp \
			printdlg.cpp \
			projectmanagerui.cpp \
			projectdepsdlg.cpp \
			projectoptionsdlg.cpp \
			recentitemslist.cpp \
			scriptconsole.cpp \
			scriptingsettingsdlg.cpp \
			splashscreen.cpp \
			startherepage.cpp \
			switcherdlg.cpp \
			threadsdlg.cpp \
			uservardlgs.cpp \
			virtualbuildtargetsdlg.cpp \
			watchesdlg.cpp

if CODEBLOCKS_NT
codeblocks_LDADD += resources.$(OBJEXT) -lexchndl -lcomctl32
codeblocks_DEPENDENCIES = resources.$(OBJEXT)
codeblocks_SOURCES += associations.cpp
resources.$(OBJEXT): resources/resources.rc resources/amd64_dpi_aware_on.manifest
	$(WINDRES) $(WX_CPPFLAGS) -DcbDPI_AWARE_ON --include-dir $(top_srcdir)/src $< $@
endif

noinst_HEADERS = app.h \
			appglobals.h \
			backtracedlg.h \
			batchbuild.h \
			breakpointsdlg.h \
			compilersettingsdlg.h \
			cpuregistersdlg.h \
			crashhandler.h \
			debugger_interface_creator.h \
			debuggermenu.h \
			debuggersettingscommonpanel.h \
			debuggersettingsdlg.h \
			debuggersettingspanel.h \
			disassemblydlg.h \
			dlgabout.h \
			dlgaboutplugin.h \
			editkeywordsdlg.h \
			editorconfigurationdlg.h \
			editprojectglobsdlg.h \
			environmentsettingsdlg.h \
			examinememorydlg.h \
			find_replace.h \
			goto_file.h \
			infopane.h \
			main.h \
			manageglobsdlg.h \
			notebookstyles.h \
			printdlg.h \
			projectmanagerui.h \
			projectdepsdlg.h \
			projectoptionsdlg.h \
			recentitemslist.h \
			scriptconsole.h \
			scriptingsettingsdlg.h \
			splashscreen.h \
			startherepage.h \
			switcherdlg.h \
			threadsdlg.h \
			uservardlgs.h \
			virtualbuildtargetsdlg.h \
			watchesdlg.h

man_MANS = codeblocks.1

EXTRA_DIST = associations.cpp \
			associations.h \
			ipc.h \
			ipc.cpp \
			$(man_MANS)
