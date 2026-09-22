Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C742638F95A;
	Tue, 22 Sep 2026 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088517; cv=none; b=atiJ+zNkKKflrC5krNxboVphKNMgQmCtIC3eJFPN7U3AVH5eDx2zRH2Nk6xSh2e63vRowdues18DxfZjGAzb0tiIyVZymVBOQAQF1iBQHjMOno/fvs/RcrYg06G17lVlk2Gh51G+yH5nLFVPLIlmBzM2ItRkGjFIyeKIsIYOZsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088517; c=relaxed/simple;
	bh=FCApGHMWc+kTIV27sY3rCeuIozsTpc3FMQYww0bbJu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=csMt5yxFLQC7sae0AfSR7YfqT/j+/WTzV9DIU8nTCXCPjR6D2ZqGI09mTJqNhBzkq7ptBJEpWTKdaomMsYp/+oQFmzzQz7bdH+nRmh9kcqlshTtHgXuRYh9n+RxAc/qo6HrIW3YqE7GE87AF2OiqUqiY8qin6y92QTRaxPyPE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=b+v7mGRH; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="b+v7mGRH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zvOgkVbLTZAACB9gDj+VHjZkJMYpe7K5p8sFuAHu5Rc=; b=b+v7mGRH48sfl5qmUgK0XXSXWn
	fo8NRE0qiOl52Iqc72CEIZ8Hc0EbfFs/u3kLy3u4ylzZ174Wnh5sd7YckQm/J4FBBPyFu6FbNgTfE
	HeVNySI+kcMcVMgiR6YpYq9VvPVQpjvifwVYc9iZwt1b39qSVHgxzU4sV+FA3G2JodIdckH+9fWH9
	23SNxWESYye9K6Mm56JgjaXo0CUtazkHMZmq+BTzkkB4Todg32sRbN4U0VGuTvdrIcyTyn2csvwuy
	phJp6XyhJewvhexhLk5UieuZqo6+NNUS1gfbjXktkvR7DDiicczeeuG7RyGLiDhiL5ond/LkkvHVj
	rCyb0MLQ==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nH-000MiJ-2Z;
	Tue, 22 Sep 2026 16:48:27 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy02.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x91nH-000PP0-0w;
	Tue, 22 Sep 2026 16:48:27 +0200
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
Subject: [PATCH v3 07/10] leds: pca995x: Make output gain configurable
Date: Tue, 22 Sep 2026 16:47:54 +0200
Message-ID: <b77094f48d9aede5832f38927c64d4e004a14538.1790087890.git.nora.schiffer@ew.tq-group.com>
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

The output gain linearly configures the LED current in 255 levels; the
absolute current depends on both the gain value and the R_ext resistor
connected to the LED driver. Make the gain configurable in the Device
Tree instead of hardcoding it to 128, allowing to adjust the current
for different hardware designs.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index b528b2b4990a7..13cce0c3fdc19 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -127,6 +127,7 @@ static int pca995x_probe(struct i2c_client *client)
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
 	int i, reg, ret;
+	u32 iref;
 
 	chipdef = device_get_match_data(&client->dev);
 
@@ -154,6 +155,11 @@ static int pca995x_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, chip);
 
+	if (device_property_read_u32(dev, "nxp,output-gain", &iref))
+		iref = PCA995X_IREFALL_HALF_CFG;
+	else if (iref > PCA995X_IREFALL_FULL_CFG)
+		return dev_err_probe(dev, -EINVAL, "invalid nxp,output-gain\n");
+
 	device_for_each_child_node_scoped(dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret)
@@ -178,7 +184,7 @@ static int pca995x_probe(struct i2c_client *client)
 		goto err_put_nodes;
 
 	/* IREF Output current value for all LEDn outputs */
-	ret = regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
+	ret = regmap_write(chip->regmap, chipdef->irefall, iref);
 	if (ret)
 		goto err_put_nodes;
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

