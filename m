Received: from mta1.migadu.com (out-5.mta1.migadu.com [95.215.58.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1B934A791
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 03:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258403; cv=none; b=QIP/62FrlH1D8A0fWPjtU3EmFDFbhvtkxhiC6pi35/8csMG6SWk/lws7kn0ZBy56aO9udJhGUdUm05oMREn6PLHo9kES/+Xx9iWvAjex8D4Odawnz0qOPhfTLPME1/NNqQURgKoz3Kdu03FKR9Tthd3HNONLVyzLAGjl9H+rRgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258403; c=relaxed/simple;
	bh=siRDrzUmKDOA4+5AOmpd4ljjJ0Zzq94b67khVQ6/UF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WzlxDWheJiO66WnPz5stny+eK9KZBYqyu9jnD/8tOzb45VhVoZYb86qakltYe/uWHGOGcroIyXmjfQuZTLY0nnskBHxEhuB8m/8nCEHYbgzZ0JJPa8asxWb8rL3V0A8Zc+cVvBkEARwEC9hLm/HRiM3NSfQHHcvmBeZPxCVzuWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=VdvQuMaN; arc=none smtp.client-ip=95.215.58.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="VdvQuMaN"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=siRDrzUmKDOA4+5AOmpd4ljjJ0Zzq94b67khVQ6/UF0=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791258399; v=1; x=1791863199;
 b=VdvQuMaN08N8YNoRBvcjxtw50DpGBFNuwf0CIzO59XAfbygmA8OfzD89cRVZEcI2ZX6lxDhY
 hCPdgbFAQc/kF1osS2GH5uje9Jau697uG0XB3Yy7y3H/lPp2UeUPdeaHCM03hoVaFXJsFvQMdhu
 BfUaUPp3UEvTDraF91L0Yve8WPgxDFiWp9B/OX6vuWV0CdEsDP8bDCcUtnmC8X1hl6Pxd2K9g3l
 //I2QqWS3gR4P7sMwQFhaAFFYeHzgYMgTkZZu0CrUWblHoENG3UHlpZIRC4xI4QtaB9REzIFeEY
 1KseQtWpoOjnKifSyunI5y7CnKgrpcmcSATUWjg/EJl2w==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c235c44fadc23cbc;
	Tue, 06 Oct 2026 03:46:39 +0000
X-Mizu-Trace-ID: c235c44fadc23cbc
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 05 Oct 2026 20:46:08 -0700
Subject: [PATCH v2 7/7] leds: aw2013: move reset from probe_dt to chip_init
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-aw2013-aw20xx-rename-v2-7-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791258374; l=1185;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=siRDrzUmKDOA4+5AOmpd4ljjJ0Zzq94b67khVQ6/UF0=;
 b=lTTfw5JDzDcYm4BHah45AuOZDOE5GnKOSEsMfS/cuxTrlH7k4R0URPCI1Cwlix+VxDpHKJEZ5
 +n4r5+t9YSXAK5pUlR3YM3OMz7SCLkMH6OAaDKT5jmxnt5JheXyIwCj
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

It has no reason to be in probe_dt, and putting it there complicates
the mutex requirements

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 2a133657d9b6..7bc0415375c6 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -139,6 +139,13 @@ static int aw20xx_chip_init(struct aw20xx *chip)
 {
 	int i, ret;
 
+	ret = regmap_write(chip->regmap, AW20XX_RSTR, AW20XX_RSTR_RESET);
+	if (ret) {
+		dev_err(&chip->client->dev, "Failed to reset the chip: %d\n",
+			ret);
+		return ret;
+	}
+
 	ret = regmap_write(chip->regmap, AW20XX_GCR, AW20XX_GCR_ENABLE);
 	if (ret) {
 		dev_err(&chip->client->dev, "Failed to enable the chip: %d\n",
@@ -369,8 +376,6 @@ static int aw20xx_probe_dt(struct aw20xx *chip)
 	if (!count || count > AW20XX_MAX_LEDS)
 		return -EINVAL;
 
-	regmap_write(chip->regmap, AW20XX_RSTR, AW20XX_RSTR_RESET);
-
 	for_each_available_child_of_node_scoped(np, child) {
 		struct led_init_data init_data = {};
 		u32 source;

-- 
2.55.0

