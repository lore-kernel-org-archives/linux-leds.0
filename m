Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794518588;
	b=MxAK6DAH5yAfleX+EyHZ1JS9EfVHZxC59lRY1OKSjRjBqVjzU+SKV1HbnWixk1v04IUt
	 +oN5uPITW4b07MHyRYoUo+rrDX0NYKNcwkapzE0t1D+s5dGg7tab1yCAdSZkGD7uRBhUH
	 xa5JOzfiwzgph+ZysEcU/WmuhwATnuhhCkdv7YdGykpMP6gzF+PqgTr3KFyBQ7OEtzGvY
	 aEw6EwN/WoAPVpTqmCjGt3y+n7xhPLJbJkOxkoHSUy9MReeResaUaOOx9RyX8yNz/k4ME
	 ZCeoMt0vAd30avfHb9ojTjn6YzjPHTVRMgmSY5THJPrDdMvnSb0jcjLtI119AFaJc/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518588;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nso3y3yLYI8AvNtWYkM6ZAd3X4KyCaCRf1zr73mOAWc=;
	b=r6GDTMLM7dIGkHwnFImbtsmNj6Uvdo7DPHEaL/Lo4ct6s18rp/HtbRf4KTfCY8IwMy4H
	 d7X+shb5XS8cCgkGYZOTPRctRGiWm31VVWIUUY0M8yII/lNLDkh8Tl+HyS8DvluP8VX5C
	 CNhuJZh2Kt30P0L6IhKZFT6mnZmvjf4JJC4RGe+WVpg2ldai5f+jzDEghv3BfyOYFWRH1
	 bkC5KrehsDQd1uxZ4MA0Zsd9aZA0K8iK6BVWbkyE0Oq8GUqMnNORVVPtgU7MgTaZulNt5
	 8sos4GoyBJpwtkYngmlq0k5E1MV7vFVSvf3/q6w8TGOfK9oss0/zfXwaIQrohUa9hlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aAbA/LAr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331DD60A260B;
	Thu, 12 Nov 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAbA/LAr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794518588;
	b=FavqCbRDlYZo8A3kNykCIkhvbnTPE7uC7XqpTqPmFHXN4r2YLCqh8L7QSG0X8Rj58auJ
	 PSJvAu1wcrDBkqzrRV1sCvQRNOOMAcYSs8nXJpHuKiDF91GfB1cJZLbo70lbpsW5LBNnp
	 Zt9cybWzYZkwDg+YlSYDVLDpaX/tzBx4ZxGQwV6tQS0QofJXmPqJ1QJiW9irdVbbev8CU
	 16Q+KPkLB0spT3z0RUYiJDS63zTpLMrVeBcxXf++BO0KMnnzEZ+PLfjolqlcF2j301d1x
	 MsulHdK6d7DmbYwYDTrnLvTGkoAmipYz1YbYOskgOwutRENQp00HPBYELJuxRlwfRTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794518588;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nso3y3yLYI8AvNtWYkM6ZAd3X4KyCaCRf1zr73mOAWc=;
	b=M0mPGFRAbSIErYOBTpvViOaLZJtURcVbSwFNLwnzolQjyQ+Ad304vaWWbYEsEMqo2Q0O
	 09b/q+knt+8LAplRN6Esa4qeYbaXt3s14zyP9EGBM3u7cOkFw+gvXoSBibVhlrzS4m5CQ
	 /iHnpG4EbWWITX3XYJTuJbTWdx/IVE5Wm8uIiabycMpLdD9A0TPULgg9p1zI53rR3o9lb
	 Sketo9ncdTym26IGVghWlMjOWMRrnISWUIYWN9Q0o89RRf0DPQWLU7/6F6wDYI3MG6RN0
	 TQlj5kz+EHXq6DliULjLs8nayV7LrmszUEwMWmN1/nBHRGHdQWaAgf0scW8bpqox10w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0890D1F000C5;
	Thu, 12 Nov 2026 21:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794518588;
	bh=nso3y3yLYI8AvNtWYkM6ZAd3X4KyCaCRf1zr73mOAWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aAbA/LAr46U/J4K0/KhPcACYlVnnlDlLwH2Ho9gS1XiTkvxpS/nPnuNvFKJVHGlU7
	 JQr537MwQytq5zHm0PVbGxQi90aJySRwFEfUp7nE/m6498/dNSinb9xakdtY31fk6g
	 4iHy+Y7A+7TkDQmOKXYWtRwUz2LqeJa+8i1AyNeC1s34u2VC+P23aBNWVwp8hovNk1
	 XBpSgmM00Pcru+tew2PU/XU6L3Y4OyBCADgAL1BlC/5Wg8CKz+0e/2VkaijDNRN9Rh
	 YKZAIbRzHq24SDtOy2p4QWN7jRdhTO7FchGdyNJISQOCQarn7EyCkfKQBSsa3S6BXo
	 +6eRPcpSz5SSg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8781A47506;
	Thu, 12 Nov 2026 21:23:06 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Thu, 12 Nov 2026 14:22:58 -0700
Subject: [PATCH v5 3/3] leds: aw2013: Use dev_err_probe
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
Message-Id: <20261112-aw2013-aw20xx-rename-v5-3-b2c5e323a90a@postmarketos.org>
References: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
In-Reply-To: <20261112-aw2013-aw20xx-rename-v5-0-b2c5e323a90a@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794518585; l=2778;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=jA6dkrp3HDWJJ31CT1UG2jCfBBnLdM10Gs8DL8EBTfI=;
 b=FdHMdjKquEZAmX/5gvC+6Z0996BwbYqm/EU703N6Q/7G+gKA5Vnpy39CIjGuJSi5NR7683cuL
 gYLNvMFMZC2CGh88ILKmdc76QP2ZmSI6jB0RdUQ4m5YjuZbiQuhK7n8
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
index d3858b06e594..7ff7167b6612 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -472,9 +472,8 @@ static int aw2013_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, chip->cdef->regmap_cfg);
 	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map\n");
 		goto error;
 	}
 
@@ -484,30 +483,29 @@ static int aw2013_probe(struct i2c_client *client)
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
 
@@ -520,8 +518,8 @@ static int aw2013_probe(struct i2c_client *client)
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


