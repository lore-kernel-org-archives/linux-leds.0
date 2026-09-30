Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257F54E4C58;
	Wed, 30 Sep 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778397; cv=none; b=kFDR1hotvZdN0ksBva8QwIHoCaEwvV8GLihA7DFgRf0CNPrpENfHapMnIrYpBh4HB5Hymc+R7bSxRWFdVIbRCsJinZ3pjOvClRAxCyOWkzlQMYknI7ukZRxVWal97jXCN7g9NsonEmRv1HnB2xRIY5hYK5p9GqZWpyroyxH4O9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778397; c=relaxed/simple;
	bh=47hb35oYe5cuVEEq7siJ4GEo+xFp7UzsM0cF6S9itXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jhiVEx/NH6D1O2q3h68lJaYUsSeX2u5lGzBa7IjMjQB3+6riaFxcMJSb7h4rfzLgm6kPEdOARfIHXgyWVWcNA4Vjj6HIbsUrPHMf+IrZ8k+c9xr5O46QpGm1jWxwzZw5I3ldnTRaAn/wALdXvs60aCoe+nlpbJ+xu2QOFNezfXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=bhh1g78v; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="bhh1g78v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GMOJFlc4JrhNDRUMJSPF00oTxXHLgtst/iFJ7M3QOmg=; b=bhh1g78vLTcpEu+cDDaFanguWg
	JcHx6lMwFJ+IkwCqvUXDSiKuJ1tRonMvPUELfa9iDWBxuppFiYxgocWMsghW1swcN2wi37gCNgXPo
	qp8en9WmPzSHbdNALxdF5FQ17vxeqmfeREOvvTXzxvj37oVrpZ7sV838bwQ6eJZx70ks016zQzCMu
	citubFXgzaraJbnQVFucHDnZc2zrKQbC4cLcTs4LBa0/j19pKR16BfQmyNgWYF/nro55ZwMCZ9sD0
	1e1cCinXIEPdvApskdcq9tc5T00Z0UXH17m18TU6zSUc/FP46mEd9qhU29QR1KWCdBv+3p0rx/p06
	VDRS3HKg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvGB-000CpG-04;
	Wed, 30 Sep 2026 16:26:15 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvGA-000MAX-1Z;
	Wed, 30 Sep 2026 16:26:14 +0200
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
Subject: [PATCH v4 04/10] leds: pca995x: Fix fwnode handle leaks in error paths
Date: Wed, 30 Sep 2026 16:25:43 +0200
Message-ID: <b2fedfd41b25fb3b1b6eca231d009d5497b1e003.1790684839.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28139/Wed Sep 30 08:24:18 2026)

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

