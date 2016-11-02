From: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 2/6] [media] rc-main: split setup and unregister functions
Date: Wed, 02 Nov 2016 19:40:06 +0900
Message-ID: <20161102104010.26959-3-andi.shyti@samsung.com>
References: <20161102104010.26959-1-andi.shyti@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20161102104010.26959-1-andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Sean Young <sean-hENCXIMQXOg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Andi Shyti <andi-ahk0KpmfxKRAfugRpC6u6w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Move the input device allocation, map and protocol handling to
different functions.

Signed-off-by: Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 drivers/media/rc/rc-main.c | 143 +++++++++++++++++++++++++--------------------
 1 file changed, 81 insertions(+), 62 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 9e19b73e..7ab1b32 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1405,16 +1405,12 @@ void rc_free_device(struct rc_dev *dev)
 }
 EXPORT_SYMBOL_GPL(rc_free_device);
 
-int rc_register_device(struct rc_dev *dev)
+static int rc_setup_rx_device(struct rc_dev *dev)
 {
-	static bool raw_init = false; /* raw decoders loaded? */
-	struct rc_map *rc_map;
-	const char *path;
-	int attr = 0;
-	int minor;
 	int rc;
+	struct rc_map *rc_map;
 
-	if (!dev || !dev->map_name)
+	if (!dev->map_name)
 		return -EINVAL;
 
 	rc_map = rc_map_get(dev->map_name);
@@ -1423,6 +1419,19 @@ int rc_register_device(struct rc_dev *dev)
 	if (!rc_map || !rc_map->scan || rc_map->size == 0)
 		return -EINVAL;
 
+	rc = ir_setkeytable(dev, rc_map);
+	if (rc)
+		return rc;
+
+	if (dev->change_protocol) {
+		u64 rc_type = (1ll << rc_map->rc_type);
+
+		rc = dev->change_protocol(dev, &rc_type);
+		if (rc < 0)
+			goto out_table;
+		dev->enabled_protocols = rc_type;
+	}
+
 	set_bit(EV_KEY, dev->input_dev->evbit);
 	set_bit(EV_REP, dev->input_dev->evbit);
 	set_bit(EV_MSC, dev->input_dev->evbit);
@@ -1432,6 +1441,61 @@ int rc_register_device(struct rc_dev *dev)
 	if (dev->close)
 		dev->input_dev->close = ir_close;
 
+	/*
+	 * Default delay of 250ms is too short for some protocols, especially
+	 * since the timeout is currently set to 250ms. Increase it to 500ms,
+	 * to avoid wrong repetition of the keycodes. Note that this must be
+	 * set after the call to input_register_device().
+	 */
+	dev->input_dev->rep[REP_DELAY] = 500;
+
+	/*
+	 * As a repeat event on protocols like RC-5 and NEC take as long as
+	 * 110/114ms, using 33ms as a repeat period is not the right thing
+	 * to do.
+	 */
+	dev->input_dev->rep[REP_PERIOD] = 125;
+
+	/* rc_open will be called here */
+	rc = input_register_device(dev->input_dev);
+	if (rc)
+		goto out_table;
+
+	dev->input_dev->dev.parent = &dev->dev;
+	memcpy(&dev->input_dev->id, &dev->input_id, sizeof(dev->input_id));
+	dev->input_dev->phys = dev->input_phys;
+	dev->input_dev->name = dev->input_name;
+
+	return 0;
+
+out_table:
+	ir_free_table(&dev->rc_map);
+
+	return rc;
+}
+
+static void rc_free_rx_device(struct rc_dev *dev)
+{
+	if (!dev)
+		return;
+
+	ir_free_table(&dev->rc_map);
+
+	input_unregister_device(dev->input_dev);
+	dev->input_dev = NULL;
+}
+
+int rc_register_device(struct rc_dev *dev)
+{
+	static bool raw_init = false; /* raw decoders loaded? */
+	const char *path;
+	int attr = 0;
+	int minor;
+	int rc;
+
+	if (!dev)
+		return -EINVAL;
+
 	minor = ida_simple_get(&rc_ida, 0, RC_DEV_MAX, GFP_KERNEL);
 	if (minor < 0)
 		return minor;
@@ -1455,39 +1519,15 @@ int rc_register_device(struct rc_dev *dev)
 	if (rc)
 		goto out_unlock;
 
-	rc = ir_setkeytable(dev, rc_map);
-	if (rc)
-		goto out_dev;
-
-	dev->input_dev->dev.parent = &dev->dev;
-	memcpy(&dev->input_dev->id, &dev->input_id, sizeof(dev->input_id));
-	dev->input_dev->phys = dev->input_phys;
-	dev->input_dev->name = dev->input_name;
-
-	rc = input_register_device(dev->input_dev);
-	if (rc)
-		goto out_table;
-
-	/*
-	 * Default delay of 250ms is too short for some protocols, especially
-	 * since the timeout is currently set to 250ms. Increase it to 500ms,
-	 * to avoid wrong repetition of the keycodes. Note that this must be
-	 * set after the call to input_register_device().
-	 */
-	dev->input_dev->rep[REP_DELAY] = 500;
-
-	/*
-	 * As a repeat event on protocols like RC-5 and NEC take as long as
-	 * 110/114ms, using 33ms as a repeat period is not the right thing
-	 * to do.
-	 */
-	dev->input_dev->rep[REP_PERIOD] = 125;
-
 	path = kobject_get_path(&dev->dev.kobj, GFP_KERNEL);
 	dev_info(&dev->dev, "%s as %s\n",
 		dev->input_name ?: "Unspecified device", path ?: "N/A");
 	kfree(path);
 
+	rc = rc_setup_rx_device(dev);
+	if (rc)
+		goto out_dev;
+
 	if (dev->driver_type == RC_DRIVER_IR_RAW) {
 		if (!raw_init) {
 			request_module_nowait("ir-lirc-codec");
@@ -1495,36 +1535,20 @@ int rc_register_device(struct rc_dev *dev)
 		}
 		rc = ir_raw_event_register(dev);
 		if (rc < 0)
-			goto out_input;
-	}
-
-	if (dev->change_protocol) {
-		u64 rc_type = (1ll << rc_map->rc_type);
-		rc = dev->change_protocol(dev, &rc_type);
-		if (rc < 0)
-			goto out_raw;
-		dev->enabled_protocols = rc_type;
+			goto out_rx;
 	}
 
 	/* Allow the RC sysfs nodes to be accessible */
 	atomic_set(&dev->initialized, 1);
 
-	IR_dprintk(1, "Registered rc%u (driver: %s, remote: %s, mode %s)\n",
+	IR_dprintk(1, "Registered rc%u (driver: %s)\n",
 		   dev->minor,
-		   dev->driver_name ? dev->driver_name : "unknown",
-		   rc_map->name ? rc_map->name : "unknown",
-		   dev->driver_type == RC_DRIVER_IR_RAW ? "raw" : "cooked");
+		   dev->driver_name ? dev->driver_name : "unknown");
 
 	return 0;
 
-out_raw:
-	if (dev->driver_type == RC_DRIVER_IR_RAW)
-		ir_raw_event_unregister(dev);
-out_input:
-	input_unregister_device(dev->input_dev);
-	dev->input_dev = NULL;
-out_table:
-	ir_free_table(&dev->rc_map);
+out_rx:
+	rc_free_rx_device(dev);
 out_dev:
 	device_del(&dev->dev);
 out_unlock:
@@ -1543,12 +1567,7 @@ void rc_unregister_device(struct rc_dev *dev)
 	if (dev->driver_type == RC_DRIVER_IR_RAW)
 		ir_raw_event_unregister(dev);
 
-	/* Freeing the table should also call the stop callback */
-	ir_free_table(&dev->rc_map);
-	IR_dprintk(1, "Freed keycode table\n");
-
-	input_unregister_device(dev->input_dev);
-	dev->input_dev = NULL;
+	rc_free_rx_device(dev);
 
 	device_del(&dev->dev);
 
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
