From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: leds: document property for LED triggers
Date: Tue, 28 Feb 2017 22:51:58 +0100
Message-ID: <290ed068-2518-50ef-4d02-394bef8b7ee9@gmail.com>
References: <20170228120452.10043-1-zajec5@gmail.com>
 <a6d25fb5-db5e-5643-b150-23588944674a@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34548 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751396AbdB1VyD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Feb 2017 16:54:03 -0500
In-Reply-To: <a6d25fb5-db5e-5643-b150-23588944674a@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>

On 02/28/2017 10:38 PM, Jacek Anaszewski wrote:
> I think that it would be simpler if we could initially see
> a complete sample dts implementation containing all required DT
> nodes. The example could contain timer trigger as well as usb-port
> trigger specific bindings.

Please take a look at attached patch. I used it on Tenda AC9 with:

usb_trigger: usb-trigger {
	trigger-type = "usbport";
	ports = <&ohci_port1>, <&ehci_port1>;
};

usb {
	label = "bcm53xx:blue:usb";
	gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
	triggers = <&usb_trigger>;
};


> I suppose that we should see DT nodes containing #list-cells
> properties that define the quantity of phandle arguments.
>
> It seems that this approach allows for defining a list of elements
> with variable number of arguments, i.e. what you were initially
> asking for.

Are you sure we need #list-cells? Can't we simply use
of_count_phandle_with_args(np, "triggers", NULL);
?


From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Date: Mon, 3 Oct 2016 16:49:05 +0200
Subject: [PATCH] usb: core: read USB ports from DT in the usbport LED trigger
  driver
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
  .../devicetree/bindings/leds/triggers-usbport.txt  | 19 ++++++++
  drivers/leds/led-triggers.c                        |  3 +-
  drivers/usb/core/ledtrig-usbport.c                 | 56 ++++++++++++++++++++++
  3 files changed, 77 insertions(+), 1 deletion(-)
  create mode 100644 Documentation/devicetree/bindings/leds/triggers-usbport.txt

diff --git a/Documentation/devicetree/bindings/leds/triggers-usbport.txt b/Documentation/devicetree/bindings/leds/triggers-usbport.txt
new file mode 100644
index 000000000000..10e55122cded
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/triggers-usbport.txt
@@ -0,0 +1,19 @@
+USB port LED trigger properties.
+
+USB port trigger can be used for signalling to the user a presence of USB
+device(s) in given ports. It's possible to specify USB ports in DT by providing
+their references.
+
+Properties:
+- trigger-type : Must be "usbport".
+- ports : List of USB ports related to this LED. Some devices may have one USB
+	  LED for all ports, other may have few of them (e.g. USB version
+	  specific). It's used by usbport trigger for reading a list of ports
+	  that should cause LED to turn on whenver device get connected.
+
+Examples:
+
+usbport-trigger {
+	trigger-type = "usbport";
+	ports = <&ohci_port1>, <&ehci_port1>;
+};
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index c53c20d676cd..1d8bda9755ca 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -181,7 +181,8 @@ static void led_trigger_of_read_trigger(struct led_classdev *led_cdev)
  	}

  	/* Check if trigger specified in DT is supported */
-	if (strcmp(trigger_type, "timer"))
+	if (strcmp(trigger_type, "timer") &&
+	    strcmp(trigger_type, "usbport"))
  		goto err_node_put;

  	led_cdev->default_trigger = trigger_type;
diff --git a/drivers/usb/core/ledtrig-usbport.c b/drivers/usb/core/ledtrig-usbport.c
index 1713248ab15a..599f7e6b0ba8 100644
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
@@ -123,6 +125,58 @@ static const struct attribute_group ports_group = {
   * Adding & removing ports
   ***************************************/

+/**
+ * usbport_trig_port_observed - Check if port should be observed
+ *
+ * Each LED may have list of related USB ports specified in a DT. This function
+ * reads them using ports property and sets a proper state.
+ */
+static bool usbport_trig_port_observed(struct usbport_trig_data *usbport_data,
+				       struct usb_device *usb_dev, int port1)
+{
+	struct device_node *led_np = usbport_data->led_cdev->trigger_node;
+	struct device *dev = usbport_data->led_cdev->dev;
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
+	/* Amount of ports this LED references */
+	count = of_count_phandle_with_args(led_np, "ports", NULL);
+	if (count < 0) {
+		dev_warn(dev, "Failed to get USB ports for %s\n",
+			 led_np->full_name);
+		return false;
+	}
+
+	/* Check if port is on this LED's list */
+	for (i = 0; i < count; i++) {
+		int err;
+
+		err = of_parse_phandle_with_args(led_np, "ports", NULL, i,
+						 &args);
+		if (err) {
+			dev_err(dev, "Failed to get USB port phandle at index %d: %d\n",
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
@@ -141,6 +195,7 @@ static int usbport_trig_add_port(struct usbport_trig_data *usbport_data,
  	port->data = usbport_data;
  	port->hub = usb_dev;
  	port->portnum = portnum;
+	port->observed = usbport_trig_port_observed(usbport_data, usb_dev, portnum);

  	len = strlen(hub_name) + 8;
  	port->port_name = kzalloc(len, GFP_KERNEL);
@@ -255,6 +310,7 @@ static void usbport_trig_activate(struct led_classdev *led_cdev)
  	if (err)
  		goto err_free;
  	usb_for_each_dev(usbport_data, usbport_trig_add_usb_dev_ports);
+	usbport_trig_update_count(usbport_data);

  	/* Notifications */
  	usbport_data->nb.notifier_call = usbport_trig_notify,
-- 
2.11.0
