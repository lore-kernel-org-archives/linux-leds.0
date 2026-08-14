Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27623E558A
	for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786749094; cv=none; b=a5Rsmwsxi7Iu+XuYZY9c4vxc2nAQdqtiz26yvHaGcKIQzJFNglI7btjRwY7CbgW9c7IhPO6K2MkM5U5xyW6DFwp9p0tE+Wmp0j9+7b3PIADACcnTgr1CLUymNi5yZ2HvZfWZT26qKftPDt36ks58KQMSGIwM2cZuWWWSYUB5GdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786749094; c=relaxed/simple;
	bh=4KC/H4o52CopchtrhVy8iaV3lRYZ5/qmXJGbc4O4nok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggZv3QOHk53gc34GD7IxhMCcnMivgyrArpz95Z4WWDXeUsahoGiQqy/kh8sK/Bu/ntCFBHUNNA6DwGJz7nIBHdsQFrpCW1YLaeerUDRtz7v7tjUGmbe1kARS4sLF9vVYMPQGzDmTDGJjje2paBxXew7RxAy9AAgRiM1l+vgddR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZYCXXk2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZYCXXk2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1551825a91.1
        for <linux-leds@vger.kernel.org>; Fri, 14 Aug 2026 16:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786749091; x=1787353891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qr19CEkBHhB/7joCmqGqeg7ZqlAJoQBl4UCNBJQTQMo=;
        b=ZZYCXXk2cjblWEewHKIf0MSZdhxOwI3Rx6DmiFchvJTcy6ViAlbK9BQD4Zp4N1t6kn
         J9w8gOMmg96+T1wZfC1Uh2NFJSafaqkizr+JlXPceP2NDr6FM98869FSrP8VlP3WJFFy
         WcSqyNQFh1YdFf0XKJfBiptGUhNiN5NRMaob5HKbvJ3N1lJRIH1Nhl+gaGSwfFoqfFfS
         YyxL8MOscr6ZV6XHU/fwQkFkQgjohcvWCo60rtW3QQ1f9UD7fHUnq7KsFMfkigEcb/7/
         1mD+BCFJt//H4z9XMAP7wYXc5Rpza/H9S9sdd7e0vkqyc76ANWttncddBWJij36IUZkG
         AOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786749091; x=1787353891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qr19CEkBHhB/7joCmqGqeg7ZqlAJoQBl4UCNBJQTQMo=;
        b=ZyJ2YFXJwvHcZp6KbY1IYk2I2935cxxPCfk0zur7CBtfeWrnXCVYSv+J40AGWOYa2U
         kkNoBcco9WFzPDBTVeNLKhvWS9SmRt0paK8NrLK/gX76p0ZHJZ33u+ToASAjyHP10fkZ
         2E3pNDYEj3CaFRt+fMIJOmx6VW0JJvZUoNkhOLycw49fkXnTyTGLPQCYr2a5XwtrAN8u
         Sa+RMJ9bJ/eXQT8/WoI4uUtZn7Q2FGJI3KZgse+LbY5hiGsRKjY6zUPE5Cth2F13UcJD
         uN47JK31j58VQCs9+e/hgGVupCSvPsYSeLTdqB5iLDRLTR41sXiQdryUo5RAwCRwb+5x
         h/Cw==
X-Forwarded-Encrypted: i=1; AHgh+RpzsXMMv63Sy/6fdZ/bT0HUPIqPwb+pG/svvraEy+fk7j88EJTSemujOSkuHY637wQfmYrs+ms7VhRT@vger.kernel.org
X-Gm-Message-State: AOJu0YzMl3KAyILA0o8VwUTvFT3kimwi/skkDC/LK8LRRv5tfaHcIG/J
	9tivEkWjgDN+Y1gDAMpy2z//5NGTFvWI4Tn1gDEKXL62Y9Y58cLFK0iu
X-Gm-Gg: AR+sD12u0Gkw5+pfRCOo8IOKJCtd4aSTOSQ2KtLhRTwq2QEX6jif/B6B3HxIU0yNGnj
	jUlDBqI0HD6247UM2il8Ii8C9MwXnCpjB7V82cCKp2OZpo7XOYde5u0avb/1L2D3PKLRnc+RU4V
	BMeL5UrmE5wPnhB2xUJ/+oZs/ZVFKR0dx1Du9yoAIVOImmB+RlzM43Owtu7OC6WgFUpgt7PdYya
	eUkywi7qF1rxW3XlK2wf6ZkDfHyiNIVfdEciDMRwozRsOmC8KRowBmtBNN8WB+PcPHZCouh9bVr
	z0j7CdISzh9eXg7EGBDS5ZBpVYz5ouiwiFtqXtdv+DdTLIVEBXCnctfKC5A8ojz6gtLJbdbrw6M
	W4Rws5dBhgv16BTbPugLTcA2EBiD/unAvlv7UigktAlhsAdEtkg+nbO3waSQj3kGQAiOd0OoC0/
	e37z59l9dHqaACxWQc1inn4yC/PcSm9iS8kH7aZjqLCCIPBsEhIX+6KQ174FVPCmoLDr7/xHH3E
	sHU9w==
X-Received: by 2002:a17:90b:2d07:b0:381:3b5d:30f4 with SMTP id 98e67ed59e1d1-3933bd18856mr10717536a91.1.1786749091160;
        Fri, 14 Aug 2026 16:11:31 -0700 (PDT)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d61e1568sm8563607eec.11.2026.08.14.16.11.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 16:11:30 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>,
	Nam Tran <trannamatk@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH net-next v5 6/7] ptp: ocp: Add R4006 I2C peripheral topology
Date: Fri, 14 Aug 2026 16:10:54 -0700
Message-ID: <c6f7d14b58411e4513d5b89472459369edc8de4f.1786747084.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1786746757.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R4006 boards place sensors and an IS32FL3207 LED controller behind
a four-channel PCA9546 mux.

Describe the LM75B, SHT3x, and ICP10100 sensors and the five RGB LED
groups. The BNO08x at address 0x4a is omitted because it has no upstream
driver; the LM75B using the same address is on a different mux channel.

Read the board ID independently of the serial EEPROM and select this
profile from the R4006 prefix. Production IDs may append a board revision,
while unknown board IDs remain untouched.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 97 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 444b26a5e2a9..5ae50ad83bda 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -578,6 +578,71 @@ static struct ptp_ocp_eeprom_map art_eeprom_map[] = {
 	{ }
 };
 
+/*
+ * The BNO08x at 0x4a on channel 3 has no upstream Linux driver, so omit it.
+ * The LM75B at the same address is a separate device on mux channel 0.
+ */
+static const struct ptp_ocp_i2c_device ptp_ocp_r4006_sensors[] = {
+	{ "temperature@48", "national,lm75b", "lm75b", 0, 0x48 },
+	{ "temperature@49", "national,lm75b", "lm75b", 0, 0x49 },
+	{ "temperature@4a", "national,lm75b", "lm75b", 0, 0x4a },
+	{ "humidity@44", NULL, "sht3x", 1, 0x44 },
+	{ "pressure@63", "invensense,icp10100", "icp10100", 2, 0x63 },
+};
+
+static const struct ptp_ocp_led ptp_ocp_r4006_leds[] = {
+	{
+		.node_name = "multi-led@c",
+		.function = LED_FUNCTION_STATUS,
+		.channel = { 13, 12, 14 },
+	},
+	{
+		.node_name = "multi-led@6",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 1,
+		.has_function_enumerator = true,
+		.channel = { 7, 6, 8 },
+	},
+	{
+		.node_name = "multi-led@9",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 2,
+		.has_function_enumerator = true,
+		.channel = { 10, 9, 11 },
+	},
+	{
+		.node_name = "multi-led@0",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 3,
+		.has_function_enumerator = true,
+		.channel = { 1, 0, 2 },
+	},
+	{
+		.node_name = "multi-led@3",
+		.function = LED_FUNCTION_INDICATOR,
+		.function_enumerator = 4,
+		.has_function_enumerator = true,
+		.channel = { 4, 3, 5 },
+	},
+};
+
+static_assert(ARRAY_SIZE(ptp_ocp_r4006_sensors) <=
+	      OCP_I2C_MAX_SENSOR_COUNT);
+static_assert(ARRAY_SIZE(ptp_ocp_r4006_leds) <= OCP_I2C_MAX_LED_COUNT);
+
+static const struct ptp_ocp_i2c_profile ptp_ocp_r4006_profile = {
+	.name = "r4006",
+	.sensors = ptp_ocp_r4006_sensors,
+	.sensor_count = ARRAY_SIZE(ptp_ocp_r4006_sensors),
+	.leds = ptp_ocp_r4006_leds,
+	.led_count = ARRAY_SIZE(ptp_ocp_r4006_leds),
+	.led_node_name = "led-controller@34",
+	.led_mux_channel = 1,
+	.led_address = 0x34,
+	.led_riset_ohms = 4700,
+	.led_max_microamp = 8150,
+};
+
 #define bp_assign_entry(bp, res, val) ({				\
 	uintptr_t addr = (uintptr_t)(bp) + (res)->bp_offset;		\
 	*(typeof(val) *)addr = val;					\
@@ -2178,6 +2243,20 @@ ptp_ocp_i2c_supported(struct ptp_ocp *bp)
 		bp->pdev->device == PCI_DEVICE_ID_CELESTICA_TIMECARD);
 }
 
+static const struct ptp_ocp_i2c_profile *
+ptp_ocp_i2c_select_profile(struct ptp_ocp *bp)
+{
+	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
+	if (!smp_load_acquire(&bp->has_board_id))
+		return NULL;
+
+	/* Production R4006 board IDs may carry a revision suffix. */
+	if (!memcmp(bp->board_id, "R4006", 5))
+		return &ptp_ocp_r4006_profile;
+
+	return NULL;
+}
+
 static int
 ptp_ocp_i2c_init_nodes(struct ptp_ocp *bp)
 {
@@ -2496,13 +2575,29 @@ ptp_ocp_i2c_populate_topology(struct ptp_ocp *bp,
 
 	if (!READ_ONCE(bp->i2c_root_present))
 		return 0;
-	if (!ptp_ocp_i2c_supported(bp) || !bp->i2c_profile)
+	if (!ptp_ocp_i2c_supported(bp) || !bp->eeprom_map)
 		return 0;
 
 	adapter = ptp_ocp_i2c_root_adapter(i2c_ctrl);
 	if (!adapter)
 		return -EAGAIN;
 
+	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
+	if (!smp_load_acquire(&bp->has_board_id)) {
+		ret = ptp_ocp_read_eeprom(bp, OCP_EEPROM_BOARD_ID);
+		if (ret)
+			goto out_put_adapter;
+	}
+	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
+	if (!smp_load_acquire(&bp->has_board_id)) {
+		ret = -EAGAIN;
+		goto out_put_adapter;
+	}
+	if (!bp->i2c_profile)
+		bp->i2c_profile = ptp_ocp_i2c_select_profile(bp);
+	if (!bp->i2c_profile)
+		goto out_put_adapter;
+
 	ret = ptp_ocp_i2c_init_nodes(bp);
 	if (ret)
 		goto out_put_adapter;
-- 
2.50.1 (Apple Git-155)

