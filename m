Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717256;
	b=0irtah3aLHDl8n3WKv2m9nTBTrJwaFS0rGcdgEJJREpo9I+YKX5aPGQDa4wzXgv2CnQQ
	 KKGJgrd+tZcC6vA5aA5Doj67gYFvISCHKglvLPtukxcy8/m1DAj1KqqRyEuB/t5jqHOlI
	 PrFgzi/LVIpY1NlnDNlyP93OAfoj8iMwNWPF2er5ba1Oi10TRHjhEAAE+Vi6aN3pMteYE
	 UtCWPnOTTYQq9EgCvsQe44fPFIF8vzd2xbXSleRdpBVg5a2s8KTh2ZvYS7mDSO3h7gnq4
	 s4Y963Il2IPTdqFw0v3KT6S7UsE/cZA1sbuC+h5GsVD0FBqDEmpNak6glBDSh4oTOew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717256;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iF8Vq1DyGPbjtEtflzljG7HvzK18XClKIFJBzHSKSfA=;
	b=P/kybMmhmG5UfmcbAMfRmcmb797LvOzI7N9yK8qAwQsMNjyqGhXzn+p8tEN7phO5yGPl
	 5ROYdZdjoM8w9S3ND6dYIPDgtQIux7p7QS7DagPKRGbnLMSL7IIEV5+5xLeE9mpKk4inj
	 FOhsRJfF+cd/Gc1jO18Mhmh4IulywaKZkEB/aZPIruOQQCCfrQlPZJ1NzIWTzQKeNtT5t
	 Zf99zmbUch38T8iURugckLftfPRycyOPgxnKev1ErHnh2NHggX2KbVHT344VA4MCijHBL
	 zQxXizjyK1xxnE4Otb0bfG6etfsgdAdcoLn0WyN0/C8qK6U3I/JCBVx6uREOSKDNR2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKNxlCmv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D00606A33B;
	Thu, 26 Nov 2026 18:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NKNxlCmv
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795717256;
	b=cjpia5h6t6D6sFLGTEphtLOhiOtMVddQ8AmnSDSWLmEoWaXldkMnpyhUAtjyVfXEMEi5
	 bfdNwouSftIAvdu9+4M52ytJvGfTFu6QXz46vBrGZUiRRJiumImJt9R2AnTdkqyg0KAJb
	 p29EbCqutEgXlBaKrbvpJn5u4nT7HLz54yTARxqwW9yDaAjxltcKPnmMr2KnOsNOzyrzs
	 jLjh150MKylHXhkxUy+Ktrnh9C9CRzetssp1WpTYt6ZhcRhjJbi+uXh4vTr9pmDPfk9Wm
	 5fHF0t4PEOirWiy2FQrBc/qFzElp1nFZXPq2rctn7sJCpWYfi4TnIQe6lF78kEgIdhw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795717256;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iF8Vq1DyGPbjtEtflzljG7HvzK18XClKIFJBzHSKSfA=;
	b=CEZTIbqyancN8/VgzbtAm3gGQW1bTIv7YrHMnVDlibaPYeYeJCgw0xqRBZdm8ibe8MAf
	 bf0Zfp0oL0OwxYRb4uRPlO3DJbzKFChWaT7/H1EcmdF75vc1z4EjB0dEgo44l2Oa2BWH9
	 SrENLnCTFiwLab34Xr2/oPlK11zTP02SlYEpBk2pO5XhaDNmQzVTcNYunTH8sQi9rDkZ5
	 21ntVAcZUBrPWyxKNFBNHq3I4RSQRYY3ikTS44lT24MlmPZGDhDPAkck34+zV6L77UGn4
	 jJDtFqlYD01NexrG+2JXipJEiY+us8rTb7xQSDuo8kzDxaPQ1k1PTbWGMC21rvyJ4+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E07901F000CF;
	Thu, 26 Nov 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795717256;
	bh=iF8Vq1DyGPbjtEtflzljG7HvzK18XClKIFJBzHSKSfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NKNxlCmvqRHWrMSNmE1dSRCvRgsjy+n/hvtcjzgQJWcxEbFHLV9b3O/uAQAx9wzH+
	 its122aYbqTmEnQ2bN3P5S1lUthvCLqRxKsV4PAr3TaftHZnD9JsCbJvBCbiTqChYF
	 Yw4tfLUJ1ODzNqg5ImKwE0aZzGxKZ3i48ui3J11qiMr5PnhcrAa4jjXl4WmTSQViJJ
	 jlbzzXtleEtTG2Rfu6D0yXC2tL357TbrN0wg2o+Rm7YK69/Wk1hwhqSM7gHXcwemO0
	 F0cu/WjfWSv8duK/iSMkU+hbfNjD/O5uXd44ULn98YXh70i1el1dEpK4iNaxvkna/i
	 frL45Dsl+lw+Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6A8514D790;
	Thu, 26 Nov 2026 18:20:46 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Thu, 26 Nov 2026 11:20:46 -0700
Subject: [PATCH v8 2/4] leds: aw2013: Use dev_err_probe
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
Message-Id: <20261126-aw2013-aw20xx-rename-v8-2-b6960baa102c@postmarketos.org>
References: <20261126-aw2013-aw20xx-rename-v8-0-b6960baa102c@postmarketos.org>
In-Reply-To: <20261126-aw2013-aw20xx-rename-v8-0-b6960baa102c@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795717245; l=2927;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=rIyhe4A4huXwEKMyPwjJskxf3n5dD7r22StUzeRvRTw=;
 b=zs3fl+sSAXBO5fGR1BaMl0N1Z5C+hR+lpbyFlPmO4TWTNMGAAkWp3gBzwvSO/kbIRtmD53NZh
 n6zKO3oWjiDArI5Q0NoR1DqABRBPfqR8zAim9SElgKi5IQXCMF8xL1G
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
 drivers/leds/leds-aw2013.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index cf20e94920fd..2937a0f92d92 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -361,9 +361,8 @@ static int aw2013_probe(struct i2c_client *client)
 
 	chip->regmap = devm_regmap_init_i2c(client, &aw2013_regmap_config);
 	if (IS_ERR(chip->regmap)) {
-		ret = PTR_ERR(chip->regmap);
-		dev_err(&client->dev, "Failed to allocate register map: %d\n",
-			ret);
+		ret = dev_err_probe(&client->dev, PTR_ERR(chip->regmap),
+				    "Failed to allocate register map\n");
 		goto error;
 	}
 
@@ -373,45 +372,44 @@ static int aw2013_probe(struct i2c_client *client)
 				      ARRAY_SIZE(chip->regulators),
 				      chip->regulators);
 	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Failed to request regulators: %d\n", ret);
+		dev_err_probe(&client->dev, ret,
+			      "Failed to request regulators\n");
 		goto error;
 	}
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(chip->regulators),
 				    chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to enable regulators: %d\n", ret);
+		dev_err_probe(&client->dev, ret,
+			      "Failed to enable regulators\n");
 		goto error;
 	}
 
 	ret = regmap_read(chip->regmap, AW2013_RSTR, &chipid);
 	if (ret) {
-		dev_err(&client->dev, "Failed to read chip ID: %d\n",
-			ret);
+		dev_err_probe(&client->dev, ret,
+			      "Failed to read chip ID\n");
 		goto error_reg;
 	}
 
 	if (chipid != AW2013_RSTR_CHIP_ID) {
-		dev_err(&client->dev, "Chip reported wrong ID: %x\n",
-			chipid);
-		ret = -ENODEV;
+		ret = dev_err_probe(&client->dev, -ENODEV,
+				    "Chip reported wrong ID: %x\n",
+				     chipid);
 		goto error_reg;
 	}
 
 	ret = regmap_write(chip->regmap, AW2013_RSTR, AW2013_RSTR_RESET);
 	if (ret) {
-		dev_err(&client->dev, "Failed to reset chip: %d\n", ret);
+		dev_err_probe(&client->dev, ret, "Failed to reset chip\n");
 		goto error_reg;
 	}
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
 	if (ret) {
-		dev_err(&client->dev,
-			"Failed to disable regulators: %d\n", ret);
+		dev_err_probe(&client->dev, ret,
+			      "Failed to disable regulators\n");
 		goto error;
 	}
 

-- 
2.56.0


