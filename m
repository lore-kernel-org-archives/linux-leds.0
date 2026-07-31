Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F55415F3C
	for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 11:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497842; cv=none; b=VOwuhSjJWqEXNjE2z+WHs4erFL0hbCQo3G+/inbAFmOYxIn4mBQpfB5C82NNH0LTGIg4+E3CEafLgl/5AEkUWphiXMrQjoA6josAga/4v54fkK+PIbhLiT8njQx0kNQWXKCxfVNzyyfz8MAxlj8xPTlQM07EzCF4Uk0dwVPJ+14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497842; c=relaxed/simple;
	bh=LRUvSV70q0AFA1Wddwi0DnOPUeCXzMEzhUYihJPrra4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsLRLpYIo6Fbl1TWYydxQFHYSFjJ8W6ntL2zt9N/nLcMtaNwFwbvZuHxVpItLCRJq05Rx5BLDzDZg9rUE72xoSkbCKLjyFL70AUlpgeFy5wUWz2W2hQLez/Y8z5cnXvUDevLUWCuvj0k4l7vV+G9JGSAxr22iVGEKkYtg2EEVVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZPezHEx; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZPezHEx"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4758bd3731bso874286f8f.0
        for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 04:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497834; x=1786102634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zjX+fB5UFRlHcf7n2PcBZQATegbj+CND3nwA4wOUKpg=;
        b=PZPezHExEBGXpPucbGCrGI3qEv6HhZbk3cO0A07owg9hVNeVDKpvgEblijobHeo2Qf
         ug1PzFM07iguzoh+X/cKsZEYtT1ycAGC9To6T0JnjjIdJcmOCLPR4GsqImSYkLTSDuyV
         P7h5FPYeBfVcWIRmWfsH8m6cPaCai3dMeyCbyGo25xeSgqXrkk1dSJpLC7eZDaEeB+Kd
         S9W1o15ZkIh895WqGqvelQUJZWZF8bNmHt96k50gx+INtdOfvopG0QHT3c+ln1lAAsK3
         OXpZ+ArxTMrVnSWdntzB8moyA2DQyhFIsisUyHYO27ZcNdLpVxYZijBhRG6f6NEsMm9T
         94+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497834; x=1786102634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjX+fB5UFRlHcf7n2PcBZQATegbj+CND3nwA4wOUKpg=;
        b=MStCJBWOtX/k4E3Sxi1bjDS9iGfcuDq85KuxQJIe1uy0bxASh0EzSSAcdX8EdyQpIZ
         KDMrtoaYliEDRjWDlZvoMH4WoLl3HS0thLCpoZFc3SOOu6/+F/f4FQbsHi3akt1QWmiN
         gO0FbeEXgqRrBGMM8CCpU8k17PHSEEtJLoVSh17tnHeHCpKVRYSkEZUlMz+qcNN+WEfe
         O5aIsafLwJOpan9aWj1ZHbDpeDEISlqPX0ffp9Njn8MLahaKdH+pSTSgtlhArZEEaiQw
         zBfBgonc2UVfXPeiM3iZ6mPUMGRDX5q8fnxYzkbsNk86C9wDlXH6iZM8d3+erV9qxi/e
         /FsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpliZVfJteqf1IINV4Kxj1aHWzqurcvncEFwEN6zEHNrPrHYNrxop3n74PLSQwK+33HAiEY8g9a0KXy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwf60f+9RCqFd0w6zeR2YxFcNL13LH8WgNJL7ZEWYM+1kS0for
	3TKfGo6S77aSczznIAoPqyFxJcLH+9YaMLup58VGez9ZN8zUrxsyVrMg
X-Gm-Gg: AR+sD13Ybb1X1rW7Mvni0gqFEXfWasaWdl2FtTVx0pH3LWIBCcQNN4Ubh4lHeZwCgO/
	Qw7TSlfcsuDeq9u4roFZFz/92BqeDnggZNV7RIysu7fNgg6LC3I/krdfcTrYNTE54dD5PSfVTDw
	j6EMcTiipq80NXn301k232cpgm4/iHLwMkTV2JEBkuunQoHST9pkxhMwJSjEmcWVkzQWpk0oDTa
	VaK97WSwb5M3+6y4Tgr3Y+nK+cfRyMs1sTA5vwZXdFgrYG1lPDrm3d6J92qmOAg6Bh5YeEM5jYX
	31ei2/LzLfiJdIQFx0Z7c0dyrd7oJTG6nbvk4oJPGIB7sB2pXO/8xh57V0zvHX8sxZas8RfYWTS
	mqheq+NPn03y+CmrZ4xkYU0yX3/R7A+ASZDbBiK+2H/NJaIMsgG+73pvCAsYQUfJ7J+nc0JkLPg
	P1bZQ5qxgOcOUSAez7OQYkdB+vQTMa0czgrCgH6GKWHLpnRknbBg44WMrEJYSzx3j+xrZYgBeX7
	oOFv4UsIg==
X-Received: by 2002:a5d:5f85:0:b0:47f:70b2:7321 with SMTP id ffacd0b85a97d-47fd32fcb20mr3516082f8f.27.1785497834285;
        Fri, 31 Jul 2026 04:37:14 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:13 -0700 (PDT)
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
	mfd@lists.linux.dev,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v6 10/14] mfd: lm3533: Set DMA mask
Date: Fri, 31 Jul 2026 14:36:28 +0300
Message-ID: <20260731113632.158440-11-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731113632.158440-1-clamor95@gmail.com>
References: <20260731113632.158440-1-clamor95@gmail.com>
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
index 2a63df034171e..9233da7ce0996 100644
--- a/drivers/mfd/lm3533-core.c
+++ b/drivers/mfd/lm3533-core.c
@@ -479,6 +479,10 @@ static int lm3533_i2c_probe(struct i2c_client *i2c)
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

