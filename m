From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH v5 5/6] leds: lp8860: Add DT parsing to retrieve the trigger node
Date: Mon, 18 Dec 2017 14:23:06 -0600
Message-ID: <20171218202307.4913-5-dmurphy@ti.com>
References: <20171218202307.4913-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171218202307.4913-1-dmurphy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, rpurdie@rpsys.net, jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add the ability to parse the DT and set the default
trigger mode for the LED.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v5 - No changes

v4 - No changes
v3 - no changes - https://patchwork.kernel.org/patch/10093751/
v2 - no changes

 drivers/leds/leds-lp8860.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 46578fbc36be..bb1d7bbc928c 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -372,6 +372,10 @@ static int lp8860_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	for_each_available_child_of_node(np, child_node) {
+		led->led_dev.default_trigger = of_get_property(child_node,
+						    "linux,default-trigger",
+						    NULL);
+
 		ret = of_property_read_string(child_node, "label", &name);
 		if (!ret)
 			snprintf(led->label, sizeof(led->label), "%s:%s",
-- 
2.15.0.124.g7668cbc60
