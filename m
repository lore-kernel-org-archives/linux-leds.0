Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793585585;
	b=vICJ+2PQkgJ/EQq4QVLPEwshNt7Ja7UphIlEa2ao+DKE9dC5KhabrmWmDqtcqNRY9KX/
	 VCn1sQ0QUC1p7sPWLczTBNUobXe25E7YILMgJwNbYyy25BmBnmjmqP6ZeoOvx/AZHspxc
	 A3x4kQ7qRR5dyVkS+F85WjrtT4KtDEV0AC+lvok/507GLrZOjOd4Q+T+QH9tLg+bc+Sa4
	 ml+8ZVqxN/5lsRoyrA0bV4+ajuQtEakTqstds38qWmgb4kzEBMeizJIz+W+vFy/h4oBeJ
	 ltpbqjefs4pAlZQREcyZBzdn791QrSATAKbVLB3zWCb8a9T3qfA1jaMbGJNAzlx4MuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585585;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6bqpBbNSGdthdXl2Tpc/InHxlB9EAyD3/Swpm+69qmQ=;
	b=piG2zyGTCUdpQLmrc/exQoh063tdHJXGh6fHiR1oKftXbdHgtwccr7EytGvv3yUWUGMf
	 iY1TYI9GQIWgImSZ9NvszhVdw8+rJqCJNDOJOt+t+/AsKsrelBMq2syJdg3Gt/+gfWVr6
	 GWlA7E+NrCX0VPRt9fgX0i/BDQ+EbyAf1maHVOnxFzNQ9c9zZsvLHrYwoxgZdvwdCXEkv
	 lcsIIxbr41u3oBnFANiF+ZVukcYEVDSJXabMakYs1tuC7NflF/t1/Ex8LXx276VLCwSXA
	 EIokncwo7fSfRR6JU7zVDRZ7+Ioi9qAFF3RxqPbKsCF4tks3VAa/wHfYV1s7EH7kCTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FMrKYzFg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026560A3825;
	Mon,  2 Nov 2026 02:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FMrKYzFg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793585585;
	b=2hopybUJv9hMD6ehkrbrn5ZwdY2i6YkFPyHRtK83O/4hwlNyLSwwWIZee2+WD2OwGzqc
	 n7aisg4CaVY2qhJ0PdBpaxLLSjB4nYi7XQH84bK0LB3X9qvqc+UVDMYG8mvzJz/4s9Zf1
	 zz0WcIqcItC1s6leLrbrwS7qhFts4QSduPC8ivO/Br3tnc1Kstxs4EyybC9YAz/cgqvX2
	 bZODCmZuJ8WBQbHbOZy0P8ZQeCTksncMvKV3Cb3bb8hEvE1x3Q2SWg719LvfgtE2tTJSo
	 4PfeyI+TYct0wAu3Wi6BFudPXhf62ZWfxH9aMhMAj1ToANayMlBdWbavUSI6ZsSc+MA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793585585;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6bqpBbNSGdthdXl2Tpc/InHxlB9EAyD3/Swpm+69qmQ=;
	b=TdRT7xP4VPrMq9I/GOreW3CTa96XCM8FgS7iUgJtaCsoaj0xxv3ANnQtIYUdyoN1dMC1
	 b/mK3yM34Xp21n1m3uIdILZD+soex5dlUm//VuwxCM3Q3oGotTb1euSAsMiREOjDYHoCb
	 Ifubb6xyy/mO3sQAC/ZZ4Ab9Smx+aQjDh9j+P5YzOGXdxJnO32c/nWhLAeUF7ynpXEJ99
	 o9X/oHPlGwrsJwgXpQsKiJuaANdWmbMpzxWLSsNIL1Tlj6nDkTNwnyPNZnnUvOagiBG8y
	 bktEHOpcjpjp/uB8+J0Rolh8TASwYIlPNO2o4x50Cb/olFh+5S1Nvtv2eKB3sHVEfnA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E0AC1F00A27;
	Mon,  2 Nov 2026 02:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585585;
	bh=6bqpBbNSGdthdXl2Tpc/InHxlB9EAyD3/Swpm+69qmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=FMrKYzFgxcZi7Rc8T7+CLRM8nqaaNpAXYKqXCPIvrbOrOWdKqJIfylCu8HJU4huYO
	 CCIeynNSVQHtLI7g6r1NPC+t2UD+zB8Fjnu5QcY2u96ep7RjMoosqPxHq3pjRZZe7A
	 CWluNEn/clPEs19SdWI83VH04KhjBpp5CCHbsIclLslaCqIDopkxW5DS+enRRIN4If
	 qRCPA2imsQX9RmkAV6foNlkzoEymI6AsgwrLkfgua8deXzxjwj55My9fJyAcgZOdWl
	 SoIS8jCsObEn5nB5YExOftllmLxdlLxeHsy+z6yuyZIkmPcnLxE/bLl7J3aCRlMEhJ
	 dcGrqEgF8KrJA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 406914632E;
	Mon,  2 Nov 2026 02:13:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 01 Nov 2026 21:12:33 -0500
Subject: [PATCH 09/10] leds: rgb: ktd202x: Fail the probe when the chip
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
Message-Id: <20261101-ktd202x-et6326-v1-9-eb51eddad08c@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793585580; l=1553;
 i=joseph@telaak.dev; s=20261102; h=from:subject:message-id;
 bh=tN2wy7OwuZC0ZumxoxtwXiUEmKmdwIanlrzcYbKhu94=;
 b=B5/78ifNW7ry1PcQYzxETIahBk8GLO1o+ue5ywcwKav5Gtrggl4xKBOZBukvmN+R81hSB9rhc
 euOF2vgJxfnD2qhCC/hoVhjX+TIZrWLj5VbnpSWbKuLQciDJWZnx98r
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=OmwSusdK4grZpiuZVfCZAvYyqz9FBkNemsV1EnHyVr4=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261102 with
 auth_id=1382
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The driver never reads from the chip: the register cache starts from the
defaults. So with a wrong address, or no chip at all, the reset write at
probe NAKs, the error is ignored and the LEDs get registered anyway. Every
later write then fails.

Fail the probe when the reset write fails.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/leds/rgb/leds-ktd202x.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 48521f1e5..5f51df993 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -722,20 +722,23 @@ static int ktd202x_probe_fw(struct ktd202x *chip)
 {
 	struct device *dev = chip->dev;
 	int count;
+	int ret;
 	int i = 0;
 
 	count = device_get_child_node_count(dev);
 	if (!count || count > chip->num_leds)
 		return -EINVAL;
 
-	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
+	/* Nothing is read back, so a failed reset is the only sign of a missing chip */
+	ret = regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to reset the chip\n");
 
 	/* Allow the device to execute the complete reset */
 	usleep_range(200, 300);
 
 	device_for_each_child_node_scoped(dev, child) {
-		int ret = ktd202x_add_led(chip, child, i);
-
+		ret = ktd202x_add_led(chip, child, i);
 		if (ret)
 			return ret;
 

-- 
Git-155)


