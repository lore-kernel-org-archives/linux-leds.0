Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611446;
	b=qbVOpSMqbUzBfN8NxYU6QSDFBEoXfY74mtB8jFv26Q5ZWa+QdCYNZPbWr+pVTuwgnRHo
	 yOnw39RZzhDBLQXAe4NLv2gMLfoQy0H1veNzFEZJ9PaFNlGxtlreO+AAl63XQ9qsSSghX
	 ryv/HE5t6HnWZ+pnfIR1x51CjlNE0/2hjGllNyu34paVwXwFS9QxjunJlc3u3TU0y58tL
	 qgayfZXvXIYgMJjNXrEeyMVxoRyIcvTZd/6zLYs2CkYodNXj0E1o7GazxMgHrauCO/DnZ
	 5okJIc8Sl9ERkAHwp50x9GvA3J/01ZsjToCDa0uOF21i08gSPoOfvsZfHuWSKdARd5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mfltfNq/ZPnpD4OYvm+F8Ne+9+ic89UiJvGsMBg0vdc=;
	b=Ly4FNRVO4pgp0Rdeu/4IHoAkTEcPXmeBYtV6CU0no8gIXWEJA6PqtEPIsW6U5Jkxq1Fr
	 Ub7epHScg0uQHkGbYPZ0B1oNbPazO/5qWy1BeJZ7/k3UcCuCpsSGMEexVUrCtCYotYCvQ
	 l0qELMzJY+X7PXaxMy2Y0YDXCzVFOpttGTl+XTQC/u4SxmKIwjM3GTJKnUJIM0j/UFEAq
	 ICBwCogrf+8DPHMCfc93pdI455Vw6W7AwPbUJHsg9C7C7ApzsSCh2EgnWNlSyv9n6M+j2
	 RDoyuKneFenpNNHyWfMfSj2AZWyQTAF6ppHRxsH5ZRvO8DculRszjL53gk0rMNZDvMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTJuGvhu;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9C606A321
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 12:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89C9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tTJuGvhu
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso7567951c88.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 04:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795611446; x=1796216246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mfltfNq/ZPnpD4OYvm+F8Ne+9+ic89UiJvGsMBg0vdc=;
        b=tTJuGvhuVbfbDZwkwiZCCFSEqZTCM4VIkwck/4VX8pBV0n5Ui7iwE33MkXy/FKxwec
         uQ2dtuJZzTajC3KNTqNZwfIpsUngEZFVpCzfVgg5e/OgUFt5OkXEuYXkafqBGRtCNID4
         Fk3AVhvPdOherDXQw3uR2Tu/lOlt3YAr9bi8alP/PU6CZZq5vQafMqetHTSLKfgCMESV
         SzP344mVC+pokZYHXUWN3XKOyP5o8D9ywjTVtc6Pc32jgVySDIi7RsVHFMonNSUvK7Vg
         cM9H2UADvTbPboeJowCrMP4bpqsOolz7iOV/8NtDVnYHkmGaxkGWJFD7Nzhe9GI4GRbx
         sl1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611446; x=1796216246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mfltfNq/ZPnpD4OYvm+F8Ne+9+ic89UiJvGsMBg0vdc=;
        b=V98SLf4HVG7WmfXsNNiM36x1KM3qRjZJ0ECxzc2S1tC9uCAE5aPJ7WWk34+65X9G+i
         oOc5IY6UrKrzi1EIoiJSmLQMdP1nFOhwwbCkkWH7HbesSVd+JLf7CliRI2OYdh0XW0Ys
         J7Dt6eVfbEyst0pF1rB14L8Uf7ufLDRZ6MznaKGeDr2ckt//Chh8QbxVwt6uxn0sJHYt
         PoCfEFRsRNdugb/lk/j77cEQdSvzgxwX2EwRS85xp//8OWdjVZ/2+A1v17weGmtF18FE
         ykHJwlhol35cW3DFlKzHS4qW6BPnV64w6iB0CJ3AGSpuRNf4M9MKqWsitjCIn6MScKaP
         SRlg==
X-Forwarded-Encrypted: i=1; AL+hErFY9wSXS4i78jsBZRRaqGnEZkJxl+rjdck+YdX2/rZ8MbJEEZ9Ep2VIkYFgsAnou8Gdh8IkVRAactBX@vger.kernel.org
X-Gm-Message-State: APuU4Z+jIWtHhIUHygaK7tdPfqGoMMtdECv+dBd4uIvhDWHMcAa09zuZ
	yNzpOVDAS964yBXR8sMx+KH8PRLzvTVkz1rY/cDuuj/XyB+3PU9kUYzl
X-Gm-Gg: AZFdTZfx8jqZflf2Gyf7FN5vscxOkryc9Cl5FBNTP+qLkxLvD8Ixh4VBI+KwauFTNar
	ePq5nneMvbbIuzXZUvSxDBo4dYgEvzBG6gpauqSeEpDZX9t3zICyab5aelLhjDFL8rMEsoL0Lkn
	JLnX3Af7RRfyqryH2q/5Z0EsP5nHfVISxj3Mym0/p7SiuCKHxFNAvO4dx+hIDSa9ra5a/KYTgpk
	N6sDGWyGf1MZD6aNzimhMwbejmNDyIe4wnnXj4G9pt5W00ufMgNruXqflICAOBnQ08W+wjETKCJ
	/+eWsZMOduemckraVZ52wkY7CMxhf/9hHg0g5McD5Pu71tvHIz8Ot9pfb7k4+LDkARziACtk267
	2Y32V6xzRQSIl2TCDGnyH/oJhzB+r62ZLvJ4Q8R9PrPu6miUgfzTeZSQWBdOfYCkm/jMRsREBfo
	wqVv7TVh7cskyHSVkXray63vbhe8aXXeE/iNzsRNTkb3WZJG/2LHbLr5PD4BfjbbYwkxbyPvqSW
	FzScQPx5qCI/Chff3Yq6ZEwXKjPf5mYCvsWo/QiBL6OriEOIK7GRAAr1CCcBp8ejTRw6F5n9T6I
	h8l4hcFgPBQZdHNJsfYv07js5ZKm7jWB4FO7dR2AEKypoV0/Ae3CeLBMPbC0JVxPAf5O
X-Received: by 2002:a05:701b:4354:b0:1b2:6cba:7f7c with SMTP id a92af1059eb24-1b5568fdafemr16762078c88.37.1795611445269;
        Wed, 25 Nov 2026 04:57:25 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm42379243c88.8.2026.11.25.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:57:24 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: =?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: rgb: ktd202x: allocate the LED array for the chip's LED count
Date: Wed, 25 Nov 2026 19:57:19 +0700
Message-Id: <20261125125719.2565828-1-congnt264@gmail.com>
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

Allocate the array with the number of LEDs the chip supports, and set
chip->num_leds right after the allocation, because the helper only sets
the counter on compilers that support __builtin_counted_by_ref. Entries
without a firmware node stay zeroed.

Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v2:
- Set chip->num_leds explicitly after the allocation. v1 relied on
  devm_kzalloc_flex() to set it, but on compilers without a working
  __builtin_counted_by_ref() the helper does not set the counter, so
  num_leds stayed 0 and probe failed with -EINVAL.

v1: https://lore.kernel.org/r/20261124095707.3852724-1-congnt264@gmail.com
---
 drivers/leds/rgb/leds-ktd202x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index f1822281c3e6..bfb28c38ba14 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -533,6 +533,7 @@ static int ktd202x_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct ktd202x *chip;
+	unsigned long num_leds;
 	int count;
 	int ret;
 
@@ -540,10 +541,14 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (!count || count > KTD202X_MAX_LEDS)
 		return dev_err_probe(dev, -EINVAL, "Incorrect number of leds (%d)", count);
 
-	chip = devm_kzalloc_flex(dev, *chip, leds, count);
+	num_leds = (unsigned long)i2c_get_match_data(client);
+
+	chip = devm_kzalloc_flex(dev, *chip, leds, num_leds);
 	if (!chip)
 		return -ENOMEM;
 
+	chip->num_leds = num_leds;
+
 	chip->dev = dev;
 	i2c_set_clientdata(client, chip);
 
@@ -558,8 +563,6 @@ static int ktd202x_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	chip->num_leds = (unsigned long)i2c_get_match_data(client);
-
 	chip->regulators[0].supply = "vin";
 	chip->regulators[1].supply = "vio";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(chip->regulators), chip->regulators);
-- 
2.25.1

