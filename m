From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH] tools/leds: Add led_hw_brightness_mon program
Date: Sun, 29 Jan 2017 12:52:31 +0100
Message-ID: <1485690751-4824-1-git-send-email-jacek.anaszewski@gmail.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34722 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750849AbdA2Lx4 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 29 Jan 2017 06:53:56 -0500
Received: by mail-wm0-f67.google.com with SMTP id c85so70201320wmi.1
        for <linux-leds@vger.kernel.org>; Sun, 29 Jan 2017 03:53:28 -0800 (PST)
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>

LED subsystem supports POLLPRI on "brightness_hw_changed" sysfs file
of LED class devices. This tool demonstrates how to use the feature.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>
---
 tools/leds/Makefile                |  4 +-
 tools/leds/led_hw_brightness_mon.c | 84 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 tools/leds/led_hw_brightness_mon.c

diff --git a/tools/leds/Makefile b/tools/leds/Makefile
index c03a79e..078b666 100644
--- a/tools/leds/Makefile
+++ b/tools/leds/Makefile
@@ -3,11 +3,11 @@
 CC = $(CROSS_COMPILE)gcc
 CFLAGS = -Wall -Wextra -g -I../../include/uapi
 
-all: uledmon
+all: uledmon led_hw_brightness_mon
 %: %.c
 	$(CC) $(CFLAGS) -o $@ $^
 
 clean:
-	$(RM) uledmon
+	$(RM) uledmon led_hw_brightness_mon
 
 .PHONY: all clean
diff --git a/tools/leds/led_hw_brightness_mon.c b/tools/leds/led_hw_brightness_mon.c
new file mode 100644
index 0000000..1a97064
--- /dev/null
+++ b/tools/leds/led_hw_brightness_mon.c
@@ -0,0 +1,84 @@
+/*
+ * led_hw_brightness_mon.c
+ *
+ * This program monitors LED brightness level changes having its origin
+ * in hardware/firmware, i.e. outside of kernel control.
+ * A timestamp and brightness value is printed each time the brightness changes.
+ *
+ * Usage: led_notify_mon <device-name>
+ *
+ * <device-name> is the name of the LED class device to be monitored. Pressing
+ * CTRL+C will exit.
+ */
+
+#include <errno.h>
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
+	char brightness_file_path[LED_MAX_NAME_SIZE + 11];
+	struct pollfd pollfd;
+	struct timespec ts;
+	char buf[11];
+
+	if (argc != 2) {
+		fprintf(stderr, "Requires <device-name> argument\n");
+		return 1;
+	}
+
+	snprintf(brightness_file_path, LED_MAX_NAME_SIZE,
+		 "/sys/class/leds/%s/brightness_hw_changed", argv[1]);
+
+	fd = open(brightness_file_path, O_RDONLY);
+	if (fd == -1) {
+		printf("Failed to open %s file\n", brightness_file_path);
+		return 1;
+	}
+
+	/*
+	 * read may fail if no hw brightness change has occurred so far,
+	 * but it is required to avoid spurious poll notifications in
+	 * the opposite case.
+	 */
+	read(fd, buf, sizeof(buf));
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
+		ret = lseek(pollfd.fd, 0, SEEK_SET);
+		if (ret < 0) {
+			printf("lseek failed (%d)\n", ret);
+			break;
+		}
+
+		printf("[%ld.%09ld] %d\n", ts.tv_sec, ts.tv_nsec, atoi(buf));
+	}
+
+	close(fd);
+
+	return ret;
+}
-- 
2.1.4
