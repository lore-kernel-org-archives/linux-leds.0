From: =?UTF-8?q?Micha=C5=82=20K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Subject: [PATCH 7/7] dell-led: move driver to drivers/platform/x86/dell-wmi-led.c
Date: Thu,  8 Dec 2016 13:36:18 +0100
Message-ID: <20161208123618.28603-8-kernel@kempniu.pl>
References: <20161208123618.28603-1-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161208123618.28603-1-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bob Rodgers <Robert_Rodgers@dell.com>, Louis Davis <Louis_Davis@dell.com>, Jim Dailey <Jim_Dailey@dell.com>, Alex Hung <alex.hung@canonical.com>, Hui Wang <hui.wang@canonical.com>, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The dell-led driver handles a specific WMI GUID present on some Dell
laptops and as such it belongs in the x86 platform driver subsystem.
Source code is moved along with the relevant Kconfig and Makefile
entries with some minor modifications:

  - Kconfig option is renamed from COFIG_LEDS_DELL_NETBOOKS to
    CONFIG_DELL_WMI_LED,

  - the X86 Kconfig dependency is removed as the whole
    drivers/platform/x86 menu depends on it, so there is no need to
    duplicate it,

  - one comment line is updated to reflect the change in the name of the
    module's source file.

Signed-off-by: Michał Kępień <kernel@kempniu.pl>
---
 drivers/leds/Kconfig                                     | 8 --------
 drivers/leds/Makefile                                    | 1 -
 drivers/platform/x86/Kconfig                             | 8 ++++++++
 drivers/platform/x86/Makefile                            | 1 +
 drivers/{leds/dell-led.c => platform/x86/dell-wmi-led.c} | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)
 rename drivers/{leds/dell-led.c => platform/x86/dell-wmi-led.c} (99%)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f29b869..5af3fb2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -454,14 +454,6 @@ config LEDS_ADP5520
 	  To compile this driver as a module, choose M here: the module will
 	  be called leds-adp5520.
 
-config LEDS_DELL_NETBOOKS
-	tristate "External LED on Dell Business Netbooks"
-	depends on LEDS_CLASS
-	depends on X86 && ACPI_WMI
-	help
-	  This adds support for the Latitude 2100 and similar
-	  notebooks that have an external LED.
-
 config LEDS_MC13783
 	tristate "LED Support for MC13XXX PMIC"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 6b82737..558d246 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -52,7 +52,6 @@ obj-$(CONFIG_LEDS_REGULATOR)		+= leds-regulator.o
 obj-$(CONFIG_LEDS_INTEL_SS4200)		+= leds-ss4200.o
 obj-$(CONFIG_LEDS_LT3593)		+= leds-lt3593.o
 obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
-obj-$(CONFIG_LEDS_DELL_NETBOOKS)	+= dell-led.o
 obj-$(CONFIG_LEDS_MC13783)		+= leds-mc13783.o
 obj-$(CONFIG_LEDS_NS2)			+= leds-ns2.o
 obj-$(CONFIG_LEDS_NETXBIG)		+= leds-netxbig.o
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 81b8dcc..f9018e8 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -143,6 +143,14 @@ config DELL_WMI_AIO
 	  To compile this driver as a module, choose M here: the module will
 	  be called dell-wmi-aio.
 
+config DELL_WMI_LED
+	tristate "External LED on Dell Business Netbooks"
+	depends on LEDS_CLASS
+	depends on ACPI_WMI
+	help
+	  This adds support for the Latitude 2100 and similar
+	  notebooks that have an external LED.
+
 config DELL_SMO8800
 	tristate "Dell Latitude freefall driver (ACPI SMO88XX)"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 2efa86d..b061817 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_DELL_SMBIOS)	+= dell-smbios.o
 obj-$(CONFIG_DELL_LAPTOP)	+= dell-laptop.o
 obj-$(CONFIG_DELL_WMI)		+= dell-wmi.o
 obj-$(CONFIG_DELL_WMI_AIO)	+= dell-wmi-aio.o
+obj-$(CONFIG_DELL_WMI_LED)	+= dell-wmi-led.o
 obj-$(CONFIG_DELL_SMO8800)	+= dell-smo8800.o
 obj-$(CONFIG_DELL_RBTN)		+= dell-rbtn.o
 obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
diff --git a/drivers/leds/dell-led.c b/drivers/platform/x86/dell-wmi-led.c
similarity index 99%
rename from drivers/leds/dell-led.c
rename to drivers/platform/x86/dell-wmi-led.c
index e5c5738..7486c01 100644
--- a/drivers/leds/dell-led.c
+++ b/drivers/platform/x86/dell-wmi-led.c
@@ -1,5 +1,5 @@
 /*
- * dell_led.c - Dell LED Driver
+ * dell-wmi-led.c - Dell WMI LED Driver
  *
  * Copyright (C) 2010 Dell Inc.
  * Louis Davis <louis_davis@dell.com>
-- 
2.10.2
