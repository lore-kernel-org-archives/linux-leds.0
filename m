Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795133257;
	b=yVvHfwcLQ/jcr/8xvmSHTop3YNxBtyINsJrVfufwHs5uvLlDEDABTHcpQcm3Q7KSDnN7
	 h6QW1+F60i861DiBDJF/OvvUiCepzTFYePUI38EOnxitTrA7jwhiMfdbSbI1ZqZ9KzqgC
	 K4SVhF2H0CAEr89d84XqJmJG1S/A6G5KhVQOctDp2/mMEqrMyILnq/teaYBBLYE6gIv09
	 ve6GXAcXZfL1Ri3oj2JZjf7Vv7H5PQYO8NJDVjxzVgX9WlipNIDGj+Dia/E1fxh9RuSFO
	 WKRCH/daYTFCoxNYLmHiuknqn0tdql2QQUUavnGu6sVZUIesXDohL5dpgN2doAOaKcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133257;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mXx8vQW9eMcb5f5cjRDmYQfODXKXZlBnw1rzPhomIHA=;
	b=FCTt6OPMT64iJx15CZtwv0tX+5zXnqPa4CD0qOKmnP8GBxEio+xG7LZJs+5t1AsWPGB+
	 19b3lQHMuoxFWeSLB2IB2qIBMg3LH/ylO7C1vcHfIFssqgHSovt5kRY/6xU9TrfdBbDtM
	 JpAU1UgWSzTm9srHyjLwBz/+kQVdVhg4ghSjLiOoUtnxTM8003ZDzUZwS1wUsqEFXaHHz
	 kkw/NWFTvcYUpCe2udHQwsLjzVLG+zgPaFNtXTlS/I7lNxa7FMPEe8KZmmyOr8gjFjaqi
	 WUR/lhGvaUbVIs6QGSlM7iXmGrM4z6GU48b7ePk0WVHMNXmwnn194Z1flXQ+9A1AkCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yb6l3y06;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1E660A2631;
	Fri, 20 Nov 2026 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yb6l3y06
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795133257;
	b=sX5Z1dEdhTJl6XEbqq/O8g/kDWJy7C+/5nsFms64KTEbSOD14ZsaZaJH374/io8SsohG
	 E3XMO/o7n4OKgcA93HksdCIVZMZyj/GFHBu+wzs3vT5ZgMjb+VVDxd8Y8XwLJPU2F1LWW
	 s0flCMAnD5JsVcrWTEJNlhifGNPaIyzbwFxa3aubiLXnQstb/9GLsU8ZSNLb8eQuQuMrm
	 cOkcoZtjN75bbQrtay+aTRQ7whoinVPOmtpemnY+JQUZlFrmvME26BOHnnMFDa/1pCjRt
	 vLhuHOBg3LM/GOKAXJEt2CIqIFrmPChwCfTFPLWCG43t+ud3uIEIPWPl9V6r7bV0O5Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795133257;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=mXx8vQW9eMcb5f5cjRDmYQfODXKXZlBnw1rzPhomIHA=;
	b=WppFUPBN0aWwBf3HQ0kr5pTeDVIjOqvLdUPM8KjkMf9AGCth/puveDxi9D2Z4z9DNa1b
	 a7ij/nywzz1Bx5i1cu0olu4l5OsyGBIBrQpByKjqwWTfoU+F6KfFlcdv17zhHQHn34A29
	 t8hlFrwWu9RII1joiw0DA6lFpW85rL1kDymdr5j0TMT/iqbzQvn9kaGUVV4lOVY0FUjBE
	 CMav5cIxyCC9fxQNPEz0GCJNyfEMs2UnqzeM0ZbQLISrcjCD4oTJ7FAV4+Omi9wWWIre4
	 04DmP7DRZ+pamLTzKXb9mi/XDchDPsapon9TB+BhPDReIiKt8ODBeyq01V4ACDb8BSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23B5D1F000CF;
	Fri, 20 Nov 2026 00:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133257;
	bh=mXx8vQW9eMcb5f5cjRDmYQfODXKXZlBnw1rzPhomIHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Yb6l3y0608FJiJ0gkH5BKJvjcOSUeE2fvDntbVaqm1GiIRf91yELqU4MsjDCZsuGJ
	 T1uYgInmb0vPpEZxf+e9YKU+j/42tvIGu1bYKCYWmU04rpGqCiG/iRJoR2prXBXY2K
	 W241gnrcyVVoqUnvte+pGHxjCuooEJmLDTEIIvvS4ZB7Mfzo5TXsBWN+jq3tb7kwmA
	 DbHtVeB27ceKnZrdkVxa/wIDuI5kU+wRaIAEH0YQgtSVTuoYQYjWC6xEzz77zyknlZ
	 BDV26c5zIZ3a6hy0r7GHXZbcGU2gyV4GlVf/wnH6ySzvZrRc2j/pfev2XufgfOFteP
	 QXJwHskQfNFgw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A53C0424E3;
	Fri, 20 Nov 2026 00:07:35 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 19 Nov 2026 19:07:25 -0500
Subject: [PATCH v3 03/11] leds: rgb: ktd202x: Never program an on time of
 zero
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
Message-Id: <20261119-ktd202x-et6326-v3-3-98b836b1cddc@telaak.dev>
References: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
In-Reply-To: <20261119-ktd202x-et6326-v3-0-98b836b1cddc@telaak.dev>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795133254; l=1697;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=4vu/LXmMkaEvGJ1/hrmJ814QvOwrRsqKU2bt/1/nM64=;
 b=6XXZtFUmMORX+v7XpaozbDugG0dkUc11VCmPURnFabSl3dyQasQBE36R+Eaic86DScMnM+X9f
 YW/e8Z5FHLqClmRq4CrwRm5Pngvc27HLOavqmo5yR49ERqRX2jCfsz1
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

blink_set() turns delay_on into a fraction of the period in 1/256 steps.
When delay_on is less than 1/256 of the period, for example 1 ms on and
1000 ms off, that fraction is 0: the LED stays dark, while the timer
trigger reports that it is blinking with delay_on = 0.

Use the shortest on time the hardware has, 1/256 of the period, and
report it back.

Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/leds/rgb/leds-ktd202x.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index e7e44d5612a7..362d231eddcc 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -66,6 +66,7 @@
 #define KTD202X_FLASH_PERIOD_MIN_MS 256
 #define KTD202X_FLASH_PERIOD_STEP_MS 128
 #define KTD202X_FLASH_PERIOD_MAX_STEPS 126
+#define KTD202X_FLASH_ON_MIN 1
 #define KTD202X_FLASH_ON_MAX 256
 
 #define KTD202X_MAX_BRIGHTNESS 192
@@ -304,8 +305,12 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 				  (delay_total_ms - KTD202X_FLASH_PERIOD_MIN_MS) /
 				  KTD202X_FLASH_PERIOD_STEP_MS);
 
-	/* Integer representation of percentage of LED ON time */
+	/*
+	 * Integer representation of percentage of LED ON time. A value of 0
+	 * keeps the LED dark, so use the shortest on time instead.
+	 */
 	on = (*delay_on * KTD202X_FLASH_ON_MAX) / (*delay_on + *delay_off);
+	on = max(on, KTD202X_FLASH_ON_MIN);
 
 	/* Actually used delay_{on,off} values */
 	delay_total_ms = num_steps * KTD202X_FLASH_PERIOD_STEP_MS + KTD202X_FLASH_PERIOD_MIN_MS;

-- 
Git-155)


