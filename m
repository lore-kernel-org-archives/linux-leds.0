Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367199;
	b=HbzTT4tNXbhS0FrWGABBu8LLpydqaWWg6NxE4VHWwb2vW7/zvbtbBDtgI4AFxCBQXtbJ
	 YwEUVNsKhM2zn+DV77cVIzmHX43ftEtkPSxU9cfF+lTQs8VkPkkmhJZ1dKIOlkI+7/SD/
	 A9hdsCqfTBOcE4xC/rss5zmjYOn04KbZHe5CtmUelWYDGxOworuvwe9RkMSaSvhymAd8/
	 38+XKbqj3tbRs1a7Nvde0KeFNkD2FRfH9UHJiVaBAH7DX5KBqXmZc6FNmujti9tlREWo9
	 Z9rOZj5FG2+SOX4GeEaT3b0b1o58mahZlJbzXfv0T9ZCaGM+xs0QDHVlEuiepEf2lzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367199;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kVyM5OtJ62yR9aZQC5kbMHpd8CkF8MTSGTtuKZsQ0qc=;
	b=Yzt/rCp2bU+zTAMPFqsu8SF1ASBtligzYxrMm585qHchTjl67Fl1YDVquJDH06xVe5g9
	 ToANXqJK0NTBtRmfrviwGNckH5u8dsn7BYUpNeUdvJlpV02LHiXDaQg/xwxjOnTgrRlSe
	 WshQ0Db2buBeBFbXbI0ytfiF+6+foVJ1Leg7z9RkHwuZKME9G6Lr6UmrQ9Cfb9oaZ3bxV
	 NNOibL3wsZvCU5ErFFc/REWiAsMlbPHWsIGtExSR6h9TqNPFaJhc6S+gNWU0ZiKfv9BDe
	 TWlzjyZtRomNHZBVQ01Hg992XgUuNkGhPe5Tyc0tdyBCTMMH5FKlJEkTGRuvFh31E4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B892A606A320;
	Sun, 22 Nov 2026 17:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B892A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6AMH6IKW031729;
	Sun, 22 Nov 2026 17:06:18 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6AMH6ITw031728;
	Sun, 22 Nov 2026 17:06:18 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v3 1/2] leds: mc13783: Use unified device property API
Date: Sun, 22 Nov 2026 17:06:14 +0000
Message-ID: <20261122170615.31710-2-akurz@blala.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122170615.31710-1-akurz@blala.de>
References: <20261122170615.31710-1-akurz@blala.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace OF-specific API calls with the unified device property variants
and drop the CONFIG_OF-guard around mc13xxx_led_probe_dt() since all used
implementations should be safe for !CONFIG_OF compilation now.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/leds/leds-mc13783.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 19c1b51475db..0882c7f6b649 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -16,8 +16,8 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/leds.h>
-#include <linux/of.h>
 #include <linux/mfd/mc13xxx.h>
 
 struct mc13xxx_led_devtype {
@@ -108,13 +108,12 @@ static int mc13xxx_led_set(struct led_classdev *led_cdev,
 			value << shift);
 }
 
-#ifdef CONFIG_OF
 static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	struct platform_device *pdev)
 {
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
 	struct mc13xxx_leds_platform_data *pdata;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	struct device *dev = &pdev->dev;
 	int i = 0, ret = -ENODATA;
 
@@ -122,34 +121,34 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	struct device_node *parent __free(device_node) =
-		of_get_child_by_name(dev_of_node(dev->parent), "leds");
+	struct fwnode_handle *parent __free(fwnode_handle) =
+		device_get_named_child_node(dev->parent, "leds");
 	if (!parent)
 		return ERR_PTR(-ENODATA);
 
-	ret = of_property_read_u32_array(parent, "led-control",
+	ret = fwnode_property_read_u32_array(parent, "led-control",
 					 pdata->led_control,
 					 leds->devtype->num_regs);
 	if (ret)
 		return ERR_PTR(ret);
 
-	pdata->num_leds = of_get_available_child_count(parent);
+	pdata->num_leds = fwnode_get_child_node_count(parent);
 
 	pdata->led = devm_kzalloc_objs(dev, *pdata->led, pdata->num_leds);
 	if (!pdata->led)
 		return ERR_PTR(-ENOMEM);
 
-	for_each_available_child_of_node(parent, child) {
+	fwnode_for_each_child_node(parent, child) {
 		const char *str;
 		u32 tmp;
 
-		if (of_property_read_u32(child, "reg", &tmp))
+		if (fwnode_property_read_u32(child, "reg", &tmp))
 			continue;
 		pdata->led[i].id = leds->devtype->led_min + tmp;
 
-		if (!of_property_read_string(child, "label", &str))
+		if (!fwnode_property_read_string(child, "label", &str))
 			pdata->led[i].name = str;
-		if (!of_property_read_string(child, "linux,default-trigger",
+		if (!fwnode_property_read_string(child, "linux,default-trigger",
 					     &str))
 			pdata->led[i].default_trigger = str;
 
@@ -162,13 +161,6 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 
 	return pdata;
 }
-#else
-static inline struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
-	struct platform_device *pdev)
-{
-	return ERR_PTR(-ENOSYS);
-}
-#endif
 
 static int __init mc13xxx_led_probe(struct platform_device *pdev)
 {
@@ -189,7 +181,7 @@ static int __init mc13xxx_led_probe(struct platform_device *pdev)
 	leds->master = mcdev;
 	platform_set_drvdata(pdev, leds);
 
-	if (dev_of_node(dev->parent)) {
+	if (dev_fwnode(dev->parent)) {
 		pdata = mc13xxx_led_probe_dt(pdev);
 		if (IS_ERR(pdata))
 			return PTR_ERR(pdata);
-- 
2.39.5

