Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794251068;
	b=SRV7ZGeRvicXueS9ji320vO89eoFi1hce3GN6T+eRZDIDhP9pOu7aZkxI6zkC1E4HE05
	 oMn3XokoEz1qVQtWZhOaOjok4YLkWsZxgkzd08z3rcueqKjqIeypYUhggRZCR3UTgNvQV
	 GIA/gOJlZtI9ytTkuPSaZVdqd0XnART6UBZZc2fjKF541i7HyOZ1YX8uhblobhZEpfPqn
	 SSFwvLn8cnPT9uXrmNWJZRhGkBmyDyVsks9l8g1taIwdXKRlCKfNqdZTJSXeCpU+ucKYH
	 82aKa+ge0jVcpnmoHJPxogX1pgbBh+1vb9gDzlkKtQOWeYlcQD9UeyTAX1rCcOSBv1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251068;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AJ4OjaajFJH3PdoaHBKuroccw+W47+J99tSmkZfQ2zM=;
	b=AK2URhf0jalJ8vGf1+noH2eU5Bn8oZpTmUNKElsoGT4om6CR7GyIT/U4kmIzYa6CLk3S
	 O2to3jdr+zd+q9rZXRlzHG+v0Kjq081+9BKgJSNlTvLkNeFpCvdfFQCGN1MPBMdgcP57c
	 cSHfdH3mOmWBr3xYS/wI2A2jm1QNzfRJFuh3b22ZrZVVnApuL0VyotEnrQbBG+W+Z2HUV
	 DS2rfEPhDq7gADYSro/1qLC7Cqd2Hbl7mUJPn/TeMHYEblNLE8y2tKG0FL4uU/HmKH3+g
	 q3w1pQfDeY3wFdwi6ChM1jCujKXIM0J6C1lv/Pm6xFFzY02IxnYcBt/neETw/KrdwDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2qLWdSC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A0060A2600;
	Mon,  9 Nov 2026 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c2qLWdSC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794251067;
	b=zEdzXXB8Cw19zeaNhCkIr3OeDcYNiVyuyM5OmKYabdzO2ToKWF6GyBoEdW3IQN3X5i+h
	 Ga2tm/4X3glk9tA8Jht8w/MKSjAFkv0L6kV8Gz22FZEvKEsm5vZLUdY0CMOOINt359Uq1
	 TMYTl85i0Odbxay457wRmE3pp9WB7C8EFnCGrlCwteMEkfYSaMmHWtuXpUn+RycpA+/XA
	 2uVnWltX0CtEiObSpH9vEUYhb64NQB94fsWHVK+DGXydBw7vXhENsKXoPzOSw3DYs2JV0
	 x6aCMDvUp+mLi9n49YFZO1KXzs2mVIWDPPI8CUNO+aU0fx/PyLHffwjv0vzjbnbSBuw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794251067;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=AJ4OjaajFJH3PdoaHBKuroccw+W47+J99tSmkZfQ2zM=;
	b=gMGpUEH2rUkRiJai3+/jUnzHGlXbn6/0hjiaul1IOPJxS3YqFxQ7tgQiKtdsFnmfFC6d
	 3ypOVUxwO2WxYPaW2PAa4sRUVPxdZC9Ijauikh0NhYZIXcYaAtDiINf27fbth2BBqrkCr
	 PdcSEF6MSbmweT0kIV3KwDpnSjeZXYrl0Scgoueu+caOggCp3NYvYt+Gxsj0s+F/YRgk8
	 e6Ia6dQjhK018jVFyuknWO1LR+c4X1CDf7Dwz/5N5KUEmS/JEQO/ZM0jD+w1ttkIubbNa
	 zxKw5bgMYAWJLfiwcCdoerBzwqmZnmJRopdrapeZg0HAq5TRfNyskbLUbYwAEzOqafg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7005E1F00902;
	Mon,  9 Nov 2026 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251067;
	bh=AJ4OjaajFJH3PdoaHBKuroccw+W47+J99tSmkZfQ2zM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c2qLWdSCoIcusmHTjlelRa7yoE+q9hjo2Gzp5oACEBj813wr0yCZMMQzeiN12aUhz
	 xcuvryiHkD7kgK6FwxNYNBCU53mHXAiSSBUL5NhVw88TAAU5g3sTbAr2gCBrevoWi+
	 p8unGfl8kpL1vJIkut+OHjOYnFCenyqXalFbsiCVU50SrZGlSW5O1/roVDIRZt0omN
	 MRVpjvQQQjqEQOkqDPYRgZvquBRwoaqOFmFKiMXBFniY9oSBFKpLuLE4uMOmh/bh5Z
	 w2m+Wwq65nnhxfbneYkEUf94kq3/r5z8xd1lLlYgw9dN8j+MZfzBVVqOCpyUGKDFzE
	 /i+mPHPFeDlPw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B95C248602;
	Mon,  9 Nov 2026 19:04:23 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 09 Nov 2026 14:03:45 -0500
Subject: [PATCH v2 09/11] leds: rgb: ktd202x: Limit the LED current to
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
Message-Id: <20261109-ktd202x-et6326-v2-9-56e97c226658@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794251062; l=3266;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=Om04kvjSybh2LIV5nsthyIAjGxULubhGOcKugy5aQ+s=;
 b=QC6BpJR2NzdSpd4gx6fOOFld+6tJ/1M0JMw1UUzo2h4/HFvoWQvc4OFGrgdQoL+YYH5aN7WNi
 +Rb+yhGBqTnB27xBLLfAuJ8v4jgDE24PmnZXBsAbSXPzyekD05Xl56B
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
index daa04f8ecefd..2a3fda860e68 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -78,6 +78,7 @@
 #define KTD202X_PATTERN_MAX_MS 16384
 
 #define KTD202X_MAX_BRIGHTNESS 192
+#define KTD202X_LED_CURRENT_STEP_uA 125
 
 static const struct reg_default ktd202x_reg_defaults[] = {
 	{ KTD202X_REG_RESET_CONTROL, KTD202X_TIMER_SLOT_CONTROL_TSLOT1 |
@@ -408,7 +409,7 @@ static int ktd202x_blink_single_set(struct led_classdev *cdev,
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


