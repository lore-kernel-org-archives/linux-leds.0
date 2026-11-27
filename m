Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810615;
	b=DsuMxqL6Cbl7Q3faGYtGI7Y2/UNQgN9Hzb5Q3Hvlhd69x439uf+t0RZT1xML/zlu3F6g
	 q3s0nMyTRMMzb/MTTypV8izmQ4s5OPTj/tojv/AOu8NNawg54JCOtEbypHhZfGHEpG5xK
	 /43I4boLMsjJPwKdeW9ZIV80Yp7OxIgCKSBFdbArFLiBbzrQrhwB+8t1o5rh8EBcVTx6K
	 LHyDfOVK1KGL+Fia/BZCDmpN5rAtx1astsOBwFvhBWppRhLgGwYM1KRQ53jwwUCbk1660
	 jBl4SbORP8ok1n5qS0pj12qh9UOwECLG2qes4VL+GBf6R5XMNx7NmfvVUbDH3LcRq5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810615;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zuN0fCtrdYdBRUqmuQogi6QL2T8Mjj5fwbrIHcyL5QM=;
	b=Pu9DzRW7AVo417vGTgE+7/oGC0SzuswZnd+64IgJ1tlm31pMMouD/UckcqZj4frfvLJD
	 p64USJBjGh38n7wg2I9gS8FCuo3IYXAiK2ENLcQTzhZXg6QA2+KnvKYfoS9xsa2iWKsUf
	 N8TFb/cJ4yKQ+t4x9o95tDZxXRkuGFzEtQzGwvjNeaqONWzJngAdA8GgT9Wu9+qr1d2hb
	 yLXH4iwG1WTxprLO+/EijlHyH+wnCxFrZocIS4ZCFYyXT4U4+bX3GflXCe4cV+efsyI3j
	 T/9oRVi5gON+KmtZ3QK0n6oSdQwOzOR1IVLmd8AJgX6dctiNVkFdViaUEeJ7BRoCHlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAFB606A31C;
	Fri, 27 Nov 2026 20:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BAFB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6ARKGViS027003;
	Fri, 27 Nov 2026 20:16:31 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6ARKGVdZ027002;
	Fri, 27 Nov 2026 20:16:31 GMT
From: Alexander Kurz <akurz@blala.de>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-kernel@vger.kernel.org,
        Alexander Kurz <akurz@blala.de>
Subject: [PATCH v4 2/2] leds: leds-mc13783: Enable driver for deferred probe
Date: Fri, 27 Nov 2026 20:16:26 +0000
Message-ID: <20261127201626.26970-3-akurz@blala.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201626.26970-1-akurz@blala.de>
References: <20261127201626.26970-1-akurz@blala.de>
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
 drivers/leds/leds-mc13783.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 1c4175fe10fa..e2a8f59bef68 100644
--- a/drivers/leds/leds-mc13783.c
+++ b/drivers/leds/leds-mc13783.c
@@ -108,7 +108,7 @@ static int mc13xxx_led_set(struct led_classdev *led_cdev,
 			value << shift);
 }
 
-static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
+static struct mc13xxx_leds_platform_data *mc13xxx_led_probe_dt(
 	struct platform_device *pdev)
 {
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
@@ -163,7 +163,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	return pdata;
 }
 
-static int __init mc13xxx_led_probe(struct platform_device *pdev)
+static int mc13xxx_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mc13xxx_leds_platform_data *pdata = dev_get_platdata(dev);
@@ -290,13 +290,14 @@ static const struct platform_device_id mc13xxx_led_id_table[] = {
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

