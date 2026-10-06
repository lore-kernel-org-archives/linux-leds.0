Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEDA3128CC
	for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2026 03:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258392; cv=none; b=uladXMixxVzROm5Da0iX9V2rL/jXdpA5/rLUTC4exrhD6lq9d0K6DksRQlhLblfILHFrFjkwkTAdarLIo08M20TVGxl6bqI/soTkxRdv6cIdzWQpYAJYNCzPYlngDKlqaWLaPHDQGOUFyVsmizQtPD5ZxjcNqbegPSh+AbZRe2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258392; c=relaxed/simple;
	bh=XvxRVW1Q5D2qNAhM+IpRlrdgeOjDlWc5Jtj/S4JyW6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fsy/euRT/xkS1CPfXw+9M2LssTr8a5MkhlvG9wuNFAaqjKilmnfVQCICzSXDq5oozjWru0TfczxqJhfL3tT5LldtEctdsK2s6bIbytczc9LSggeXtg1JSysMOV4KdStnYNC8ac37iqzI45FBrfUlNdKwBQDi2SSBT6M5P+Fa/NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=cffPX8u4; arc=none smtp.client-ip=91.218.175.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="cffPX8u4"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=XvxRVW1Q5D2qNAhM+IpRlrdgeOjDlWc5Jtj/S4JyW6s=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791258388; v=1; x=1791863188;
 b=cffPX8u4mbnk/NrU4iq/av+GMfe1Yre3HhWTnaMwacsjN35T9RX4s2bT905PdVlb98D22VE3
 3mKdFQD13bNk12ku3N4ThNkhnYSKnLwIXkWtxtDPlqjVmm6Q5kkjWmeIGZHOXk+mEHYOiPblnsF
 1Y3rAVqvLq8PaggjZlQ3CTwDLGV/4Tr534wPMAwWlvnPLyjj6hUhNurcIR1CAvsd2cXaWBH3+A4
 JruCrpsUk8DEuJDoTDoHaBmGx22TeZWity0ftye/9D6SMwB0LXweftE6zQ/KMwhsWcLDOEQbvPv
 quUXtBirz7U4Nmw5EGEgzkCTnNAE6duSQPX2MCvS6fZeg==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 71ed95ae9f4377a9;
	Tue, 06 Oct 2026 03:46:28 +0000
X-Mizu-Trace-ID: 71ed95ae9f4377a9
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 05 Oct 2026 20:46:05 -0700
Subject: [PATCH v2 4/7] leds: aw2013: use dev_err_probe
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-aw2013-aw20xx-rename-v2-4-108ecbdf2775@postmarketos.org>
References: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
In-Reply-To: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791258374; l=2589;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=XvxRVW1Q5D2qNAhM+IpRlrdgeOjDlWc5Jtj/S4JyW6s=;
 b=yX0VKJ4FkIgP8q45aik3Wm9IMErD3o+1+AcUuPPQY10c9zDvf+cGYxu5PY8x0iVnrun345qqV
 5/AXBJeJHmqA0JtidPRV97mUxH/+nCegPOqPvqxQELMfWrDW891534C
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Failure to use dev_err_probe() for regulator requests violates
LED subsystem guidelines.

The original driver didn't use it, but it's worth cleaning up
while I'm here.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 340eefdda04f..705de95c6eac 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -448,9 +448,8 @@ static int aw20xx_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map\n");
 		goto error;
 	}
 
@@ -460,30 +459,30 @@ static int aw20xx_probe(struct i2c_client *client)
 				      ARRAY_SIZE(chip->regulators),
 				      chip->regulators);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to request regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				     "Failed to request regulators\n");
 		goto error;
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
 				    chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to enable regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				     "Failed to enable regulators\n");
 		goto error;
 	}
 
 	ret = regmap_read(chip->regmap, AW20XX_RSTR, &chipid);
 	if (ret) {
-		dev_err(&client->dev, "Failed to read chip ID: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, ret,
+				     "Failed to read chip ID\n");
 		goto error_reg;
 	}
 	if (chipid != chip->cdef->chip_id) {
-		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
-			chipid);
 		ret = -ENODEV;
+		ret = dev_err_probe(&client->dev, ret,
+				     "Chip reported wrong ID: %x\n",
+				     chipid);
 		goto error_reg;
 	}
 
@@ -498,13 +497,12 @@ static int aw20xx_probe(struct i2c_client *client)
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to disable regulators: %d\n", ret);
+		ret = dev_err_probe(&client->dev, ret,
+				     "Failed to disable regulators\n");
 		goto error;
 	}
 
 	mutex_unlock(&chip->mutex);
-
 	return 0;
 
 error_reg:

-- 
2.55.0

