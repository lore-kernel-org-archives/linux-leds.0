Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB844908AA;
	Mon,  5 Oct 2026 13:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208485; cv=none; b=qPKEmxgMQGOJ9V6Ci56Jw+PjmT8hTWBJnqGI53nIIXLzZ79fYFtI8TWVyZwvdMsIQKsbkKHLH4mbL+hDWinry2gXdLpbIdXBHmZzIqm1B1U5xwnEeBb7XpqB4M+x8iXEj4AF2nH38vKpPV6CO4r6YCwUT5zgYvFfnREFpGQShT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208485; c=relaxed/simple;
	bh=fMsEYMaJ3Q4u7pflwE7/gzWXjChtDSHAJtkGAzMt7Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GxwarDdpyYDX0C35Ff+lGNwrjWTECYuBQWiVmhUUxR/0BKVh21dgXAfFTixhFH8lISXWNkQcT8PHSLj937nj45ZFL+oy/Oz6lW8JCdsdYqOjlPrT5sqdoajlffsJLL3M4d/VdsEXEqYxhMv2zAnKcP1yR+9H4ZZ1Olsij7nADYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Pnsfla5o; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Pnsfla5o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KYuf12bt9LdGnasJY7HDXdK/vvJyApSn9sMWxpyDAoI=; b=Pnsfla5obfTQ+vhOFN6yFEoPfG
	Ej802Dn50MYHgbJUkZL3H96HEXV+EpxCrocFkLFj1hjL4CEMi4pe80Ljk3Faj4AWl3xhoY3VSNXUB
	FlcI14kg++TRpO2kk7BcznJCHByCm0h9EgBoKSZx9gixY6TgMe6y5+WxwZFVZdnaJzjTCahI0UIiM
	KumYAuonToDzWI3q8fYxQMDXaOpXPvbY/lmyFzHvk/jsb58s8dV15Nh7d35/XpR4caHqddpkfJge5
	2Gsl3X2a2tNY3jrkTR3SL9p7gp2XE7bwHHEqsECu/cwZ6wW8EmOH03QwAd5/KZ6tFxZgNHLavOHxY
	aPzDarSw==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9H-000OyS-0V;
	Mon, 05 Oct 2026 15:54:35 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9G-000HEr-16;
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
Subject: [PATCH v5 05/11] leds: pca995x: Write global registers before creating LED devices
Date: Mon,  5 Oct 2026 15:53:29 +0200
Message-ID: <c46f7e126c08a53a8f04643b5bc8de3145ce84bd.1791207391.git.nora.schiffer@ew.tq-group.com>
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

The hardware setup should be finished before the devices become visible
to userspace.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 079ce3d8f1e49..e6122b33451ed 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -159,6 +159,16 @@ static int pca995x_probe(struct i2c_client *client)
 		led->ldev.max_brightness = 255;
 	}
 
+	/* Disable LED all-call address and set normal mode */
+	ret = regmap_write(chip->regmap, PCA995X_MODE1, PCA995X_MODE1_CFG);
+	if (ret)
+		goto err_put_nodes;
+
+	/* IREF Output current value for all LEDn outputs */
+	ret = regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
+	if (ret)
+		goto err_put_nodes;
+
 	for (i = 0; i < chipdef->num_leds; i++) {
 		struct led_init_data init_data = {};
 
@@ -179,13 +189,7 @@ static int pca995x_probe(struct i2c_client *client)
 		led_fwnodes[i] = NULL;
 	}
 
-	/* Disable LED all-call address and set normal mode */
-	ret = regmap_write(chip->regmap, PCA995X_MODE1, PCA995X_MODE1_CFG);
-	if (ret)
-		return ret;
-
-	/* IREF Output current value for all LEDn outputs */
-	return regmap_write(chip->regmap, chipdef->irefall, PCA995X_IREFALL_HALF_CFG);
+	return 0;
 
 err_put_nodes:
 	for (i = 0; i < chipdef->num_leds; i++)
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

