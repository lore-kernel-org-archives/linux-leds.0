Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795717250;
	b=A+t31cNHztPD7bgiwE05kbcPs4WNQscYAEZio32QEHb3+lhZvn8Ce/6tGG59+FN3PiW3
	 VL7a9oop5q/szNVFTlgIX+yRtCift4KhXY4ZAvS27U7bQTl9DIGgQYJJT2un0FPnXyFLX
	 Fzpxp9VkFESAjn0n9hoZ+UHhKgVBOOTpnsFzoPG0HXdCP+ZV9LbkrhzCJFBTR1+zt5XBZ
	 075y6yp/HR0qq5fS4PSg+MPHKtQqpw7sKkz53mCVSNj6YUeVJ9wIkJJUgLAjzREQPhG6X
	 RiL5irtq90MxixpG1VljPKzAttRkJyOZRVO9f9QYnlsGLtZwcd//LRS+CcMcEXC4o/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795717250;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	b=HIUl0Y3dSU2jcfBM5mN3JWMo1nTF70ePCcB3m9XDR2mRlUZupbP1RqbWQukmznZYBFdj
	 AwGnak46esHbiGBPKVRmQp17BQVgFSFZCDTSNR24k0ttXh9AZnv5IlOYOTbxb3Zv9gcCi
	 r2ipWJW5RZTa9nheu9ZwP7OEPOYTQAYu1MtqhTG+UzEDmuQfRBmssJzew1xZucUVOn6O2
	 7TwRA41T0dWHzAzprea3UdPJ3PDOlVTqnPJFv6wAjzmF84+5m/SOfXAnkyN+vqQf3Speb
	 3skQTIeq+zM3F46cLkFB/7Ci4V44PPVYs8/1WrL/BeLY+aeU9RLqkCttw7e7YiVVwVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMwB8d1g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945D606A31C;
	Thu, 26 Nov 2026 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RMwB8d1g
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795717250;
	b=YZ65/8XvT8qqarg+ltTGqw1KSDIhxyO5eOO4pn4pcNx90sHxGmSMYoRx/WAb6d5jdK/J
	 AHN+fhOVhuDplFLO1ipDaOtCl/tG8xT2pre5KKEWIDDFPky2PP6YmgEvCbw4ZL0OF21HM
	 dn4GzKEfdBnx1yRMJNbI+XZQr9nMi97VlEI7Fthy1VPjggXxmGLxik9LLNAP4yv1NWQ0Q
	 ywbGtvbVYs+9dR6rlXGKtHnW6ZTyUSEzbJ5H/OvYq5A8wRQdAoe8Jb7Hl3TkSbtrQ+Fwv
	 izFt82RsobsZaD3qTk4tzzzL3gzwgSmojADITEhQG5sKhdnQHRbIm3GlqTnKcoSvspQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795717250;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	b=KIMsVx7oHTypPx7OhhtwHVo2Yn4Kx+GrL3M9ICyTgUcJEymbO6Y3WLH1s9vUmEyV8viP
	 Mc96TzaxPA2zEOHwGnDtQKCVe9InXcxg67r1cPClDAFl/0WJBrwjIKZawrnuHQZ7zDmKY
	 7H7Lo+MU2yWkIKasqhKqHxWO2cG3fmhMj/pHrTIqxLiGyk9xdpDQh2FrtAeirAkp/s+2O
	 yzc2K07HeDvINxXLqo5ZCflwuVbwj7P0zC0Fm8nP9bdw9orkFNispznNHyFwX29P6hSja
	 i8nd9a3Wwb35koJVuNNe8UsbxzYkWX/KzD/6zqqZxDsPBRZE4fTF3oH6KeYpIBpOncg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1E111F000C6;
	Thu, 26 Nov 2026 18:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795717249;
	bh=Ct1fbDF1mb7Be3mEluDpAJNIkA18LafUdGDziI8jFKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RMwB8d1gW17jBGP6aPiQs69QAN5E505JDH5/Q3yWCobWHmUmuiV4236JjGC4QvlPY
	 yn0ZXvs0QawgGAAyVfm7fWuTSCPVSsRj6CnkbObcb5iN/sDWpugKTknxb6poUq10Wp
	 l1opKoVdwUgbbq46zHHMQeX/lR/7s8N5Iljbp0YwTsqgrZ4spCUc5zO+rw4Qkv4iat
	 ndqcYz0BJpxP1rkMGP6/Zc8rW3mzQXApicGEwzmkYl3MQyX9/nGH6CC3rEwdfdp9tq
	 DTNTUdD5MX3KJbQAiu/YBmNjpUz7xlbFQPfgXy5mOwIQgQY3IAHhZwCZo1+iBqB6Tt
	 uB49p2jNIrFPA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4B9644D787;
	Thu, 26 Nov 2026 18:20:46 +0000 (UTC)
From: Paul Sajna via B4 Relay <devnull+sajattack.postmarketos.org@kernel.org>
Date: Thu, 26 Nov 2026 11:20:45 -0700
Subject: [PATCH v8 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
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
Message-Id: <20261126-aw2013-aw20xx-rename-v8-1-b6960baa102c@postmarketos.org>
References: <20261126-aw2013-aw20xx-rename-v8-0-b6960baa102c@postmarketos.org>
In-Reply-To: <20261126-aw2013-aw20xx-rename-v8-0-b6960baa102c@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>, David Heidelberg <david@ixit.cz>, 
 Griffin Kroah-Hartman <griffin@kroah.com>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795717245; l=1313;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=w/6qEc2cwOI6T/xUHNJh3OifoyGO3FRpW1FATx28UoM=;
 b=dp1bSdfEAgOHHn3XRT+jMPi0IbTO6Or2jMi8OcHqs4bpVBkJcEcAnK3ZiA9Wgp8it3u778dAH
 B6csUUEuacWCPIZjZ0+uXX17nww7bi3IqEKTm2S206ZHTgsbruXSw6c
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=
X-Endpoint-Received: by B4 Relay for sajattack@postmarketos.org/20250413
 with auth_id=1505
X-Original-From: Paul Sajna <sajattack@postmarketos.org>
Reply-To: sajattack@postmarketos.org
Content-Transfer-Encoding: 7bit

From: Paul Sajna <sajattack@postmarketos.org>

The aw2027 is largely the same as the aw2013, with the
exception of the way the max current is written to registers.
This exception makes it different enough to not work without
driver modifications, but similar enough to fall under the
umbrella of the same driver.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/leds/leds-aw2013.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
index 26238446f2bd..1ad165cfe34a 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW2013/AW2027 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
@@ -15,7 +15,9 @@ description: |
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.56.0


