Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795246994;
	b=bDITxD4CuHXlbi3cVvGvfcj5sqzQLU/lCmSfnzX0lA59Cm/U/FaBW1EkSDiVKXmEfsYx
	 K3yQS6JsvVupVpiG1EJMLAgFRD29EKKksMiHL5wCN/WZ7AP3Z0Kt1noUxzD1mtKc9Fura
	 t0T73DL7rKNUkJ3BXUO4ya33CjQG579cH1E0yGLIN3wYadjlEgkPFurgFEr1Edk17Nx4o
	 CQUNhIK1ZhsV37FBIrRbqTjkfsRavDv1hhgZnUB3C0XBwJfCs7HbKfng8ULBnT9aO/yN1
	 TTV4mcTTucIxUl+MSBMs2G0Wd9eHvidZfIzMAyHM/zqRhQTPrqBlw3PrvPb3jkHjYkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246994;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TfZDmxUS3f9DwEGJSoQXaI/7hT5azmRVE2pM5ktJupM=;
	b=obse2D5zDd3MJlJJr63/DPd/D+xKalIzDHObKI6s6TZYDFY7hNCzye/vcULkW0hD4n49
	 6FPWZxAnBLtxLydcsGdJi6YxE4XPn3/6kixm6z1BZAFIvecqtb5Y+vp0an/QLg6zY52nV
	 XdAVCg4uditOgRx08X4FkIV54+wUL/JuuoGCOpbTFNxsCG0RSoz286x5MJz5PvusCB8EJ
	 2p60YnX+FKM4BM7QmbbLGN9vyrqfbSjarQ52iMBUUDNwhiDGSyievvpk6MmHc1cqxTK7+
	 LfA1tnehEBTWpI+O5GUcjdAZCU23/AbpL8/GonZnbMmm542dyY7iyggtiAgjl41ppKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0A7606A320;
	Sat, 21 Nov 2026 07:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E0A7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6AL7gr0X008770;
	Sat, 21 Nov 2026 07:42:53 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6AL7grtD008769;
	Sat, 21 Nov 2026 07:42:53 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH 2/2] leds: leds-mc13783: enable driver for deferred probe
Date: Sat, 21 Nov 2026 07:42:39 +0000
Message-ID: <20261121074239.8745-2-akurz@blala.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121074239.8745-1-akurz@blala.de>
References: <20261121074239.8745-1-akurz@blala.de>
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
index c3bbbc8ef946..042cefde7853 100644
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

