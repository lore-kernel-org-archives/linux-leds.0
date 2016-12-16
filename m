From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v5 3/6] [media] rc-core: add support for IR raw transmitters
Date: Fri, 16 Dec 2016 15:12:15 +0900
Message-ID: <20161216061218.5906-4-andi.shyti@samsung.com>
References: <20161216061218.5906-1-andi.shyti@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20161216061218.5906-1-andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sean Young <sean-hENCXIMQXOg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Heiner Kallweit <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

IR raw transmitter driver type is specified in the enum
rc_driver_type as RC_DRIVER_IR_RAW_TX which includes all those
devices that transmit raw stream of bit to a receiver.

The data are provided by userspace applications, therefore they
don't need any input device allocation, but still they need to be
registered as raw devices.

Suggested-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
Signed-off-by: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Reviewed-by: Sean Young <sean-hENCXIMQXOg@public.gmane.org>
---
 drivers/media/rc/rc-main.c | 42 +++++++++++++++++++++++++-----------------
 include/media/rc-core.h    |  9 ++++++---
 2 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 7cc700d..19cf15c 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1365,20 +1365,24 @@ struct rc_dev *rc_allocate_device(enum rc_driver_type type)
 	if (!dev)
 		return NULL;
 
-	dev->input_dev = input_allocate_device();
-	if (!dev->input_dev) {
-		kfree(dev);
-		return NULL;
-	}
+	if (type != RC_DRIVER_IR_RAW_TX) {
+		dev->input_dev = input_allocate_device();
+		if (!dev->input_dev) {
+			kfree(dev);
+			return NULL;
+		}
+
+		dev->input_dev->getkeycode = ir_getkeycode;
+		dev->input_dev->setkeycode = ir_setkeycode;
+		input_set_drvdata(dev->input_dev, dev);
 
-	dev->input_dev->getkeycode = ir_getkeycode;
-	dev->input_dev->setkeycode = ir_setkeycode;
-	input_set_drvdata(dev->input_dev, dev);
+		setup_timer(&dev->timer_keyup, ir_timer_keyup,
+						(unsigned long)dev);
 
-	spin_lock_init(&dev->rc_map.lock);
-	spin_lock_init(&dev->keylock);
+		spin_lock_init(&dev->rc_map.lock);
+		spin_lock_init(&dev->keylock);
+	}
 	mutex_init(&dev->lock);
-	setup_timer(&dev->timer_keyup, ir_timer_keyup, (unsigned long)dev);
 
 	dev->dev.type = &rc_dev_type;
 	dev->dev.class = &rc_class;
@@ -1507,7 +1511,7 @@ static int rc_setup_rx_device(struct rc_dev *dev)
 
 static void rc_free_rx_device(struct rc_dev *dev)
 {
-	if (!dev)
+	if (!dev || dev->driver_type == RC_DRIVER_IR_RAW_TX)
 		return;
 
 	ir_free_table(&dev->rc_map);
@@ -1537,7 +1541,8 @@ int rc_register_device(struct rc_dev *dev)
 	atomic_set(&dev->initialized, 0);
 
 	dev->dev.groups = dev->sysfs_groups;
-	dev->sysfs_groups[attr++] = &rc_dev_protocol_attr_grp;
+	if (dev->driver_type != RC_DRIVER_IR_RAW_TX)
+		dev->sysfs_groups[attr++] = &rc_dev_protocol_attr_grp;
 	if (dev->s_filter)
 		dev->sysfs_groups[attr++] = &rc_dev_filter_attr_grp;
 	if (dev->s_wakeup_filter)
@@ -1555,11 +1560,14 @@ int rc_register_device(struct rc_dev *dev)
 		dev->input_name ?: "Unspecified device", path ?: "N/A");
 	kfree(path);
 
-	rc = rc_setup_rx_device(dev);
-	if (rc)
-		goto out_dev;
+	if (dev->driver_type != RC_DRIVER_IR_RAW_TX) {
+		rc = rc_setup_rx_device(dev);
+		if (rc)
+			goto out_dev;
+	}
 
-	if (dev->driver_type == RC_DRIVER_IR_RAW) {
+	if (dev->driver_type == RC_DRIVER_IR_RAW ||
+				dev->driver_type == RC_DRIVER_IR_RAW_TX) {
 		if (!raw_init) {
 			request_module_nowait("ir-lirc-codec");
 			raw_init = true;
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index ba92c86..98d28d5 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -32,13 +32,16 @@ do {								\
 /**
  * enum rc_driver_type - type of the RC output
  *
- * @RC_DRIVER_SCANCODE:	Driver or hardware generates a scancode
- * @RC_DRIVER_IR_RAW:	Driver or hardware generates pulse/space sequences.
- *			It needs a Infra-Red pulse/space decoder
+ * @RC_DRIVER_SCANCODE:	 Driver or hardware generates a scancode
+ * @RC_DRIVER_IR_RAW:	 Driver or hardware generates pulse/space sequences.
+ *			 It needs a Infra-Red pulse/space decoder
+ * @RC_DRIVER_IR_RAW_TX: Device transmitter only,
+			 driver requires pulse/space data sequence.
  */
 enum rc_driver_type {
 	RC_DRIVER_SCANCODE = 0,
 	RC_DRIVER_IR_RAW,
+	RC_DRIVER_IR_RAW_TX,
 };
 
 /**
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
