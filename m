From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH/RFC] tools/leds: Add led_notify_mon program for monitoring
 brightness changes
Date: Wed, 02 Nov 2016 16:37:38 +0100
Message-ID: <1478101058-7864-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54666 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754454AbcKBPhw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Nov 2016 11:37:52 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>, Hans de Goede <hdegoede@redhat.com>

LED subsystem supports POLLPRI on "brightness" sysfs file of LED
class devices. This tool demonstrates how to use the feature.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Hans de Goede <hdegoede@redhat.com>
---
This app doesn't work properly so far as poll seems not to clear
POLLPRI flag once it is set. Maybe someone will know the reason
or more appropriate approach to handle sysfs_notify_dirent.
To test the feature just checkout branch [0].

[0] https://git.kernel.org/cgit/linux/kernel/git/j.anaszewski/linux-leds.git/commit/?h=pollpri&id=e7fc8d4ece58df6a443b2c760c0a3b505c545571

 tools/leds/Makefile         |  4 +--
 tools/leds/led_notify_mon.c | 77 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+), 2 deletions(-)
 create mode 100644 tools/leds/led_notify_mon.c

diff --git a/tools/leds/Makefile b/tools/leds/Makefile
index c03a79e..0fa948a 100644
--- a/tools/leds/Makefile
+++ b/tools/leds/Makefile
@@ -3,11 +3,11 @@
 CC = $(CROSS_COMPILE)gcc
 CFLAGS = -Wall -Wextra -g -I../../include/uapi
 
-all: uledmon
+all: uledmon led_notify_mon
 %: %.c
 	$(CC) $(CFLAGS) -o $@ $^
 
 clean:
-	$(RM) uledmon
+	$(RM) uledmon led_notify_mon
 
 .PHONY: all clean
diff --git a/tools/leds/led_notify_mon.c b/tools/leds/led_notify_mon.c
new file mode 100644
index 0000000..a6793ba
--- /dev/null
+++ b/tools/leds/led_notify_mon.c
@@ -0,0 +1,77 @@
+/*
+ * led_notify_mon.c
+ *
+ * This program monitors LED brightness change notifications,
+ * either having its origin in the hardware or in the software.
+ * A timestamp and brightness value is printed each time the brightness changes.
+ *
+ * Usage: led_notify_mon <device-name>
+ *
+ * <device-name> is the name of the LED class device to be created. Pressing
+ * CTRL+C will exit.
+ */
+
+#include <fcntl.h>
+#include <poll.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <linux/uleds.h>
+
+int main(int argc, char const *argv[])
+{
+	int fd, ret;
+	char brightness_file_path[LEDS_MAX_NAME_SIZE + 11];
+	struct pollfd pollfd;
+	struct timespec ts;
+	char buf[11];
+
+	if (argc != 2) {
+		fprintf(stderr, "Requires <device-name> argument\n");
+		return 1;
+	}
+
+	snprintf(brightness_file_path, LEDS_MAX_NAME_SIZE,
+		 "/sys/class/leds/%s/brightness", argv[1]);
+
+	fd = open(brightness_file_path, O_RDONLY);
+	if (fd == -1) {
+		printf("Failed to open %s file\n", brightness_file_path);
+		return 1;
+	}
+
+	ret = read(fd, buf, sizeof(buf));
+	if (ret < 0) {
+		printf("Failed to read %s file\n", brightness_file_path);
+		goto err_read;
+	}
+
+	pollfd.fd = fd;
+	pollfd.events = POLLPRI;
+
+	while (1) {
+		ret = poll(&pollfd, 1, -1);
+		if (ret == -1) {
+			printf("Failed to poll %s file (%d)\n",
+				brightness_file_path, ret);
+			ret = 1;
+			break;
+		}
+
+		clock_gettime(CLOCK_MONOTONIC, &ts);
+
+		ret = read(fd, buf, sizeof(buf));
+		if (ret < 0)
+			break;
+
+		printf("[%ld.%09ld] %u\n", ts.tv_sec, ts.tv_nsec, atoi(buf));
+	}
+
+err_read:
+	close(fd);
+
+	return ret;
+}
-- 
1.9.1
