Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367200;
	b=qBv1fa78rSzmO7NTSlkRMqY3DocEJTN78W9KgPswPZkUzmqpBlRsAYzA/5tJtH/OHxPY
	 HKRy0s4JAEp9Fgl/luC3EZkyX0JVFnfBvu9ova0XaTIh/lYxP5I/z1VBcMkBc/cXprucd
	 La/o+YOIShLqfwmmSjW+tuAtmhtEdftpgbNNU+eirLt13La95ORqZt8x9n5yJo4LU0q30
	 lfo/sntlG5fNxQFDveDPvD9c6C1/5dzu2HkDUPM2N2ZcUAF9fFaQ9mgTJ+1v39Slbfxe8
	 tFni2ognc3k//covP34sd/m/i7s+zGD0cYrjNG4bay3/AMXuwCYQv2irgHyR0sYh0MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367200;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xKJU8r8LgWpb+YbX2NKqLQcLCQkJ8708QhgDAlQe+d8=;
	b=cunmFwgY02Qf+UuJuB4kFPtx7n9Dgv6s4iV4XGMtBKVripO/MIUTKKOntLUN+SWWpr7x
	 a3QAGltw1SApstOVeteHssPMkHNLnRKFuEk4/6IDfeH/gYtnII4JwkXizI9+UUWo8J8FI
	 Q/SEcEliJmmaHY7h3DMXxs/XDlWmQJ+T0PFdI1vM3D8Egu5XFrhLgZI+uhst6RJgOSw0R
	 EvODGhrSMKk70a2Rkeu2LWYFqJxpaxdKV3UJNm1CjnyHxiMM6c5e5ZO+5iUDVTLKOsJWa
	 ZUI34zNake/m6NIm/Ck6tH6BzwKbpIO/tdiAO+TCeu05DOQuFBu3bLhuyNA+EfnfiCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0A5606A680;
	Sun, 22 Nov 2026 17:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C0A5606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6AMH6I5V031738;
	Sun, 22 Nov 2026 17:06:18 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6AMH6Iom031737;
	Sun, 22 Nov 2026 17:06:18 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v3 2/2] leds: leds-mc13783: enable driver for deferred probe
Date: Sun, 22 Nov 2026 17:06:15 +0000
Message-ID: <20261122170615.31710-3-akurz@blala.de>
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
index 0882c7f6b649..538f5794410a 100644
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
@@ -162,7 +162,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	return pdata;
 }
 
-static int __init mc13xxx_led_probe(struct platform_device *pdev)
+static int mc13xxx_led_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mc13xxx_leds_platform_data *pdata = dev_get_platdata(dev);
@@ -288,13 +288,14 @@ static const struct platform_device_id mc13xxx_led_id_table[] = {
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

