Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA3D4908BD;
	Mon,  5 Oct 2026 13:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208485; cv=none; b=UbwQI4ksTf2Uvs6aclgSLI7Zkn7ZlNzBSopw2DqRHofzVTjhUyI6L74uMgnS7MT3Cd5XPopMiTNRolmBXiUoBrpkUt/wcOM6LcfZc+VAXxEMunLD48v0qD2x8Q05LUgpJaA42kAqazlq5yLRmDlDlcOHh+sd/OBXYsDyTCjpfjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208485; c=relaxed/simple;
	bh=1EJ3I1svHPeJrHvLGB+g4xhf1ULp4UqBWn7KgIFjZEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ENES0ruPKJDbgszElxCsHdyfG93qNqCRIqGwhlLMulRHw+uBWAHcD9htCTkvt1ee/xbeeNbs9hLPVUa3sM2KdGeioblCblHhBrN42cBeCTQY/bOIee7q6EcA3OgiycvUlwTA91hBZafUmZiH9yaae1VGESVehe2FgJpjHoD17yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AeuvdcqI; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AeuvdcqI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=K8LfEIiH2RRlQ+idMFlmLYlhhnOG1kdBPcs1LE/RjTI=; b=AeuvdcqIVQbc9eT4yXqkXi5rOt
	uyZmiMBARWvYP3a7ezfNJzR1B20Hg7GAvD4vN71rSvBggBGMVu9LEK3JarLtY4d6+0ny0Bkmsegr3
	3whr4BwpT63UCwaPHyCSxEpfF0zQBAIoCwl66G+oWPeYx5WpWCkw1FHjFxkKG9JXuSRj/PDQ6x2TH
	6n4iLVbjsdbhOTpaQNbM2zw8aYa/D1vdn7SR2GvySrELI7pEik5RWOSlw43g9PjnZxYh7Ew3LRsYE
	ZKSv7At3SjEITPvuWPEFjGHf4pfZ8rWC0MaM1PF9oZKx0EWKIv20MULq6MrDDM26ysBtGwfBxC2Ul
	YtLTFHqw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9I-000OzV-1L;
	Mon, 05 Oct 2026 15:54:36 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9H-000HEr-1n;
	Mon, 05 Oct 2026 15:54:35 +0200
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
Subject: [PATCH v5 07/11] leds: pca995x: Make output gain configurable
Date: Mon,  5 Oct 2026 15:53:31 +0200
Message-ID: <f1ff88185074948a40a1e8e6f022cae4fcc55fc1.1791207391.git.nora.schiffer@ew.tq-group.com>
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

The output gain linearly configures the LED current in 255 levels; the
absolute current depends on both the gain value and the R_ext resistor
connected to the LED driver. Make the gain configurable in the Device
Tree instead of hardcoding it to 128, allowing to adjust the current
for different hardware designs.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index b528b2b4990a7..df3f7ab2e1f87 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -122,6 +122,7 @@ static int pca995x_probe(struct i2c_client *client)
 {
 	struct fwnode_handle *led_fwnodes[PCA995X_MAX_OUTPUTS] = { 0 };
 	struct device *dev = &client->dev;
+	u32 val, iref = PCA995X_IREFALL_HALF_CFG;
 	const struct pca995x_chipdef *chipdef;
 	struct gpio_desc *reset_gpio;
 	struct pca995x_chip *chip;
@@ -154,6 +155,13 @@ static int pca995x_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, chip);
 
+	if (!device_property_read_u32(dev, "nxp,output-gain", &val)) {
+		if (val > PCA995X_IREFALL_FULL_CFG)
+			return dev_err_probe(dev, -EINVAL, "invalid nxp,output-gain\n");
+
+		iref = val;
+	}
+
 	device_for_each_child_node_scoped(dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret)
@@ -178,7 +186,7 @@ static int pca995x_probe(struct i2c_client *client)
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

