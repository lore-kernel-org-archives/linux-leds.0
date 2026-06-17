Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD70E3CF943
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683261; cv=none; b=VqoME8XtP8aTsIrDUS8Hj1J7Q0wzCbs9ICxWScvORq1CDaRxMqpv/5XbFe6mE9dH8CA3vVrlM63Hno7eEmZCRf4DPKNDsEKVFGdEu5ZVSg8F5prlyDYveMx+EWKSHrZJHTi2lXkgQVavy9KW0iRaZC6TqZDt9FrxEdqgEBSTTv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683261; c=relaxed/simple;
	bh=EErEa+xTvRrMlTfCICTBeucwWtahnLN9Dg/ExT+D1y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITFJ73jSEP3xNuPVHr+ZrNatWI3JEkllqPBkSm7IQOWRzeZSvUfuiM/HeQg4vztyZ1dWQWunPb/GAhv1aLI6uIrokSTsnmC3RCEze0clFF+h5YQnpvvWdOY8ZhpuTDBRbTCU1bui4/6B99pQDm3q+r8aTks9/YtiWk/lNUguZkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQK9yjFt; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQK9yjFt"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6954810cfefso944489a12.0
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683251; x=1782288051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zcYkBqsgtm7crDvyj+FVJGVI8rwwbt6ayEuo6Ql52s=;
        b=UQK9yjFt9W/l/gnodv7PROtIDTvHGJKgOXovy2Cy15yiDA6YO2lmeVtIL5lGz2h26j
         YkGPTwFA9NeYqU5TWWS/8iTmZ4WbCSWWTeEvYBAYRG2OPh7yuvtEJ7A7vLobt+LoDttI
         6MQbCmriupTGKgkRvOkvCz2DF0K/SKHRCmaL1WjkKUj1kklGXeS6SQUys5S0/ZUS0Nou
         kbFpIHQsdMiV6qfUitY9/cBvIVLVRKnNWLr6mCjYa4sTDcjT7f8Rk8G+zhb1P0YlqbSD
         peIct/+llBU1722YeW+RecV7siZ25vV0kaV3nRWXrg8NQGC7wom+cow1IYLOhAPNNQ9V
         frLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683251; x=1782288051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0zcYkBqsgtm7crDvyj+FVJGVI8rwwbt6ayEuo6Ql52s=;
        b=l+fPcj4s0zf0HNx8l0Az4EBsjOOpR4lo9/79lwXjKveXTLy3UbTGnwgELL1oNz9jgE
         NjiFiluDhKbITVxn5e6xGZ3fzQ3mQnQVqN3ztad6yH382iCnWbrn1Gq1NexvXFJBgHQn
         DgGHEGkusZqsaZcgcnBIp1A0VuxR4Y/n58EGmfwN0z03UAd8Ij5nSk4cNv3vOzG/YsZh
         ocL9sUWAcM5r0h2W4U+PXmmE+lqiFjS3b1T9RqsWS2ZQ7DB9cZyFli2m88wQ8mmadnP2
         J5GT4tQ257b27TsO4kgGiynNUIihLuw3GuITHVQaHOx+geqJLqskRENCMXUwTjK4/SEu
         j29g==
X-Forwarded-Encrypted: i=1; AFNElJ8OunC+s/R2wC+n+rih0VYxTumlsjRWNiP57ZUETWD/4caWRkL0z3YGEFt2bqJi9cVub6b8WrTeNNob@vger.kernel.org
X-Gm-Message-State: AOJu0YwC95Az6Y2Go2P0PjSHoCfudnxgweHapdqzC5Eb27ZiurdRiXHN
	tnip3Biasin3IZxTIpAD8RazTeN/w5iSmHqD3MWImurMOi00x+bFCB0F
X-Gm-Gg: Acq92OEDI+lAWxfDFvVoJeWv3fH791stgN+ayALMVxJwpF+JGu8k8hNxl0L1XihEChP
	qLyedfD1BQLIpYtCNCAAcOMWYmyVQf0wyHs8QYx/SCcXdxxPHNmbbALXXDpPaTJffw/ESZne/Qc
	Nx0wGiH2JkaG2hCqN5RTQbjk8nXn8FpgRituUA1LrY5fxddo3hKGXXynbZmC3eBxjLpU/LT3aCu
	UvfVhYJF+kABCMnVtsHnTJABzWpnZz8H/mW8osvmRYXWnJMPSZ+JP/u9YeK/fawYrLWhNSdG8mi
	PRraJJ4G/hlS9iEywZ0b+9OZH/mpZxy3/JC6VdpA1jRos0YOPFpsrYrkWGp0vubZ6DDsX4eE71r
	NnbeQYQsw+g5qz/i+2fu6JKorjYC0grwHNDSHitnFmG/xuu28AXaJZMkFHj9U9nkY2o2Lw6FaZw
	jxYA==
X-Received: by 2002:a17:906:9fca:b0:c03:b8c6:cc27 with SMTP id a640c23a62f3a-c05a6bded8bmr163827566b.24.1781683249238;
        Wed, 17 Jun 2026 01:00:49 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:48 -0700 (PDT)
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
Subject: [PATCH v5 05/14] iio: light: lm3533-als: Remove redundant pdata helpers
Date: Wed, 17 Jun 2026 11:00:22 +0300
Message-ID: <20260617080031.99156-6-clamor95@gmail.com>
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

The lm3533_als_set_input_mode() and lm3533_als_set_resistor() functions
are used only in lm3533_als_setup(). Incorporate their code into
lm3533_als_setup() directly to simplify driver readability.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/lm3533-als.c | 56 ++++++++++------------------------
 1 file changed, 16 insertions(+), 40 deletions(-)

diff --git a/drivers/iio/light/lm3533-als.c b/drivers/iio/light/lm3533-als.c
index a9af8e2b965f..69bac1b202f1 100644
--- a/drivers/iio/light/lm3533-als.c
+++ b/drivers/iio/light/lm3533-als.c
@@ -708,55 +708,31 @@ static const struct attribute_group lm3533_als_attribute_group = {
 	.attrs = lm3533_als_attributes
 };
 
-static int lm3533_als_set_input_mode(struct lm3533_als *als, bool pwm_mode)
+static int lm3533_als_setup(struct lm3533_als *als,
+			    const struct lm3533_als_platform_data *pdata)
 {
+	struct device *dev = &als->pdev->dev;
 	int ret;
 
 	ret = regmap_assign_bits(als->regmap, LM3533_REG_ALS_CONF,
-				 LM3533_ALS_INPUT_MODE_MASK, pwm_mode);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set input mode %d\n",
-								pwm_mode);
-		return ret;
-	}
-
-	return 0;
-}
+				 LM3533_ALS_INPUT_MODE_MASK, pdata->pwm_mode);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to set input mode %d\n",
+				     pdata->pwm_mode);
 
-static int lm3533_als_set_resistor(struct lm3533_als *als, u8 val)
-{
-	int ret;
+	/* Bail out when in PWM-mode */
+	if (pdata->pwm_mode)
+		return 0;
 
-	if (val < LM3533_ALS_RESISTOR_MIN || val > LM3533_ALS_RESISTOR_MAX) {
-		dev_err(&als->pdev->dev, "invalid resistor value\n");
-		return -EINVAL;
-	}
+	if (pdata->r_select < LM3533_ALS_RESISTOR_MIN ||
+	    pdata->r_select > LM3533_ALS_RESISTOR_MAX)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid resistor value\n");
 
 	ret = regmap_write(als->regmap, LM3533_REG_ALS_RESISTOR_SELECT,
-			   val);
-	if (ret) {
-		dev_err(&als->pdev->dev, "failed to set resistor\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-static int lm3533_als_setup(struct lm3533_als *als,
-			    const struct lm3533_als_platform_data *pdata)
-{
-	int ret;
-
-	ret = lm3533_als_set_input_mode(als, pdata->pwm_mode);
+			   pdata->r_select);
 	if (ret)
-		return ret;
-
-	/* ALS input is always high impedance in PWM-mode. */
-	if (!pdata->pwm_mode) {
-		ret = lm3533_als_set_resistor(als, pdata->r_select);
-		if (ret)
-			return ret;
-	}
+		return dev_err_probe(dev, ret, "failed to set resistor\n");
 
 	return 0;
 }
-- 
2.53.0

