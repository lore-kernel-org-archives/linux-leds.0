From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V4 2/2] usb: core: read USB ports from DT in the usbport LED trigger driver
Date: Tue, 30 May 2017 11:27:05 +0200
Message-ID: <20170530092706.927-3-zajec5@gmail.com>
References: <20170529140142.13496-2-zajec5@gmail.com>
 <20170530092706.927-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170530092706.927-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This uses DT info to read relation description of LEDs and USB ports. If
DT has properly described LEDs, trigger will know when to turn them on.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: Update to use "led-triggers"
V3: Update to use "trigger-sources"
---
 drivers/usb/core/ledtrig-usbport.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index 1713248ab15a..29c9202226bf 100644
--- a/drivers/usb/core/ledtrig-usbport.c
+++ b/drivers/usb/core/ledtrig-usbport.c
@@ -11,8 +11,10 @@
 #include <linux/device.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <linux/usb.h>
+#include <linux/usb/of.h>
 
 struct usbport_trig_data {
 	struct led_classdev *led_cdev;
@@ -123,6 +125,56 @@ static const struct attribute_group ports_group = {
  * Adding & removing ports
  ***************************************/
 
+/**
+ * usbport_trig_port_observed - Check if port should be observed
+ */
+static bool usbport_trig_port_observed(struct usbport_trig_data *usbport_data,
+				       struct usb_device *usb_dev, int port1)
+{
+	struct device *dev = usbport_data->led_cdev->dev;
+	struct device_node *led_np = dev->of_node;
+	struct of_phandle_args args;
+	struct device_node *port_np;
+	int count, i;
+
+	if (!led_np)
+		return false;
+
+	/* Get node of port being added */
+	port_np = usb_of_get_child_node(usb_dev->dev.of_node, port1);
+	if (!port_np)
+		return false;
+
+	/* Amount of trigger sources for this LED */
+	count = of_count_phandle_with_args(led_np, "trigger-sources",
+					   "#source-cells");
+	if (count < 0) {
+		dev_warn(dev, "Failed to get trigger sources for %s\n",
+			 led_np->full_name);
+		return false;
+	}
+
+	/* Check list of sources for this specific port */
+	for (i = 0; i < count; i++) {
+		int err;
+
+		err = of_parse_phandle_with_args(led_np, "trigger-sources",
+						 "#source-cells", i, &args);
+		if (err) {
+			dev_err(dev, "Failed to get trigger source phandle at index %d: %d\n",
+				i, err);
+			continue;
+		}
+
+		of_node_put(args.np);
+
+		if (args.np == port_np)
+			return true;
+	}
+
+	return false;
+}
+
 static int usbport_trig_add_port(struct usbport_trig_data *usbport_data,
 				 struct usb_device *usb_dev,
 				 const char *hub_name, int portnum)
@@ -141,6 +193,8 @@ static int usbport_trig_add_port(struct usbport_trig_data *usbport_data,
 	port->data = usbport_data;
 	port->hub = usb_dev;
 	port->portnum = portnum;
+	port->observed = usbport_trig_port_observed(usbport_data, usb_dev,
+						    portnum);
 
 	len = strlen(hub_name) + 8;
 	port->port_name = kzalloc(len, GFP_KERNEL);
@@ -255,6 +309,7 @@ static void usbport_trig_activate(struct led_classdev *led_cdev)
 	if (err)
 		goto err_free;
 	usb_for_each_dev(usbport_data, usbport_trig_add_usb_dev_ports);
+	usbport_trig_update_count(usbport_data);
 
 	/* Notifications */
 	usbport_data->nb.notifier_call = usbport_trig_notify,
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
