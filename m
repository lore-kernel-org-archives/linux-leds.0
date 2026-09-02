Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECB8433E75;
	Wed,  2 Sep 2026 12:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351784; cv=none; b=k+o2MYEHjqMBLipkOTaAFqcjaExiHF0Lane4JxpvBua6nuUhKbhAjBV6tIEEtYeS+or4hRheCzsdNk9DfeezsL+8t+tFOvUwcPBjzFNHaPkPnJWoWk72F+wYxVY4Sq/So6x08hLU3i6npQJVaiFs7vXA/XOcQnyIiGdhD6x+0WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351784; c=relaxed/simple;
	bh=AESHr0IkfGVe/nYHKOQP0CK1IQsbtql8FlBvNdGujUE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nhYJKcMy5RKzgnzEoJ/jO4HFX1R3lu8NT0Bt2zstkAaawm1yFJ4o6bHewj1qDMi3c45joDy0wkhBqeKGCdEAO1lSkdnNaQA3VQyAHMVv4V8QFKTrahg3eZOMmKRQZ8ryj+J3ioXVKk6IR+qXKT2hTg1BB3Ikjkrv03lLkrwsbM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KdQUdWzQ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KdQUdWzQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=YZOJZMYVElt8qJZC0gYvS3Szs6oti4jhDQBoAAgKW94=; b=KdQUdWzQNGU9wbFij+iXKNCoQz
	yf/EXf8J8Gp/O8oeVLqHyT8HUgsHjE1BHKIUGMMgl7CM5febu1qHx4yaghL4JV57H3uXv/1gha2dx
	zduDuxsAoEqK52WoPpxptlkbo80+Qtwc6JOjCghg7n+iucYD3UyOKRFont0IOWmI/l0Gw8KyXdra+
	YmLMVZtJMmHbZgjT7fk2GASVeRaoHlWlWOMO1Rd8FyRAqIJF53SNhcsd69RKa71aOJ7KlTv8DgNkg
	p9Ig3XelHRQNwcpEUrO3vKnHeMgz4cFFcgoUVmSiX8F/7e9DJvjJG09tToUivkbPQU7H6f4GGmrqZ
	/hESG9Ig==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzY-0006yB-1B;
	Wed, 02 Sep 2026 14:23:00 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzX-0004kO-2r;
	Wed, 02 Sep 2026 14:22:59 +0200
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
Subject: [PATCH 4/7] leds: pca995x: make output gain configurable
Date: Wed,  2 Sep 2026 14:22:12 +0200
Message-ID: <0c7e5cd44bb73d8680d30e1ae912b1cfcdab332f.1788350618.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)

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
index 8eb9847b9709f..b069b93d39a54 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -126,6 +126,7 @@ static int pca995x_probe(struct i2c_client *client)
 	struct pca995x_chip *chip;
 	struct pca995x_led *led;
 	int i, j, reg, ret;
+	u32 iref;
 
 	chipdef = device_get_match_data(&client->dev);
 
@@ -153,6 +154,11 @@ static int pca995x_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, chip);
 
+	if (device_property_read_u32(dev, "output-gain", &iref))
+		iref = PCA995X_IREFALL_HALF_CFG;
+	else if (iref > PCA995X_IREFALL_FULL_CFG)
+		return dev_err_probe(dev, -EINVAL, "invalid output-gain\n");
+
 	device_for_each_child_node_scoped(dev, child) {
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret)
@@ -195,7 +201,7 @@ static int pca995x_probe(struct i2c_client *client)
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

