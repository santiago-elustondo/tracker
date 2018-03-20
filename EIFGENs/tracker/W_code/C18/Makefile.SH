case $CONFIG in
'')
	if test ! -f ../config.sh; then
		(echo "Can't find ../config.sh."; exit 1)
	fi 2>/dev/null
	. ../config.sh
	;;
esac
case "$O" in
*/*) cd `expr X$0 : 'X\(.*\)/'` ;;
esac
echo "Compiling C code in C18"
$spitshell >Makefile <<!GROK!THIS!
INCLUDE_PATH =  -I"\$(ISE_LIBRARY)/library/encoding/implementation/include" -I"\$(ISE_LIBRARY)/library/time/spec/include" -I"\$(ISE_LIBRARY)/library/vision2/spec/include" -I"\$(ISE_LIBRARY)/library/vision2/implementation/gtk/Clib" `$ISE_LIBRARY/library/encoding/implementation/unix/Clib/iconv-config --include_path` `$ISE_LIBRARY/library/vision2/implementation/gtk/Clib/vision2-gtk-config --include_path`
SHELL = /bin/sh
CC = $cc
CPP = $cpp
CFLAGS = $wkoptimize $mtccflags $large -DEIF_IEEE_BEHAVIOR -DWORKBENCH -I"$rt_include" -I. \$(INCLUDE_PATH)
CPPFLAGS = $wkoptimize $mtcppflags $large -DWORKBENCH -I"$rt_include" -I. \$(INCLUDE_PATH)
LDFLAGS = $ldflags
CCLDFLAGS = $ccldflags  $windows_flags
LDSHAREDFLAGS =  $mtldsharedflags
EIFLIB = "$rt_lib/$prefix$mt_prefix$wkeiflib$suffix"
EIFTEMPLATES = $rt_templates
LIBS = $mtlibs
MAKE = $make
AR = $ar
LD = $ld
MKDEP = $mkdep \$(DPFLAGS) --
MV = $mv
CP = $cp
RANLIB = $ranlib
RM = $rm -f
FILE_EXIST = $file_exist
RMDIR = $rmdir
X2C = "$x2c"
SHAREDLINK = $sharedlink
SHAREDLIBS = $sharedlibs
SHARED_SUFFIX = $shared_suffix
COMMAND_MAKEFILE = 
START_TEST = $start_test 
END_TEST = $end_test 
CREATE_TEST = $create_test 
SYSTEM_IN_DYNAMIC_LIB = tracker$shared_suffix 
!GROK!THIS!
$spitshell >>Makefile <<'!NO!SUBS!'

.SUFFIXES:.cpp .o

.c.o:
	$(CC) $(CFLAGS) -c $<

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $<

OBJECTS = big_file_C18_c.o 

OLDOBJECTS =  da1547.o da1547d.o ti1545.o ti1545d.o da1543.o da1543d.o da1550.o \
	da1550d.o da1546.o da1546d.o ti1544.o ti1544d.o kl1533.o kl1533d.o \
	da1549.o da1549d.o fi1542.o fi1542d.o da1548.o da1548d.o kl1532.o \
	kl1532d.o yy1524.o yy1524d.o kl1527.o kl1527d.o yy1523.o yy1523d.o \
	kl1529.o kl1529d.o kl1534.o kl1534d.o kl1525.o kl1525d.o yy1522.o \
	yy1522d.o ev1537.o ev1537d.o kl1528.o kl1528d.o kl1539.o kl1539d.o \
	kl1541.o kl1541d.o kl1540.o kl1540d.o kl1526.o kl1526d.o ki1538.o \
	ki1538d.o kl1531.o kl1531d.o kl1536.o kl1536d.o kl1535.o kl1535d.o \
	kl1530.o kl1530d.o uc1520.o uc1520d.o kl1521.o kl1521d.o uc1519.o \
	uc1519d.o uc1518.o uc1518d.o 

all: Cobj18.o

Cobj18.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj18.o $(OBJECTS)
	$(RM) $(OBJECTS)
	$(CREATE_TEST)

clean: local_clean
clobber: local_clobber

local_clean::
	$(RM) core finished *.o

local_clobber:: local_clean
	$(RM) Makefile

!NO!SUBS!
chmod 644 Makefile
$eunicefix Makefile

