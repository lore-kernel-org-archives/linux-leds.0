Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022962;
	b=4YdsKqEhig0kYP312g34KVgblevKGoekZFoH7sTD38D4yz907Lk/HGYbGB0eErs3wvB4
	 D5hjugP+7tMv1GhPGjdzN0aZ+BlTy81CDcWB1HpZYR8pnvzqDFrXW6loDGYtAyvAs1clB
	 vpuqA8mWgq/+ssuXzD+0amQklApL7I8JcFmqHEKhcXQ8KEjG9ZxPOqYBSap4GEgIGwzOQ
	 X58wngsSwneBB9ZudPy1LqnWsXHGVlAUx0Z/2NxG/7w8H3Q1db+Xni+EVjiN6OXeckY2T
	 cgpy3sCtLExJkMNwpkMkpLu5swWXZas2k9azhyvNXts1MjOJmAjXQEkVW3G0DJXP6kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022962;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-GND-Sasl:X-GND-Cause:X-GND-State:
	 X-GND-Score;
	bh=Ain478MQUudw9GUhSVXEy7ckdW9+NKwHKYxGj1eOMV8=;
	b=o51GdpE1kXehaBclbXdW3y+5bi2eRnwbkLMSAfwc3uDCAUaxKKXPrVqPWBhlVGLNnwPu
	 /a242Png6KYYDkza9iDpJzuftE/TmDwigd3+6+Q/vwBdLnCV0vmoQW4YgvWbja18r5laK
	 2sbxQVqVN0xev1LNz8rb+R4w5rtZeIeJRRrxDTrS/lpByEIUcPxsUy/6S7chAvGtOpwj/
	 dkYeP8ojkdmz26eMxnzIa5893C/l6BTJ9OemlJZSIqfSW+hMMsY7GZ/FXg63bx7YgrWLU
	 6tnApyr15KmT07izOaDhWuv4bFPpv3QePIo19tGIwIZNDwa+tJliIUnf1p/ultFZEXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marmottus.net;
	spf=pass smtp.mailfrom=marmottus.net;
	dkim=pass header.d=marmottus.net header.i=@marmottus.net header.a=rsa-sha256 header.s=gm1 header.b=gizMqybg;
	arc=none smtp.remote-ip=217.70.183.197
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CE9606A31B;
	Mon, 26 Oct 2026 13:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5CE9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marmottus.net header.i=@marmottus.net header.a=rsa-sha256 header.s=gm1 header.b=gizMqybg
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6890A3ED04;
	Mon, 26 Oct 2026 13:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1793022953;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ain478MQUudw9GUhSVXEy7ckdW9+NKwHKYxGj1eOMV8=;
	b=gizMqybgVP3jJHkk7ecW+K9tkgEo3VXff6B2YdKrwYp010glJvN7gqbQ3dX/XIPwy45DPx
	QRkvAUuAbitMPZsdQ4IyAQTObuL6phhQD5WGTvRaKY9cKkSLHPUXljKtbJDgV1NZ88MMrX
	mulXrPywYUXG0Apz6XgHzltlYb7CY5k37U38rVaduR2g86MlQ49Vx+hDoSu8Fxw4NWk9sW
	BABLENG3C8AOPfJ3SJHjqelSmg55kPwd6q0UByCFj7XTnCrvT8EK612oP9IgZghD+74XFN
	JfGB5xQwVbB9053h6gmfZ3AXV7RNO0tr6SXyEyihIJ+7d/NrRvyWi2FMLpeWBg==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Date: Mon, 26 Oct 2026 14:55:40 +0100
Subject: [PATCH 2/3] leds: leds-lp5569: Place the LED mapping table in the
 lower half of the SRAM
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
Message-Id: <20261026-lp55xx-v1-2-6eaaf530115c@marmottus.net>
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
X-GND-Cause: dmFkZTF4wHLuNZNT+x8QlpvzKlCxiQ5v2Xy48uyN0XCB/1+FoIXabsjUwdsrOAnEv00sHzZcWK9jzeLdTqDar17yLdhWCO3HeWhe4TTzmwiIXmPcXT0eWYP54N5aPolxv0jmeaXrEgBZagKbus65l09WZAp7xgQR2sj4YVQErQBi/WseZ9qe4i5TORJMs5bSNSCd5UpYmMf7AZmKRDBFngUISwL3+00J0vV5a4IS+g1SCNBiiJfGxFjWMKMcy2WCzgGOltqTsGur/fZKzOuALTbwlCZh1ECtCjtZIlBB2NeQMyIkI5OX/4dkWE6rFvDqQLkifvnLWNLxG4Bd1pN6E6uKkZIybhZVuLK+Key4Bzh/QZD2Rhd8ZGKGgV4aRRvzALDIurs/kz1QrVKbwAtVluxfa63v01H69qRihJj4Ta5ABYISQ53UbSrZFGVx1K1eEq9+7JpxY2hP0/h/8Bhx7T3y5nOF2K4NU4G+5loSm7DC/GwtIq3XfJ8+c1yqr43rOLPWX+f4xGs9r+44njUyb7H/WWx5kK75NjfRSZLnNZN17tLQdFZERCfmJjC4e/BbxZ8ERrTnDTI4SKAoer9K5jHZgxLJjF8lXAX3YKufGaZod0C02sLLiKyhfxO85zYJDQamTS2+7mSLZepSsVU+gOHUOKbEddR85XwQoaS0j5/pFTRgpQ
X-GND-State: clean
X-GND-Score: -100

The LED mapping instructions (map_start, load_end, map_addr, ...) take
a 7-bits absolute SRAM address, so the mapping table must be in the
lower half of the SRAM (0-127).
The driver placed the muxing info after the engine programs, which
these instructions cannot reach.

Place the mapping tables in pages 0-2 and the engine programs after
them.

This changes the SRAM layout seen by userspace:

  - The program of engines 1/2/3 now starts at address 0x30/0x70/0xb0
    instead of 0x00/0x40/0x80 (ENGINEx_PROG_START).
  - The mapping of engines 1/2/3 is at address 0x00/0x10/0x20.

Programs loaded through engineN_load or the firmware interface are not
affected, since they are written relative to the start of the engine.
Programs that use absolute SRAM addresses (map_start, load_end,
load_addr, map_addr) must be updated to the new layout.

Fixes: 30c6743cc89c ("leds: leds-lp5569: Add support for Texas Instruments LP5569")
Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
 drivers/leds/leds-lp5569.c | 53 +++++++++++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/drivers/leds/leds-lp5569.c b/drivers/leds/leds-lp5569.c
index 15beac7b34ea..a4d9787c4158 100644
--- a/drivers/leds/leds-lp5569.c
+++ b/drivers/leds/leds-lp5569.c
@@ -21,17 +21,21 @@
 
 #define LP5569_MAX_LEDS			9
 
-/* Memory is used like this:
- * 0x00 engine 1 program (4 pages)
- * 0x40 engine 2 program (4 pages)
- * 0x80 engine 3 program (4 pages)
- * 0xc0 engine 1 muxing info (1 page)
- * 0xd0 engine 2 muxing info (1 page)
- * 0xe0 engine 3 muxing info (1 page)
+/*
+ * Memory is used like this (a page is 16 instructions).
+ * The LED mapping rows must be in the lower half of the SRAM (0x00-0x7f) to be
+ * reachable by the map_* instructions, so they are placed before the engine
+ * programs:
+ * 0x00 engine 1 muxing info (1 page)
+ * 0x10 engine 2 muxing info (1 page)
+ * 0x20 engine 3 muxing info (1 page)
+ * 0x30 engine 1 program (4 pages)
+ * 0x70 engine 2 program (4 pages)
+ * 0xb0 engine 3 program (4 pages)
  */
 #define LP5569_PAGES_PER_ENGINE		4
-#define LP5569_PROG_PAGE_BASE		0
-#define LP5569_MUX_PAGE_BASE		12
+#define LP5569_MUX_PAGE_BASE		0
+#define LP5569_PROG_PAGE_BASE		3
 
 #define LP5569_REG_ENABLE		0x00
 #define   LP5569_ENABLE			BIT(6)
@@ -88,12 +92,12 @@
 #define   LP5569_LED_FAULT1		BIT(1)
 #define   LP5569_LED_FAULT0		BIT(0)
 
-#define LP5569_ENG1_PROG_ADDR		0x0
-#define LP5569_ENG2_PROG_ADDR		0x40
-#define LP5569_ENG3_PROG_ADDR		0x80
-#define LP5569_ENG1_MUX_ADDR		0xc0
-#define LP5569_ENG2_MUX_ADDR		0xd0
-#define LP5569_ENG3_MUX_ADDR		0xe0
+#define LP5569_ENG1_MUX_ADDR		0x00
+#define LP5569_ENG2_MUX_ADDR		0x10
+#define LP5569_ENG3_MUX_ADDR		0x20
+#define LP5569_ENG1_PROG_ADDR		0x30
+#define LP5569_ENG2_PROG_ADDR		0x70
+#define LP5569_ENG3_PROG_ADDR		0xb0
 
 #define LP5569_STARTUP_SLEEP		500
 
@@ -119,11 +123,22 @@ static int lp5569_init_program_engine(struct lp55xx_chip *chip)
 	int j;
 	int ret;
 	u8 status;
-	/* Precompiled pattern per ENGINE setting LED MUX start and stop addresses */
+	/*
+	 * Precompiled program run by each ENGINE, setting the start and end of
+	 * the LED mapping table to the row of the engine (bit 7 of the operand
+	 * selects load_end instead of map_start):
+	 *   map_start MUX_ADDR
+	 *   load_end  MUX_ADDR
+	 *   map_next
+	 *   end
+	 */
 	static const u8 pattern[][LP55xx_BYTES_PER_PAGE] =  {
-		{ 0x9c, LP5569_ENG1_MUX_ADDR, 0x9c, 0xb0, 0x9d, 0x80, 0xd8, 0x00, 0},
-		{ 0x9c, LP5569_ENG2_MUX_ADDR, 0x9c, 0xc0, 0x9d, 0x80, 0xd8, 0x00, 0},
-		{ 0x9c, LP5569_ENG3_MUX_ADDR, 0x9c, 0xd0, 0x9d, 0x80, 0xd8, 0x00, 0},
+		{ 0x9c, LP5569_ENG1_MUX_ADDR, 0x9c, 0x80 | LP5569_ENG1_MUX_ADDR,
+		  0x9d, 0x80, 0xd8, 0x00, 0},
+		{ 0x9c, LP5569_ENG2_MUX_ADDR, 0x9c, 0x80 | LP5569_ENG2_MUX_ADDR,
+		  0x9d, 0x80, 0xd8, 0x00, 0},
+		{ 0x9c, LP5569_ENG3_MUX_ADDR, 0x9c, 0x80 | LP5569_ENG3_MUX_ADDR,
+		  0x9d, 0x80, 0xd8, 0x00, 0},
 	};
 
 	/* Setup each ENGINE program start address */

-- 
2.56.0

