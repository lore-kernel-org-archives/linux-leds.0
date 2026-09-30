Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D23651616E;
	Wed, 30 Sep 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778393; cv=none; b=fRJH+Wh3z+CvK75unAIj58sh/E01XGLyg5zIUUJz7vI825yJb29vK/QELEU66SJpl1wTpcXiZTceHaOJPw4t4+ltt0HcI3kpbRuIuTUocT4nCMsBQc0xtaqk+17QVphaTofmUe7n+Z+MQGHnPqqGKA/7jtdBH3/gdriUhZPb94c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778393; c=relaxed/simple;
	bh=fMsEYMaJ3Q4u7pflwE7/gzWXjChtDSHAJtkGAzMt7Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q52JsAtHRi8EJLfoW1u24g4kimu5usCHVi/zRWBsT9ywoy3mL/FzsoeupL9xUulALJrRlOqYWZiozNI2G5ASYsFNNWIQRIAAGwq+5pxTDK6JR5Do4WPGSIrXJbu+M736SD+9Ni/c0fPHaMYc52vTA+L6CoHe6XzNGHrKaTJiSno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k28gUIhP; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k28gUIhP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=KYuf12bt9LdGnasJY7HDXdK/vvJyApSn9sMWxpyDAoI=; b=k28gUIhP4c2tpiX9NLF3SFgz8o
	+fO0X8SNqn54fc9QguaA26eyhcXaG63IjDuV8TuSGWYdZFQPuViy1GvNNsJBZIxdvm1jB3VgyRigC
	/Jp+0CYRktmJd8y88tZyHlkayAbKQHhyBYLs+uGVYZqNi+bAWfWPpRg2CKelbXjC8DSuAYY4HgrJC
	EoIs4W6zTemejHtoPEVNUe8zDA8s2VZxYMxWhuZFNvl7iBuFA172oNGa7ojhCgKFWrF2i6R7R2RDW
	4ItOIuD1aBdkIA6iT0Ikz/E5Do+89zK4D9Vl9jVBicXWED5edzcisz8w2qrCE+hyMy+m1Yked1QsL
	C1IB3GLA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvGB-000Cq1-22;
	Wed, 30 Sep 2026 16:26:15 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvGB-000MAX-0G;
	Wed, 30 Sep 2026 16:26:15 +0200
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
Subject: [PATCH v4 05/10] leds: pca995x: Write global registers before creating LED devices
Date: Wed, 30 Sep 2026 16:25:44 +0200
Message-ID: <c46f7e126c08a53a8f04643b5bc8de3145ce84bd.1790684839.git.nora.schiffer@ew.tq-group.com>
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

