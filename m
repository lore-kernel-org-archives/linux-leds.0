Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794251066;
	b=vIcr3cvP63EjUuMbJG9ljEpPQM5W3DOg/2NesWjvuSNrzdhsUCi0KN6zdektwiOwE57l
	 1HaRpq6bSN0bymyapMFuQ4pb1vFmcYVt2EgvU6HeeZR0zFJvhiISaEF4eO5Rxl9L9dKAk
	 BGDTB5cxQnwjU+zDJmaOjiDdgfK6TuzfLxxbyTH27KSzI5unkftEQnhKcteCITx5q7ln8
	 Oi6mTlfa4xNmn1sT74+/R+1+Ml1GXPajvwiHs1doXnFaeJ9cuBqFSbPRBLX9EicIZIagQ
	 9DO7SJ1ymVr1Z3pqW2iRleFTB0y5psvDck/xkNpUiHxfNXmkahvI/xoxUcV5Kd8EmZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251066;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5tjTKvxeC9+M4iJKZA+UA1MEf01p6/zSFwOThNqPwxU=;
	b=Rz7ocOIYqIvWIkgomB6nt7RvsKriro8SXGvVIsHpsmKOmVR4CzoiVA6/7p5W5ctTlgSv
	 3qo3iybZD06npOK1KvIlWeLf+45R2DEEUGJJkkNmLv13z009UqanFw+znEp9jHLjG0DsU
	 V1Z/4B/lmspq2tsaJNtf3HKTABClnDBWJtWbcPi9ZHo7QWFYTqFPh9eN8numsSJoJfDmk
	 wyYpgi4P9hrBTO6qwvfi/2k1netS/nNMwv/bpmPspjkIrZQY/oJ1gxSWZRNd3P84Jm/8k
	 kOeijnGG/XgKORLOF29/4uzGzc4jtEygUmXVawutYL22y2boSDfREQJeLIrR5/Oyj2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGNtusje;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADF5606A333;
	Mon,  9 Nov 2026 19:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XGNtusje
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794251066;
	b=SukHsAjJLBr3VCccwZ12OOEasfOTy7L/iTc7+bYG67poX441xHwYOjv6GHEnnve1BNjZ
	 wHXa+Kq2rzwvXCKqshuk+jo7YeYNVxOBavfFWSu8B9H9WUKDOvPmB/5z7wGaJwJoo4kKG
	 hSPkaEUm5GS8kdY/PX3hfjGuocsc79cQN3vedoetFxSC2zhnao0JKa2H0+ae1y5htfTxt
	 /olJ8mAO1ESf7GU+O9dufxCG0YVfiC+cNpUCB50g3akBPvA1IVxc528FoGs8WOI9UXdgh
	 F6mr4pPg4gYARYj5gq+fRkiYXtQBNf3mwJnmjjjB9+4CDkr5ZUIrUvic6HHL7DPzL7g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794251066;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5tjTKvxeC9+M4iJKZA+UA1MEf01p6/zSFwOThNqPwxU=;
	b=wvAgxy61az5N6XQLXgUUdo03+1QuK0dnCqfeCI5bpBLOEnPhfDNX4Y0y0XX1fvVZGfNZ
	 Py3iL7ucOLZinSyv/l7EfZWf8qI2ie76k2xTYJkOZsIsJr6k/3xVYvMZGR63/mCnlr/YT
	 mo6px55Y7Gp86PTQn9B57CjAU7CatWc2lND+KioRC7h4wh30scRALmwj6UPlEJ8Vn7405
	 a54RYJ7E/ZGQDwohX21PkEa985rXs7KhlOZMsJb4AcsDStG7a10DO4zADXoWqmh18+jJo
	 YTX/NQvMVWk1JWd9ShlIvQ6fiPEFAfH/cIsbIKarv5ZbNukhBD78uCjxa4qvXrcaxFQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D94CA1F00900;
	Mon,  9 Nov 2026 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794251066;
	bh=5tjTKvxeC9+M4iJKZA+UA1MEf01p6/zSFwOThNqPwxU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XGNtusjeRvBO7MmXmt/1J8oWwsgHrvgdD0oMJCaD69OCRLWp7/DHrjPhNMrLSFRAd
	 SYc6EDhux+MXIa+9mJPVMAzxOm6DPS+F7Apo0nABt9cYWX3pDmwYyBvqzQl9V2ej8w
	 gAV9EUacuEvw/LScujY3OyNF/KM1xpPYI8mzeOWGgZWnFPXq5LDijb6noML4+HjpU8
	 yuM/nMthV6Lo/zrID56GV6eKX7pNMNXgyXU1a06qn4SH1ZanKA6Behm1Rn7FVmzK9n
	 h6qV9rH8jWolDsgX88qXI3oGJdDCQoAhVa5wHPGENtkD+2kzL/yuCV2lpuGV4HxSLm
	 wO4zyPKoQXM6w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8035A485F6;
	Mon,  9 Nov 2026 19:04:23 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Mon, 09 Nov 2026 14:03:42 -0500
Subject: [PATCH v2 06/11] dt-bindings: leds: kinetic,ktd202x: Add Etek
 ET6326
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
Message-Id: <20261109-ktd202x-et6326-v2-6-56e97c226658@telaak.dev>
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
 linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794251062; l=1688;
 i=joseph@telaak.dev; s=20261104; h=from:subject:message-id;
 bh=hIvFiNaElM5DM1f0GSci39p2JZ0LoYvSxCvTlBftLaU=;
 b=lUjuN8U4Q5GU35310ZlXoMPNWT2zClb0iQY/QCBSyeAe8abYvpxs9cJYgn2FDsyOsiJAmE1Yj
 kVmh2yZhhlmAaI5cfY4Bzdh/6fZpO67chvFzMtoSbzQd+RqswrnYOkx
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=oQI+UfddlZ0wK2ac4WKOGNjUl1ZEN8j9ZVFSqEDoNP0=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261104 with
 auth_id=1404
X-Original-From: Joseph Telaak <joseph@telaak.dev>
Reply-To: joseph@telaak.dev
Content-Transfer-Encoding: 7bit

From: Joseph Telaak <joseph@telaak.dev>

The Etek ET6326 is a 3 channel LED driver with the register map, the I2C
address and the current steps of the KTD2026. It only differs in the
flash period, which is (Reg1 + 1) * 128 ms instead of 256 ms + Reg1 *
128 ms, so a KTD2026 driver runs it with blink periods that are 128 ms
off. Document it with the KTD2026 as fallback.

The ET6326 drives the status LED of the GL.iNet GL-SFT1200 (Opal).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../devicetree/bindings/leds/kinetic,ktd202x.yaml         | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml b/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml
index 832c030a5acf..b13c71721853 100644
--- a/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml
+++ b/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml
@@ -15,11 +15,20 @@ description: |
   The data sheet can be found at:
     https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
 
+  The Etek ET6326 is a 3 channel variant that is register compatible with
+  the KTD2026, but encodes the flash period differently. Its data sheet can
+  be found at:
+    https://www.etekmicro.com/wp-content/uploads/datasheets/ET6326_datasheet.pdf
+
 properties:
   compatible:
-    enum:
-      - kinetic,ktd2026
-      - kinetic,ktd2027
+    oneOf:
+      - enum:
+          - kinetic,ktd2026
+          - kinetic,ktd2027
+      - items:
+          - const: etekmicro,et6326
+          - const: kinetic,ktd2026
 
   reg:
     maxItems: 1

-- 
Git-155)


