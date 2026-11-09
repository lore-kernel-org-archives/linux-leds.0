Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794251072;
	b=GzUVpR6IvjGePwp6jVtgNPl5DvhCIYcR6NEvRAHGZzM7jPHs9aMC7LyU/JnMpvb5Qtil
	 SXF8CxS/84+6Hrq0mkxkOIC/q2qYfenZ29DNEZeh9sjmZqziSKkYvH42HODwCt3ppWqg2
	 4goiEGSYMF68R+6/azgpFW3BoBu1bFcOavEcXh9LVK7j/KH0kPo7NuGAZCKODLXm3udM1
	 t1iXuI/c8WHJeVkESJXjGEGBl3UAlD+SQCR5gynl4VnZZY+i4g0vleD7hfIqKZB7GETDL
	 MKR4V3EAL05aNxoSOm+pKt1OVeLBu40DnrVx2gMRGnmNG5FapG/dXTLpxKmXsehx2GQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251072;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T0OORxXQwW/M0i4PBHBDxRsNpuec1FenlCWc4WnP8hg=;
	b=soJQmVpdsyi1WkeA66rGue05sr1HiWRJVQIg3ccyyhrKIqzWWsAAy26NsSgOuWrn8unn
	 fkTWAbdhvCYGCteM8adLJMpes+a1Jn0+vyq8vXvWBfSLJP7IdqcL/ecgejXZ7hT8kp8Mp
	 /cqaW7IaMUNn51GcZzzYh2yJWNYLDA2hSB/tlkj8WgUwxC5cR/j7mr19hsYY5EKuIL6Ph
	 gqGhX3lJo7Mw1LOiYo8D4voun5xHCkzOTFUHtmem2/tkr2nuxsLvuW/FI7QTlao9Sc+KF
	 YaFFwr1lLGaqtLMq+k2O0hkuThVHaQYZHxlwUnP3SEfJEWkUh2R50+SVu8W75XAmajw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwLCice+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4867160A382A;
	Mon,  9 Nov 2026 19:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwLCice+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794251066;
	b=bdKmqhCVIO7In40+T2JKQkjMKatNhqWA/XrR/fpwkDJta+DF68oo5VHiIXCzlnn9xRqa
	 mNM7qaVrunSQtRRq0/coAEkJTY+qQEPKg4a2LtjXCpPX9qfZVjcERY1PgNcD0sQ0A2vkN
	 VojXMw88gyfIwIpVEsRpkXryD9a8DT5uQVUtog0/uuE/sG8Q1JE86JddWnlNHXnj8QBjd
	 /vxeK4K6UMvfQhZiTzFXm/++qY72UtUb8dqcFUH2vaUQIL56Upxr7h+rMnWuhjyhcmH2p
	 tIJYNOL3kiEI2DiOyEspCwI+FelvtPxgEwiXSyGab6KTKM+YWRGk5cdlELBCrI1AZ8Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794251066;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=T0OORxXQwW/M0i4PBHBDxRsNpuec1FenlCWc4WnP8hg=;
	b=UqaDqr1v5CrNWzknLFeOaucD1hhnuXFFlrP+UiJFl1kbkQaw6DuLGaGUC5S28zas3Y9O
	 D5StkenlU/03PbLLKAZ//6g6SiZATRWnSe4DUSSeuaweVvoGxSibRHxh+LsBAtCylWAnU
	 uLXMXsAxJQCqAhhUZX8deaepl1Jg586TfUdlWF2ezPmTYEoUf4qDRn3GBKCFngJQTciEl
	 Kct6n8z5UEUSGYK1lGBmhLbT0NVoEKFeapstORMo4rS467yi5ABHKshJz2hW2kY+NcxiM
	 ARfj0VyezCcDuWaZ2gHtdUB9O/ABcEoC0M4Vb+F1upRT5kr+KPd6tu66zSunvt+bx4g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 702081F00903;
	Mon,  9 Nov 2026 19:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251066;
	bh=T0OORxXQwW/M0i4PBHBDxRsNpuec1FenlCWc4WnP8hg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bwLCice+gAYJSCvXWY2VoUq3iPu6cXTsp92o8zdSI96kl5p/81tv6M4DAA3AF6p0t
	 v+vXbK5NKkltfH7GIGqNOVCWuiTscGcUKEbBtk+z6p26XoIjXbigmCjjng6x+PsoGx
	 HCykBh+AmSsjn2msnyC5Z7vS35ViEwAgvjQCLq0eJ24MNefJDOTntREACaIvPpBKgw
	 mYi+/W/W4wb0p7vF5zrqIfhtGxXnGZ+orugFn0IoRrOGrrIctYhkybMgSE3F755zpN
	 2w5hKTHaZephqGg6qxUZIzeOgNJQ8p7gErcVX8FRSwAEnOX9UAhUJ1cVepABMM6JiA
	 Rb3tnBT3mudeA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CB5CE48606;
	Mon,  9 Nov 2026 19:04:23 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 09 Nov 2026 14:03:46 -0500
Subject: [PATCH v2 10/11] leds: rgb: ktd202x: Fail the probe when the chip
 does not answer
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
Message-Id: <20261109-ktd202x-et6326-v2-10-56e97c226658@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794251062; l=1869;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=33Zn/F7Xphg4ctn6H/G5Lu7rMFXNNK5SWJKIHAWvAZY=;
 b=htRnK0RlYXjrx6Qh6BAVp0Ley8xZqZUnpahsbB0rAtx7YoUkKhYHdZ3R/xlqmWt4K2VmNvfZ1
 YMtTHcx/DMuA5sTI423AQwgXbYOqqfENOsu9+fxJj/1IXUbGN8QH68V
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The driver never reads from the chip: the register cache starts from the
defaults. So with a wrong address, or no chip at all, the LEDs get
registered anyway, and every later write fails.

The reset write can't tell: the KTD202x does not ACK the byte that
resets it, and its data sheet says to ignore that. So once the reset
is done, put the chip to sleep, as ktd202x_chip_disable() does, and
fail the probe when that write fails.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/leds/rgb/leds-ktd202x.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 2a3fda860e68..0cc2ec3f6a7f 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -738,20 +738,29 @@ static int ktd202x_probe_fw(struct ktd202x *chip)
 {
 	struct device *dev = chip->dev;
 	int count;
+	int ret;
 	int i = 0;
 
 	count = device_get_child_node_count(dev);
 	if (!count || count > chip->num_leds)
 		return -EINVAL;
 
+	/* The KTD202x does not ACK the byte that resets it, so ignore the result */
 	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
 
 	/* Allow the device to execute the complete reset */
 	usleep_range(200, 300);
 
-	device_for_each_child_node_scoped(dev, child) {
-		int ret = ktd202x_add_led(chip, child, i);
+	/*
+	 * Nothing is read back, so a failed write is the only sign of a missing
+	 * chip. Leave it asleep until a LED is turned on.
+	 */
+	ret = regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_ENABLE_CTRL_SLEEP);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to reach the chip\n");
 
+	device_for_each_child_node_scoped(dev, child) {
+		ret = ktd202x_add_led(chip, child, i);
 		if (ret)
 			return ret;
 

-- 
Git-155)


