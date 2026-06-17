Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5213CF1E3
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683268; cv=none; b=b43W8f14N4iAuoLV9HzN7Hj5vk2RXV45ws5q+doAchIyFZacpmiDBH7L6YjqCyfRdcUtGwKWoV/c900EkxlfN4GSAHg9LS1FFVx+pl7XI6dQwBcyT7wgFmHcmLnQhjkDFHpLwh50+mSPYahC7Vew76WvyCyqEi4bjhvLmymI+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683268; c=relaxed/simple;
	bh=Gwi2SEZRxxZPvrxGh5xpiGuXapIPqlS3eMFp/EcaCRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sO0PbN/6ZMXQmb+FNdBWX6BOdUrgFGdWNQ7ybluK8lNgZ7+vUfz0bcRjnZJotXk0h5l/KVdTJjuYIYcf2EYDprz1UxhnvKzOu3JcZVOAFA5uK9pU2Gsg0x1qVrhgnJd+Dh+QlasNhyeqUImXCunkeJy07azooD3+je6rXfuuL4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIQvHTqP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIQvHTqP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-beeba001887so706181866b.3
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683257; x=1782288057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BStSfLs2cVd2uwZhDXiQO2uYMri4qNRZ0wt5dxl+TLw=;
        b=kIQvHTqPC5VkRUDrpLCtRDZpUvjzaV9nTZdILVN2cxG1d6Oyz9pmvLEnPozk2o1wZo
         h474uWl/pxK41XGij4r2JYew0UA6KoyoxQyE/39flbfeBxwMwXhYAEAHsyC3c9bNRhP1
         hRr3qJGbvH9zCnmKdb3R9hNRrpLxPW/VacDkgecOxXmZSBQ8kPoudHAR/EX9uG1CyiS6
         NJk6FGJaTTV2K/HnXKVsolYx0wJUUfT8zwDCCs+ywLPBRJoikv2gWxnYjkov7uKaoG1/
         hM5lhI8hzdqZfKo+c6549baqe6L7LV1jel4GgJ+pMV1Q2AF3z9JapDJG+5i7dDswNJkF
         cUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683257; x=1782288057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BStSfLs2cVd2uwZhDXiQO2uYMri4qNRZ0wt5dxl+TLw=;
        b=ijJ8iOLxwNsFd2MVmSxx+qDZGLgBrqAJ/rs/gBYrLjh0w/5gWaQFCM79gjUUoZKyRL
         vy3p4YKYrZqMdFfHwFu3b6BzX5fgtBIQt88iuTc8A+LbTS95EurHT5a0U8ySLKMHpfyU
         sFp6g5SMn2d/br2f9i2Su+PdR2Anm3/4xPIMZhvRyFxC3gRGhrzmJFVVqajBUi4lrVSn
         B1Vk77DzDTZzREXCelrx8PlUz4MRmgKTZLbUwnOrgHwV2IBIQEk3Gv+83D98dtkY6af9
         GaC+Iya8W53d9Mo78huvBYV7RD+iuOHk4CXSD1ijLQRsP5Y7Y0CGgQnYb5dAaQcvmW9r
         +mcA==
X-Forwarded-Encrypted: i=1; AFNElJ8PRMXeXnG87fUzOubxFtmPBFxyiaZrtDphtPNaABxHrgS3dFyH/uMeFb2tL1rVjn9CfvyzJtp8/7bz@vger.kernel.org
X-Gm-Message-State: AOJu0YzgEixJ2rB7bJSkYqE3tjPNgH/lSo6YsCH2xhsleUH4ORq+NtPw
	DfyZUgQ8fJuZv0EUmVVDIOKSwxs2waLsKt0A9yqfONOOmVq+AnaUL4zK
X-Gm-Gg: AfdE7cmR+/QiDXbGqkJCgZbm96A5uNUhm/rjeCpaILjx9E33u0QRBBA4Hj+EeyRD6bG
	evx2nM87gPboyCAoOhGaJtigH6z1aJFimYoYaWLs25jDw8lFYeZQvaxkTH0G5VBvlSbWDwi+XoQ
	fJCgnVRUmkpRxSm+K3BDeiZpnQ7tBch6rRSeQsXZxRrtfyohp/3YmBbxjqB48V9FVYNMh9ScUna
	BXP/X9CABS5mHMHtk1oWKD92ejSh7/rF4LYsKf4V6Up1RQoC+oabSq1YHHBzhhCITLXmeTY28MI
	m972NItxZquZIRFSxKIBUEWvZ9+PcKIEKKRg5GfgTsQU4uLd7jy8h2QVGymi+XfAx9p7gzHvDkm
	W3IcanbVzNK2krlRav1pbocdCM1HUR/dL7sitMmI7LKUy0A4+iaKCmRKa6aredMpIFfQnexqPst
	MPvw==
X-Received: by 2002:a17:907:928d:b0:bd5:405c:7964 with SMTP id a640c23a62f3a-c05a5219b56mr201079366b.48.1781683256443;
        Wed, 17 Jun 2026 01:00:56 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:56 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 10/14] mfd: lm3533: Set DMA mask
Date: Wed, 17 Jun 2026 11:00:27 +0300
Message-ID: <20260617080031.99156-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Missing coherent_dma_mask assigning triggers the following warning in
dmesg:

[    3.287872] platform lm3533-backlight.0: DMA mask not set

Since this warning might be elevated to an error in the future, set
coherent_dma_mask to zero because both the core and cells do not utilize
DMA.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/lm3533-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
index 4b5d94e9ed27..db8581d1b073 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -480,6 +480,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
 				   LM3533_BOOST_FREQ_MAX);
 	lm3533->boost_freq = lm3533->boost_freq / (500 * KILO) - 1;
 
+	/* LM3533 and child devices do not use DMA */
+	i2c->dev.coherent_dma_mask = 0;
+	i2c->dev.dma_mask = &i2c->dev.coherent_dma_mask;
+
 	return lm3533_device_init(lm3533);
 }
 
-- 
2.53.0

