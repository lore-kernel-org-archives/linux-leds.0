Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B094772AC
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870054; cv=none; b=EBBM3OldAnp+Q5xQ4fxviyPspWmfSHphrFhlbp8zk+lOwOmsdgPxXN8jQj4aVUU7GNgOrhwUPtsw13JF0z1J/H8EOysHsd3T1YNWje0tlOUQ2vJgEZ4QYG3qCReS1dTnLLRuQXvzLKmsQCr6tf4vOiS1u9RG2SayLudL5riCI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870054; c=relaxed/simple;
	bh=qUjzj1fq6XmfDNgNlFf6SLJDEc7kpA8cVLGtOvI9Yd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PidhcrlwMhH8agX2vS4q03djBivsnAKMEBocx3BYt925fy8DZKuv+FHDF/88xSpUt+Imw2ryPsCEGJkNSdVTgwXwIa4qUPJ76/DPXk68a15Z9PoaWj5FGUKVtztBuyDCxdj3R2uk9X+F70BCZz5M/YUxnkINzQLhlrjme9b4+/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=XdhEtkpG; arc=none smtp.client-ip=91.218.175.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="XdhEtkpG"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qUjzj1fq6XmfDNgNlFf6SLJDEc7kpA8cVLGtOvI9Yd0=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791870049; v=1; x=1792474849;
 b=XdhEtkpGW9/k53s9qwyDbnHaHWHiySdTBjwN0QXEDIGehWSbaUBgfumE3MyawMxb3DymFCEV
 GT8948nivou2lwOLcAdY3yowBttycOsJzm4/ZfHo/IdSvlm/WCLekh7zLc/4BR8PvkafLVFzNCh
 E3mPE9k/d2BLD3POzopAA3SJrMuNmvvEDFSChpH6C4Ftbb2yE707/CCjWbhXD4V029kCW2YvYdm
 FOzhx3myj/s4EEMGfNFkv3qEEiyODnzs47Mf0PJhIvTcua1oHhtiXUiU8d3E4skBzu60CCTa9QE
 VF6y40lsAsGDX+pkLvR3blSyVGWawHI9oBFJ44IcQRvig==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f251a07ac04ff85a;
	Tue, 13 Oct 2026 05:40:49 +0000
X-Mizu-Trace-ID: f251a07ac04ff85a
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 12 Oct 2026 22:39:57 -0700
Subject: [PATCH v3 3/6] leds: aw2013: Use dev_err_probe
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-aw2013-aw20xx-rename-v3-3-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791869999; l=2778;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=qUjzj1fq6XmfDNgNlFf6SLJDEc7kpA8cVLGtOvI9Yd0=;
 b=k9+x2k17tzP27+PbGCdmIVevpA0rbYTJmHFNxuDRzWgn+fuQ92QpmiPMbSQwiLQ6bg/lwC4G3
 aI/YUGbm4gWANgKg9X96SS7LIxM9m1r/3LtjQXuqcN3lrR6XLKS9xH+
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=

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
index 4da33a86af16..05d61f4e5804 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -447,9 +447,8 @@ static int aw2013_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map\n");
 		goto error;
 	}
 
@@ -459,30 +458,29 @@ static int aw2013_probe(struct i2c_client *client)
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
 
@@ -497,8 +495,8 @@ static int aw2013_probe(struct i2c_client *client)
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
2.55.0

