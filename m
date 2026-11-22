Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332765;
	b=JhKMfu8HnvPQk8PzJhsk+LKqZltBhZolWD3mvr53msVcLcB0dTVR261qMzcyU+Y9/aLc
	 J4HWRgtC9F6kZ7Y8SgMu8bS3r1pCzIuyN8+jMJ97bds9K8IDzs1ZA+icvZ/RFgNBHcCZ4
	 butAByuzDFYHNNlbsIOF4d6qNg/GZ2oQgnTJURa1xGiDQtDQkuHFLuF6m22v5+RgDDUPG
	 v1mSHQMbBtBXigrpzPVkYsPbvVxZT2ocltf4a0IEmdcbX//50rLACxxZo5ftgbvyuuRuO
	 Lm7ANPx/8MjhUhjSo5utlOWeYchhBNVs6fAofy9et5p3yZ3S1dzBdNCORmllrVBDBrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332765;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RsdGtAkYUsaeCZ/FJRf2seuLAA0egfEZef1GvkXgdf4=;
	b=l8LglXSqxbcz7itP464P2EncDa4cld21xorPqidI1hCaNcOoOyky28VeltuhvOZnY6Xy
	 gc/lKAGty8+quC4rX66dRazIcMh4Dbt/eQAXbRmwEWRaEyXR/amx69kO4tvsUihhBrTn1
	 CVApvdtulVB4D99HP0tiwMax9WCb6+nRAqVKb1pxwQ/RZr8BmX3sr8ml1SXdDZsX42ACl
	 6U2bNmmM7FrmZtNQD9FJR9DGdfFxLqB4UXBBoWL26NCB2o+T3WlSu93Whhk1ZrPj9rUU3
	 KOXrkIue7KwaVgRwTm6PxUU/Gi/rH1ywWakHL8cFpH5fpwLPBxm0DSMtCI+6F15vl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4159A606A32A;
	Sun, 22 Nov 2026 07:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4159A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6AM7WdeX026736;
	Sun, 22 Nov 2026 07:32:39 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6AM7WdML026735;
	Sun, 22 Nov 2026 07:32:39 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v2 2/2] leds: leds-mc13783: enable driver for deferred probe
Date: Sun, 22 Nov 2026 07:32:35 +0000
Message-ID: <20261122073235.26707-3-akurz@blala.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261122073235.26707-1-akurz@blala.de>
References: <20261122073235.26707-1-akurz@blala.de>
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

The probe order between mfd and leds has been changed with commit
78efa53e715e ("leds: Init leds class earlier") so that mc13xxx-led
driver was not registered any more due to the missing mfd instance.
Use module_platform_driver() to replace module_platform_driver_probe().
The former utilizes platform_driver_register(), which allows the driver
to defer probing when it doesn't acquire the necessary resources from
the mfd device due to probe order.

Fixes: 78efa53e715e ("leds: Init leds class earlier")
Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/leds/leds-mc13783.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 82b2062b2280..866097be3eb9 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -109,7 +109,7 @@ static int mc13xxx_led_set(struct led_classdev *led_cdev,
 }
 
 #ifdef CONFIG_OF
-static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
+static struct mc13xxx_leds_platform_data *mc13xxx_led_probe_dt(
 	struct platform_device *pdev)
 {
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
@@ -163,14 +163,14 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	return pdata;
 }
 #else
-static inline struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
+static inline struct mc13xxx_leds_platform_data *mc13xxx_led_probe_dt(
 	struct platform_device *pdev)
 {
 	return ERR_PTR(-ENOSYS);
 }
 #endif
 
-static int __init mc13xxx_led_probe(struct platform_device *pdev)
+static int mc13xxx_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mc13xxx_leds_platform_data *pdata = dev_get_platdata(dev);
@@ -296,13 +296,14 @@ static const struct platform_device_id mc13xxx_led_id_table[] = {
 MODULE_DEVICE_TABLE(platform, mc13xxx_led_id_table);
 
 static struct platform_driver mc13xxx_led_driver = {
+	.probe = mc13xxx_led_probe,
 	.driver	= {
 		.name	= "mc13xxx-led",
 	},
 	.remove		= mc13xxx_led_remove,
 	.id_table	= mc13xxx_led_id_table,
 };
-module_platform_driver_probe(mc13xxx_led_driver, mc13xxx_led_probe);
+module_platform_driver(mc13xxx_led_driver);
 
 MODULE_DESCRIPTION("LEDs driver for Freescale MC13XXX PMIC");
 MODULE_AUTHOR("Philippe Retornaz <philippe.retornaz@epfl.ch>");
-- 
2.39.5

