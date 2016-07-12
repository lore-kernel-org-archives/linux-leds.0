From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH PROOF OF CONCEPT 3/2] trigger: ledtrig-usbport: read initial state from DT
Date: Tue, 12 Jul 2016 14:35:21 +0200
Message-ID: <1468326921-26485-4-git-send-email-zajec5@gmail.com>
References: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1468326921-26485-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

This allows specifying USB ports that should be observed by a trigger
right after activating it. Example:

usb {
	gpios =3D <&gpio 0 GPIO_ACTIVE_HIGH>;
	linux,default-trigger =3D "usbport";
	usb-controllers =3D <&ohci>, <&ehci>, <&xhci>;
	usb-ports =3D "1", "1", "1";
};

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 drivers/leds/trigger/ledtrig-usbport.c | 72 ++++++++++++++++++++++++++=
++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-usbport.c b/drivers/leds/trig=
ger/ledtrig-usbport.c
index eb20a8f..5724f63 100644
--- a/drivers/leds/trigger/ledtrig-usbport.c
+++ b/drivers/leds/trigger/ledtrig-usbport.c
@@ -12,8 +12,10 @@
 #include <linux/device.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
+#include <linux/usb/provider.h>
 #include "../leds.h"
=20
 struct usbport_trig_port {
@@ -94,6 +96,75 @@ static bool usbport_trig_match(struct usbport_trig_d=
ata *usbport_data,
 	return false;
 }
=20
+static int usbport_trig_new_port(struct usbport_trig_data *usbport_dat=
a,
+				 int busnum, const char *suffix)
+{
+	struct usbport_trig_port *port;
+	size_t len;
+	int tmp;
+
+	tmp =3D busnum;
+	len =3D 1;
+	while (tmp >=3D 10) {
+		tmp /=3D 10;
+		len++;
+	}
+	len++; /* '-' */
+	len +=3D strlen(suffix);
+	len++; /* '\0' */
+
+	port =3D kzalloc(sizeof(*port), GFP_KERNEL);
+	if (!port)
+		return -ENOMEM;
+
+	port->name =3D kzalloc(len, GFP_KERNEL);
+	if (!port->name) {
+		kfree(port);
+		return -ENOMEM;
+	}
+	snprintf(port->name, len, "%d-%s", busnum, suffix);
+
+	list_add_tail(&port->list, &usbport_data->ports);
+
+	return 0;
+}
+
+static int usbport_trig_fill(struct usbport_trig_data *usbport_data)
+{
+	struct device_node *np =3D usbport_data->led_cdev->dev->of_node;
+	struct of_phandle_args args;
+	int count, i;
+	int err =3D 0;
+
+	if (!np)
+		return -ENOENT;
+
+	count =3D of_property_count_strings(np, "usb-ports");
+	if (count < 0)
+		return count;
+
+	for (i =3D 0; i < count; i++) {
+		const char *port;
+		struct usb_hcd *hcd;
+
+		err =3D of_property_read_string_index(np, "usb-ports", i, &port);
+		if (err)
+			continue;
+
+		err =3D of_parse_phandle_with_args(np, "usb-controllers", "#usb-cell=
s", i, &args);
+		if (err)
+			continue;
+
+		hcd =3D of_hcd_get_from_provider(&args);
+		if (!IS_ERR(hcd))
+			usbport_trig_new_port(usbport_data, hcd->self.busnum, port);
+
+		of_node_put(args.np);
+	}
+
+	return err;
+}
+
 static int usbport_trig_notify(struct notifier_block *nb, unsigned lon=
g action,
 			       void *data)
 {
@@ -129,6 +200,7 @@ static void usbport_trig_activate(struct led_classd=
ev *led_cdev)
 		return;
 	usbport_data->led_cdev =3D led_cdev;
 	INIT_LIST_HEAD(&usbport_data->ports);
+	usbport_trig_fill(usbport_data);
 	usbport_data->nb.notifier_call =3D usbport_trig_notify,
 	led_cdev->trigger_data =3D usbport_data;
=20
--=20
1.8.4.5
