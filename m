Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCABB4908A6;
	Mon,  5 Oct 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208484; cv=none; b=F/DX8UiFIOsYBng+55kKgwItKDp+s6XwKz33dO2n8KIkAqA7v7vxVOw0gKKGGjzWBRGvArcnbWTEsEvBThAgF80Kp5SqXuUg/0Bmu79BzKs9sAMbfEhLcxB4Zd1KP13WFQCvPRzdAb0Vu6dfYGPIRMRwMaRWNjaYggUSBa3S3YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208484; c=relaxed/simple;
	bh=47hb35oYe5cuVEEq7siJ4GEo+xFp7UzsM0cF6S9itXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cHrkexu7EeRkvIlJFur6FsIvctd96SAZGVyrEBh9u4PP0GTB8kdMY0bhm2WoBlkGNrKf9iD9uGqU6o88/bMyQ+vD+mtp4saHqLNEFe8HxgiDBu8+lbnEPQ0N4hoCUDyQ5QEJQ7KIJ0GCLXBGQO5zT5bgIn8TKYRgSGc8s6Vtt/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gUX14JB7; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gUX14JB7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GMOJFlc4JrhNDRUMJSPF00oTxXHLgtst/iFJ7M3QOmg=; b=gUX14JB7QI/tdeCqBd5Zdsn9FQ
	jGPkL1DvxCZQ2ArGOJYvjytNdufeYCysLbBWU/7hV5ur7X5qkMH+3+eyhjpD8+zYLTbfhsZdLu3Tq
	nXJ0w56UFBthsNwZOBT4JclELUYYwGKRB+mKO08FUIH0qyDqe3Eq+DZKGNv/MFBRq35f/oderq/nw
	OTP8btTYPS0Mcg/jk13dga1v4KGjmrDgUinZZq/+dvJ0FzMK9y1bTBww3K7YVAKHV4mdeVyEcZnJ6
	qcxdrIArmVOq8V9urv5AAu+NIdhOZ/qpMVRSA+fiHz1T4NNLVa1vtWjBUsBwtIPoen0rMDeMo789D
	tzFqvHpg==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9G-000Oxo-21;
	Mon, 05 Oct 2026 15:54:34 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9F-000HEr-2X;
	Mon, 05 Oct 2026 15:54:34 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Pieterjan Camerlynck <pieterjanca@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v5 04/11] leds: pca995x: Fix fwnode handle leaks in error paths
Date: Mon,  5 Oct 2026 15:53:28 +0200
Message-ID: <b2fedfd41b25fb3b1b6eca231d009d5497b1e003.1791207391.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28144/Mon Oct  5 08:24:24 2026)

Each entry in led_fwnodes needs to be put as long as no LED device has
been created for it yet - not just in the creation loop, but also in the
first loop that iterates over the child nodes.

By clearing entries in led_fwnodes once they have been used, the same
cleanup loop can be used to handle errors in both loops.

Fixes: 82c5ada1f9d0 ("leds: pca995x: Fix device child node usage in pca995x_probe()")
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 8b05b3f12cf38..079ce3d8f1e49 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -123,7 +123,7 @@ static int pca995x_probe(struct i2c_client *client)
 	const struct pca995x_chipdef *chipdef;
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
-	int i, j, reg, ret;
+	int i, reg, ret;
 
 	chipdef = device_get_match_data(&client->dev);
 
@@ -144,10 +144,12 @@ static int pca995x_probe(struct i2c_client *client)
 	device_for_each_child_node_scoped(dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret)
-			return ret;
+			goto err_put_nodes;
 
-		if (reg < 0 || reg >= chipdef->num_leds || led_fwnodes[reg])
-			return -EINVAL;
+		if (reg < 0 || reg >= chipdef->num_leds || led_fwnodes[reg]) {
+			ret = -EINVAL;
+			goto err_put_nodes;
+		}
 
 		led = &chip->leds[reg];
 		led_fwnodes[reg] = fwnode_handle_get(child);
@@ -169,12 +171,12 @@ static int pca995x_probe(struct i2c_client *client)
 						     &chip->leds[i].ldev,
 						     &init_data);
 		if (ret < 0) {
-			for (j = i; j < chipdef->num_leds; j++)
-				fwnode_handle_put(led_fwnodes[j]);
-			return dev_err_probe(dev, ret,
-					     "Could not register LED %s\n",
-					     chip->leds[i].ldev.name);
+			dev_err_probe(dev, ret, "Could not register LED %s\n",
+				      chip->leds[i].ldev.name);
+			goto err_put_nodes;
 		}
+
+		led_fwnodes[i] = NULL;
 	}
 
 	/* Disable LED all-call address and set normal mode */
@@ -184,6 +186,12 @@ static int pca995x_probe(struct i2c_client *client)
 
 	/* IREF Output current value for all LEDn outputs */
 	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
+
+err_put_nodes:
+	for (i = 0; i < chipdef->num_leds; i++)
+		fwnode_handle_put(led_fwnodes[i]);
+
+	return ret;
 }
 
 static const struct i2c_device_id pca995x_id[] = {
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

