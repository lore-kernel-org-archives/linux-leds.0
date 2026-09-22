Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA48391E4C;
	Tue, 22 Sep 2026 14:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088517; cv=none; b=l1RR8PNTY6oK/1fobu8zvI83RhPJZzYM6a38z3BMShk0WFDCOkXb834bDNhlW7gaJXQfbk3J7WIn7Nz80QPULRsbP1vGsM1RLQ/WCF44u4DEgTxed1mL4yFOjOLtuN1xUt+/3afbirgh9bD8Sn7aqYpR7oupsQPsYyFK9eyUvcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088517; c=relaxed/simple;
	bh=47hb35oYe5cuVEEq7siJ4GEo+xFp7UzsM0cF6S9itXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpNQ8W25xOZI+UlgyT3nRAf+Co3x74geuR1ZaUWGP9UetwTMvyi5JRixT4VX/qfycswP0UmFXRr87xkk8GRJ3k2lnDMajyOK70UBZ5AiG45vsxINtWSLIfgGys7FGFJCLG9G/igzlETPv6BVnesP7Kl+YZGAmRY7KW75U3oKZQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=dvq+FeiQ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="dvq+FeiQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GMOJFlc4JrhNDRUMJSPF00oTxXHLgtst/iFJ7M3QOmg=; b=dvq+FeiQlW/c+ZQZeeZVQ5SeyB
	Kt97/3hH1g7KOC6Xgxdqw9UKqerCn+QbNmYOhkxEGuiAssBiFJ8C6/e3xI5Tg+KCE5psmJ5ao8Nnd
	a+/U15Id6gAoEl9od09nbDg+vX2ByBVx6yt36aO2odxPPuroPyTbz8oYNM4HS3L8Hv3/8X09BcVZn
	MMg5deuUDLH6oQ7UsJGPizrVFev73CqOn241L+DJl/ZVlPf+F+hI+KhlicBN9at3FpuANtuztwT4D
	WsxQT+O2G1XmOU5c3PrLEmFmm8D1KuVkLJOP174R/4cWg79rYN5uRl1VxfIaWK4U4+riVgFVBU+zG
	rjW/6wbw==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nG-000Mh1-25;
	Tue, 22 Sep 2026 16:48:26 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nG-000PP0-0M;
	Tue, 22 Sep 2026 16:48:26 +0200
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
Subject: [PATCH v3 04/10] leds: pca995x: Fix fwnode handle leaks in error paths
Date: Tue, 22 Sep 2026 16:47:51 +0200
Message-ID: <3d38609c96d387aec7eaff7cdb19fc2d8eb32a3e.1790087890.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790087890.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28131/Tue Sep 22 08:27:06 2026)

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

