From: Michal Sojka <sojka@merica.cz>
Subject: [PATCH v5 3/3] usb: Add LED triggers for USB activity
Date: Fri, 29 Aug 2014 15:07:43 +0200
Message-ID: <1409317663-31160-4-git-send-email-sojka@merica.cz>
References: <87k35rihcc.fsf@steelpick.2x.cz>
 <1409317663-31160-1-git-send-email-sojka@merica.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1409317663-31160-1-git-send-email-sojka@merica.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Michal Sojka <sojka@merica.cz>, Alan Stern <stern@rowland.harvard.edu>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz
List-Id: linux-leds@vger.kernel.org

With this patch, USB activity can be signaled by blinking a LED. There
are two triggers, one for activity on USB host and one for USB gadget.

Both triggers should work with all host/device controllers. Tested only
with musb.

Performace: I measured performance overheads on ARM Cortex-A8 (TI
AM335x) running on 600 MHz.

Duration of usb_led_activity():
- with no LED attached to the trigger:        2 =C2=B1 1 =C2=B5s
- with one GPIO LED attached to the trigger:  2 =C2=B1 1 =C2=B5s or 8 =C2=
=B1 2 =C2=B5s (two peaks in histogram)

Duration of functions calling usb_led_activity() (with this patch
applied and no LED attached to the trigger):
- __usb_hcd_giveback_urb():    10 - 25 =C2=B5s
- usb_gadget_giveback_request(): 2 - 6 =C2=B5s

Signed-off-by: Michal Sojka <sojka@merica.cz>
---
 drivers/usb/Kconfig               | 10 +++++++
 drivers/usb/common/Makefile       |  1 +
 drivers/usb/common/led.c          | 57 +++++++++++++++++++++++++++++++=
++++++++
 drivers/usb/core/hcd.c            |  2 ++
 drivers/usb/gadget/udc/udc-core.c |  4 +++
 include/linux/usb.h               | 12 +++++++++
 6 files changed, 86 insertions(+)
 create mode 100644 drivers/usb/common/led.c

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index e0cad441..9d9cc3b 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -147,4 +147,14 @@ source "drivers/usb/phy/Kconfig"
=20
 source "drivers/usb/gadget/Kconfig"
=20
+config USB_LED_TRIG
+	bool "USB LED Triggers"
+	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
+	help
+	  This option adds LED triggers for USB host and/or gadget activity.
+
+	  Say Y here if you are working on a system with led-class supported
+	  LEDs and you want to use them as activity indicators for USB host o=
r
+	  gadget.
+
 endif # USB_SUPPORT
diff --git a/drivers/usb/common/Makefile b/drivers/usb/common/Makefile
index 052c120..ca2f8bd 100644
--- a/drivers/usb/common/Makefile
+++ b/drivers/usb/common/Makefile
@@ -4,5 +4,6 @@
=20
 obj-$(CONFIG_USB_COMMON)	  +=3D usb-common.o
 usb-common-y			  +=3D common.o
+usb-common-$(CONFIG_USB_LED_TRIG) +=3D led.o
=20
 obj-$(CONFIG_USB_OTG_FSM) +=3D usb-otg-fsm.o
diff --git a/drivers/usb/common/led.c b/drivers/usb/common/led.c
new file mode 100644
index 0000000..df23da0
--- /dev/null
+++ b/drivers/usb/common/led.c
@@ -0,0 +1,57 @@
+/*
+ * LED Triggers for USB Activity
+ *
+ * Copyright 2014 Michal Sojka <sojka@merica.cz>
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/usb.h>
+
+#define BLINK_DELAY 30
+
+static unsigned long usb_blink_delay =3D BLINK_DELAY;
+
+DEFINE_LED_TRIGGER(ledtrig_usb_gadget);
+DEFINE_LED_TRIGGER(ledtrig_usb_host);
+
+void usb_led_activity(enum usb_led_event ev)
+{
+	struct led_trigger *trig =3D NULL;
+
+	switch (ev) {
+	case USB_LED_EVENT_GADGET:
+		trig =3D ledtrig_usb_gadget;
+		break;
+	case USB_LED_EVENT_HOST:
+		trig =3D ledtrig_usb_host;
+		break;
+	}
+	/* led_trigger_blink_oneshot() handles trig =3D=3D NULL gracefully */
+	led_trigger_blink_oneshot(trig, &usb_blink_delay, &usb_blink_delay, 0=
);
+}
+EXPORT_SYMBOL_GPL(usb_led_activity);
+
+
+static int __init ledtrig_usb_init(void)
+{
+	led_trigger_register_simple("usb-gadget", &ledtrig_usb_gadget);
+	led_trigger_register_simple("usb-host", &ledtrig_usb_host);
+	return 0;
+}
+
+static void __exit ledtrig_usb_exit(void)
+{
+	led_trigger_unregister_simple(ledtrig_usb_gadget);
+	led_trigger_unregister_simple(ledtrig_usb_host);
+}
+
+module_init(ledtrig_usb_init);
+module_exit(ledtrig_usb_exit);
diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 487abcf..409cb95 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -1664,6 +1664,8 @@ static void __usb_hcd_giveback_urb(struct urb *ur=
b)
 	usbmon_urb_complete(&hcd->self, urb, status);
 	usb_anchor_suspend_wakeups(anchor);
 	usb_unanchor_urb(urb);
+	if (likely(status =3D=3D 0))
+		usb_led_activity(USB_LED_EVENT_HOST);
=20
 	/* pass ownership to the completion handler */
 	urb->status =3D status;
diff --git a/drivers/usb/gadget/udc/udc-core.c b/drivers/usb/gadget/udc=
/udc-core.c
index 29789f1..f272cf0 100644
--- a/drivers/usb/gadget/udc/udc-core.c
+++ b/drivers/usb/gadget/udc/udc-core.c
@@ -27,6 +27,7 @@
=20
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
+#include <linux/usb.h>
=20
 /**
  * struct usb_udc - describes one usb device controller
@@ -116,6 +117,9 @@ EXPORT_SYMBOL_GPL(usb_gadget_unmap_request);
 void usb_gadget_giveback_request(struct usb_ep *ep,
 		struct usb_request *req)
 {
+	if (likely(req->status =3D=3D 0))
+		usb_led_activity(USB_LED_EVENT_GADGET);
+
 	if (likely(req->complete))
 		req->complete(ep, req);
 	else
diff --git a/include/linux/usb.h b/include/linux/usb.h
index d2465bc..447a7e2 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -1862,6 +1862,18 @@ extern void usb_unregister_notify(struct notifie=
r_block *nb);
 /* debugfs stuff */
 extern struct dentry *usb_debug_root;
=20
+/* LED triggers */
+enum usb_led_event {
+	USB_LED_EVENT_HOST =3D 0,
+	USB_LED_EVENT_GADGET =3D 1,
+};
+
+#ifdef CONFIG_USB_LED_TRIG
+extern void usb_led_activity(enum usb_led_event ev);
+#else
+static inline void usb_led_activity(enum usb_led_event ev) {}
+#endif
+
 #endif  /* __KERNEL__ */
=20
 #endif
--=20
2.1.0
