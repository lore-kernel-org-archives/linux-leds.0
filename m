Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792955017;
	b=0crOdCnni7VwHqRu/Wcjs3dwXXiqa7eJnkPdkPZEXqJkd7PtpbfTqCVm8bCCB5MLLzFm
	 f4XR9kM94ZVdqJYXWLsWTuTM+3YfuNct4pAfRsuxPGelU/+NJKmP6YmNPencpjFSkE5IF
	 NPN8hmDWfOIb9wxh7mXdRwXCcBcHV3ARyZtc5FFquanDj5bgORfFmTxSZ9WqM2zHcGVHu
	 RaBGO6nPktbQ0ypcU48HixX0Tb5TFo4jFBfMqWARDY+KvR1z2f+P+WxmGmCw6ddhzS5PB
	 yZ4VLh6FHqviYj79QTEoLze4NwFeTK7qkfa+dVkT4hnoPGARg4lThWq31Apb/o6RFhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792955017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c2nQBlsttnFwE+wFd1Y7XAl/9ctYoHY3LHuYcwEyhS4=;
	b=Bg6wB1jbRntm4cr/+o4699cO5IuG9C73xqeD4ztaS6scHRK/g7NeLKjyHU7PhIH5rYHU
	 5P0zPqm+iHAafqyc6i4lXz61vizU52ieUnOO2BlQk/aYvmWnwQHIFxmpP7LEmmHDFhS/D
	 Am5+fVZF3d13k+K5JjCR4ay4icaj3NmND+qfTvSATCc4h4++UaC8W+SkyY4t3MHeZjTP3
	 haOpP7d8RIh9Ois02HwL4XGIK+RE1712tIMYIqPdoBQDzagibQ8cDLZePGfMEV1K01S/t
	 Gl+L3X7vHIyzvp1COb0B/2tpvaXLEUMb5XwRNaieUtOetuDEl2YBu/l50aFHabFSnYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q8Tu0KLC;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA07606A31B
	for <linux-leds@vger.kernel.org>; Sun, 25 Oct 2026 19:03:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA07606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=q8Tu0KLC
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c46d41f6af3so67782966b.1
        for <linux-leds@vger.kernel.org>; Sun, 25 Oct 2026 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792955015; x=1793559815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2nQBlsttnFwE+wFd1Y7XAl/9ctYoHY3LHuYcwEyhS4=;
        b=q8Tu0KLCDLousqREOj6hP3kA8Y8qVrt/ds1YYbgmEUDRVzV3kcVwZ+XPvgdCISoYy4
         LnJ9AAQJ/DxIUfJlDm+3z8O/KGKa2YMshGLr/rLYp3p2tpnRRJZTwaS4F6FT6wjOv4ur
         M8UG7yMurkGOh1clcaMCKqqMawp61QLRPY9WDixfMR4WST8fMMM2tFXNRdNlBhoAoXJd
         RProvqoieAJg6SY8HbwKDtXDsa1+9LjZY0YRdFAn3njBZfMAHSvKuvHIBVcbDetbrf+x
         fXLDhrWx8KP5JnpCL5/XrVKfTFToEV/ZoFiNE7mmq307ZJN4AIJ6M2+J29QIcYGQGQwb
         JnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792955015; x=1793559815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2nQBlsttnFwE+wFd1Y7XAl/9ctYoHY3LHuYcwEyhS4=;
        b=abdmvxEpRTNhBN/CR7Nq4i4xceKBXrdsSk3FfFrUEvFICDMCXroY+AQc3Cjc6Rquk4
         AU0+ju7OeTO+YPZtqcl4cRKIp3V6ewyoT+89bo1dxaSNl9ldNO8yGHcuZGvxB4EiMBke
         U6GPBYRKBY4VYN4d/aPaIMKKTIcUov3UQlwpEgSDKwJYraANbz5vaJsG6c00S4VixeQE
         tvVcO0bZbdZtFmS+fDnVa7f9y05BLXKFCpesBCLe5+0VimSWVin/lJBC+9zqS7jDNZHK
         pgI4MeeMF08VpoNaY5TyS+ZuOxVGUaTPZULDXOcgoWIPbk99UE/qlp1/zUTvT77RVjKm
         pcLg==
X-Forwarded-Encrypted: i=1; AKwUvByeuM5f9vxPjh/vPrO/rwagjl4jvvZO11EmiCRgEQvmDW6yOGFyJzbb7JHlD9DwnK3kNM4OGn1AJ0UJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIz4SSEKTC6258F+wcLEv6NLw7U7C/XnmV8+lPDApPogyFEIpsW
	ZemGxcOwanodTldiIeZvb8E5ZBueA4RUTH6K9+adFioGBXI2i3v49ibQzDHTgr0DMKk=
X-Gm-Gg: AYBFou0eWRqangRCXnTPmubjWodyAMitMu9HYo69wdHRl/T00tIEfdiE0lWluWHG4Se
	B3JSU62LDVtoVK6uscYfoomU1zyh/Yc7RFJ5YgfX7Id6w71Flyk8NCXIRnB3k/rlU+qxAC+PYwP
	RnjD9eckIlGhH2x4zRbH1DhfRmLZ+4MjAD7cOsrz5pXBLUaCPWGnFpXEV5pJq4tdVaAh8dYZwd3
	a3+oocOoIvuUCnvsIyMOiOjXzqVgUENKZZ95Jom/dj+X/uPLLaHxRMugcwsnga/KIWHo/Hemtyv
	RTGLhvlwLDunK3SztS8Xdco0qUCJXYoEbTRs9Q9dbLM3i25jlZA97lc9WgbyzaofV57bH0Fk+Xl
	K/ajeOchQq60Qz55TqDefQP9HTKjsOrJY5ln6Gu9r6Cm/2mZiqtcvu6KOnOk3GPZ4vOufpRDzdt
	H8x5EVnXrlxxeN5zNSCLNn8Y1FxXJvKYcg8ZhS7NbYeN30U43GKUWw2ZqUHLXCjSBc7cESdyMl0
	bmlZaUy8aT6Ox+BCD05wSh/Ki8pSMv+a5SEkOq35maAtWAPGw8uci4IehZrLyJP1If0/X+MSDck
	F5ZcvTxMmbOt/W8sSqhhkjGYumQObfF5Mgk9tNWoEdMkGaeHwJ6syyxbDOsdptuca9NzSBJjvi5
	QJ2BTuuxnB+u2fnuSbx5U4+x21oTvIljz2Scp5gxVbVaK
X-Received: by 2002:a17:907:94ca:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c46bde7eaf0mr746614366b.35.1792955015229;
        Sun, 25 Oct 2026 12:03:35 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66fa1asm232324266b.62.2026.10.25.12.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:03:35 -0700 (PDT)
From: Selby Mashiki <mashikiselby@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Selby Mashiki <mashikiselby@gmail.com>
Subject: [PATCH] leds: lp50xx, max77705: use fwnode_for_each_child_node_scoped() to fix fwnode leaks
Date: Sun, 25 Oct 2026 21:03:31 +0200
Message-ID: <20261025190331.449462-1-mashikiselby@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In lp50xx_probe_dt(), the inner fwnode_for_each_child_node(child,
led_node) loop returns -EINVAL on two error paths (when reading "reg"
fails or multi_index is out of bounds) without calling
fwnode_handle_put(led_node), leaking the child reference.

Similarly, in max77705_add_led(), fwnode_for_each_child_node(np, child)
returns early when max77705_parse_subled() fails without calling
fwnode_handle_put(child).

Switch both loops to fwnode_for_each_child_node_scoped() and drop the
manual fwnode_handle_put() and loop cursor declarations so references
are automatically released on all exit paths.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
Fixes: aebb5fc9a0d8 ("leds: max77705: Add LEDs support")
Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
---
 drivers/leds/leds-lp50xx.c   | 4 +---
 drivers/leds/leds-max77705.c | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 20bfb315b..d542eedd4 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -458,7 +458,6 @@ static int lp50xx_probe_leds(struct fwnode_handle *child, struct lp50xx *priv,
 
 static int lp50xx_probe_dt(struct lp50xx *priv)
 {
-	struct fwnode_handle *led_node = NULL;
 	struct led_init_data init_data = {};
 	struct led_classdev *led_cdev;
 	struct mc_subled *mc_led_info;
@@ -505,12 +504,11 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		if (!mc_led_info)
 			return -ENOMEM;
 
-		fwnode_for_each_child_node(child, led_node) {
+		fwnode_for_each_child_node_scoped(child, led_node) {
 			int multi_index;
 			ret = fwnode_property_read_u32(led_node, "color",
 						       &color_id);
 			if (ret) {
-				fwnode_handle_put(led_node);
 				dev_err(priv->dev, "Cannot read color\n");
 				return ret;
 			}
diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
index 1e2054c1b..4fd803c95 100644
--- a/drivers/leds/leds-max77705.c
+++ b/drivers/leds/leds-max77705.c
@@ -160,7 +160,6 @@ static int max77705_add_led(struct device *dev, struct regmap *regmap, struct fw
 	struct max77705_led *led;
 	struct led_classdev *cdev;
 	struct mc_subled *info;
-	struct fwnode_handle *child;
 	struct led_init_data init_data = {};
 
 	led = devm_kzalloc(dev, sizeof(*led), GFP_KERNEL);
@@ -191,7 +190,7 @@ static int max77705_add_led(struct device *dev, struct regmap *regmap, struct fw
 		cdev->brightness_set_blocking = max77705_led_brightness_set_multi;
 		cdev->blink_set = max77705_rgb_blink;
 
-		fwnode_for_each_child_node(np, child) {
+		fwnode_for_each_child_node_scoped(np, child) {
 			ret = max77705_parse_subled(dev, child, &info[i]);
 			if (ret < 0)
 				return ret;
-- 
2.56.0

