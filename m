Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514235;
	b=SSL4PtawYUjBpPJEVqw4VCzWEDPbDQf9UJsDqXAM2Z4AuRiBVuaqv9wQa7i9BsSmugtK
	 MfsKUunzyXStYN3LhbbdAi+w+08jcJ1SLgC+UViH1BTHmqFJV5UXWUuGsYjY/+EFYtdGJ
	 x2aSrVj0bkblaQqPN/4vjhIGetG+mdC8aiRB6BOBfycANTwjULC9Df24F6p0jIm3Ecojf
	 j7X1N6Fgs8+n31pZeawHqEm7QrnX0aFDLaRkOcP07oLC+3yBwUrbPZ61UHzc8sob1Kurb
	 JgzrHlEd/Af2SBepPFyOxuw6krYMiF4q1ymJ/Zo2tGvIiSEs0xlcU8H+YL/d0uzXzRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZjDaNSB2HLIfLWzDN7uiWUYczNlAzXlQFpNtIilTK4g=;
	b=4SXRDRn6Rk2WjNg06oF68B+iuxY/5zeF0qmUlAozVfpDqg1ikuGioV0M+KhxzyM/1dka
	 D9g4Ck/X4MIz1i6EUtFpkf/1L2bXDHEWj1ZIJEg6lZf0mfyj7QwQxwJKf8K8V0YMAfRgx
	 2Bu095w7DyslLNdRSdR+8TMWmsKhKG6SsjWNif9p2gODq1buo9zRDhLVUs48GJ6fJktHQ
	 wSaMavobOOLxRteX71r0HWefnu2An8gLNh5dydxY+tWQiK6xbdy6yuFb+03LCcdf2FTIv
	 WKv0JOU5292LIQbt6tkjOAn0Bxo3fWrtrX6RqTS8TuxHFbzn3x2p4li/OOAkudx56uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v7w6IN9a;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16B606A338
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 09:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB16B606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v7w6IN9a
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f0621eec70so26566275ad.2
        for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 01:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514234; x=1796119034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjDaNSB2HLIfLWzDN7uiWUYczNlAzXlQFpNtIilTK4g=;
        b=v7w6IN9an0o4PTO4bxm+siSV210HGcPWmamp1rYVn/Nat5ZwOGdOtQL6REmEGb3B9n
         0L+RNL8BiSXnZ+5yoFWze/geC+uqNrYDIb6rEJt2DAdy/Yk5irwqB0pQ9VmkWk+rgFGy
         DJIhdBBGyPlfJ7dE4abOgpOU+6AFIRo1f8tYXkyp6D3LZ0b6fPGxKFP2hJv6Zs7xWCzA
         j3LORax0XQ8p4742A4aV6HL2FGfO8KtMcnXZsjUHQaAangAj3qHM/trbpEqaP+4AafFu
         SNMeC+22K0p2/xoXQGNb8Cl4A8G2PWPvWuQSMSyTYtT+Wms2A+gfMPK3dNY/qnL3AYka
         STHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514234; x=1796119034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjDaNSB2HLIfLWzDN7uiWUYczNlAzXlQFpNtIilTK4g=;
        b=LFixZbJtrKva5waP8hh4DhBEMvaOtRD5bWMgPhuRvDcdNH4wNo1KfmaJBcUyVLOD3i
         lyTxsCgOATCHAGsBJ8oRwdbkh5ocz7BN4RoNRRCvYm1czsNcYZ2H0Mp9txaKtOQgjrnj
         XygBvstLEOYFtOXCEXICwQUvLzwaNDocMx6RHxBuiSQVboePn1KjbyyAeB5Z25x15zQA
         onGwc+EXH/BEbE17Izs75XPmFFvSmmZGOhvAX+8YUNj6Bv1Of1PeowUos6QFiZzRJPvJ
         BfjWoWfaCjf2cAafvP65VpNEr7RXS2yXyca5FoIbrXHZe0q46e0uq938L2dZfMdLsksv
         BB6A==
X-Forwarded-Encrypted: i=1; AL+hErFhKHJ/J0NsVm/ioOVtnBeP8WxAUaDnENnREm2WS3ygQbfnTZ+E9JCVmfsBiT3CbTjJziGUIStBUkAG@vger.kernel.org
X-Gm-Message-State: APuU4Z8BJm7fAHAq9uDH90vSXwRnYx5KIHTY/RQYHMS0wGHC5BFD7K5k
	tujJDHjxliwBPh5M8MEqnxrewDMBcdatURePklAGuRYE0R8BT+KWdNbs
X-Gm-Gg: AZFdTZdlPkHpC/8ajFhTEIbK2rQN+Yc1XwHVsMUCukDq2WLVo3e9AgLpdadmf5ilB7x
	CU9c/LCORiNjKgeZn3dp791+drSn02miCqsnPEk3CGTN1kQJX8IMm9I+rwaASpnun/cHGJcoH59
	n13Rgy+k15dvDVw8lsqgmMlj7yYeuBeDdrYs47JydcXeDEM3//wcb6wQXQiUtiV0sUjy9XBCHp6
	CENE/EvFlyr1WKjTDjo67+D6UEnd4hc9/GV9JHq1TtHYKyCW3DAfRcGeyQTVJuGQE/59EIWDUI0
	m49/lp0vrj/JuVnStd5v0+VPNrcppwJycxYbkx8l5DGgj3pz9g4D7vrdsepDDHBeOGSmh5E1n6b
	GtDoUEh0CV9WJUpwn1olI+ns7YVQL52D13FP1leM6/yJTkU2xiS6DeKnLZ72T1uiL4c7YBSLdsC
	Lwi4q45RMIdnJGVJ7WCj2oQhtwUP/6alqsVa7NB/RHO7Yqs6oG2Q57ZXkkc4FWKJtoCz++ZBTK0
	zsIl5ckJhHn3hqMuSTkBIg8QWMgASrJAxwGZIIP6/mSRVBbCO5xSVGE5gq11JfGpeBInehdoZnU
	1JLQplyIuy6JpAOY78PpF4oqk8S5Hj8axDXVkXlHg4kPAPA=
X-Received: by 2002:a17:90b:3891:b0:3b4:127a:2bc2 with SMTP id 98e67ed59e1d1-3b41c8d9bfamr12544097a91.14.1795514234177;
        Tue, 24 Nov 2026 01:57:14 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm24186851a91.5.2026.11.24.01.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:57:13 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Alexander Sverdlin <alex@sverdlin.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: rgb: ktd202x: allocate the LED array for the chip's LED count
Date: Tue, 24 Nov 2026 16:57:07 +0700
Message-Id: <20261124095707.3852724-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

ktd202x_probe() allocates chip->leds[] with one entry per LED child node.
The allocation helper sets chip->num_leds to that count, but probe then
overwrites it with the number of LEDs the chip supports (3 for KTD2026,
4 for KTD2027).

If the firmware describes fewer LEDs than the chip supports,
ktd202x_chip_in_use() reads entries past the end of the allocation each
time a brightness is set.

Allocate the array with the number of LEDs the chip supports, so that
num_leds matches the allocation. Entries without a firmware node stay
zeroed.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index f1822281c3e6..56f6fa906b70 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -533,6 +533,7 @@ static int ktd202x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ktd202x *chip;
+	unsigned long num_leds;
 	int count;
 	int ret;
 
@@ -540,7 +541,9 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (!count || count > KTD202X_MAX_LEDS)
 		return dev_err_probe(dev, -EINVAL, "Incorrect number of leds (%d)", count);
 
-	chip = devm_kzalloc_flex(dev, *chip, leds, count);
+	num_leds = (unsigned long)i2c_get_match_data(client);
+
+	chip = devm_kzalloc_flex(dev, *chip, leds, num_leds);
 	if (!chip)
 		return -ENOMEM;
 
@@ -558,8 +561,6 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	chip->num_leds = (unsigned long)i2c_get_match_data(client);
-
 	chip->regulators[0].supply = "vin";
 	chip->regulators[1].supply = "vio";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators), chip->regulators);
-- 
2.25.1

