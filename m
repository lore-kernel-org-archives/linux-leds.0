From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH v5 19/26] leds: aat1290: Use generic support for composing LED names
Date: Sun,  9 Jun 2019 21:07:56 +0200
Message-ID: <20190609190803.14815-20-jacek.anaszewski@gmail.com>
References: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net, dmurphy@ti.com, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

After switching to new led_classdev_register_ext() the validity
of struct led_classdev's name property is no longer guaranteed,
and therefore rely on struct device's kobj.name instead.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 drivers/leds/leds-aat1290.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 43bd8a43f36c..d892a96fd1bd 100644
--- a/drivers/leds/leds-aat1290.c
+++ b/drivers/leds/leds-aat1290.c
@@ -45,6 +45,8 @@
 #define AAT1290_FLASH_TM_NUM_LEVELS	16
 #define AAT1290_MM_CURRENT_SCALE_SIZE	15
 
+#define AAT1290_NAME			"aat1290"
+
 
 struct aat1290_led_config_data {
 	/* maximum LED current in movie mode */
@@ -78,7 +80,6 @@ struct aat1290_led {
 	int *mm_current_scale;
 	/* device mode */
 	bool movie_mode;
-
 	/* brightness cache */
 	unsigned int torch_brightness;
 };
@@ -218,7 +219,6 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 			struct aat1290_led_config_data *cfg,
 			struct device_node **sub_node)
 {
-	struct led_classdev *led_cdev = &led->fled_cdev.led_cdev;
 	struct device *dev = &led->pdev->dev;
 	struct device_node *child_node;
 #if IS_ENABLED(CONFIG_V4L2_FLASH_LED_CLASS)
@@ -257,9 +257,6 @@ static int aat1290_led_parse_dt(struct aat1290_led *led,
 		return -EINVAL;
 	}
 
-	led_cdev->name = of_get_property(child_node, "label", NULL) ? :
-						child_node->name;
-
 	ret = of_property_read_u32(child_node, "led-max-microamp",
 				&cfg->max_mm_current);
 	/*
@@ -431,7 +428,7 @@ static void aat1290_init_v4l2_flash_config(struct aat1290_led *led,
 	struct led_classdev *led_cdev = &led->fled_cdev.led_cdev;
 	struct led_flash_setting *s;
 
-	strlcpy(v4l2_sd_cfg->dev_name, led_cdev->name,
+	strlcpy(v4l2_sd_cfg->dev_name, led_cdev->dev->kobj.name,
 		sizeof(v4l2_sd_cfg->dev_name));
 
 	s = &v4l2_sd_cfg->intensity;
@@ -469,6 +466,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	struct aat1290_led *led;
 	struct led_classdev *led_cdev;
 	struct led_classdev_flash *fled_cdev;
+	struct led_init_data init_data = {};
 	struct aat1290_led_config_data led_cfg = {};
 	struct v4l2_flash_config v4l2_sd_cfg = {};
 	int ret;
@@ -497,8 +495,12 @@ static int aat1290_led_probe(struct platform_device *pdev)
 
 	aat1290_init_flash_timeout(led, &led_cfg);
 
+	init_data.fwnode = of_fwnode_handle(sub_node);
+	init_data.devicename = AAT1290_NAME;
+
 	/* Register LED Flash class device */
-	ret = led_classdev_flash_register(&pdev->dev, fled_cdev);
+	ret = led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
+					      &init_data);
 	if (ret < 0)
 		goto err_flash_register;
 
-- 
2.11.0
