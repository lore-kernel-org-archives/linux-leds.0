Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A6D24BBEB
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 23:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824905; cv=none; b=H2juBArcSerggJ7Gp5kuV31bchrcszZyAT2bozPZORtIUg6CtMyHvDQXzBdOH/LKIz/aLv5Xm/N8dxO0mJ98r78PvHfiqbzP2H+QH3UXk/usWJq/3IQAjh0f3JpfFRxwiP6Ws1YozSt0OihauCHQahfH1N3gPxbeqdR3oD3F/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824905; c=relaxed/simple;
	bh=4yD8X7otmgPY0p50cRg0KKsF3jt1T9Ba2/FNtMPWPn4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sqkBaftrB78+G7krOGVKbJb/lo+cPXQSoUlXPw7qfMmXEhEaZgLEf8mFYxfMHOexaUYlUy9f6wauf8LoUxe5mcxyAF1tm7LvSpDBvGHfy9lS2Ig1Z8RU6tTV+CxRjZ84G9apMGyLYdQQ2gAMUkRuDnNiZtB/IHTeyQtSTJJWJr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=e50wt4pD; arc=none smtp.client-ip=91.218.175.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="e50wt4pD"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4yD8X7otmgPY0p50cRg0KKsF3jt1T9Ba2/FNtMPWPn4=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788824900; v=1; x=1789429700;
 b=e50wt4pDyA0RaPnsQ47vMgElfpf2c70D+xM1GP6KwPMNPS3ey7JIHhk9LfWbLDXwf9Ig4BJa
 R12ofNXPJhatOqfZo0JaOFakOsSZIHtpsHFOgYeJzlXbrv+UHqINg1S7OtL7f/mpvsg8Kpze3JU
 lApOT7KlVC1T28D5e4mQzmqY66OELhRbtdcepcVtPHwxChvi8nFPv4IqU9WAIiiwLCuL1c2xDte
 A8rsl9Wh5KIJTy1s2HBPP3fptUDwWPmS2X1EgPTisU7OIz5QqwdU5COPlA3cQzsd+fwliPs1hs6
 HKD3NybbcPaPsse044qK/2nNtO9847r8NDlDKLdxwXnQA==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2a40a3d15d8c5203;
	Mon, 07 Sep 2026 23:48:20 +0000
X-Mizu-Trace-ID: 2a40a3d15d8c5203
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 07 Sep 2026 16:47:51 -0700
Subject: [PATCH RFC 1/3] dt-bindings: leds: aw2013: Add aw2027 compatible
 and rename to aw20xx
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-aw2013-aw20xx-rename-v1-1-c9a7df12a701@postmarketos.org>
References: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
In-Reply-To: <20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788824891; l=1565;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=4yD8X7otmgPY0p50cRg0KKsF3jt1T9Ba2/FNtMPWPn4=;
 b=upptue/4rhtxBtfeRmKOugL1HJgxHSPEhKquBut3MW7Sd+FScwmzneK7+peb+O6y9iK1o5cZG
 gs3hodueEyaDxancvQbehh1zH0DJmHmhpHhku5K++GrqVuCuqdlLklz
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Document the awinic,aw2027, which is very similar to aw2013.
Rename the driver to support all of the 20xx series.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 .../bindings/leds/{leds-aw2013.yaml => leds-aw20xx.yaml}       | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml b/Documentation/devicetree/bindings/leds/leds-aw20xx.yaml
similarity index 91%
rename from Documentation/devicetree/bindings/leds/leds-aw2013.yaml
rename to Documentation/devicetree/bindings/leds/leds-aw20xx.yaml
index 26238446f2bd..f20b5344e3e1 100644
--- a/Documentation/devicetree/bindings/leds/leds-aw2013.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-aw20xx.yaml
@@ -1,21 +1,23 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/leds/leds-aw2013.yaml#
+$id: http://devicetree.org/schemas/leds/leds-aw20xx.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: AWINIC AW2013 3-channel LED Driver
+title: AWINIC AW20XX 3-channel LED Driver
 
 maintainers:
   - Nikita Travkin <nikitos.tr@gmail.com>
 
 description: |
-  The AW2013 is a 3-channel LED driver with I2C interface. It can control
+  The AW20XX is a 3-channel LED driver with I2C interface. It can control
   LED brightness with PWM output.
 
 properties:
   compatible:
-    const: awinic,aw2013
+    enum:
+      - awinic,aw2013
+      - awinic,aw2027
 
   reg:
     maxItems: 1

-- 
2.55.0

