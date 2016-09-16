From: David Lechner <david@lechnology.com>
Subject: [PATCH v4 3/3] tools/leds: Add uledmon program for monitoring userspace LEDs
Date: Fri, 16 Sep 2016 14:16:50 -0500
Message-ID: <1474053410-24387-4-git-send-email-david@lechnology.com>
References: <1474053410-24387-1-git-send-email-david@lechnology.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1474053410-24387-1-git-send-email-david@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David Lechner <david@lechnology.com>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, Pavel Machek <pavel@ucw.cz>
List-Id: linux-leds@vger.kernel.org

The uleds driver provides userspace LED devices. This tool is used to
create one of these devices and monitor the changes in brighness for
testing purposes.

Signed-off-by: David Lechner <david@lechnology.com>
---
 tools/Makefile        |  7 +++---
 tools/leds/.gitignore |  1 +
 tools/leds/Makefile   | 13 +++++++++++
 tools/leds/uledmon.c  | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+), 3 deletions(-)
 create mode 100644 tools/leds/.gitignore
 create mode 100644 tools/leds/Makefile
 create mode 100644 tools/leds/uledmon.c

diff --git a/tools/Makefile b/tools/Makefile
index daa8fb3..00caacd 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -17,6 +17,7 @@ help:
 	@echo '  hv                     - tools used when in Hyper-V clients'
 	@echo '  iio                    - IIO tools'
 	@echo '  kvm_stat               - top-like utility for displaying kvm statistics'
+	@echo '  leds                   - LEDs  tools'
 	@echo '  lguest                 - a minimal 32-bit x86 hypervisor'
 	@echo '  net                    - misc networking tools'
 	@echo '  perf                   - Linux performance measurement and analysis tool'
@@ -56,7 +57,7 @@ acpi: FORCE
 cpupower: FORCE
 	$(call descend,power/$@)
 
-cgroup firewire hv guest spi usb virtio vm net iio gpio objtool: FORCE
+cgroup firewire hv guest spi usb virtio vm net iio gpio objtool leds: FORCE
 	$(call descend,$@)
 
 liblockdep: FORCE
@@ -126,7 +127,7 @@ acpi_clean:
 cpupower_clean:
 	$(call descend,power/cpupower,clean)
 
-cgroup_clean hv_clean firewire_clean lguest_clean spi_clean usb_clean virtio_clean vm_clean net_clean iio_clean gpio_clean objtool_clean:
+cgroup_clean hv_clean firewire_clean lguest_clean spi_clean usb_clean virtio_clean vm_clean net_clean iio_clean gpio_clean objtool_clean leds_clean:
 	$(call descend,$(@:_clean=),clean)
 
 liblockdep_clean:
@@ -164,6 +165,6 @@ clean: acpi_clean cgroup_clean cpupower_clean hv_clean firewire_clean lguest_cle
 		perf_clean selftests_clean turbostat_clean spi_clean usb_clean virtio_clean \
 		vm_clean net_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
 		freefall_clean build_clean libbpf_clean libsubcmd_clean liblockdep_clean \
-		gpio_clean objtool_clean
+		gpio_clean objtool_clean leds_clean
 
 .PHONY: FORCE
diff --git a/tools/leds/.gitignore b/tools/leds/.gitignore
new file mode 100644
index 0000000..ac96d9f
--- /dev/null
+++ b/tools/leds/.gitignore
@@ -0,0 +1 @@
+uledmon
diff --git a/tools/leds/Makefile b/tools/leds/Makefile
new file mode 100644
index 0000000..c03a79e
--- /dev/null
+++ b/tools/leds/Makefile
@@ -0,0 +1,13 @@
+# Makefile for LEDs tools
+
+CC = $(CROSS_COMPILE)gcc
+CFLAGS = -Wall -Wextra -g -I../../include/uapi
+
+all: uledmon
+%: %.c
+	$(CC) $(CFLAGS) -o $@ $^
+
+clean:
+	$(RM) uledmon
+
+.PHONY: all clean
diff --git a/tools/leds/uledmon.c b/tools/leds/uledmon.c
new file mode 100644
index 0000000..44d8634
--- /dev/null
+++ b/tools/leds/uledmon.c
@@ -0,0 +1,62 @@
+/*
+ * uledmon.c
+ *
+ * This program creates a new userspace LED class device and monitors it. A
+ * timestamp and brightness value is printed each time the brightness changes.
+ *
+ * Usage: uledmon <device-name>
+ *
+ * <device-name> is the name of the LED class device to be created. Pressing
+ * CTRL+C will exit.
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <time.h>
+#include <unistd.h>
+
+#include <linux/uleds.h>
+
+int main(int argc, char const *argv[])
+{
+	struct uleds_user_dev uleds_dev;
+	int fd, ret;
+	unsigned char brightness;
+	struct timespec ts;
+
+	if (argc != 2) {
+		fprintf(stderr, "Requires <device-name> argument\n");
+		return 1;
+	}
+
+	strncpy(uleds_dev.name, argv[1], LEDS_MAX_NAME_SIZE);
+
+	fd = open("/dev/uleds", O_RDWR);
+	if (fd == -1) {
+		perror("Failed to open /dev/uleds");
+		return 1;
+	}
+
+	ret = write(fd, &uleds_dev, sizeof(uleds_dev));
+	if (ret == -1) {
+		perror("Failed to write to /dev/uleds");
+		close(fd);
+		return 1;
+	}
+
+	while (1) {
+		ret = read(fd, &brightness, 1);
+		if (ret == -1) {
+			perror("Failed to read from /dev/uleds");
+			close(fd);
+			return 1;
+		}
+		clock_gettime(CLOCK_MONOTONIC, &ts);
+		printf("[%ld.%09ld] %u\n", ts.tv_sec, ts.tv_nsec, brightness);
+	}
+
+	close(fd);
+
+	return 0;
+}
-- 
2.7.4
