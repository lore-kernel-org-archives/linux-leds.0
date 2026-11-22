Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.160.73.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795332766;
	b=B7X8P0mIX4hqsWZRoRdAIJP2Ul7q9OfY9hPh3yv+4wCYO8sOI4lQeCw1V0gvkLsZlVfe
	 rUTpuyNlrxlDlbeAqpS+O/Eah+ITzM2Syf/xQZ17kEm+/Fhj4y/TOyoBwdegVvye+Y2uX
	 3TqipQT8wQrOPAIelT+RDSn/QslWK4jTz0oR2YhhKslXe87M3bVtrtw+DgvAnJlddIeCi
	 Ym1E/ktYvSNOsqShgue5uDqAUXXKCmAAfJQhPOF9DuyY/HbXDmYIGm28uDzVqx1lVr4w3
	 UgPDlfowknd+eidcaZDzAOR8moEWL3a2hxvGrYKlWmX19cG+GpVTkKP38Ih5lytTT/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795332766;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z/itzPyaySuUqIwDB1VMmsM811i+UtgNl+TS4HUXl3Q=;
	b=0NoyDZe/TfaWh3TB85fOe+4cii8tuN1ULz/j0a/dAKcKJKZvx0Tj3Q696/9LWBpFs8dJ
	 rgF4pgW0Odz8SAiMFgeX1g6qrnV7v/tamfOPmWTOgBrq1dKlH/kEm8v3KtDZNYiI36V1E
	 FdHbKa1mV/2c+O/XVgcGxGav7KXWc0qEJ+oSuSXWqDbLIrq5bMU6+BLSagmmIyX/JpTVY
	 Vb43dHRAdgyu5pFgxN/cZQI12V6yV3CRX9om2ojpVhsk9xi6QnL86ZDQcsfYTBkD11qva
	 sgvpoE/OZ9RjjC4B+Ly8vqhky5Gq1MI4etJEW+PdjEN833p0sR8JiEmi7M8WsE3UHSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blala.de;
	spf=pass smtp.mailfrom=blala.de;
	arc=none smtp.remote-ip=213.160.73.65
Received: from vs81.iboxed.net (vs10.datenmanufaktur-hosting.net [213.160.73.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4168B606A32C;
	Sun, 22 Nov 2026 07:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4168B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blala.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blala.de
Received: from blala.de (localhost [127.0.0.1])
	by vs81.iboxed.net (8.18.1/8.18.1/Debian-6) with ESMTP id 6AM7WdwT026727;
	Sun, 22 Nov 2026 07:32:39 GMT
Received: (from akurz@localhost)
	by blala.de (8.18.1/8.18.1/Submit) id 6AM7WdSR026726;
	Sun, 22 Nov 2026 07:32:39 GMT
From: Alexander Kurz <akurz@blala.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alexander Kurz <akurz@blala.de>
Subject: [PATCH v2 1/2] leds: leds-mc13783: use unified device property API
Date: Sun, 22 Nov 2026 07:32:34 +0000
Message-ID: <20261122073235.26707-2-akurz@blala.de>
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

Replace OF-specific API calls with the unified device property variants.

Signed-off-by: Alexander Kurz <akurz@blala.de>
---
 drivers/leds/leds-mc13783.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-mc13783.c b/drivers/leds/leds-mc13783.c
index 19c1b51475db..82b2062b2280 100644
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
 
-- 
2.39.5

