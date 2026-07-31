Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B50F403AFA
	for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 11:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785497845; cv=none; b=mAQncHo/CIIdKON1/hPSEC+bIJEtOVyL3CA40eDpCLGZZT1F1UPdKJ6OLVVB66giVvA09tVhuDmGbkr3xXT6jNzqARQat+s1Or8cUEtlLTW+S6CyOuD1wT/minA/ytrkffSesm9EYHON9rORY2GvDjUmydVoITbz8ZpkWquMjBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785497845; c=relaxed/simple;
	bh=jzKL0N3YlVllgP+B/U9c8TNN1MATVwvNIY+TMDc6s/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZVDoTDNLCcmDTzzMy2gJhJZ113B5vwSEmNPTAY+Kp5gntNYlC1UG/Bh69i3io+yb7zSjdZyQWVk/ROFZEuxPqHMFwTEvQ6OoLlDUHDq4uCaVHx60JPvhLAsEFqxeuFhBy8988YMSenuiYiLhNn5Ipm4/WEGTDiov0QyZgY+zjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q5Ow2v32; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q5Ow2v32"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso898248f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 31 Jul 2026 04:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785497840; x=1786102640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0eE6D17SL5fIygwG8Kw0xWT8mg9cqKbwl7rsTtSWgs=;
        b=q5Ow2v32jfbPPxDG0mXmP+CTBT2dGUH9jlwpUt7BufPhHC8Sx2h392TWzN//pybhJF
         R5ovHcdivFq7NfpfBbaqoYKpuTKwYVQqR464ghAymNN1Ppvd5BJ7Ksc8gp/60xchEs8W
         mMprOEEFx9iv8ppnB9uBfDc7OemiLBPDH6x4QRgDpmaA0yzsmUViff8XgxhWLMkF+3t3
         VLF6/0A6H6Z6CIHe/hrUKFraY02d2uGO5JWdK+cdYkVRNzzF23l7iaYegfSaYsKVf+Qs
         7tEhx1BFzB3CN0NfzazbbiaxtwrY10wVy7Jj4R2qDeHVg2aFOrAy3sPRQu5XUkXbTRKv
         irXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785497840; x=1786102640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0eE6D17SL5fIygwG8Kw0xWT8mg9cqKbwl7rsTtSWgs=;
        b=n1S8eoGYKy/EZ7AjwfyskAZjnvSgwuQS6Bek5GyCUmTdpIGjbHUqtqM1Km8VVK5kbe
         Sz+QfmqdWoTySSgJb9m8Mu3LaN8y2s4XOKcnTFJU8XQVb01MW3Wz1sprRG9luygzLcVK
         +mul5oqPxoFKeZw6dwlWh1udoqQ8utjU6BFVMN+VA3t/VyHQc39TDNlNCy0dhSrYSI0I
         15mSUxunF1Q0q+rjon71lvGWwnqP1miAw1pAch7C5GWIRhMGeAUh77WDFo0D7N6zAC9J
         OoC8OVf0NAiZ5rQmku2E/6IsP7WUumVeVaIw3/NIngQ1NkfP/Njpj2+JN/I/OnVJWe8q
         jmtw==
X-Forwarded-Encrypted: i=1; AHgh+RqAM43YOwXAgb+4KuVh8ASjWgXRHC60l5UYy0/NyN4wdMsevbsdlUVbWRLrrwxS0LN86QABPeseFHPm@vger.kernel.org
X-Gm-Message-State: AOJu0YysRqX5oGZoNp6jK9Su+Hb+OX85Bxpli8U9ea6pa9aUudYN2uLj
	gwJ6NKXoJuNNljYuQPdxnSJiMFs+P6GnphfCYNeJU+nha6a6OAAjeq8i
X-Gm-Gg: AR+sD11atdenmXMeG/CpSvDUEitI7ZgFm+Izr29CCyQgnTpY0wZ5p92Hz0tvL2H5/L6
	GwLn20ULuFJKCD7vFVL/CqvfE9hAWf+UjdfJJV8bNCXfWyeI2u+yj7zN9bz4LTViBG4j/cIBKwP
	mIVI/aQXxUiKbiQsUbL8WwP8Pqu6C1ejPdedfqSH7Yq1faPOjTePpMc0xx2NLDnNvxe3aHXKnoF
	AsR6LdadTjjdPTDjWs6nSu5KWlJ6CAq367sWoThcZ8ql3gcNFiqsKpHmSHurgIIYSllLZTp9fsz
	j4/2JR+Ar4aPCvfVvni50VaNWxipQ1LnVGRCli3uqPgbGvDs9J6hm1pQs3aHwrr5EW25Q03KHPM
	5BgdWxJVeU0BwT6dKJ4zvsarWNQeqKRzMf3rSF4s4FxU1OuPTLDUzpnGtug47219dMzivYBAXc3
	Wz4L5nZHhSXyascGjs3kMpFx8LOMbqeOz9nRZkC57qVJwV300LswWs3rLDxtPdFxq4kDRmKmw4D
	OLdjAWNgA==
X-Received: by 2002:a05:6000:184f:b0:47f:9760:4d25 with SMTP id ffacd0b85a97d-47fd2ac97a4mr4103846f8f.14.1785497839657;
        Fri, 31 Jul 2026 04:37:19 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm3670646f8f.34.2026.07.31.04.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:37:18 -0700 (PDT)
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
Subject: [PATCH v6 12/14] video: backlight: lm3533_bl: Set initial mapping mode from DT
Date: Fri, 31 Jul 2026 14:36:30 +0300
Message-ID: <20260731113632.158440-13-clamor95@gmail.com>
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

Add support to obtain the initial mapping mode from DT instead of leaving
it unconfigured.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
---
 drivers/video/backlight/lm3533_bl.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index 2e31a79628d6b..666213cab667a 100644
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -36,6 +36,7 @@ struct lm3533_bl {
 	u32 pwm;
 
 	bool have_als;
+	bool linear;
 };
 
 
@@ -230,8 +231,14 @@ static const struct attribute_group *lm3533_bl_attribute_groups[] = {
 
 static int lm3533_bl_setup(struct lm3533_bl *bl)
 {
+	int ctrlbank = lm3533_bl_get_ctrlbank_id(bl);
 	int ret;
 
+	ret = regmap_assign_bits(bl->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
+				 CTRLBANK_AB_BCONF_MODE(ctrlbank), bl->linear);
+	if (ret)
+		return ret;
+
 	ret = lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);
 	if (ret)
 		return ret;
@@ -285,6 +292,9 @@ static int lm3533_bl_probe(struct platform_device *pdev)
 	props.max_brightness = LM3533_BL_MAX_BRIGHTNESS;
 	props.brightness = default_brightness;
 
+	bl->linear = device_property_read_bool(&pdev->dev,
+					       "ti,linear-mapping-mode");
+
 	bd = devm_backlight_device_register(&pdev->dev, name, &pdev->dev,
 					    bl, &lm3533_bl_ops, &props);
 	if (IS_ERR(bd)) {
-- 
2.53.0

