Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793585585;
	b=URcY2/VJFJIBSTWBXao7Wv0dKMZ21Jlc2aM8Ll3CRlTxH4I1J/ia9/kignI9kFkfWtJE
	 Qk2tpTUt6K/46scehQ/A3QG1KTZOEt6KFu7iGrM7N50MZIS4+FUwX4BjLonKpH9Xlgs58
	 7p2thfX+9JtGL31p9n/AJAv8ynjh4vCZEILDCnEZ40XjI299OVOSPzCDcCAnFgpsWsfQ1
	 rLeF2xIZLNV5gYIUL66MpZU4Zk0YDOpj23YjnIAH9OrA3NfaF0XvMiysYrM0wnPPC+UW8
	 003xTB8Nzvl/tIv8/Sc3t/SFlb4hHzXeZjAlgprRGJY0W10QRIMpHpjz5RRUF5NG2Dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585585;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jElxAp0dA4eNZGZcWkB1ulI8aR6d8P3Xv4bNYfxLcoc=;
	b=GwHeF10mVPeRLcp8rIuaKZ4ggssnL4SCEJtueC9B5f4UO/kwvlz/jl3fIlISwb3KZBlg
	 zRgMwav8uAKO6gZNRepMyZ7EtcLfffOVm1guBZxeQo8vwIfsrkriHQT0JdVXO/4rPs+09
	 hbsFCR6MChajAexTCh1+uMGokl2tzNMf3l3DqrYWSrt8jbBMlHlPezHQIGJ+zYKw7bRbv
	 PjhIcxrwtwI/m8Myf0itNLdo7pdNmBtLNW7A9/U5deJqxlWuux7HOeLZjUX9Lq8VVz49E
	 4Z9bMJ+tm5BQQQ5gK6VfedAEKUcA3T55JaJFLRzdmyWBmXb6W//QisioqX3febk2Gtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BnCVdW92;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919C9606A32D;
	Mon,  2 Nov 2026 02:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BnCVdW92
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793585585;
	b=wzdMxMCa+mr/9GV4qVycYN/oIMBgd+qWSz3XitrYslb+/likLciEz9gCEH9Y/+FNDwwH
	 vuDfhLwEwbVQtLM8DLFHo0nnUlXliuJh6IVNupC/UNmrma11YUBjtiq00LM1kUVIvhcmY
	 sJ9+x29yVHQnPJyIZweI6OdvZF2hvrkJmusHNTkIZW7/MAPzTSW+AIs52ZOc6SmbxlVnj
	 W8UoYrE85dYb3Rf78kk8zIrswuo2V25dBsA4i1os1PCcDhUzdZwray9W4/lBCefA4EYCf
	 2dJtAByjLyaQke2KO7RoknOW1aS7lPsJsF2LE/6Lp+JPsyHtcXf9Cx+0XbjPdADW2MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793585585;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jElxAp0dA4eNZGZcWkB1ulI8aR6d8P3Xv4bNYfxLcoc=;
	b=GFV5uOOxW81vOdJHuw7JN7uLbBi2Bi4QuakCxOtr0wIVSggytexA8QEMXyVj+2GFJh9g
	 GmRu8DinDUv7IgTNXv1mzcUJI2Wd7CI01qdznzsJ5rqixzLGRFkDKDNqJktRpJufk2RFx
	 AnGu68aqi5MCsyDiOMQyKO2PKHcxd9cTN9iR7vc9wZ9niHJS651isOHQ19oVGPAYRkNW2
	 r+O8z+NBZ0B3j2pzZxjD8T+eGarTAvEYItj77tYA5ap/vhV8vqtZNYVP5ENz1CLCGkzme
	 ZGln3SlOcJuwByDDOgMX/88oFlOaiooNA4P8VZbrp1KK5RKSbvLRB4GsIta4jYCh+EQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52AE21F00A15;
	Mon,  2 Nov 2026 02:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585585;
	bh=jElxAp0dA4eNZGZcWkB1ulI8aR6d8P3Xv4bNYfxLcoc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BnCVdW92QXm00ldXfo+qOJAfrSlLHBtufuYf0m52DzdgpBvbe6uIVuJjvnJ9Pxf3i
	 THeujWQkohHRR6FnUzMKwDHIR5T7W9IV3J2tEkCJJEcAKosJzE8waTqqAT3xB+O+Pu
	 PrNTjNouOAOSaPiKZTS5ytbJw1+6jUmbbHI3Ti5uYH/hPJ2yS6dYVPcvBewTISucHj
	 XhaSVQBIl/+oS2tx+WkfkLxuBVEDhJGIodrPGEUN3DruE6rziqJyRlbzS7A7FzBZOU
	 ntiP6gaUy+w6y/g/yZTtsPnrkQ+NKDoymFwrh1XpqKxTv6ppoiPw7U78sIr6nxKKkM
	 JjJIvqTf1Jceg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3385A4632A;
	Mon,  2 Nov 2026 02:13:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 01 Nov 2026 21:12:32 -0500
Subject: [PATCH 08/10] leds: rgb: ktd202x: Limit the LED current to
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
Message-Id: <20261101-ktd202x-et6326-v1-8-eb51eddad08c@telaak.dev>
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
In-Reply-To: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793585580; l=3297;
 i=joseph@telaak.dev; s=20261102; h=from:subject:message-id;
 bh=bJVCBymLVZomp3//HashN1Tl2FKEJXGEWkQVbD7FcHw=;
 b=Ug8b6aLw0kyjUK7y0zyWl1VcaJ12U6+WG3NrndldaoVN86LAdHH/6/ZN16W7uRe1kZrdHyIVX
 Q+XKBv/fTmMCsjvPlrcWKMEhhXLAxES1O1OD2E1e41JJj5TndnFthKp
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=OmwSusdK4grZpiuZVfCZAvYyqz9FBkNemsV1EnHyVr4=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261102 with
 auth_id=1382
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

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/leds/rgb/leds-ktd202x.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index ed0e8e74c..48521f1e5 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -78,6 +78,7 @@
 #define KTD202X_PATTERN_MAX_MS 16384
 
 #define KTD202X_MAX_BRIGHTNESS 192
+#define KTD202X_LED_CURRENT_STEP_uA 125
 
 static const struct reg_default ktd202x_reg_defaults[] = {
 	{ KTD202X_REG_RESET_CONTROL, KTD202X_TIMER_SLOT_CONTROL_TSLOT1 |
@@ -398,7 +399,7 @@ static int ktd202x_blink_single_set(struct led_classdev *cdev,
 	int ret;
 
 	if (!cdev->brightness) {
-		ret = ktd202x_brightness_single_set(cdev, KTD202X_MAX_BRIGHTNESS);
+		ret = ktd202x_brightness_single_set(cdev, cdev->max_brightness);
 		if (ret)
 			return ret;
 	}
@@ -588,6 +589,18 @@ static int ktd202x_pattern_mc_clear(struct led_classdev *cdev)
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
@@ -637,6 +650,7 @@ static int ktd202x_setup_led_rgb(struct ktd202x *chip, struct fwnode_handle *fwn
 	led->mcdev.num_colors = num_channels;
 
 	cdev = &led->mcdev.led_cdev;
+	cdev->max_brightness = KTD202X_MAX_BRIGHTNESS;
 	cdev->brightness_set_blocking = ktd202x_brightness_mc_set;
 	cdev->blink_set = ktd202x_blink_mc_set;
 	cdev->pattern_set = ktd202x_pattern_mc_set;
@@ -660,6 +674,8 @@ static int ktd202x_setup_led_single(struct ktd202x *chip, struct fwnode_handle *
 	led->index = reg;
 
 	cdev = &led->cdev;
+	cdev->max_brightness = ktd202x_max_brightness(fwnode);
+
 	cdev->brightness_set_blocking = ktd202x_brightness_single_set;
 	cdev->blink_set = ktd202x_blink_single_set;
 	cdev->pattern_set = ktd202x_pattern_single_set;
@@ -699,8 +715,6 @@ static int ktd202x_add_led(struct ktd202x *chip, struct fwnode_handle *fwnode, u
 		return ret;
 	}
 
-	cdev->max_brightness = KTD202X_MAX_BRIGHTNESS;
-
 	return 0;
 }
 

-- 
Git-155)


