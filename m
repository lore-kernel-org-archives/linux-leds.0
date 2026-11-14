Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794696948;
	b=YLgmfrtIdEzMeJy1F8s+CgccawBXrvxf1TqB31dNrfg2jngI5eNsehb9foib7Rp0+gP/
	 1QZP5nbve7ZQv0npUSsgCv6T6Rz64S2KGOZKD/eYfEGYb96klNyQMRRe/7DxRaPhnA5PP
	 XVCV+MF45XISVzRcoZ7B4dtzt5Ugw1/OTA64ZcLo7ABqbs8VEEETOQZXQwzWAAVmptaKm
	 O11rzzH/SqTbGEat9h1PSADY5Fg0Wgx2vLThozO/wHvEje70DjEhciac8htmqHOb0kcCQ
	 RnQU4X0CeUMhn8FBwWKlSp0nMtPUYKyVcgg6+JOvsEbjNqJWfDfCde+oiy+kqPrVZpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794696948;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=9vlfSvYfqwSc8ODI6yi7UL0SJ3h1s4wGaTk0B5VZePc=;
	b=rtmrKpmt76Do/Mf5fBL5fHsDWz6kUNvkvgru8hm+gm/yftWeuOeFNuGsuojBV7dpJd7b
	 oYo4Cfeec3LsJGqdUEUjrtfSQklopKdwDy27w1AVZRTAuRbxysQYj0fKovB6L4QksYpGh
	 nGJakivOoa/avj4uXB3klRFUZA+dWHcXHvKexv+BxdsZbCfQJEBbOLR0LP1zdLPJpl3cT
	 7u7yi9wwOqHhi9z0SK6gjT/7xzfAGYPLvaJAPZdKPBZ7Nm1whG1GBtCOYlHF/lBpRDH7c
	 6X9b7Y/3aydjDAf4mKlU5QI3nXIkMGH+AW/pLXR8T9tzvQq1DyarHPfElxIwDUTrMHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b="RvDF9pj/";
	arc=none smtp.remote-ip=95.215.58.93
Received: from mta1.migadu.com (out-93.mta1.migadu.com [95.215.58.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB50606A323
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 22:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB50606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=RvDF9pj/
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RKdUJFZD9nYfhPbO5gyGhjv6SKsiWNCSZIbQ+/pFHgI=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794696945; v=1; x=1795301745;
 b=RvDF9pj/5W9gQjxbmvxD/JuzdiqbceKHndxr2PKW0ByJtK2t9E2uUVDYlj7Ycd7D6Vfk2s+j
 rqkDrBMK1Uf2MbVCgXPh8/TKpUW8J/5XT1jZlLIyuPFmE6PRAxoVqO7NsegvB9gTK90PYjckWDi
 g2mLvlGyyfEyzOIjpK+myqNQzUhRcX0BD2UA9aqwUxn4QuhYTP/27K5IHwyPpj8qJIyUwsrQnNx
 BKzbNxoQfVZ9f5Gje1kn+4WcEgC/Sf3OWwUBDK/xnYT/WvbzIKg2SoyWzZNHrg1K7nXdPJRWSdL
 3XmpkSL8oBT/QRW+sKf3Vl33h+X/XwrQ4EAaUE9YPnKcQ==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e2131ee82858e725;
	Sat, 14 Nov 2026 22:55:45 +0000
X-Mizu-Trace-ID: e2131ee82858e725
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sat, 14 Nov 2026 15:55:14 -0700
Subject: [PATCH v7 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-aw2013-aw20xx-rename-v7-1-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794696929; l=1313;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=RKdUJFZD9nYfhPbO5gyGhjv6SKsiWNCSZIbQ+/pFHgI=;
 b=HcZAzW+34QUpywu8m6ruxphJZTEwPT33NSZWrLVRtmQIXeW9VsLTEFV7GcdQMZssoDIJYuBCv
 qhfydauzKyNB6g+Klut9DvVV1bPxYllRnJ/1X/xrtmy9f7UltPvX9jN
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

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
2.56.1

