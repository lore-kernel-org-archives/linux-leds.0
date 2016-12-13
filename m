From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: [PATCH 5/5] firmware: add DECLARE_FW_CUSTOM_FALLBACK() annotation
Date: Mon, 12 Dec 2016 19:08:28 -0800
Message-ID: <20161213030828.17820-6-mcgrof@kernel.org>
References: <20161213030828.17820-1-mcgrof@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161213030828.17820-1-mcgrof@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, ming.lei@canonical.com
Cc: daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

We need to ensure that when driver developers use the custom firmware
fallback mechanism it was not a copy and paste bug. These use cases on
upstream drivers are rare, we only have 2 upstream users and its for
really old drivers. Since valid uses are rare but possible enable a
white-list for its use, and use this same white-list annotation to refer
to the documentation covering the custom use case.

New faulty users can be reported via 0-day now.

Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Cc: Abhay Salunke <Abhay_Salunke@dell.com>
Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
---
 Documentation/driver-api/firmware/fallback-mechanisms.rst     | 7 +++++--
 drivers/firmware/dell_rbu.c                                   | 1 +
 drivers/leds/leds-lp55xx-common.c                             | 1 +
 include/linux/firmware.h                                      | 7 +++++++
 scripts/coccinelle/api/request_firmware-custom-fallback.cocci | 9 ++++++++-
 5 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/firmware/fallback-mechanisms.rst b/Documentation/driver-api/firmware/fallback-mechanisms.rst
index 955c11d6ff9d..b51673e40439 100644
--- a/Documentation/driver-api/firmware/fallback-mechanisms.rst
+++ b/Documentation/driver-api/firmware/fallback-mechanisms.rst
@@ -184,8 +184,11 @@ load firmware for you through a custom path.
 
 The custom fallback mechanism can often be enabled by mistake. We currently
 have only 2 users of it, and little justification to enable it for other users.
-Since it is a common driver developer mistake to enable it, help police for
-new users of the custom fallback mechanism with::
+Since it is a common driver developer mistake to enable it, driver developers
+should use DECLARE_FW_CUSTOM_FALLBACK() to both white-list and validate their
+use and also refer to the documentation for the custom loading solution.
+
+Invalid users of the custom fallback mechanism can be policed using::
 
         $ export COCCI=scripts/coccinelle/api/request_firmware-avoid-init-probe-init.cocci
         $ make coccicheck MODE=report
diff --git a/drivers/firmware/dell_rbu.c b/drivers/firmware/dell_rbu.c
index 2f452f1f7c8a..3f2aa35bc54d 100644
--- a/drivers/firmware/dell_rbu.c
+++ b/drivers/firmware/dell_rbu.c
@@ -586,6 +586,7 @@ static ssize_t read_rbu_image_type(struct file *filp, struct kobject *kobj,
 	return size;
 }
 
+DECLARE_FW_CUSTOM_FALLBACK("Documentation/dell_rbu.txt");
 static ssize_t write_rbu_image_type(struct file *filp, struct kobject *kobj,
 				    struct bin_attribute *bin_attr,
 				    char *buffer, loff_t pos, size_t count)
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 5377f22ff994..04161428ee3b 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -219,6 +219,7 @@ static void lp55xx_firmware_loaded(const struct firmware *fw, void *context)
 	release_firmware(chip->fw);
 }
 
+DECLARE_FW_CUSTOM_FALLBACK("Documentation/leds/leds-lp55xx.txt");
 static int lp55xx_request_firmware(struct lp55xx_chip *chip)
 {
 	const char *name = chip->cl->name;
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index b1f9f0ccb8ac..e6ca19c03dcc 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -8,6 +8,13 @@
 #define FW_ACTION_NOHOTPLUG 0
 #define FW_ACTION_HOTPLUG 1
 
+/*
+ * Helper for scripts/coccinelle/api/request_firmware-custom-fallback.cocci
+ * and so users can also easily search for the documentation for the
+ * respectively needed custom fallback mechanism.
+ */
+#define DECLARE_FW_CUSTOM_FALLBACK(__usermode_helper)
+
 struct firmware {
 	size_t size;
 	const u8 *data;
diff --git a/scripts/coccinelle/api/request_firmware-custom-fallback.cocci b/scripts/coccinelle/api/request_firmware-custom-fallback.cocci
index c7598cfc4780..68cacab35b76 100644
--- a/scripts/coccinelle/api/request_firmware-custom-fallback.cocci
+++ b/scripts/coccinelle/api/request_firmware-custom-fallback.cocci
@@ -17,6 +17,13 @@
 virtual report
 virtual context
 
+@ r0 depends on report || context @
+declarer name DECLARE_FW_CUSTOM_FALLBACK;
+expression E;
+@@
+
+DECLARE_FW_CUSTOM_FALLBACK(E);
+
 @ r1 depends on report || context @
 expression mod, name, dev, gfp, drv, cb;
 position p;
@@ -30,7 +37,7 @@ position p;
 *request_firmware_nowait@p(mod, FW_ACTION_NOHOTPLUG, name, dev, gfp, drv, cb)
 )
 
-@script:python depends on report@
+@script:python depends on report && !r0 @
 p << r1.p;
 @@
 
-- 
2.10.1
