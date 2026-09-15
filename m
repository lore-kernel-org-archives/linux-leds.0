Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72137DEA3;
	Tue, 15 Sep 2026 14:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481705; cv=none; b=RGk0Bb97dPGp+Ie+c6n2RXEtVL6oK1vqCZTuBK4wyA0kd6jvD6vzS7b3UVPjaJ5U2JmZYaVR9Ldxn9mjfY0yaVJDg25FGnksaOqfxtr256qFhv/up+vUX2Fmu0zc15ZQWmdB/XGfMNhiS+0Xh1DJj9f0uCjgANkUEKdHYzW3mck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481705; c=relaxed/simple;
	bh=xyEvljz0L0uHlEfkMO/XAAG1yVFqmZQW3RkJEraT2HY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PYMOz6wbGZl6kKDJOXsHpGh2GSuBHwxn5xMtgtt3eola23HabaopAtglW1v23zFSy1e0zS658JIdFICVpthoes4N/IEm4h6z/yWPukUPHQdq7rVu31SWiYUuykdlmJxeW/wJm27se+NWQRY5vqbSHUabEH1FnhaNEFjVz1OhEIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=U0h7+Wxl; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="U0h7+Wxl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ph4eoaSxarsjQv7bGWCkw3EH6rJ8brkR1cdiTpW1F1w=; b=U0h7+WxlnSnbXgdFixqUMGNGqj
	Jjw9JC2+SiMFZhS4aoQ/9d/log7tdpMkRQq1UOcQ+fJP7bgslfQ9eQOuGs97b4SZOmz4BS5XUDJZS
	rDLkJbB8FCa20Qq0q3twpoKZymaR474RVPH0IRejAW1LqI8N7nci5/QmrvkyM6vcrd5OU3r/0pvrH
	8IiJq6j0CuNvK59ni7tTZOgm8GIzN8bLFLSQ2I1MQtq5sps+W9RjGIY6N184cYKP7AuSDEm1WeKWh
	yHu/fV/qBJPZ4VF+6M8qj2chtMpo5mqoF7qtPSsR+cLxG1Upt6RDOlmX1CzR9sTxM+m9gMD2f9RBE
	lYYtyIog==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTJ-0003hT-1j;
	Tue, 15 Sep 2026 15:45:17 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x6TTI-000FKf-2j;
	Tue, 15 Sep 2026 15:45:17 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH v2 5/8] leds: pca995x: Make output gain configurable
Date: Tue, 15 Sep 2026 15:43:53 +0200
Message-ID: <6b65d783052e84fd00c139a3b3f85b04f680b798.1789477502.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
References: <bd687915af26ccdbfc8cc911eee0787fc8145ae1.1789477502.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28124/Tue Sep 15 08:27:28 2026)

The output gain linearly configures the LED current in 255 levels; the
absolute current depends on both the gain value and the R_ext resistor
connected to the LED driver. Make the gain configurable in the Device
Tree instead of hardcoding it to 128, allowing to adjust the current
for different hardware designs.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: Add nxp, vendor prefix

 drivers/leds/leds-pca995x.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 0c0ea57f3225a..9cd5702573b0d 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -127,6 +127,7 @@ static int pca995x_probe(struct i2c_client *client)
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
 	int i, j, reg, ret;
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
@@ -196,7 +202,7 @@ static int pca995x_probe(struct i2c_client *client)
 		return ret;
 
 	/* IREF Output current value for all LEDn outputs */
-	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
+	return regmap_write(chip->regmap, chipdef->irefall, iref);
 }
 
 static const struct i2c_device_id pca995x_id[] = {
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/
