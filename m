From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v8 2/7] platform/x86/thinkpad_acpi: Use brightness_set_blocking callback for LEDs
Date: Thu,  9 Feb 2017 16:44:12 +0100
Message-ID: <20170209154417.19040-3-hdegoede@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170209154417.19040-1-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Now a days the LED core can take care of executing brightness_set from
a workqueue if it needs to sleep, make use of this and remove a bunch
of DIY code for this.

Since this commit removes the workqueue usage for LEDs, the
led_sysfs_blink_set callback may now also sleep, this is fine.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v8:
-New patch in v8 of this patch-set
---
 drivers/platform/x86/thinkpad_acpi.c | 80 ++++++++----------------------------
 1 file changed, 16 insertions(+), 64 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0680bb3..f51833f 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -372,11 +372,9 @@ enum led_status_t {
 	TPACPI_LED_BLINK,
 };
 
-/* Special LED class that can defer work */
+/* tpacpi LED class */
 struct tpacpi_led_classdev {
 	struct led_classdev led_classdev;
-	struct work_struct work;
-	enum led_status_t new_state;
 	int led;
 };
 
@@ -5156,24 +5154,10 @@ static bool kbdlight_is_supported(void)
 	return status & BIT(9);
 }
 
-static void kbdlight_set_worker(struct work_struct *work)
-{
-	struct tpacpi_led_classdev *data =
-			container_of(work, struct tpacpi_led_classdev, work);
-
-	if (likely(tpacpi_lifecycle == TPACPI_LIFE_RUNNING))
-		kbdlight_set_level(data->new_state);
-}
-
-static void kbdlight_sysfs_set(struct led_classdev *led_cdev,
+static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	struct tpacpi_led_classdev *data =
-			container_of(led_cdev,
-				     struct tpacpi_led_classdev,
-				     led_classdev);
-	data->new_state = brightness;
-	queue_work(tpacpi_wq, &data->work);
+	return kbdlight_set_level(brightness);
 }
 
 static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
@@ -5191,7 +5175,7 @@ static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
 	.led_classdev = {
 		.name		= "tpacpi::kbd_backlight",
 		.max_brightness	= 2,
-		.brightness_set	= &kbdlight_sysfs_set,
+		.brightness_set_blocking = &kbdlight_sysfs_set,
 		.brightness_get	= &kbdlight_sysfs_get,
 	}
 };
@@ -5203,7 +5187,6 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 	vdbg_printk(TPACPI_DBG_INIT, "initializing kbdlight subdriver\n");
 
 	TPACPI_ACPIHANDLE_INIT(hkey);
-	INIT_WORK(&tpacpi_led_kbdlight.work, kbdlight_set_worker);
 
 	if (!kbdlight_is_supported()) {
 		tp_features.kbdlight = 0;
@@ -5227,7 +5210,6 @@ static void kbdlight_exit(void)
 {
 	if (tp_features.kbdlight)
 		led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
-	flush_workqueue(tpacpi_wq);
 }
 
 static int kbdlight_set_level_and_update(int level)
@@ -5356,25 +5338,11 @@ static int light_set_status(int status)
 	return -ENXIO;
 }
 
-static void light_set_status_worker(struct work_struct *work)
-{
-	struct tpacpi_led_classdev *data =
-			container_of(work, struct tpacpi_led_classdev, work);
-
-	if (likely(tpacpi_lifecycle == TPACPI_LIFE_RUNNING))
-		light_set_status((data->new_state != TPACPI_LED_OFF));
-}
-
-static void light_sysfs_set(struct led_classdev *led_cdev,
+static int light_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	struct tpacpi_led_classdev *data =
-		container_of(led_cdev,
-			     struct tpacpi_led_classdev,
-			     led_classdev);
-	data->new_state = (brightness != LED_OFF) ?
-				TPACPI_LED_ON : TPACPI_LED_OFF;
-	queue_work(tpacpi_wq, &data->work);
+	return light_set_status((brightness != LED_OFF) ?
+				TPACPI_LED_ON : TPACPI_LED_OFF);
 }
 
 static enum led_brightness light_sysfs_get(struct led_classdev *led_cdev)
@@ -5385,7 +5353,7 @@ static enum led_brightness light_sysfs_get(struct led_classdev *led_cdev)
 static struct tpacpi_led_classdev tpacpi_led_thinklight = {
 	.led_classdev = {
 		.name		= "tpacpi::thinklight",
-		.brightness_set	= &light_sysfs_set,
+		.brightness_set_blocking = &light_sysfs_set,
 		.brightness_get	= &light_sysfs_get,
 	}
 };
@@ -5401,7 +5369,6 @@ static int __init light_init(struct ibm_init_struct *iibm)
 		TPACPI_ACPIHANDLE_INIT(lght);
 	}
 	TPACPI_ACPIHANDLE_INIT(cmos);
-	INIT_WORK(&tpacpi_led_thinklight.work, light_set_status_worker);
 
 	/* light not supported on 570, 600e/x, 770e, 770x, G4x, R30, R31 */
 	tp_features.light = (cmos_handle || lght_handle) && !ledb_handle;
@@ -5435,7 +5402,6 @@ static int __init light_init(struct ibm_init_struct *iibm)
 static void light_exit(void)
 {
 	led_classdev_unregister(&tpacpi_led_thinklight.led_classdev);
-	flush_workqueue(tpacpi_wq);
 }
 
 static int light_read(struct seq_file *m)
@@ -5702,29 +5668,21 @@ static int led_set_status(const unsigned int led,
 	return rc;
 }
 
-static void led_set_status_worker(struct work_struct *work)
-{
-	struct tpacpi_led_classdev *data =
-		container_of(work, struct tpacpi_led_classdev, work);
-
-	if (likely(tpacpi_lifecycle == TPACPI_LIFE_RUNNING))
-		led_set_status(data->led, data->new_state);
-}
-
-static void led_sysfs_set(struct led_classdev *led_cdev,
+static int led_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
 	struct tpacpi_led_classdev *data = container_of(led_cdev,
 			     struct tpacpi_led_classdev, led_classdev);
+	enum led_status_t new_state;
 
 	if (brightness == LED_OFF)
-		data->new_state = TPACPI_LED_OFF;
+		new_state = TPACPI_LED_OFF;
 	else if (tpacpi_led_state_cache[data->led] != TPACPI_LED_BLINK)
-		data->new_state = TPACPI_LED_ON;
+		new_state = TPACPI_LED_ON;
 	else
-		data->new_state = TPACPI_LED_BLINK;
+		new_state = TPACPI_LED_BLINK;
 
-	queue_work(tpacpi_wq, &data->work);
+	return led_set_status(data->led, new_state);
 }
 
 static int led_sysfs_blink_set(struct led_classdev *led_cdev,
@@ -5741,10 +5699,7 @@ static int led_sysfs_blink_set(struct led_classdev *led_cdev,
 	} else if ((*delay_on != 500) || (*delay_off != 500))
 		return -EINVAL;
 
-	data->new_state = TPACPI_LED_BLINK;
-	queue_work(tpacpi_wq, &data->work);
-
-	return 0;
+	return led_set_status(data->led, TPACPI_LED_BLINK);
 }
 
 static enum led_brightness led_sysfs_get(struct led_classdev *led_cdev)
@@ -5773,7 +5728,6 @@ static void led_exit(void)
 			led_classdev_unregister(&tpacpi_leds[i].led_classdev);
 	}
 
-	flush_workqueue(tpacpi_wq);
 	kfree(tpacpi_leds);
 }
 
@@ -5787,7 +5741,7 @@ static int __init tpacpi_init_led(unsigned int led)
 	if (!tpacpi_led_names[led])
 		return 0;
 
-	tpacpi_leds[led].led_classdev.brightness_set = &led_sysfs_set;
+	tpacpi_leds[led].led_classdev.brightness_set_blocking = &led_sysfs_set;
 	tpacpi_leds[led].led_classdev.blink_set = &led_sysfs_blink_set;
 	if (led_supported == TPACPI_LED_570)
 		tpacpi_leds[led].led_classdev.brightness_get =
@@ -5795,8 +5749,6 @@ static int __init tpacpi_init_led(unsigned int led)
 
 	tpacpi_leds[led].led_classdev.name = tpacpi_led_names[led];
 
-	INIT_WORK(&tpacpi_leds[led].work, led_set_status_worker);
-
 	rc = led_classdev_register(&tpacpi_pdev->dev,
 				&tpacpi_leds[led].led_classdev);
 	if (rc < 0)
-- 
2.9.3
