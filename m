Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174589;
	b=gdb6uXsRfju8hT78GdZ4BpK1D0rCVsgKl2C6+0Wp1QWEsItgNW2CgOl/64QnZDv8KKUc
	 hP59cADYURsK0tFZigUDsYigBwVkCCew+hELRhoKDvothXNO4sCGWbG2jbtg4UEvGK2oh
	 gMUnFTn/dlNx2isQtdxGgwJZyKfzzSTHXrmgvygLC+kh70rsl9djR/JiRsGBftwQ8O+kM
	 mBW/T5WlkpyeY9HrFzIaLp7Mw1FXfVtqkv6Kj2JrGR8un45GoRoQ9FcypERaWeVBTXogi
	 qKdyk6GI4ICKie/42sFTXVzortGrdw9gNPkv8dy/s0nSOEnajvjT3mXMSShjkNQvrgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174589;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ID8aXSDi6DUqVlcBNz/m4nIgtfKw4nmq+cmUYg5AD44=;
	b=s9UBHyHfsTnKFikFRXLi2ZPB6na5LoWZhXBBx3CsFoZ4z13iFbsjyD8MR885zOXi3n7V
	 7TDFdCQiK7foMnJDsxSTZCe4fjc0dsPObKNbdJarMkyYvq1gseAG4M2EGDwK/hWMHO4jy
	 MeOrkGmI8eHd+A6dN6H7Aoj9kAhPD8VOxWT+qxcx6uuiiAawfaU9O8OJKXQIINsX/WxME
	 Q61lBZlm1q8KP45CbROLFwT+GlF+Tgj7/nvaBPTljhKBYDMLI5SWRb7okjsdxWnoKkI8x
	 PSQX5MSTlo/ZAc3hgemsT23bOL0v/+kpaJwlHl/1yy4DXSxBMqTv/XKcDgQUECF+06g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=nCS3Yvu2;
	arc=none smtp.remote-ip=95.215.58.174
Received: from mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC30606EE93
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 21:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC30606EE93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=nCS3Yvu2
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ettSwBxSa5xIRDiOTDO3cSPU46l8tVUsC0Q7wr2qb8U=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794174587; v=1; x=1794779387;
 b=nCS3Yvu2Nm4bNtFZcUTcOfbKjrD2FaIvrAOc0H9/hlCzzGESPIjKVLlR8eyS9PKYES/B8Gex
 FFOzM1vJNChSc09algLfW/TTPthzpjnwx62woHQf1RkegufZCezUieX3QyitCJnApcMii8HTio9
 R1QyukAqq0o/WjPIzK7ckxBLXnmQC1R8uQ9qDT/dXEtWGxJMJMpsquwohhyAWcfhGCdt+KFjArT
 HDiBb2zttl+kXQdGxWPebL3sLY+5ahQ17gudiiTqXAk5/tTa9letI0JcLGi/NDKSy92vLigvg0h
 CapmdQJVAEFXM2XAhOk7OXz4C5K1rz3NziktwR0YmX1Rg==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9c6cbfdcf6ab8252;
	Sun, 08 Nov 2026 21:49:46 +0000
X-Mizu-Trace-ID: 9c6cbfdcf6ab8252
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 08 Nov 2026 14:49:15 -0700
Subject: [PATCH v4 4/4] leds: aw2013: Move assignment of chip->num_leds
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-aw2013-aw20xx-rename-v4-4-826529beeb52@postmarketos.org>
References: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
In-Reply-To: <20261108-aw2013-aw20xx-rename-v4-0-826529beeb52@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794174570; l=1195;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=ettSwBxSa5xIRDiOTDO3cSPU46l8tVUsC0Q7wr2qb8U=;
 b=tyyg0CXSxsNHTK/G9Jo5Y1cgKmitvJlkxuqEswdfAB8ZAQr3B/yij1fhxxoolkOtq1RvVbnpB
 iuG1fdMYZsVBXVSHJCoOY1dV7kTXkTLEwlryKMTpI8xwS2zj8adJuLK
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

devm_led_classdev_register_ext() executes default triggers
synchronously, which call aw20xx_brightness_set().
aw20xx_chip_in_use() silently returns false, skipping chip enablement and
causing unbalanced regulator disables while probe is still running.

Increment chip->num_leds inside the loop, so that each call gets the
correct value for it's default trigger.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index cf8e4b0a4572..c5df652ad8c4 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -410,6 +410,8 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 		led->cdev.brightness_set_blocking = aw2013_brightness_set;
 		led->cdev.blink_set = aw2013_blink_set;
 
+		chip->num_leds = i + 1;
+
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
 		if (ret < 0)
@@ -421,8 +423,6 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 	if (!count)
 		return -EINVAL;
 
-	chip->num_leds = i;
-
 	return 0;
 }
 

-- 
2.56.0

