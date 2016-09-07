From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: [PATCH v4 3/5] firmware: update usermode helper docs and add SmPL report
Date: Tue,  6 Sep 2016 17:42:08 -0700
Message-ID: <1473208930-6835-4-git-send-email-mcgrof@kernel.org>
References: <1471999507-913-1-git-send-email-mcgrof@kernel.org>
 <1473208930-6835-1-git-send-email-mcgrof@kernel.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:54998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756166AbcIGAm3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 6 Sep 2016 20:42:29 -0400
In-Reply-To: <1473208930-6835-1-git-send-email-mcgrof@kernel.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: ming.lei@canonical.com, akpm@linux-foundation.org, gregkh@linuxfoundation.org
Cc: daniel.wagner@bmw-carit.de, mmarek@suse.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, zohar@linux.vnet.ibm.com, broonie@kernel.org, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, teg@jklm.no, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-leds@vger.kernel.org

We've determined that very sadly we cannot nuke the usermode helper.
The firmware code is a bit hard to follow, and so is the history,
document the reasons for why we cannot remove the usermode helper and
the only thing we can do is compartamentalize it.

While it, add a Coccinelle SmPL patch to help maintainers police
for *infidels* still using the usermode helper. Its accepted that perhaps
we can't get rid of all use cases, as otherwise we'd break userspace, so
best we can do is go on a hunt and fix incorrect users of it. Drivers
can only be transitioned out of the usermode helper once we know old
userspace cannot be not be broken by a kernel change.

The current SmPL patch reports:

$ export COCCI=scripts/coccinelle/api/request_firmware-usermode.cocci
$ make coccicheck MODE=report

drivers/leds/leds-lp55xx-common.c:227:8-31: WARNING: please check if user really needs the usermode helper
drivers/firmware/dell_rbu.c:622:17-40: WARNING: please check if user really needs the usermode helper

Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Cc: Abhay Salunke <Abhay_Salunke@dell.com>
Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
---
 Documentation/firmware_class/README                | 36 ++++++++++++++++++---
 .../coccinelle/api/request_firmware-usermode.cocci | 37 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 5 deletions(-)
 create mode 100644 scripts/coccinelle/api/request_firmware-usermode.cocci

diff --git a/Documentation/firmware_class/README b/Documentation/firmware_class/README
index 20aca5901785..9f8b2daf4c7c 100644
--- a/Documentation/firmware_class/README
+++ b/Documentation/firmware_class/README
@@ -33,7 +33,7 @@
 	than 256, user should pass 'firmware_class.path=$CUSTOMIZED_PATH'
 	if firmware_class is built in kernel(the general situation)
 
- 2), userspace:
+ 2), userspace: (AVOID)
  	- /sys/class/firmware/xxx/{loading,data} appear.
 	- hotplug gets called with a firmware identifier in $FIRMWARE
 	  and the usual hotplug environment.
@@ -41,14 +41,14 @@
 
  3), kernel: Discard any previous partial load.
 
- 4), userspace:
+ 4), userspace: (AVOID)
 		- hotplug: cat appropriate_firmware_image > \
 					/sys/class/firmware/xxx/data
 
  5), kernel: grows a buffer in PAGE_SIZE increments to hold the image as it
 	 comes in.
 
- 6), userspace:
+ 6), userspace: (AVOID)
 		- hotplug: echo 0 > /sys/class/firmware/xxx/loading
 
  7), kernel: request_firmware() returns and the driver has the firmware
@@ -66,8 +66,8 @@
 	 	copy_fw_to_device(fw_entry->data, fw_entry->size);
 	 release_firmware(fw_entry);
 
- Sample/simple hotplug script:
- ============================
+ Sample/simple hotplug script: (AVOID)
+ ==========================================
 
 	# Both $DEVPATH and $FIRMWARE are already provided in the environment.
 
@@ -116,6 +116,32 @@ If you're a maintainer you can help police this with:
 $ export COCCI=scripts/coccinelle/api/request_firmware-avoid-init-probe-init.cocci
 $ make coccicheck MODE=report
 
+Usermode helper
+===============
+
+The firmware API supports a usermode helper that lets userspace fetch and
+hand off firmware to a driver through sysfs. While in theory this was a
+nice feature it also presented many issues, so in practice it should be
+avoided at all costs now.
+
+Only drivers that have a really good reason for a usermode helper should
+use it. This use case must be well documented. You should try really hard
+to avoid it, at all costs.
+
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK: disabled by most distributions now
+CONFIG_FW_LOADER_USER_HELPER: still enabled by most disributions
+
+When CONFIG_FW_LOADER_USER_HELPER_FALLBACK is enabled request_firmware()
+*always* calls the usermode helpers. When CONFIG_FW_LOADER_USER_HELPER is
+enabled, only if you specifically ask for it wil the usermode helper be
+called. If CONFIG_FW_LOADER_USER_HELPER_FALLBACK is disabled drivers can
+still require the usermode helper by using request_firmware_nowait().
+
+To help police for user of the usermode helper you can use:
+
+$ export COCCI=scripts/coccinelle/api/request_firmware-avoid-init-probe-init.cocci
+$ make coccicheck MODE=report
+
  about in-kernel persistence:
  ---------------------------
  Under some circumstances, as explained below, it would be interesting to keep
diff --git a/scripts/coccinelle/api/request_firmware-usermode.cocci b/scripts/coccinelle/api/request_firmware-usermode.cocci
new file mode 100644
index 000000000000..94ab95cb7c75
--- /dev/null
+++ b/scripts/coccinelle/api/request_firmware-usermode.cocci
@@ -0,0 +1,37 @@
+// Avoid the usermode helper at all costs
+//
+// request_firmware_nowait() API enables explicit request for the
+// usermode helper. Chances are high its use is just a copy and
+// paste bug. Before you fix the driver be sure to *verify* no
+// usermode helper tool exists that would otherwise break if
+// we replace the driver to use a non-usermode helper variant.
+//
+// Confidence: High
+//
+// Reason for low confidence:
+//
+// Copyright: (C) 2016 Luis R. Rodriguez <mcgrof@kernel.org> GPLv2.
+//
+// Options: --include-headers
+
+virtual report
+virtual context
+
+@ r1 depends on report || context @
+expression mod, name, dev, gfp, drv, cb;
+position p;
+@@
+
+(
+*request_firmware_nowait@p(mod, false, name, dev, gfp, drv, cb)
+|
+*request_firmware_nowait@p(mod, 0, name, dev, gfp, drv, cb)
+|
+*request_firmware_nowait@p(mod, FW_ACTION_NOHOTPLUG, name, dev, gfp, drv, cb)
+)
+
+@script:python depends on report@
+p << r1.p;
+@@
+
+coccilib.report.print_report(p[0], "WARNING: please check if user really needs the usermode helper")
-- 
2.9.2
