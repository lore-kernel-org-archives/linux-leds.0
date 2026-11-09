Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794251065;
	b=PNdaguv4n7sAISbD24w1acVWokMb4QhgA7qgZOX+2IuUIns7swlhE+BMbQL+sm7/lyNn
	 bSIbms7sDvXCr3z8W8DMFtNMc/fpH2Rvt637K9DtQ5fuAU70zfyJPG9nSQVKfp9nC5yz+
	 LhIZsNYweC17u7+kZuODgBdHui/Oj6QkbxWiM0h5tqIuHTg96W5N0dwrfANcTa6Z3tPC2
	 6yaY0r7Xi0moX4OHqg3T5QhGBaKMT2LaZVdAXm/mORpzo8JYbCmAMm1wuoX4BAToKurrW
	 dpxrA6DpylN2yEZzfJXoq56lSaIZld5N8UQJdZCo7EBXTbUu2Ea+dMBrFN2Iydi+afA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251065;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9DhueLum8Z1bpHDqZK0vZGxoFbrR9/gjrhWzlk/HNW0=;
	b=FF9WKDwlLQ757L/2lUedFaI4N15oNFs/HRNV9drI3XLWezes01kLp2ew7JQqLrqHppKQ
	 XDxp83q91OCk3v9QMEBHIfHUAbN/DE6vliVCh9emxnKaZt6LBsTL3xVwnHQC5jnLxaCol
	 vrHGX0ddHJiSHN09ZbTXgjglB9f9DDcXK8e/BGzLh5DMaVbFqBO1g68uSTlGGwMr6M2od
	 4dSQKeyl3mxi3l0RqQ+KUbhlsWUV/nTVr+9JWAlUU2Eq9IjknT4sATPSp0br6gjC/lT+X
	 bZsmXq9DqnreRKEuvV0welaD6zK2+l/dImuJyyJIbqZV590nlB2hgFX30DBh5wC0Dlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIuCsgP9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457E8606A335;
	Mon,  9 Nov 2026 19:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIuCsgP9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794251064;
	b=HfTe1+JwTHdKikNV6oNnVRG5cNUt1NS73WUNKtJsWb4JscHdjBRps8XXGiBh8CItEX8z
	 5Ql3Y4m8ERoG+LG98ArsExvQEpqc5TGbOyIl095rGjiT+O9Yrbqiekvyo2tcq+rHVN7AO
	 V79/tgomtoSJmFLFqiJFNFgbI2BcDos8HdVnLnzrmB70EyWYMwTNExxhdR8gsh6XBIx/r
	 Tvi4WcEYzswoCp62JKfgOxHJl9PrYnyBGwAt/omhlu+VjTrjzJ9Y5LSobFKP2ALPRUjkD
	 0KAeUyRJhGP3pzL3mmV11nYnLQ6dFAeeX0wa4NeDxiV2C5yrzkB+JI7g122qrqtinXQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794251064;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9DhueLum8Z1bpHDqZK0vZGxoFbrR9/gjrhWzlk/HNW0=;
	b=WtTk4A/z7gooJRuPCcwQEHhFKjZbVLrxeFyEsKTBJiwKP2brdd15DZuat4mU3yjmVbPV
	 XPRsShzdjn67Kh3luqJ0g7YX+Cbmp0JxNOZcnQ4FsYkYpd9wg7y2kuok2JNTz3EtvKdFf
	 tWyyiMPKY4pb8k7I4Wvvoghu5nNECM9NYI/Gl+6vbieFar7/ekSAALnmhkD3dJ5RbRcSR
	 +Z7JSvwcQcrw6Cw8OL853w2uNhRSo+ouNIQ9kTeC2iiEWDGGYk5d0EGdO8ggejnxuHHn2
	 fj/5cgN/EK7TVtivqxLWM799P1x7k8vvWabSc+W0ZNnZzWdbkCZ0Lfv4CT8ezT9lrBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BDA251F008A3;
	Mon,  9 Nov 2026 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251064;
	bh=9DhueLum8Z1bpHDqZK0vZGxoFbrR9/gjrhWzlk/HNW0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FIuCsgP9jmn4Drcs1eZyxoxfN280aY78UOYGBoUpaQVAh8uArVio6nBcKb2svC5kt
	 9ykrbRdTAjdYc41eemZE0NWB8qI7PO13hIoQBigdDbQpTQMvMutRJVF2nIC+/yvOTM
	 lJnhQ4INb6tuUvOs/PUzMq2BFFXZ5qKh4ft29/ugK99we4qAKWr1uFGH+zkt9gfJKK
	 b9LArrgmy1G1x9chYiE2W36d8txwv4gQXSXEh7Rd/SKQG1fulp4M3oT7VTKR9Jgefu
	 mIcxyTKO+KI2SLEUxQX2Sd3FLR3+YvINpx8KC5I2vssb2dzNQ+S0o1XGBOzF2ESG8G
	 Jeox0FzSFzPJw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 47ADC485EA;
	Mon,  9 Nov 2026 19:04:23 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 09 Nov 2026 14:03:39 -0500
Subject: [PATCH v2 03/11] leds: rgb: ktd202x: Never program an on time of
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
Message-Id: <20261109-ktd202x-et6326-v2-3-56e97c226658@telaak.dev>
References: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
In-Reply-To: <20261109-ktd202x-et6326-v2-0-56e97c226658@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794251062; l=1420;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=EV1hmMaaQNopYbNm1qmtCvLAT8YUulReeH2UbRD8tX4=;
 b=5N6+AXHYwh9K+UQFzXUIn312YRX3LuAYUQmwV4Tgf5T/HL84uozk/eH7bTzjryK47HfTo6lmW
 x5nyDoLh/aUCzecIRTCZZ3cQgz72pFFGw2XO7KMPzCYYP9BfrvGUd40
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
 drivers/leds/rgb/leds-ktd202x.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 482af28e8370..8c890ea5a754 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -304,8 +304,12 @@ static int ktd202x_blink_set(struct ktd202x_led *led, unsigned long *delay_on,
 				  (delay_total_ms - KTD202X_FLASH_PERIOD_MIN_MS) /
 				  KTD202X_FLASH_PERIOD_STEP_MS);
 
-	/* Integer representation of percentage of LED ON time */
+	/*
+	 * Integer representation of percentage of LED ON time. A value of 0
+	 * keeps the LED dark, so use the shortest on time instead.
+	 */
 	on = (*delay_on * KTD202X_FLASH_ON_MAX) / (*delay_on + *delay_off);
+	on = max(on, 1);
 
 	/* Actually used delay_{on,off} values */
 	delay_total_ms = num_steps * KTD202X_FLASH_PERIOD_STEP_MS + KTD202X_FLASH_PERIOD_MIN_MS;

-- 
Git-155)


