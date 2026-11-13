Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794528110;
	b=NM8BZ3sqoE46OK/y+bs9W8XQeImMpW0MZmIkPQAkuh6Q8dB08Tmqp+8pVsSwmWLsnAIL
	 FYtfPsj8pu7/bNiQOG1VBG6WY0IN9hRse2aEMW78ifce5t1d+iMqyHhDRYz+hPH37c2qQ
	 a2Bmam783B5xwWvolWY5J6+u77p/hhm4KW6byz39U8xsvhQqLpCDptxlnubHpminRD55+
	 Ya4v4cNa3csKN33IUDpQ+1mZcUJ6tGaRIaf9MHUP7uqPoPlGC+bhlOZSUI3MsH8XwqMfT
	 mt9HC3FeZxfNwfGtCADisdidwyaBgX7o8cMwYludPk7DCMi85wggFawn+bzxLhbJEYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528110;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zNqQiIoeKnejxHXcEYRpk8vo2xsVAoRPJpozLSXGzLI=;
	b=d3YAnWHC+omn09sMsJ27yHIz5WRgkAxQwXkOuRbHA0VH0TzFt8Ux2r96Q/3dOX34+OUB
	 uxMIXmMr4AU/MhpU09tRW2vpl5IKtEX5oW/NBNKsdMPXYMyHrc8HJSDqn6cl7jGvrFhtJ
	 AU8bXtK5Fm3q3MN8dJIA/Ex1me2ta8ukkgryArAEekZfxlgVlcm5ipGol1gwHivZ83Cpz
	 dGyrK9te9jA+hO+/ETT1cvDWJa3BsAHKGLMWJ2w47ue0bJeHTejY/+0FG1gkkmgwp2hTM
	 9IuCUewInUf5iCEC88tGvvk8cTgp3WCgMCh2pApT1+whju0z2y9lXw/zA06lScBW+yg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fzd5DIx5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6511E606A338;
	Fri, 13 Nov 2026 00:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fzd5DIx5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794528110;
	b=P/PDxgnebrc6xLZm4p3ffk4cMBNSCAMcrz4FuVN4tBXa8fJLczdzrai7yovyDTBZckqn
	 T8qd5srNKNOM2DP98ijkJOs7J4G5kwQrLLWecX/agT4B1jZJqHaxKCPU7+KZ64KdBFEdm
	 Wgk0ZHj7J/jg3bsWGnCzW18ngGg2fG5sFNsh+HlQ2kcn9sdVDz042++rUgncxv4KJThMa
	 eGg15PWQQzN668jCAUvp9WVCOGwOk/43lwVBaFpB2ai2TVI3JTY/vv4wuBWf2IUMSUb4s
	 L4b7SvRuPv7QtHWCMkAc2qNCmUyzeKTOp72bvb9TpliwZv6hpjEK5SM6e6YyilJAUXA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794528110;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zNqQiIoeKnejxHXcEYRpk8vo2xsVAoRPJpozLSXGzLI=;
	b=jr8rCBKmlM/f9JZRssDAAFte3PEhk+nPbBaEDv4NQ0ti6Ls5ynon0BJNJVtfIDq/1KpO
	 DZ4gR1F66P7C3QoRwF1jRmAgaKtd8UMH2MKTjdfXQraSYSbjkj+OxPJToX2KYmbYbQuT3
	 x1xvMLi9N4pKFdZ1XHlQqqNl65bjVzy/pnaUJQg5135mOqhfXhpnw1HN1KxQJjS5skTjG
	 AkdeHzqxg60bCSvEbZN6UfQw9BxZiAhlOD/LqrA6e+wdc+JVpNw41IT85Ps0CuNP0z9BA
	 xsM7BSCoE62UApPLkcg6n9Fn8XvH74sH2zWt9SuC36410v3t+N38DLjdcT1u4+XjkXg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1ED871F000C7;
	Fri, 13 Nov 2026 00:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794528110;
	bh=zNqQiIoeKnejxHXcEYRpk8vo2xsVAoRPJpozLSXGzLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Fzd5DIx5eIJ5nbh1IAyfmf6oE4FfEPmLSw2zusMett2mSEk136wD02UG1E65RENOH
	 kFK5gRtVHRu1M5AnHzIvQUDw5HEIqTAWPUtvJebkBARmQF6cvkHIZgRJlH6hY06JOv
	 lZBuvBzRbXJSnKKBs47SzrXNnAW16DQISWt5z77NTFd3Twtr7hjy40Ji12xj99DXnc
	 IM8SaDFbQuSNGDbvhXZZUeUMMQwGk/CglkS8/hXWA+GrvlddL3IzA3imyP6UzFCKAj
	 W62hSPVECpY4MRf21yqofH4D72Gag5PzH5dFGZOXrMK2uW2+Nbyz3ppnIQn1+xmWRg
	 O0hLWVJyqHpyg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A289A47561;
	Fri, 13 Nov 2026 00:01:48 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Thu, 12 Nov 2026 17:01:42 -0700
Subject: [PATCH v6 3/3] leds: aw2013: Use dev_err_probe
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261112-aw2013-aw20xx-rename-v6-3-251eca340abc@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
In-Reply-To: <20261112-aw2013-aw20xx-rename-v6-0-251eca340abc@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794528107; l=2778;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=2B+GF1b0hghJky80VY1FQVanKx5e0d/LMcttsjGQeGU=;
 b=mnI3Sgb6HdbtxuyLSr2mM4FTnYncoTHQXykg01B8omVjjRwBScej9VqPDhjz/u26rbi9Ycw3+
 q4wJiE/X0E7CusFjQVApz3JfR6x4pSe006wHmWyygCsFYx8c6YMri2s
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org
Content-Transfer-Encoding: 7bit

From: Paul Sajna <sajattack@postmarketos.org>

Failure to use dev_err_probe() for regulator requests violates
LED subsystem guidelines. (At least according to sashiko [1])

The original driver didn't use it, but it's worth cleaning up
while I'm here.

[1]: https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md?plain=1#L71

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
Reviewed-by: David Heidelberg <david@ixit.cz>

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 5ff9887086a6..f1106456d4ed 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -497,9 +497,8 @@ static int aw2013_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map\n");
 		goto error;
 	}
 
@@ -509,30 +508,29 @@ static int aw2013_probe(struct i2c_client *client)
 				      ARRAY_SIZE(chip->regulators),
 				      chip->regulators);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to request regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to request regulators\n");
 		goto error;
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
 				    chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to enable regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to enable regulators\n");
 		goto error;
 	}
 
 	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
 	if (ret) {
-		dev_err(&client->dev, "Failed to read chip ID: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to read chip ID\n");
 		goto error_reg;
 	}
 	if (chipid != chip->cdef->chip_id) {
-		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
-			chipid);
-		ret = -ENODEV;
+		ret = dev_err_probe(&client->dev, -ENODEV,
+				    "Chip reported wrong ID: %x\n",
+				     chipid);
 		goto error_reg;
 	}
 
@@ -545,8 +543,8 @@ static int aw2013_probe(struct i2c_client *client)
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to disable regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				    "Failed to disable regulators\n");
 		goto error;
 	}
 

-- 
2.56.0


