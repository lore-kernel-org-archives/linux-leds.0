From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: [PATCH 19/25] leds: aat1290: Use led_compose_name()
Date: Sun, 10 Mar 2019 19:28:30 +0100
Message-ID: <20190310182836.20841-20-jacek.anaszewski@gmail.com>
References: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190310182836.20841-1-jacek.anaszewski@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pavel@ucw.cz, robh@kernel.org, jacek.anaszewski@gmail.com
List-Id: linux-leds@vger.kernel.org

Switch to using generic LED support for composing LED class
device name.

Signed-off-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/leds-aat1290.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-aat1290.c b/drivers/leds/leds-aat1290.c
index 43bd8a43f36c..9132a6ee551e 100644
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
@@ -469,6 +466,7 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	struct aat1290_led *led;
 	struct led_classdev *led_cdev;
 	struct led_classdev_flash *fled_cdev;
+	struct led_init_data init_data;
 	struct aat1290_led_config_data led_cfg = {};
 	struct v4l2_flash_config v4l2_sd_cfg = {};
 	int ret;
@@ -488,6 +486,12 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	init_data.fwnode = of_fwnode_handle(sub_node);
+	ret = led_compose_name(init_data.fwnode, AAT1290_NAME, NULL,
+			       init_data.name);
+	if (ret < 0)
+		return ret;
+
 	mutex_init(&led->lock);
 
 	/* Initialize LED Flash class device */
@@ -498,7 +502,8 @@ static int aat1290_led_probe(struct platform_device *pdev)
 	aat1290_init_flash_timeout(led, &led_cfg);
 
 	/* Register LED Flash class device */
-	ret = led_classdev_flash_register(&pdev->dev, fled_cdev);
+	ret = led_classdev_flash_register_ext(&pdev->dev, fled_cdev,
+					      &init_data);
 	if (ret < 0)
 		goto err_flash_register;
 
-- 
2.11.0
