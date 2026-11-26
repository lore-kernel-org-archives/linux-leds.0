Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717261;
	b=P0JlTDg5bHobBWs+wJK52RftCZOgh9FhI/ZEqECAgZAwv3wTdkQKhtaf727CyIaHYNQC
	 LtPPpQnApPxW5HgzCXydSxr93RGxgpXzAEhrA9FaZJhkwUhEerzcHGMQ/S3a9a34BLJZj
	 zNOEtoIAwiiXR6ZdT9wlcfHqgXmiyRE660U6AflqFaHYOyL1US2V2qRkT0FOk0dfP1W0x
	 tzK55xrx4mY408QidrVo3iTacnB1jSJdcxxSGj6iLRa4XMekNK9C94Yo6lWXOzP/NR31t
	 1/LNaflrM4pU59zSphZ1F7EPIOkXO4GNeQSktKI8oaCo7MDnqCUZ5stJ6K9ba7kUe9g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717261;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lY5nq+bk/co1m+VEpdGDg6a4KYR+pxllw1oL68kIan0=;
	b=mbBjHTh8JzFI3gatiYqtW6EMzraCm8qg1T1e/GxbFB9oxz6ndotoxGRiG2Rt+IaCYgO6
	 76vZVIoFfPeLJl2qKNHKitRE0QdFBVyrBFZQ4Qcmp3NhyTk0LeunwU0rz447bPhe9DcV4
	 xO4WKc2dD/Mw5xegHq3Neu9tygK+8c22mwjWZ1fsN4aTJluxJJsn8DuG84l94bD6Ipw3w
	 AoJK+F4Sv6f9hIY7FDzIwvQDJSYgM1Q92dyEAjW/9TFJ3/Hux/T/ShbKhRJJMgx1QHSvF
	 eB3DCeFsfci5Mwjtfro7s2daZqItTqfB+4WSpPZE+NDhJau/uO5oUA2CePR3xdwRJmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bjFn8UDr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79152606A31E;
	Thu, 26 Nov 2026 18:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bjFn8UDr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795717260;
	b=Wkum/wJczX5H3GgSpCgTE8hbIhNF5LtP0KulSuavYXMKYjvE+7GzcrTVo1VIUFvbJApp
	 8/WdfIaG+3ZX03AkiCU1rXn6Y32JoPOVF6V4jr+P4f0DUPJFHrmpCQlgO39lwI7hEK0Us
	 UkUQ69TIGT98w/vVSNTmjlDnTo0AsVKPkylkITvwGsK//J8gYKAlOFOYleNZoLLeSd2pG
	 TAx9qTuNHvT75O/uBiAyp3mK+bgbUFXfQHYGX8iN7hT9N+wzREpjsG/XUxPCsY/vbl3mz
	 +lyjJdxJM5VBe1BBE5QKAaUz+iHazETbMFLEqWY+raYsTewrSjMzziOdhhwQTnP0u2w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795717260;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lY5nq+bk/co1m+VEpdGDg6a4KYR+pxllw1oL68kIan0=;
	b=uFMuZW7fXTyZPDKcQfJaa+OS6lNKPrwpIMJW8RVAvaJvxLdQHwLeg2pWwnOYBkT23MSL
	 PgA1Pta7CHwTWLRJyOOgoDxuxBywgVfWAFLt6kkET4N0xcqmAW2mA4VGb0LcN8iDn1l/l
	 E9KQHDK0f46YZ0NOfhmwIkCm22Z6zIsoq81plfIYm+J0ZlRY1mikxujmOb/D0GHqiRc52
	 zRVdvTnc9aq2TkPnQ4oacRREOBnWs6yLntcUad88/YSTE6Uss3RlRGBrJG13qHMpTSC88
	 okBPvHYLWFsj5l2LBrhEBiy1+lTyjCpVqyTA3J2ctpHeWxtXaap3Kd33kRALGCg6zRg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0DD1D1F000C0;
	Thu, 26 Nov 2026 18:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795717260;
	bh=lY5nq+bk/co1m+VEpdGDg6a4KYR+pxllw1oL68kIan0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bjFn8UDrXDaOLJf32s3aI/elSGuHKNr1g74JHBT9jcDGo52vkoiXYNriggfUrVuP5
	 gd5uqo0jJ/8W56Vfk207yTLJng9k/dnuhUp0nOnKOlBh11HHtf867+SyvSlxAYyRJo
	 +2hJ5uZkZJP3VyHFfDvXAS1aoXSL1ZyPY4a7eDPUmZgNDRix8/eDHqFtQHRPx6GaUM
	 ytfm3pj7Sh+WMV8oz4+c055k1AVvUyZP/XEqNlTMHe/iyEE7FLiv/j8li5Yyzrygyq
	 y3PjLtaFnbAdNYoAzb4Suib0TS9xtDLeQI8/YWNSaZlWhQENeSkMT7mqg63K0Sc9rK
	 MQ1tEgVy8BxSg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8ABF24D794;
	Thu, 26 Nov 2026 18:20:46 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Thu, 26 Nov 2026 11:20:47 -0700
Subject: [PATCH v8 3/4] leds: aw2013: Leverage C99 for-loops
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
Message-Id: <20261126-aw2013-aw20xx-rename-v8-3-b6960baa102c@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795717245; l=1264;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=8moIJ3mQfmuBTIbU/eQPcugoUhzkUtic+4Kui/oHkmM=;
 b=b7br/0hLQPbV4CV4SejB+oqP+oSdovGCrp0iygknZXyv0JM2D0Mc74Dj3j6iaA+xd6zDp2KWg
 hROm2rHWUFbBQatdRapSKCU7L1bDl4BvnEv83pydS71mTX6ex6bz5fz
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org
Content-Transfer-Encoding: 7bit

From: Paul Sajna <sajattack@postmarketos.org>

Declare the int within the for-loop declaration rather than as a
separate local variable. To make the code more readable.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 2937a0f92d92..7fe7e9dae903 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -72,7 +72,7 @@ struct aw2013 {
 
 static int aw2013_chip_init(struct aw2013 *chip)
 {
-	int i, ret;
+	int ret;
 
 	ret = regmap_write(chip->regmap, AW2013_GCR, AW2013_GCR_ENABLE);
 	if (ret) {
@@ -81,7 +81,7 @@ static int aw2013_chip_init(struct aw2013 *chip)
 		return ret;
 	}
 
-	for (i = 0; i < chip->num_leds; i++) {
+	for (int i = 0; i < chip->num_leds; i++) {
 		ret = regmap_update_bits(chip->regmap,
 					 AW2013_LCFG(chip->leds[i].num),
 					 AW2013_LCFG_IMAX_MASK,
@@ -142,9 +142,7 @@ static int aw2013_chip_enable(struct aw2013 *chip)
 
 static bool aw2013_chip_in_use(struct aw2013 *chip)
 {
-	int i;
-
-	for (i = 0; i < chip->num_leds; i++)
+	for (int i = 0; i < chip->num_leds; i++)
 		if (chip->leds[i].cdev.brightness)
 			return true;
 

-- 
2.56.0


