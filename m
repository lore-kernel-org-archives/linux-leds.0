Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793585584;
	b=GGQA5nO8ugJKQZkKZLKpaL1gFEGza97lR9o3Mxhtgldje4sROwSufis+gY4uQF/RzDoW
	 2j9rHOpcZ8fYW1Q75vtDBMholDx9f8RBOthd8Z7xpgzOq//NS8+ASC6wWT1slOg0EIsmi
	 Uf2OcX7vKgVFYPbt5FOk0GnOvAUt7NScr+D+QnxPf5fJ3IExvrOYum2Lw99AIzbgdD8O0
	 Co14WlE3jmSpGnfZOJTxPYs324Iz8Rrt43Zbx0yvnvVCijcqaKAb3JqAZ5AE3gyDWySu/
	 rs1+SbytLWl0xCvCvbcNJ1shVU/x+A98Bl64CSr6dEWV/3bvXmhveF65IjUrgPbtoCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793585584;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KkQIqA8IXrJhkxBQ9cT5+iFl65IXcfeXnLQ/FTq4aVU=;
	b=PnpJzGYOC0xdDRVPOF5d329wKgvtfXpsxv+XcAh8ELTfVT1RP2dwuFb3SJPUBLapzRFG
	 SkRBYymisK0I8lChNSATK9TMRDPZ/AYBlYc1CAYVBkOncrET+fID5t5GR5lHbPRcPOVbU
	 r3SOsifNWcsAMxAmUiWIxTRAr6J64zmWjDRvJh905YDNzwuv9sXv7znM1OYSiXQrGPKsf
	 CYnuyOK2Dt/Zu63ZGy3i98+xUEFOUiq/lSwVIp5qoNi9CjqI6szYsoM5MCS5D+szZn8uD
	 chZPR/bW9Z9zxbyTbIitMQrT69Nu9clIBUgQYG6j6DV9/YKTkCwai8AJpq+vVKGNR4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJOomMTs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE77760A2633;
	Mon,  2 Nov 2026 02:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DJOomMTs
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793585583;
	b=dMUpUbDRo3upUZouRI9807u+X9wFM5/8N23jEmHaVOv18t0CWbKV591x4EI6hoWitfFv
	 ySHB07ucxV48CWtQ+vKLBnvUqmL5IJRvQ48AbP5Wif0OaxVdtLqvXHU3GbgdNSAjiAqFm
	 lMUfyYEIZ3Rf6JLW5MFk9GzcaEWMhsRRldDBt6Ct5aVHLxlSp6+UJHKKlxjVzp1nthI/C
	 K+3q5ivuePknw1Ijx9yDUxsQPHemp7/jBliq+wDw61scfj1DoZDW5Ctbi42ZXfR+vsgs3
	 E+ttMMV9CgOe0JkeT5YBNEYyxRYgQ0OHd4t/I/QZpCFeA7M7NCQ3TOhhf7ALQH+hkAA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793585583;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KkQIqA8IXrJhkxBQ9cT5+iFl65IXcfeXnLQ/FTq4aVU=;
	b=q6X/TovcIXusEiKfMZ4QzEMskhkIbU3bwejVBIJG6MlCRCSck0WpUqrMldjssEW4VxsD
	 jPENSb9ZKDJNB3DgjPjNgN0VkYdUmJbLb9ParlSi7VTJhAHp1JADhgCbFcVRK68tXb4KD
	 d68K0c6mkIWcAmCeHaDPHF+JQ3Nm+XXB0xHzOUq99GEtK8UBsSTITr42d44bmSyNIRVf/
	 rmb84n2EFVMl6sFS64QLTSpRr9CspR/1thg/8ckc0Yh0A/Kgfysl8v2vEpyZuWfFZxDaJ
	 z+JJaAupaHzmZn0qEPfzT+kpQhfHfa2UuBW/67lwNPGR3Fy/F1e834U3f/v2KgDcM7Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B51791F00919;
	Mon,  2 Nov 2026 02:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793585583;
	bh=KkQIqA8IXrJhkxBQ9cT5+iFl65IXcfeXnLQ/FTq4aVU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DJOomMTsoSGXyEJ6G9zieItGkEvlLF+Rw3x0MQUu2jkDbOWbuQKR7kO1x5FcoWSHw
	 qbN9b614Y92FZVdB6ki+FjJsSyCIz4agw/uYjwDrO8ECrNUi1ERbbDaKxYan51Cb68
	 qSjV25U43I8/zozUVnEAgMRvsekasdaGqrEkOrIp3Gyq2BH1QcSGC0XULDVBDK4ADJ
	 aTKK2cy5w4l/kCAcNf8zfrJzxYGULRtouzkv3YAUEGN51nJy6J07MuPe9lEM7CYtIm
	 CxjPLya0pAMW+dA64O3k2YYLm9yEGdveLOINNzXGB2sm5cw8LdQh8EmB8C7SyeNGai
	 eNz8cEfOmYG2Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 094734631E;
	Mon,  2 Nov 2026 02:13:01 +0000 (UTC)
From: Joseph Telaak via B4 Relay <devnull+joseph.telaak.dev@kernel.org>
Date: Sun, 01 Nov 2026 21:12:29 -0500
Subject: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
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
Message-Id: <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793585580; l=1649;
 i=joseph@telaak.dev; s=20261102; h=from:subject:message-id;
 bh=HYICjmNxdFgdqcylXUNcK/S8YiVsE//qewc7WXLDhSc=;
 b=TA84/zemQUt29lSHIfaBvLiQqex+sJNhDwoZZHydp97qdF8iqoXoVX18Pb0crlRBXlPuZuy6N
 FBdBBEsUueiC06gUOdWNxi5h8VvtrQOnV4n2UO1VwGqwI/hsf+HId0j
X-Developer-Key: i=joseph@telaak.dev; a=ed25519;
 pk=OmwSusdK4grZpiuZVfCZAvYyqz9FBkNemsV1EnHyVr4=
X-Endpoint-Received: by B4 Relay for joseph@telaak.dev/20261102 with
 auth_id=1382
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

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 .../devicetree/bindings/leds/kinetic,ktd202x.yaml         | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml b/Documentation/devicetree/bindings/leds/kinetic,ktd202x.yaml
index 832c030a5..b13c71721 100644
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


