Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795246995;
	b=N5XbzTvf/HhFi5bkmkW3o2Q1Z/aV1UAkIu4vTImYwE+Qh123NWlipzfceCG3hW0wTmQG
	 CNjRL9+nKpguqoVrSEtYMKdmyqQw2+Qp3oLCftxRo6sg8fBmfXWrQs3Sg7e/gLlvGbCdt
	 btuYYo2VWIS+gX66mLx73gEpqKi6O3Esbg52bhHNB+Za/3o23Lb191Xs2JuQIzmgaVD4L
	 1Iqh+8s/3tL8PCW7Pp0yX3mlImOGia5Nm/1GaJKC5MFJ0V6JqxFutDldvTGCXrxI1xfq1
	 4TWpW3jTqY/DbwB7hybNhwmR42n1F+DS0MvmfPfBQTMiXixaWOjjccfob736u3dgzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795246995;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YQMD6P455roWznDvZidE7Y9pltP2O8Ucc6Aqgok7dcY=;
	b=nLivZEiNlL5RE0oXON8yqI/uYbM30XpOmIJ8J/M1u6txiPl+qwT/1DZZO3wJzo3n+bHV
	 YHJBC5/rGR3dVcttqs78P1fkt+vbsCWejJP29Lv/UoJLlWXwazSAiVPhho86fV1NHTgDc
	 VaY60qdNdodwG2Xb8EwbC6QM72C2GppnLZq+vC8JLRXLzdy8adFpK/fLTUWGLYg0I36/j
	 khj63enC+OE0ntiDFThesCbEQNl1pH3D/dJwQGXgP3oEtiwi+amomjSA3+V1pBwkNVgCE
	 8pFYJhh9uqXViXsQ6S4zVYDKYUHkH8BZPbv/tGjP5W6KaJmP8R4SVJphz/OywyBjiig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E115606A325;
	Sat, 21 Nov 2026 07:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E115606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6AL7gqYQ008761;
	Sat, 21 Nov 2026 07:42:52 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6AL7gpqB008760;
	Sat, 21 Nov 2026 07:42:51 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH 1/2] leds: leds-mc13783: use unified device property API
Date: Sat, 21 Nov 2026 07:42:38 +0000
Message-ID: <20261121074239.8745-1-akurz@blala.de>
X-Mailer: git-send-email 2.47.3
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

As preparation for a fix regarding deferred probing, replace OF-specific
API calls with the unified device property variants.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/leds/leds-mc13783.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 19c1b51475db..c3bbbc8ef946 100644
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
@@ -114,7 +114,7 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 {
 	struct mc13xxx_leds *leds = platform_get_drvdata(pdev);
 	struct mc13xxx_leds_platform_data *pdata;
-	struct device_node *child;
+	struct fwnode_handle *child;
 	struct device *dev = &pdev->dev;
 	int i = 0, ret = -ENODATA;
 
@@ -122,34 +122,34 @@ static struct mc13xxx_leds_platform_data __init *mc13xxx_led_probe_dt(
 	if (!pdata)
 		return ERR_PTR(-ENOMEM);
 
-	struct device_node *parent __free(device_node) =
-		of_get_child_by_name(dev_of_node(dev->parent), "leds");
+	struct fwnode_handle *parent __free(fwnode_handle) =
+		device_get_named_child_node(dev->parent, "leds");
 	if (!parent)
 		return ERR_PTR(-ENODATA);
 
-	ret = of_property_read_u32_array(parent, "led-control",
+	ret = fwnode_property_read_u32_array(parent, "fsl,led-control",
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
 
-- 
2.39.5

