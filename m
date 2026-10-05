Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9788E48FF7B;
	Mon,  5 Oct 2026 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208484; cv=none; b=GBt6dI77QTjrQNfW3YRRzxGOxu3D70r3I+2rqmOdRRQFx6iUtPS+1qh3coB6/UywuLwnuwTXVwmIF9DXWAeDdjnp+ejy6nO/RJxxiztOJ/jYw3bp164TXQjUfJ0U/ZCZRFmvugQT6ISViJ1Af8w88Y2YjAOj+fRJ4Yu7PgP2xO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208484; c=relaxed/simple;
	bh=WDUo6plYQrHKR/Mn89MSt8tTrJOHGWs/P03u2at+gtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EwvPMpeF5f1F+CgVYIdcP4dJXNX6U0Z2VWwAkZ0MH7cAqI9pAkKCYXzZTNfLNHHdmW6Ws9p2iJ/guxFTdewwUgIdhrzOQcZKjIqzEKQ2Sh+eYAUHQWbSxqUb+X6xn/+8FgBNyB70jgLwzp9CxB7ULMJ7eG2Yk5PfdrwANAlXj0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Lsf0uJ6t; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Lsf0uJ6t"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=PhLadTDAN1qeuHtn4J2vQhQNYGqun8mHlQ+L4Lk4fyI=; b=Lsf0uJ6tI5nZYN069M/SkPnVdL
	wTsqf30tv/tWFTD6uwDuC7selZi2VfJ/B8eS3T//A0H2zZe7Okg+9I7YO85uT/N2SxRN/xFHMA+Sp
	X1wqgr0XgDxoYDzfOxrFa1AMwxrVvWY4BWXd4OGhcB9SBmXU1i7QUpcg8kJLhTBqa4YwkzVEj/RWW
	8Y+Jg4IphWJUI7UaSedRSKKPmqwYJLhQtjBCdXnWJN8FOorzRA78FzVr/1nLemcETFuU1xBWQenY7
	jzmSoY+6UN48ZfuT8qrw1OIIeJEEGUnBrcTPKUJoV2BCBMzfyMVRVf8tBbt8ciTMrtvol4W2DGV9u
	ADOx3AjQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9G-000Oxi-0B;
	Mon, 05 Oct 2026 15:54:34 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9F-000HEr-0m;
	Mon, 05 Oct 2026 15:54:33 +0200
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
	Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>
Subject: [PATCH v5 03/11] leds: pca995x: Fix maximum LED index for 16-channel variants
Date: Mon,  5 Oct 2026 15:53:27 +0200
Message-ID: <3926421f5734083348a6dc3e3c0d60de5d75a067.1791207391.git.nora.schiffer@ew.tq-group.com>
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

The pca995x_chipdef for the 16-channel variants PCA9952 and PCA9955B
correctly sets num_leds to 16, but the value was not actually used when
checking and iterating over the LEDs during probe.

Fixes: 68d6520d2e76 ("leds: leds-pca995x: Add support for NXP PCA9956B")
Link: https://sashiko.dev/#/patchset/6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com
Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 drivers/leds/leds-pca995x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index fee6216cd1bd0..8b05b3f12cf38 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -146,7 +146,7 @@ static int pca995x_probe(struct i2c_client *client)
 		if (ret)
 			return ret;
 
-		if (reg < 0 || reg >= PCA995X_MAX_OUTPUTS || led_fwnodes[reg])
+		if (reg < 0 || reg >= chipdef->num_leds || led_fwnodes[reg])
 			return -EINVAL;
 
 		led = &chip->leds[reg];
@@ -157,7 +157,7 @@ static int pca995x_probe(struct i2c_client *client)
 		led->ldev.max_brightness = 255;
 	}
 
-	for (i = 0; i < PCA995X_MAX_OUTPUTS; i++) {
+	for (i = 0; i < chipdef->num_leds; i++) {
 		struct led_init_data init_data = {};
 
 		if (!led_fwnodes[i])
@@ -169,7 +169,7 @@ static int pca995x_probe(struct i2c_client *client)
 						     &chip->leds[i].ldev,
 						     &init_data);
 		if (ret < 0) {
-			for (j = i; j < PCA995X_MAX_OUTPUTS; j++)
+			for (j = i; j < chipdef->num_leds; j++)
 				fwnode_handle_put(led_fwnodes[j]);
 			return dev_err_probe(dev, ret,
 					     "Could not register LED %s\n",
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/
