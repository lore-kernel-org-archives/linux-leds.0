Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795133260;
	b=aucsPe+p97vdwCbzHoflmcxTs47bT7rf57vnB1kacWJPoepIkwQhG9DyvwuGO1lEyigm
	 sapADs7Q4zMSM+vfAird/HW/3x2y92yQc5Hl9HAadBfgIkI5Llwp6KCnhKI2pUotkhvLM
	 3ceAlWs0Y6hpkjUsLxP/2PEG+jklNKiXn3HbVW0aMI/mub5Wk3G5n3ds/W8jqjIFz8Hhe
	 mHAYKPaGZPcqizwmJGcZTeKv0qSh7HN7ehmEDeq/LamCWpijSbuC/9zb5MWfX7dtLx+J0
	 FCPTVkXbUtIHPDZ8Tnk6JU4jRRAO6Jww+zByb6duRXSnIVqER2OlZvh9wF8cpYEQXQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133260;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9ukZaqEWTVIJ0b1S/fQBx1kJyBM+iiIVJfCmEtRGX/M=;
	b=SVi4Vls7BlZQdBHc8BLOiPxItkJN99a+dzlq712mym5NDBL1iDdn6GwqtU+cotniq9iG
	 e0W+rRyH7KmodCsLv7Hc6UcfAkYullXebZ+pba4ChgKBqaonlA5sjkalCJYJH9KFqL4ts
	 5tuACRvJcu1P4KM1qe88mUR++LwqANr7RFCjk6sW06vLLBGuMFC+8oBM6GYc5syM9/IbD
	 c7Ovzmz84VVDzwW8N/9KxsqPX0XQOu1n/Sdw7cQyVG03aA7fkCxLiLy7SEtu2onmiuoD4
	 WeesBhX5INHz7jEqYZqQUYC2hHxsf8+Ft7PLqCzxNsRiTto8jhCX5GCFRu3j1a1dUWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQ+YMb+r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68048606A337;
	Fri, 20 Nov 2026 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jQ+YMb+r
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795133260;
	b=wvliRA0+TmfWT6JilxxZUm8emuAVRInDJlQHEi6G1yhnY+xUzguX1ZZCkPck8AjomdZD
	 699O/S90Zx5LxraBN2Ub0+U7or4hxi8PDO983ghPkFxzHH7eLTbUJswKALCcqEbi9Eq7r
	 B+4NM5CDo6RCaJObVC5FTSVf/HD/wK1NGwS4FYir1hkrqW386PRIkit/9ZDjzX2pmtU9C
	 Bea0mwEvwCKOwrOs9BPDCICTO0r7c4pgxl5UrChAsRYcRhxKp3ayqgLOPTUa9+5rNpRNq
	 YfotmyBpZxQNS9E0/xFqdoa09b3wsiC2mSi8kmTTAsV14fcD7X3EhOB3CKkiMXM/pvA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795133260;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9ukZaqEWTVIJ0b1S/fQBx1kJyBM+iiIVJfCmEtRGX/M=;
	b=FqqDATiPKnYh+wFZKGBAK+ZVkGW8AKmWPAD7hkkaMQvQShd/B3yRx29wIpb8PBk8GqKV
	 ZILj8S+wMGdWWiXxzrchoN+gWJbjDgX+Uw6G6i0SaXdo2g2APZS675yEnbnZWqltaJ5GH
	 FeUnG9Da8MGiBBOoRyiJGSiP93N7vF33t4YOXvdGQ77v/o08Le9sJFmMAdFXd+5KAibjm
	 SCTM4Mdwew5YR+gMr+Mo1ZyHWVMYSOvLAD4FE8wB5IN8IUCjUYtCF/xkAmXj5ZGFnUOSg
	 xg8oaD5Jd3ou+dVHWuW1Ww22CDJhPPiBMX6Lv3xt7fafqqzgG55kUTyS8M9zk/NzGww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB7EA1F000E1;
	Fri, 20 Nov 2026 00:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795133260;
	bh=9ukZaqEWTVIJ0b1S/fQBx1kJyBM+iiIVJfCmEtRGX/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jQ+YMb+rqfa/6GEptImEBQVfjWNG+Zo3Whm3kGPgp1I0L4rWxupqfLovJR6GCcJtk
	 EPxVFB4zzjuIwCysn58T7uwEIn914kFEvEIjxpaoeZAlBC1G2whbIk2bktujMBhewL
	 rjtz9JpgM9UZ2awzYFi367a2OsfEOnrWFq87zGRgliJzIXHMOgVp12tVTFQUCLhcfU
	 +FnJk9CP2x8Rg41wr0Vxq6F2XBh9C58K4JjApTnAa7pnpsHsFSCL+oQ8Pnf5eFBtz/
	 f7Rc7pcYcPGWwFkevAMblIpirnWOCwvIgixUjJqJK8gNQck8ZN9c18PSQcmr4pSrVJ
	 2BlzRQ9CeXM5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4B90042503;
	Fri, 20 Nov 2026 00:07:36 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Thu, 19 Nov 2026 19:07:31 -0500
Subject: [PATCH v3 09/11] leds: rgb: ktd202x: Limit the LED current to
 led-max-microamp
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
Message-Id: <20261119-ktd202x-et6326-v3-9-98b836b1cddc@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795133254; l=3266;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=/+/x6pQgWlnn08kTUbnKzktid+/Nbrtkr2nYJeoZkoM=;
 b=kJ37CTWLmFo1+PHgl61W8qaBoNRAO4tyQ/vcWD8l5yXDv1ilQjNfbFYzZatyZVGI3VB+zingM
 fGAzrdkEyRqANoxuhrbVxi7uqecix4C0yy8JcFcJUS3Ba4x6DTBpEPO
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The full brightness of 192 is 24 mA, which is more than many indicator
LEDs are made for, and a channel may drive several LEDs in parallel. The
GL.iNet GL-SFT1200 firmware, for example, runs each of its two channels,
three LEDs each, at 1.375 mA.

Honor the common led-max-microamp property for single color LEDs by
lowering max_brightness, since each brightness step adds 0.125 mA. Set
max_brightness before the LED is registered, and blink at max_brightness
rather than at the chip maximum.

Multicolor LEDs are left as they are: the LED core already bounds each
color intensity, and the hardware this was tested on has none.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/leds/rgb/leds-ktd202x.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index ba370c429b04..a95910817e76 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -83,6 +83,7 @@
 #define KTD202X_PATTERN_MAX_MS 16384
 
 #define KTD202X_MAX_BRIGHTNESS 192
+#define KTD202X_LED_CURRENT_STEP_uA 125
 
 static const struct reg_default ktd202x_reg_defaults[] = {
 	{ KTD202X_REG_RESET_CONTROL, KTD202X_TIMER_SLOT_CONTROL_TSLOT1 |
@@ -411,7 +412,7 @@ static int ktd202x_blink_single_set(struct led_classdev *cdev,
 	int ret;
 
 	if (!cdev->brightness) {
-		ret = ktd202x_brightness_single_set(cdev, KTD202X_MAX_BRIGHTNESS);
+		ret = ktd202x_brightness_single_set(cdev, cdev->max_brightness);
 		if (ret)
 			return ret;
 	}
@@ -604,6 +605,18 @@ static int ktd202x_pattern_mc_clear(struct led_classdev *cdev)
 	return ktd202x_brightness_mc_set(cdev, LED_OFF);
 }
 
+/* The current limit of a LED in brightness steps, each of which adds 0.125 mA */
+static unsigned int ktd202x_max_brightness(struct fwnode_handle *fwnode)
+{
+	u32 max_microamp;
+
+	if (fwnode_property_read_u32(fwnode, "led-max-microamp", &max_microamp))
+		return KTD202X_MAX_BRIGHTNESS;
+
+	return clamp_t(u32, max_microamp / KTD202X_LED_CURRENT_STEP_uA, 1,
+		       KTD202X_MAX_BRIGHTNESS);
+}
+
 static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwnode,
 				 struct ktd202x_led *led, struct led_init_data *init_data)
 {
@@ -653,6 +666,7 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwn
 	led->mcdev.num_colors = num_channels;
 
 	cdev = &led->mcdev.led_cdev;
+	cdev->max_brightness = KTD202X_MAX_BRIGHTNESS;
 	cdev->brightness_set_blocking = ktd202x_brightness_mc_set;
 	cdev->blink_set = ktd202x_blink_mc_set;
 	cdev->pattern_set = ktd202x_pattern_mc_set;
@@ -676,6 +690,8 @@ static int ktd202x_setup_led_single(struct ktd202x *chip, struct fwnode_handle *
 	led->index = reg;
 
 	cdev = &led->cdev;
+	cdev->max_brightness = ktd202x_max_brightness(fwnode);
+
 	cdev->brightness_set_blocking = ktd202x_brightness_single_set;
 	cdev->blink_set = ktd202x_blink_single_set;
 	cdev->pattern_set = ktd202x_pattern_single_set;
@@ -715,8 +731,6 @@ static int ktd202x_add_led(struct ktd202x *chip, struct fwnode_handle *fwnode, u
 		return ret;
 	}
 
-	cdev->max_brightness = KTD202X_MAX_BRIGHTNESS;
-
 	return 0;
 }
 

-- 
Git-155)


