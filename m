From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: [PATCH v2 4/5] firmware: add SmPL report for custom fallback mechanism
Date: Fri, 16 Dec 2016 03:10:37 -0800
Message-ID: <20161216111038.22064-5-mcgrof@kernel.org>
References: <20161216111038.22064-1-mcgrof@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161216111038.22064-1-mcgrof@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, ming.lei@canonical.com
Cc: daniel.wagner@bmw-carit.de, teg@jklm.no, mchehab@osg.samsung.com, zajec5@gmail.com, linux-kernel@vger.kernel.org, markivx@codeaurora.org, stephen.boyd@linaro.org, broonie@kernel.org, zohar@linux.vnet.ibm.com, tiwai@suse.de, johannes@sipsolutions.net, chunkeey@googlemail.com, hauke@hauke-m.de, jwboyer@fedoraproject.org, dmitry.torokhov@gmail.com, dwmw2@infradead.org, jslaby@suse.com, torvalds@linux-foundation.org, luto@amacapital.net, fengguang.wu@intel.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, Abhay_Salunke@dell.com, Julia.Lawall@lip6.fr, Gilles.Muller@lip6.fr, nicolas.palix@imag.fr, dhowells@redhat.com, bjorn.andersson@linaro.org, arend.vanspriel@broadcom.com, kvalo@codeaurora.org, "Luis R. Rodriguez" <mcgrof@kernel.org>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Even though most distributions today disable the fallback mechanism
by default we've determined that we cannot remove them from the kernel.
This is not well understood so document the reason and logic behind that.

Recent discussions suggest some future userspace development prospects which
may enable fallback mechanisms to become more useful while avoiding some
historical issues. These discussions have made it clear though that there
is less value to the custom fallback mechanism and an alternative can be
provided in the future. Its also clear that some old users of the custom
fallback mechanism were using it as a copy and paste error. Because of
all this add a Coccinelle SmPL patch to help maintainers police for new
incorrect users of the custom fallback mechanism.

Best we can do for now then is police for new users of the custom
fallback mechanism and and fix incorrect users when they are spotted.
Drivers can only be transitioned out of the custom fallback mechanism
once we know old userspace cannot be not be broken by a kernel change.

The current SmPL patch reports:

$ export COCCI=scripts/coccinelle/api/request_firmware-custom-fallback.cocci
$ make coccicheck MODE=report

drivers/leds/leds-lp55xx-common.c:227:8-31: WARNING: please check if driver really needs a custom fallback mechanism
drivers/firmware/dell_rbu.c:622:17-40: WARNING: please check if driver really needs a custom fallback mechanism

Cc: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org
Cc: Abhay Salunke <Abhay_Salunke@dell.com>
Acked-by: Julia.Lawall@lip6.fr
Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
---
 .../driver-api/firmware/fallback-mechanisms.rst    | 17 ++++++++++
 .../api/request_firmware-custom-fallback.cocci     | 37 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 scripts/coccinelle/api/request_firmware-custom-fallback.cocci

diff --git a/Documentation/driver-api/firmware/fallback-mechanisms.rst b/Documentation/driver-api/firmware/fallback-mechanisms.rst
index d19354794e67..b87a292153c6 100644
--- a/Documentation/driver-api/firmware/fallback-mechanisms.rst
+++ b/Documentation/driver-api/firmware/fallback-mechanisms.rst
@@ -28,6 +28,12 @@ CONFIG_FW_LOADER_USER_HELPER_FALLBACK=n
 the kobject uevent fallback mechanism will never take effect even
 for request_firmware_nowait() when uevent is set to true.
 
+Although the fallback mechanisms are not used widely today they cannot be
+removed from the kernel since some old userspace may exist which could
+entirely depend on the fallback mechanism enabled with the kernel config option
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK. In the future though drivers may opt
+to embrace a different API which provides alternative fallback mechanisms.
+
 Justifying the firmware fallback mechanism
 ==========================================
 
@@ -176,6 +182,17 @@ but you want to suppress kobject uevents, as you have a custom solution which
 will monitor for your device addition into the device hierarchy somehow and
 load firmware for you through a custom path.
 
+The custom fallback mechanism can often be enabled by mistake. We currently
+have only 2 users of it, and little justification to enable it for other users.
+Since it is a common driver developer mistake to enable it, help police for
+new users of the custom fallback mechanism with::
+
+        $ export COCCI=scripts/coccinelle/api/request_firmware-avoid-init-probe-init.cocci
+        $ make coccicheck MODE=report
+
+Drivers can only be transitioned out of the custom fallback mechanism
+once we know old userspace cannot be not be broken by a kernel change.
+
 Firmware fallback timeout
 =========================
 
diff --git a/scripts/coccinelle/api/request_firmware-custom-fallback.cocci b/scripts/coccinelle/api/request_firmware-custom-fallback.cocci
new file mode 100644
index 000000000000..c7598cfc4780
--- /dev/null
+++ b/scripts/coccinelle/api/request_firmware-custom-fallback.cocci
@@ -0,0 +1,37 @@
+// Avoid the firmware custom fallback mechanism at all costs
+//
+// request_firmware_nowait() API enables explicit request for use of the custom
+// fallback mechanism if firmware is not found. Chances are high its use is
+// just a copy and paste bug. Before you fix the driver be sure to *verify* no
+// custom firmware loading tool exists that would otherwise break if we replace
+// the driver to use the uevent fallback mechanism.
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
+coccilib.report.print_report(p[0], "WARNING: please check if driver really needs a custom fallback mechanism")
-- 
2.10.1
