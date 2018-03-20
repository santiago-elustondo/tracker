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
echo "Compiling C code in C20"
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

OBJECTS = big_file_C20_c.o 

OLDOBJECTS =  fu1614.o fu1614d.o ha1595.o ha1595d.o ha1616.o ha1616d.o ta1598.o \
	ta1598d.o he1606.o he1606d.o bi1609.o bi1609d.o in1594.o in1594d.o \
	bi1605.o bi1605d.o ta1596.o ta1596d.o pr1611.o pr1611d.o pr1607.o \
	pr1607d.o ha1599.o ha1599d.o tr1608.o tr1608d.o ac1593.o ac1593d.o \
	ac1613.o ac1613d.o li1610.o li1610d.o ta1597.o ta1597d.o kl1584.o \
	kl1584d.o kl1587.o kl1587d.o kl1602.o kl1602d.o kl1585.o kl1585d.o \
	kl1588.o kl1588d.o kl1603.o kl1603d.o kl1590.o kl1590d.o kl1600.o \
	kl1600d.o kl1586.o kl1586d.o kl1589.o kl1589d.o kl1604.o kl1604d.o \
	ev1592.o ev1592d.o ev1612.o ev1612d.o kl1591.o kl1591d.o kl1601.o \
	kl1601d.o kl1615.o kl1615d.o 

all: Cobj20.o

Cobj20.o: $(OBJECTS) Makefile
	$(LD) $(LDFLAGS) -r -o Cobj20.o $(OBJECTS)
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

