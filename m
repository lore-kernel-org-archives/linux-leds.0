From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: [PATCH v2 4/5] firmware: add usermode helper DECLARE_FW_LOADER_USER() annotation
Date: Thu, 16 Jun 2016 15:54:20 -0700
Message-ID: <1466117661-22075-5-git-send-email-mcgrof@kernel.org>
References: <1466117661-22075-1-git-send-email-mcgrof@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466117661-22075-1-git-send-email-mcgrof@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: ming.lei@canonical.com, akpm@linux-foundation.org, mmarek@suse.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, zohar@linux.vnet.ibm.com, broonie@kernel.org, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, teg@jklm.no, dhowells@redhat.com, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

We need to ensure no one else adds *anything* that requests the
usermode helper without really meaning it, to police it we now have
an SmPL script but no formal annotation is present to help us ensure
the call has been validated.

Add a dummy DECLARE_FW_LOADER_USER() which we can use to annotate
validated calls and also clearly outline the documentation over where
the required usermode helper is documented.

All other future callers can be reported via 0-day by making use of the
Coccinelle SmPL patch.

Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Cc: Abhay Salunke <Abhay_Salunke@dell.com>
Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
---
 drivers/firmware/dell_rbu.c                            | 1 +
 drivers/leds/leds-lp55xx-common.c                      | 1 +
 include/linux/firmware.h                               | 7 +++++++
 scripts/coccinelle/api/request_firmware-usermode.cocci | 9 ++++++++-
 4 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/dell_rbu.c b/drivers/firmware/dell_rbu.c
index 2f452f1f7c8a..53b3869c0900 100644
--- a/drivers/firmware/dell_rbu.c
+++ b/drivers/firmware/dell_rbu.c
@@ -586,6 +586,7 @@ static ssize_t read_rbu_image_type(struct file *filp, struct kobject *kobj,
 	return size;
 }
 
+DECLARE_FW_LOADER_USER("Documentation/dell_rbu.txt");
 static ssize_t write_rbu_image_type(struct file *filp, struct kobject *kobj,
 				    struct bin_attribute *bin_attr,
 				    char *buffer, loff_t pos, size_t count)
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 5377f22ff994..ce1d087979a1 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -219,6 +219,7 @@ out:
 	release_firmware(chip->fw);
 }
 
+DECLARE_FW_LOADER_USER("Documentation/leds/leds-lp55xx.txt");
 static int lp55xx_request_firmware(struct lp55xx_chip *chip)
 {
 	const char *name = chip->cl->name;
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index bdc24ee92823..791ab8632f02 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -8,6 +8,13 @@
 #define FW_ACTION_NOHOTPLUG 0
 #define FW_ACTION_HOTPLUG 1
 
+/*
+ * Helper for scripts/coccinelle/api/request_firmware-usermode.cocci
+ * and so users can also easily search for the respectively needed
+ * usermode helper.
+ */
+#define DECLARE_FW_LOADER_USER(__usermode_helper)
+
 struct firmware {
 	size_t size;
 	const u8 *data;
diff --git a/scripts/coccinelle/api/request_firmware-usermode.cocci b/scripts/coccinelle/api/request_firmware-usermode.cocci
index 94ab95cb7c75..1775fd3067e8 100644
--- a/scripts/coccinelle/api/request_firmware-usermode.cocci
+++ b/scripts/coccinelle/api/request_firmware-usermode.cocci
@@ -17,6 +17,13 @@
 virtual report
 virtual context
 
+@ r0 depends on report || context @
+declarer name DECLARE_FW_LOADER_USER;
+expression E;
+@@
+
+DECLARE_FW_LOADER_USER(E);
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
2.8.2
