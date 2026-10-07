Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3163149A3C7
	for <linux-leds@vger.kernel.org>; Wed,  7 Oct 2026 10:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791370213; cv=none; b=rDDUt0IW/iBl9VCVOLS6IWvZfT1M49J/tTcOTcV4DX+ZcYrcxRMJMdFN6jm01wIjLsW23p7KPjQszbPbb12Lf3873bExr0TAJanC2vn9hyUwHyngIDmstpUYp2/9frvIuS3Ec5LV7goEZM8PtRRKDo1bkghC3roDjZDu6pIyi0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791370213; c=relaxed/simple;
	bh=JRP8CU54RL1e7Jil5HXwWG/cGwsBF5GNPmAGfU9OqWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HG/OSlHL2fawhAAp2+Jm++nYpgAUdB2IriModt7RvUvcqGrFuThgrFZ23haSL8NFPB0995FIhDk/4MzvB0A4POyOcLZDxSgpz/IHEN54YxVhRraKK++kx+yRYx0PDHoaeKBwSN5NWmUVWjcSvDd7ALuO9jkniVZJ2dWjjiCy7aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFf1oTOf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFf1oTOf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so826907a91.0
        for <linux-leds@vger.kernel.org>; Wed, 07 Oct 2026 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791370168; x=1791974968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Z8eRhir2+9ggHPXk1/kOSteQHGP26i6yzCMLHKZ/DQ=;
        b=LFf1oTOfRU9du5EQRbnlMvTi3/OTjCzreVil8yDUBphfHOmhYG3C82KDG85WGnvxj/
         TSWcDMt4uURN+//ap0DQKONNFgzNlFvitHjPy+gG9YHVNqM3uj3GjE83exfa4N8eCb90
         PHWB6bRlPSGkI7ausG+xHrVwW4pcOZLhEFbH914aq2Dj8rOwy/YdxLqpJ6SziHsAd27h
         A83SOfDCrx2qTpKgJ9pLG7qNiyVXMqHeIVKynkqANDSLGSEuJAsKO5irHsJ1RgSN0XFf
         0qqfKJ60RDcnVp9f1Ob/+81m7VdoINvZY/Lt748CBTDKO7PIaWUIER3m2VfmTb+V2qHB
         tbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791370168; x=1791974968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Z8eRhir2+9ggHPXk1/kOSteQHGP26i6yzCMLHKZ/DQ=;
        b=wCcaom8TFVWBvlo/xN4tuPs72oWrZ6btY2mWeTOmeEGr4zXHPD92GrUS63NReLdj1m
         YMCiLd6ubvXUwOI9y/8W8L6hYyddFl7UR8yUIsszFt5diULksKG23uSapehNScBvYaSP
         H8OgPJARW4UcgEfmTCWMamvuFdfuXkKNeTjNeq8fgIMK15GwiV2bz2Z4KeMKm69Nrf8x
         PgRa9gy4CiLiyZVqnt+2A8A59vOgqFfOQIkQ52uL5veA3Ph+EppZ9RKWxWckW+bnekjs
         Yvgwmw7jt9LnhFdeBqLEVAIE035XCOYrvdzMNw/Gl1GW9WIE/osdGarlRgQAzSmCxqXI
         le0w==
X-Forwarded-Encrypted: i=1; AKwUvBwsE0ohTuQutFGOiW52z2Uv/FxwhLf2JOLrH5a//B5RI4Bw7/MdWoDdtWYHdquw/c0O1OkYMQ4GqUT4@vger.kernel.org
X-Gm-Message-State: AFq9FYKiH0hUQv+PPHBLX3oAhKWl+IPr8qm0W8ldnsrqW2EL8C1JysrM
	rMekeYJ8UBMQtgOYuWmiLFUKsv3XqPjRRAzqunHxAkSsg5MhAyRolvk4
X-Gm-Gg: AYBFou1LdItYFMJPqQpxSRqHewCIDIrh4js01Rf7AgbzIxB2dy7Qkow8er3Xlv16yJg
	dPrz2Ft5hjjDnIYN1DEYMMOLPlParcpfaKV7gFfJFoifQDg4ZAcVKpMouIFJxLdznY/Yb/UkU6c
	CFSNXo/2llnWcWEgbsjMquCedY1oNAd47mcvEvxGHEFOH5ffSqfUzvowld5y/PyRzUdUDsakds7
	4UXjGDGvpTFyTVoVDYOyU7fUYFweBYdzix0QhcGsbbQXujOdZp+CjoaF/syvv+S1e2mat/uhG05
	BzliNL8Ow0AoodXMaE/kC4w2mQmIjgJ6uoTfJy0vFLi3rCLPaPVuuajlUylNOED5DJ8Kbxtgqie
	0USOeofiqnJERU/y78ahMy0wlTy+SzrmPlXyH7trqqVGmMiYRWB5X6zlJy8/zF5fmhioofgmTDo
	qnZNxyMQGIXoJQsZGEBpsj2ZmYx+61vjHLAjCRH5kg5Ge6TD0wt4CjPU7hfk6Ja0K0x+mRGqyZV
	Aeit/ZAEcAp0lPlQxZ23PcFhSNbO0hP0mSPhmX/3iKYWpL9cETYz1u2HSYi1ylbWim9iC1GJ3vi
	mRCYnpW7K2gY6Q==
X-Received: by 2002:a17:90b:390a:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a8a0ba8708mr1338116a91.33.1791370168228;
        Wed, 07 Oct 2026 03:49:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8533aba95sm10781337a91.2.2026.10.07.03.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:49:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] leds: lm3532: propagate enable GPIO errors
Date: Wed,  7 Oct 2026 17:49:15 +0700
Message-ID: <20261007104915.507801-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_gpiod_get_optional() returns NULL when the optional GPIO is not
present, but may return -EPROBE_DEFER or other errors.

lm3532_parse_node() currently treats GPIO lookup errors as if the GPIO
were not present.

Check the return value and propagate errors from the enable GPIO lookup.

Fixes: bc1b8492c764 ("leds: lm3532: Introduce the lm3532 LED driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/leds/leds-lm3532.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index b51496910b08..a3bc9680dc4c 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -560,7 +560,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	priv->enable_gpio = devm_gpiod_get_optional(&priv->client->dev,
 						   "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(priv->enable_gpio))
-		priv->enable_gpio = NULL;
+		return dev_err_probe(&priv->client->dev, PTR_ERR(priv->enable_gpio),
+				     "failed to get enable GPIO\n");
 
 	if (priv->enable_gpio) {
 		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
-- 
2.43.0

