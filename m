Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022960;
	b=RnBkLskmMua1VT+HtfP65IA/Sy1eT2RwIcf8liCZnPjreFKJhDYEDa4Z/jAo+dxGz+gF
	 f8tQFnNTn19lOIXFKcys7qKMQg4VxXUM+UlECFb8ipQz/MzznS8FheyjMSwvIfElpNHPu
	 5B76bpOK8BaA9H+6iVwUgjqfABxU558NLEaFpGwwD0F/FCQsSM6wYUuMnwP/AC8VJDin+
	 8rv7CmvYaa42Wa871mRtPpuP+12Y1tM4DnDbsoIvTZJgyITOkfWouaDbC0/QKeRTWBrSh
	 jljIZKWCNUruD3oC51PAfumB7+8WSSybW+fVLvmEBdOSeUPieAniiyv5znGDOE2kUlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022960;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-GND-Sasl:X-GND-Cause:X-GND-State:
	 X-GND-Score;
	bh=4UrHFstxwiVEXXBOYQrbuW1T4cA35KP53oV0mHf6aCo=;
	b=FGJY20Pa662l+QPH5SwH/eD4groLjxToMR8SXGhHRrzG0M3nvi6Br+COSyaPL4NaakH0
	 NSXMVwZy0RtSjjzZCrBMUdeI5LLwXkfjuZSTEcPE8JiWZy/WxGjm18sxxJ6egy7t/hvBR
	 ePeHjFi9fw7g+n8Ebrk38lm1ZHA9EYn0iNWwKcfQmbi6ZnSQ7BRJWzXo0KwhgrnZErv7I
	 rJfxn1053ND8e0cxCjwWG8k+URH2ZpyOGcIPhWih7VuLVg3SE7o0LFBT50N59T3fzudJA
	 dfe1diqUOQpV+ypwRqNJ4+EDHVixWylrSxeBqJCeYv6+u3U9lYnV4YsnVq58M/gxClw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marmottus.net;
	spf=pass smtp.mailfrom=marmottus.net;
	dkim=pass header.d=marmottus.net header.i=@marmottus.net header.a=rsa-sha256 header.s=gm1 header.b=oorKhatV;
	arc=none smtp.remote-ip=217.70.183.197
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81253606A31A;
	Mon, 26 Oct 2026 13:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81253606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marmottus.net header.i=@marmottus.net header.a=rsa-sha256 header.s=gm1 header.b=oorKhatV
Received: by mail.gandi.net (Postfix) with ESMTPSA id BDE223ED13;
	Mon, 26 Oct 2026 13:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1793022952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4UrHFstxwiVEXXBOYQrbuW1T4cA35KP53oV0mHf6aCo=;
	b=oorKhatVZt0LngquBvhcLTMUXMSv/E7XCZrM+ycn1+ErzzujfGCxBKOYzuj2CWSG/v+1xu
	nj02fUARnvV7REOCa70MqNz/qHo2DpeyK3fMHKRfLeZVZuPcm5KPGYDQFCDnrr7id2pafG
	lz9oGrvBu2nvO+CHAhtF6LvfYSJu1j5kPKSoIHoHRa+dT7Pr//M/DXiumK7k8uMX+YVvTW
	+5ZBdHqRTjxsgyrc0HDerPA/7gYGSlsEcUtQMjAuCoKmYZH2lgJZcy2DaGzHHi/c8jS405
	6T665B1lGGNavJLPTI1nynFHpDAtvlUYWIRLXS53BRTIhodkzdh7NdDRgEiOOQ==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Date: Mon, 26 Oct 2026 14:55:39 +0100
Subject: [PATCH 1/3] leds: lp55xx: Add program and mux base pages to the
 device config
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
Message-Id: <20261026-lp55xx-v1-1-6eaaf530115c@marmottus.net>
References: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
In-Reply-To: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Arthur Crepin Leblond <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-Cause: dmFkZTF4wHLuNZNT+x8QlpvzKlCxiQ5v2Xy48uyN0XCB/1+FoIXabsjUwdsrOAnEv00sHzZcWK9jzeLdTqDar17yLdhWCO3HeWhe4TTzmwiIXmPcXT0eWYP54N5aPolxv0jmeaXrEgBZagKbus65l09WZAp7xgQR2sj4YVQErQBi/WseZ9qe4i5TORJMs5bSNSCd5UpYmMf7AZmKRDBFngUISwL3+00J0vV5a4IS+g1SCNBiiJfGxFjWMKMcy2WCzgGOltqTsGur/fZKzOuALTbwlCZh1ECtCjtZIlBB2NeQMyIkI5OX/4dkWE6rFvDqQLkifvnLWNLxG4Bd1pN6E6uKkZIyMaFQiGJNXXgub9Lt3FAz30DYJDEwpFnK+mIQw5z4lnApHrrBfb0SISVoYfGPBSykdPHKGw+5L6nbObryrYXU3CxnFsDz1jCncNB+FCTP0tKviTamPrNrfsrW4bGSK/GSzyU+WaMfF0VgKSDo+e3ITrep4+xHpim7ZOjxnAJE0GUut0Of//Ni+Gbh74QGjHl7vcGKzc6bPPA3DncwlFMHMjtb1woGRmPJ4ceVdYM2nJNdiAxHppiEgRmCAVDhQeIMsyDgaeocLJoyu+wNNeC4ZXa/cJABikBG2K0KzCHUHF6KDuW5d6uFX7YKBiWhiDnoFY802Ow12jGmps73q8CbpA
X-GND-State: clean
X-GND-Score: -100

Add program and mux base page to struct lp55xx_device_config to
set the first page of the engine programs and of the LED mapping table.

Until now the mapping tables were placed at the end of the programs.
On the LP5569 this puts them in the upper half of the SRAM, while the
map_* instructions can only address words 0-127.
This change allows placing the mapping tables before the programs instead.

All the chips set the values matching their current layout, so their
behavior is unchanged:
  - LP5523 has the 3 engine programs on the first 3 pages and their
    LED mapping tables on the next 3 pages.
  - LP5569 has the 3 engine programs of 4 pages each, followed by the
    LED mapping tables.
  - LP8501 stores its program at address 0.

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
 drivers/leds/leds-lp5523.c        |  4 ++++
 drivers/leds/leds-lp5569.c        |  4 ++++
 drivers/leds/leds-lp55xx-common.c | 14 ++++++++------
 drivers/leds/leds-lp55xx-common.h |  6 ++++++
 drivers/leds/leds-lp8501.c        |  2 ++
 5 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 39cb26d343c1..3ec9f3f31708 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -31,6 +31,8 @@
  * 0x50 engine 3 muxing info
  */
 #define LP5523_PAGES_PER_ENGINE		1
+#define LP5523_PROG_PAGE_BASE		0
+#define LP5523_MUX_PAGE_BASE		3
 #define LP5523_MAX_LEDS			9
 
 /* Registers */
@@ -335,6 +337,8 @@ static struct lp55xx_device_config lp5523_cfg = {
 		.addr = LP5523_REG_LED_CTRL_BASE,
 	},
 	.pages_per_engine   = LP5523_PAGES_PER_ENGINE,
+	.prog_page_base     = LP5523_PROG_PAGE_BASE,
+	.mux_page_base      = LP5523_MUX_PAGE_BASE,
 	.max_channel  = LP5523_MAX_LEDS,
 	.post_init_device   = lp5523_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index 199db3efca65..15beac7b34ea 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -30,6 +30,8 @@
  * 0xe0 engine 3 muxing info (1 page)
  */
 #define LP5569_PAGES_PER_ENGINE		4
+#define LP5569_PROG_PAGE_BASE		0
+#define LP5569_MUX_PAGE_BASE		12
 
 #define LP5569_REG_ENABLE		0x00
 #define   LP5569_ENABLE			BIT(6)
@@ -503,6 +505,8 @@ static struct lp55xx_device_config lp5569_cfg = {
 		.addr = LP5569_REG_LED_CTRL_BASE,
 	},
 	.pages_per_engine   = LP5569_PAGES_PER_ENGINE,
+	.prog_page_base     = LP5569_PROG_PAGE_BASE,
+	.mux_page_base      = LP5569_MUX_PAGE_BASE,
 	.max_channel  = LP5569_MAX_LEDS,
 	.post_init_device   = lp5569_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,
diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index ea131177de96..e2c55ce5d92b 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -61,8 +61,8 @@
 
 /* Memory Page Selection */
 #define LP55xx_REG_PROG_PAGE_SEL	0x4f
-/* If supported, each ENGINE have an equal amount of pages offset from page 0 */
-#define LP55xx_PAGE_OFFSET(n, pages)	(((n) - 1) * (pages))
+/* If supported, each ENGINE have an equal amount of pages offset from base */
+#define LP55xx_PAGE_OFFSET(n, pages, base)	((base) + ((n) - 1) * (pages))
 
 #define LED_ACTIVE(mux, led)		(!!((mux) & (0x0001 << (led))))
 
@@ -131,7 +131,8 @@ void lp55xx_load_engine(struct lp55xx_chip *chip)
 	/* Setup PAGE if supported (pages_per_engine not 0)*/
 	if (cfg->pages_per_engine)
 		lp55xx_write(chip, LP55xx_REG_PROG_PAGE_SEL,
-			     LP55xx_PAGE_OFFSET(idx, cfg->pages_per_engine));
+			     LP55xx_PAGE_OFFSET(idx, cfg->pages_per_engine,
+						cfg->prog_page_base));
 }
 EXPORT_SYMBOL_GPL(lp55xx_load_engine);
 
@@ -176,6 +177,8 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 	const struct lp55xx_device_config *cfg = chip->cfg;
 	u8 pattern[LP55xx_MAX_PROGRAM_LENGTH] = { };
 	u8 start_addr = cfg->prog_mem_base.addr;
+	int first_page = LP55xx_PAGE_OFFSET(idx, cfg->pages_per_engine,
+					    cfg->prog_page_base);
 	int page, i = 0, offset = 0;
 	int program_length, ret;
 
@@ -218,7 +221,7 @@ int lp55xx_update_program_memory(struct lp55xx_chip *chip,
 		/* Write to the next page each 32 bytes (if supported) */
 		if (cfg->pages_per_engine)
 			lp55xx_write(chip, LP55xx_REG_PROG_PAGE_SEL,
-				     LP55xx_PAGE_OFFSET(idx, cfg->pages_per_engine) + page);
+				     first_page + page);
 
 		for (i = 0; i < LP55xx_BYTES_PER_PAGE; i++) {
 			ret = lp55xx_write(chip, start_addr + i,
@@ -769,8 +772,7 @@ static int lp55xx_load_mux(struct lp55xx_chip *chip, u16 mux, int nr)
 
 	lp55xx_load_engine(chip);
 
-	/* Derive the MUX page offset by starting at the end of the ENGINE pages */
-	mux_page = cfg->pages_per_engine * LP55XX_ENGINE_MAX + (nr - 1);
+	mux_page = cfg->mux_page_base + (nr - 1);
 	ret = lp55xx_write(chip, LP55xx_REG_PROG_PAGE_SEL, mux_page);
 	if (ret)
 		return ret;
diff --git a/drivers/leds/leds-lp55xx-common.h b/drivers/leds/leds-lp55xx-common.h
index 8fd64ec40919..7ef657047933 100644
--- a/drivers/leds/leds-lp55xx-common.h
+++ b/drivers/leds/leds-lp55xx-common.h
@@ -125,6 +125,10 @@ struct lp55xx_reg {
  * @reg_led_ctrl_base  : Chip specific base reg address for LED ctrl base
  * @pages_per_engine   : Assigned pages for each engine
  *                       (if not set chip doesn't support pages)
+ * @prog_page_base     : First page of the engine 1 program, the programs of
+ *                       the other engines follow one after another
+ * @mux_page_base      : First page of the engine 1 LED mapping row, the rows
+ *                       of the other engines are in the next pages
  * @max_channel        : Maximum number of channels
  * @post_init_device   : Chip specific initialization code
  * @brightness_fn      : Brightness function
@@ -146,6 +150,8 @@ struct lp55xx_device_config {
 	const struct lp55xx_reg reg_master_fader_base;
 	const struct lp55xx_reg reg_led_ctrl_base;
 	const int pages_per_engine;
+	const u8 prog_page_base;
+	const u8 mux_page_base;
 	const int max_channel;
 
 	/* define if the device has specific initialization process */
diff --git a/drivers/leds/leds-lp8501.c b/drivers/leds/leds-lp8501.c
index 8009689db7b4..1c05839cd4c2 100644
--- a/drivers/leds/leds-lp8501.c
+++ b/drivers/leds/leds-lp8501.c
@@ -21,6 +21,7 @@
 #include "leds-lp55xx-common.h"
 
 #define LP8501_PAGES_PER_ENGINE		1
+#define LP8501_PROG_PAGE_BASE		0
 #define LP8501_MAX_LEDS			9
 
 /* Registers */
@@ -121,6 +122,7 @@ static struct lp55xx_device_config lp8501_cfg = {
 		.addr = LP8501_REG_LED_CURRENT_BASE,
 	},
 	.pages_per_engine   = LP8501_PAGES_PER_ENGINE,
+	.prog_page_base     = LP8501_PROG_PAGE_BASE,
 	.max_channel  = LP8501_MAX_LEDS,
 	.post_init_device   = lp8501_post_init_device,
 	.brightness_fn      = lp55xx_led_brightness,

-- 
2.56.0

