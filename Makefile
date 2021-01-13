CFLAGS = -Wall -O2 -fPIC
LDFLAGS = -shared -lm
INSTALL_DIR = /usr/lib64/lv2/smoothed-echo/
INSTALL_DIR = /tmp/lv2/smoothed-echo/

PLUGINS = smoothed-echo.so

all: $(PLUGINS)
	@echo
	@echo "Now 'make install' to install this LV2 plugin"
	@echo "in $(INSTALL)"
	@echo

clean:
	$(RM) *.o $(PLUGINS)

%.so: %.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $<

install:
	install -D -d -m 755 $(DESTDIR)$(INSTALL_DIR)
	install -m 755 smoothed-echo.so  $(DESTDIR)$(INSTALL_DIR)
	install -m 644 smoothed-echo.ttl $(DESTDIR)$(INSTALL_DIR)
	install -m 644 manifest.ttl.in $(DESTDIR)$(INSTALL_DIR)/manifest.ttl
	sed -i -e "s/@LIB_EXT@/\.so/g" $(DESTDIR)$(INSTALL_DIR)/manifest.ttl
