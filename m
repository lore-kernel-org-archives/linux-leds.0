Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558752;
	b=jOl6hg+EpqzSmwDTCE21UpwJTDMuOhm6Y7R3UZb6i+fPMN8iZT5wnECxfHLqubZcLPRH
	 hVz+pDBWqFAHObFEsueFRVI7QsBMpafXVn8/eUSSio1RZBAYaMzh7JPS+j+tzgh5fTKWh
	 Vd2RiE9G8XzDUsTBWo7No7I7OojTdHb9uMEhWsVmGUdoyieGDNxLhHUMkViWQqa6nLrQ/
	 P/J2aepxeVgOS2KRHvZgzkfs6ktxfIF+IoDC8DXzFLS2eS0xiMjY2GFLAopD7U8EweZ4s
	 Aulx9z6/hLEeoOQlTsj21ssNzO/fj7YDQVNoqmK6mQK/DFO/KVAAEYOzErDeM/q+9Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iSU38EcMZfIIXouCuIDccJH8EhhzfGLu0Vv+v6R4YDQ=;
	b=3BbK0JvtMEri6fdQFMu3bjOx3WUPy7G4wyTh4z8+aVIRuivMDqpzmjADvVvVFF6Zk1uW
	 LRURR+8N6GxmGOwJjwaJAUSNd8geQTEoPx+h6ZWZt4LE0mUbGapnl/rWzOKqXhwZsjKKs
	 qHXqf/SqFHR/MTeqbabDaRROmcKABELpN+yY40ObqqR6+h0DBUoWrF4yjPRiqSEduLovN
	 rgncnXfsIV92RT+zptFT9buxU/Po5EJ2bLi+0UVmpuiomVC1xpHUEECnXYQstuRhh9svu
	 Xhs0MFRVN+raBswHceIK2geOR+xt5MnSgco95tD5D3KkbkDmdj4YSqJvzFxjhVQOtMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QCnqB7Qa;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB14A606A31C
	for <linux-leds@vger.kernel.org>; Wed, 21 Oct 2026 04:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB14A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QCnqB7Qa
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so58760a12.3
        for <linux-leds@vger.kernel.org>; Tue, 20 Oct 2026 21:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792558751; x=1793163551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iSU38EcMZfIIXouCuIDccJH8EhhzfGLu0Vv+v6R4YDQ=;
        b=QCnqB7QaEQOw+6rI0X7E8ZaIqfc1YdvX+5dUjvduWaQI9agXq/UfU0HaW9/RDQgOjM
         qB+Avv33iFu+4WQb2ZkEFPFUMj4nffOJ5TztpUeK8eBqnLeOzUgWjbce72ZGyz2QmTVK
         +f7dNz7eziJ84QT+H5mafLjeqeUHP8FrmcBtTQf9UFSF2mpouQviRHPpuNHdAw/3Ccdx
         a1/qabzriMy1BP394FHUWXKxqYV4yI7573RJ73nyiRZaFNuSpQ/nuMI0+t1mKFtn34Vm
         IjoEDVe60LNtjj7LnJpgeyR7Sx/DTp6l0xyeIPfucZ53tFGieQmMsIBwsdHEZU2zX7yZ
         sybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558751; x=1793163551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSU38EcMZfIIXouCuIDccJH8EhhzfGLu0Vv+v6R4YDQ=;
        b=w94c9MqgBjyRQfu3PIToNEgp15zMVeZassaWF534/HIU5ew8gNB5jAIhXaTx9G5imy
         qkjVC+sunNgAelnzdRx6Yuxjw3deG8/dmdUD3vvTISd9UDY6SNBBdd1Hg9TQ2u4nYMUj
         UlX+SkV034w7sF52tDXhVN/kuAhTX08ehbYy1T5oFfyngtUA/DvC1LF+UH7p+CsNoU49
         nsLgfJ2qUNnMmTbbWTSWqgxdi5WxpL9wQN49aoWnRtb5MfLiUrCuYpFiwIKMyc71aWun
         QmGAVcaI2Hm7db5MdYsHY+eYXX8FDi5Iow/bjrmBQWVyfl32vWMUBQZdR45YfvZIj/Zv
         e19A==
X-Forwarded-Encrypted: i=1; AKwUvBwyqFuUCvK0XWpqZNDuZ+Ep57h+FqjHWuUT9TuhPNrhi9Gb95fIevwQRMTSI/sBc2p/h4zR1mbKLekY@vger.kernel.org
X-Gm-Message-State: AFq9FYJgtHb0tlQhb127hjHXC5vTdgrgnC3WVE4riX1YUhE3FGX5IGzr
	nZ6aKgaLEExTwtgiTwicApNuRUOPArT87WLlxdHwKJKAJ8Tf06KnYoR4
X-Gm-Gg: AYBFou3nuF33TM6asyU8FHccNJP9LYJFp7A3CJWK/oP5yX4kFDDzFYXHsqOh2UbJeHd
	Orza2IuYMrpcJFCreAw8O9bh6vJ++DMW3EUU76yz+5VLHPaTX0fg64GOqleP6C3cmREWSir3G0s
	luYu8FidJA8Hl9hLzxKMwauqLoP41Pr57ky5yhqcEVOhNU89be71kLq50X9Q27KKSesu6x6GAW+
	4qua6Dj5j6AE5ufJ8b9he1U7/2ILIHLK+1DVhOLHVigTak+587o1mjkK3hQI5kBXRL92lk/xnlx
	Ez72JBIZBeupawfk0+NTnEXStGRlXqyTAeLBa1InW+lQTeOOInfH6Ka7CVdY7MSPIpXLKuLx578
	Kej5+PY/YuB3WfBNf2mvOxo+oqAYtcN1J9ecd1/UgtsZn+y6KAT+qG0Sbrc1atd5f4xt4KJP9sS
	xRfTB+o203Pk4ghN+Uc23nvTFM1JI312rAH6OF855JAfs5dib71GuSE0D/GdnrYq+DsXVAMeWL+
	m7BUPxEtdGwyVC6zPfERuIGNoCY+6DURH3DSl5o7oXtNCfTTs1RqCVEm3NKy//He1RgN2JlIadR
	wmSI6mK2CE2wEYAEx78R/vXMaXVM7OiX0I3EwKERrnTHXtaQQ5vVk+RUkhd4/MlrrjysW6g=
X-Received: by 2002:a05:6a20:3d09:b0:3e0:bb59:7fc0 with SMTP id adf61e73a8af0-3e287e7e807mr824422637.52.1792558751116;
        Tue, 20 Oct 2026 21:59:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6a871dbb9sm313903a12.24.2026.10.20.21.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:59:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/2] leds: lm3532: Propagate enable GPIO errors
Date: Wed, 21 Oct 2026 11:58:31 +0700
Message-ID: <20261021045832.16356-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
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

Link v1 : 
https://lore.kernel.org/all/20261007104915.507801-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20261009091059.25729-1-phucduc.bui@gmail.com/

Changes in v2:
 - Capitalize the first letter of the commit message subject 

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

