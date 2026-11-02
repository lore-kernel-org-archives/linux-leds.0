Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793632979;
	b=3eq1+HZmrB7UXLBcW59TB54Q/f3m6upHahfUY0mXS5XCTIBrU/8dwYCTv6lLhGQ6uGq7
	 tZ3cTVdsZCOK0fkbUiL6UzVjkHYhTdGmq++m7JpPeNrNhByyh6t9KYxbMXM3Y4J3XcEpJ
	 LAhwibV0+aX1Fmnj3ybcAtcv1Cnvq9SFfahnR4bRsWlVXwG1wb4I60aovbIi0PXdfnYEn
	 RuL8jhehiKAypmfkqAZR89cyOy83Ysc2dHhTx3+uFaumaSyY9LVCbVWvUmV+Iqk8sfnYq
	 uG5mdSX3yY1cM2zvqihzIRZhVIhzzFSfMc6qly3TFhd9n/IkFdDDoY814iCUlZaPe6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632979;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1wuG1t645DYhkT3v1nTMe3PxAn0VwtDhlTpOvdLsMIA=;
	b=RcfC91wDFF5rqC+7DZIUOq4Qzdu1x4D80rSI7kg+wyOonNwrb1h6oGEwiuupd4qHMZvQ
	 67fEHfNYkRRVSWqBGK60qJcL6ZJRQ2ouV357fsM5xaTfvdf6WR4N2XgXR7fCIGy4jydDo
	 VP6Ev6z3u0DNUCkKUhbupetuzTd9MilgUn9EgIPx9wTOtC1fTb0m3QIpZwi6OfbPBxOvv
	 LXsRyhrVOw2zYJBDS+dY5BKv84rsy+mACmDQ25lu7Ag6WOVZ4HVRxmejfZhrrcYxzc65c
	 169X4Ve2x8KeB1XMr/QJOYAQh/q7u0/JlMSjtXVVAst4miSUEqIioIGI2CZXhUxEiow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BetumiTH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A57660C412D;
	Mon,  2 Nov 2026 15:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BetumiTH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793632979;
	b=W1I9Us12TuAJMXVX9mi0HZei6frJ6eyxvrEM6yodKZOh+NlLA3ujBBsAwhjzGC1/EWTm
	 RFShRpOUAU5wKZceUGYo1VxONu/OXQcMHi66eoc5ZKgjemvoV73g8PA9as/osHzK9udPw
	 iTK86OTrtJQ+GsBSDAQdj9G9ar/UBmvqkyjhvHlDeHf02He4HYm1Vx9HltkrEKTE2I/jv
	 v2Xb1GEvec7mByWB2EiJ3JJbmKEaXnbD8u5LO6Y0PXKrxCgBDgsmXnKdrbluxy2wzo3f2
	 YKeokyIwIJIpyFaixe47EFQ2O8TtfwUwXTLWHzOsg45fm1hARCpqF20NguZY9G6RCFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793632979;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1wuG1t645DYhkT3v1nTMe3PxAn0VwtDhlTpOvdLsMIA=;
	b=JFzwSd/JcUzoN8Ped5om8avM15uF6R4uF7Mg2QNEJmUyT/UOoZia9eR1X22hXDfWgn8q
	 8DP7FCBPNpSHlYhZ8O3JN8IupwMxctYhyAsEdo37UBq9+oRgrld2W4LrEQFZgvHl5GsIL
	 /FAMEu4vmeClXG3mTFGt2ctBhvh5i2k8iwFpfUhXGUp6z68JqxU0TnqGbh4raxszVv4dQ
	 WzA+S7zDdN837YReC59nYGLxVpprqNPlx2KGQkx7GQ5ZvoPoe2xVyb27MBH6nZk35HNBU
	 f0sUxFvPY6C6l0gZGpIXWSslTNEnIyomKv6Ic1zJyeqSe5In7sLOJ4/N9fO+vi6mq/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E94D01F00A1A;
	Mon,  2 Nov 2026 15:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793632978;
	bh=1wuG1t645DYhkT3v1nTMe3PxAn0VwtDhlTpOvdLsMIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BetumiTHUa35BXbujArBG2pvr6Twn1o45pTeIOzaw6fI7+VhnPWGfOhgErxgnCZ1t
	 24vx+cdcCZ4HJ0gJwQChUD98rpoUxo02nm/5lRWxqYuInb6yPiNNrUINv8FzEEut0H
	 LZnjpyYRTqTrKJj6v3cRzlANohrX34Wgz5/DWFtX6eGlXeKV+h2Y/wWGFdMMxvBObO
	 kiObIIB1u3GEoJf96FW3dBiNo3wV/Obe2bYXI6awZb26LB8DjM0nVIKohEen5zQ8qc
	 mnRI4nHmQfvoVa6GcLFZgn3LZEixOKsjf4wDNAfNSRKH4dmuR/eO54kp3wVKtWgypp
	 BBSQZMyFcqeeQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5AD3346564;
	Mon,  2 Nov 2026 15:22:57 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 02 Nov 2026 17:22:56 +0200
Subject: [PATCH 1/2] dt-bindings: leds: irled: pwm-ir-tx: add power supply
 support
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
Message-Id: <20261102-6768-irled-v1-1-c7064f3afed1@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793632976; l=912;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=lrAuDDWc631H8kDzeXXaEWZPrYdjJgCBsuDfNWjP9es=;
 b=QonYg6UGNgFyURq5T7Isz6r0IAf56o1L6vgClckpFuFmgYzieXOhemc4SwTYnbWOcbrKBkSEi
 OfuiQb1E3n4BoNCtnJScVv8SxCNs3M6cweo9I/v6/hbh9buCWI/GMI3
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Reply-To: rva333@protonmail.com
Content-Transfer-Encoding: 7bit

From: Roman Vivchar <rva333@protonmail.com>

On some boards, the IR LED is connected to a switchable power rail, such
as an eMMC supply. If this regulator is disabled, IR transmission fails.

Add an optional power-supply property to document this regulator.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
index 7526e3149f72..35a601cc068b 100644
--- a/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
+++ b/Documentation/devicetree/bindings/leds/irled/pwm-ir-tx.yaml
@@ -23,6 +23,10 @@ properties:
   pwms:
     maxItems: 1
 
+  power-supply:
+    description:
+      The regulator controlling the current to the LED.
+
 required:
   - compatible
   - pwms

-- 
2.56.0


