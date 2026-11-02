Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632979;
	b=JeZ1G1E6NtA5GmdbSmK85P+7SZWYGJvty72bHGFVKhgby5qqJFFYksjMIqNkYKMPIccV
	 fX+uGKmAUabRd6FLzNqgiv2/Fqjx2LDh5LwBHpytwb0XE40IFFtv0ZRg93hZX0DesBaGx
	 E/S3mG3EcijapTzqRaO82sCMmHUejQN8N/OaVW4QhuuuxvV0saBSvQfiW31pXic2tpWdJ
	 907NHbgjEfCq5UyWFuSgRDkBTw/aVzp/qXH8psRp/nl9pZHQYkVVfu3C+eDNqKVBbOnzb
	 QlJJNSilseU4ZlzUuuRWhy7vdoGzgSlDzVmOhYTYRbTRKIeppGf8c2ehMi4+pDW0g1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632979;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aHw52U/fCgmG8rXLdi+T2eomdSE3QiG7fSPiaslIA0o=;
	b=xFU6hFb063BkIkYl7yYJwemf/0G3pW4Z/+gUZ/+i2EQWzGp54gDJUr5DGTIlf8r+HE8W
	 GFYQNVPRc+hGQ/4JtRP2kTxY/+pi4LmlaG/6GlT2ZYCBpF/xceEy/hu1pozIKN5h+l8g7
	 1tT2uW6DwygR1VwMGOblnYsQ/2IGIx4fIImVzNDydjO9LtQDeW6UeiKGgpVgAhKvgMkQs
	 pWqAas+JNic0vURRuzoHBcg5qCJTYYAIDHKH5Afu7ijSjpYu81TuIcwQGqM6GE0hxZGze
	 MyHko7OEbhnIThAuA2lf+7vbwgNc38AapuIgGaOH368tB3xSdjUCVB50pA5vrzMcx2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8koYraH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381E960C412B;
	Mon,  2 Nov 2026 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c8koYraH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793632979;
	b=l0MsnolSoz0totqXE+vHzNzbZEi5pHi6G9lP6QKaya5vnbYW7gOLdeJ7pv4eWNwGw6F+
	 pv+wWkd5jqhC6Ly2fiqJrdsL0YvFc5k+8ttCN93PT9TwJc/E6eH7NPDUDWQLEvVO0PIDt
	 5qr2DaAJcHjR1L1PBazxqkPKady1r6qmau6XhpodyTrcVo+6eCzovsfiBk7c6WWrp4I3Q
	 pWHKF+NPAEYss7AkmCxVDq8y4K+x0CwMK9i+ijOOchVbRO7oRA/jNyw/52oCz9AL5WSvE
	 QpF4Pbb/dMFglKStrf64TE3ZpXjWkY5upqXhGcTsUSQFKqddiiSiYyH9zlGQwk7NF5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632979;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aHw52U/fCgmG8rXLdi+T2eomdSE3QiG7fSPiaslIA0o=;
	b=24cXyy0WLgpSBGKm8uZImQfUT7RYngCcU3sPVLRRHza27t/wwQIUufHjgzO0JFAD+Gv5
	 GnKcab84odBEbgxwQdkRwQKVS/qDGSPjXJDrZQ/G448KmUP63vXWJYheUdO9rXIiNhJu4
	 /VhrjUqMlmMBEJHIXX1xFJUpaNlrIBjUdwTbTVX22cFTAina1w1LHX7KMMyIhklySrjDi
	 PeKFhy2GMtrkM3EUGmugv1SnepMUZHzihKoV3RK20S9tRbdNSDL2R+HYjPOmIzWjFtYVT
	 gRRwCOwtLm4Vi0RRkWREJYU+9zgMO4IH/bgZhUh2fwIMI+jdtEmL0E2NG3E4HYTyCrw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EA1EE1F00A1B;
	Mon,  2 Nov 2026 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632979;
	bh=aHw52U/fCgmG8rXLdi+T2eomdSE3QiG7fSPiaslIA0o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=c8koYraHlaD91D/GjrCqUnCamg1iSeR3ahqfHriK0UZaHGraaGKvOtjovh0HwqvL8
	 Cs7eBtnkXItRkEdxXSkVfVOMCzh7zTwtUznqJcM/xso+5uMIu9R5Nl5KoWVKiLkx7O
	 iuNq9nI5G+7LNCecb4Swaxz0Jk2dMuC1TJi+KMXO8QTBhi9dhtj835Y9ccbWRWl7tM
	 qhD0yW/AYhTHfS8bNfSwUXWczUElbHFNSts215Tpi9Rkl8f8OkeQKv1RKdXV+25+fK
	 tC9272aa6OGUSKupnCGyAzJg7ulo8Z2trtvn0qjleCphAIo0BsoPGmJLPOJ44rQnku
	 cuhfJg6JqVchw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6805C4656D;
	Mon,  2 Nov 2026 15:22:57 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 02 Nov 2026 17:22:57 +0200
Subject: [PATCH 2/2] media: pwm-ir-tx: add regulator support
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
Message-Id: <20261102-6768-irled-v1-2-c7064f3afed1@protonmail.com>
References: <20261102-6768-irled-v1-0-c7064f3afed1@protonmail.com>
In-Reply-To: <20261102-6768-irled-v1-0-c7064f3afed1@protonmail.com>
To: Sean Young <sean@mess.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793632976; l=2900;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=IhXQr7kOEDLCtAxSwK+rAEvZXOZEWzcPKhKvyEtqCwc=;
 b=WpatHju56LMszkCTB2MstZbQpeJ0+VIeHY9B2ViWmHW6U5PgXxpnUaZMqWki8mQ+rJktM/yHG
 kiF5WtstosQBjLdR5tW0MRdSRMh8JI6qzBVYe2qBvUNca1N7rd0h/wn
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

From: Roman Vivchar <rva333@protonmail.com>

On some boards, the IR LED shares a power rail with other components.
If that rail is turned off, IR transmission can't function properly.

Add optional regulator support to ensure the power supply is enabled when
needed.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/media/rc/pwm-ir-tx.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/pwm-ir-tx.c b/drivers/media/rc/pwm-ir-tx.c
index 047472dc9244..f9c95d034493 100644
--- a/drivers/media/rc/pwm-ir-tx.c
+++ b/drivers/media/rc/pwm-ir-tx.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/hrtimer.h>
 #include <linux/completion.h>
 #include <media/rc-core.h>
@@ -19,6 +20,7 @@
 
 struct pwm_ir {
 	struct pwm_device *pwm;
+	struct regulator *reg;
 	struct hrtimer timer;
 	struct completion tx_done;
 	struct pwm_state *state;
@@ -63,10 +65,16 @@ static int pwm_ir_tx_sleep(struct rc_dev *dev, unsigned int *txbuf,
 	struct pwm_ir *pwm_ir = dev->priv;
 	struct pwm_device *pwm = pwm_ir->pwm;
 	struct pwm_state state;
-	int i;
+	int i, ret;
 	ktime_t edge;
 	long delta;
 
+	if (pwm_ir->reg) {
+		ret = regulator_enable(pwm_ir->reg);
+		if (ret)
+			return ret;
+	}
+
 	pwm_init_state(pwm, &state);
 
 	state.period = DIV_ROUND_CLOSEST(NSEC_PER_SEC, pwm_ir->carrier);
@@ -87,6 +95,12 @@ static int pwm_ir_tx_sleep(struct rc_dev *dev, unsigned int *txbuf,
 	state.enabled = false;
 	pwm_apply_might_sleep(pwm, &state);
 
+	if (pwm_ir->reg) {
+		ret = regulator_disable(pwm_ir->reg);
+		if (ret)
+			return ret;
+	}
+
 	return count;
 }
 
@@ -96,6 +110,7 @@ static int pwm_ir_tx_atomic(struct rc_dev *dev, unsigned int *txbuf,
 	struct pwm_ir *pwm_ir = dev->priv;
 	struct pwm_device *pwm = pwm_ir->pwm;
 	struct pwm_state state;
+	int ret;
 
 	pwm_init_state(pwm, &state);
 
@@ -107,10 +122,22 @@ static int pwm_ir_tx_atomic(struct rc_dev *dev, unsigned int *txbuf,
 	pwm_ir->txbuf_index = 0;
 	pwm_ir->state = &state;
 
+	if (pwm_ir->reg) {
+		ret = regulator_enable(pwm_ir->reg);
+		if (ret)
+			return ret;
+	}
+
 	hrtimer_start(&pwm_ir->timer, 0, HRTIMER_MODE_REL);
 
 	wait_for_completion(&pwm_ir->tx_done);
 
+	if (pwm_ir->reg) {
+		ret = regulator_disable(pwm_ir->reg);
+		if (ret)
+			return ret;
+	}
+
 	return count;
 }
 
@@ -157,6 +184,14 @@ static int pwm_ir_probe(struct platform_device *pdev)
 	if (IS_ERR(pwm_ir->pwm))
 		return PTR_ERR(pwm_ir->pwm);
 
+	pwm_ir->reg = devm_regulator_get_optional(&pdev->dev, "power");
+	if (IS_ERR(pwm_ir->reg)) {
+		if (PTR_ERR(pwm_ir->reg) != -ENODEV)
+			return PTR_ERR(pwm_ir->reg);
+
+		pwm_ir->reg = NULL;
+	}
+
 	pwm_ir->carrier = 38000;
 	pwm_ir->duty_cycle = 50;
 

-- 
2.56.0


