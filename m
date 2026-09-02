Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7975142122E;
	Wed,  2 Sep 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351784; cv=none; b=ARLNtK4k5ZD3aSErpupyR+BoFSOxgh9FNHFu4+BuBajoHH1AkYi0tdl1m3TiUp8Qty7a7HTytyzef+U+PbeZeS5UU4+gDnaYXaAOtzWjjL+rq8q1TIKEgSxz+cdUqrKoRyLiXnqnUTLj1LAiJm3L/qZYqmh4j9CciEm9ROWSlWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351784; c=relaxed/simple;
	bh=1EGWCCoHcG3Z2V63F+Myi+iPIv3yloujSomWts6GQlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R1D+EpqO8G20fbVuyyVhbuK1gQ3uCVc7IT+4o3n1BijxhIBRjwgUaUQMK7pABYZxPB/5i/o4a7830DP7LsGa7vv8Fu4Cc0UNllbvoLvyL0ps1ov3ibEha7diGyTSOhCWlHm9TOAAWtnyWAce2YtFKqpUuZvHZjzkMlF5h+kwp1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=D7KnbIX2; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="D7KnbIX2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=XpiLHbEcgv3WSwpwg47u9BSnQNywOfz+zM1suAcBgiE=; b=D7KnbIX2sHJnrfNdD04eyYcbI6
	TRZDnIlDyJQGiOGeUUkJy1syIgfXWMT/DojyuA8fa89HvdvMOCWY+dWYbi9AIUFFDi/1N4o8vJ+Cr
	JannYJZH0Vzl9f1uIztnVM+DxDgouGsJgsNNYQubr/ntfMk2sYZYXgfmu0+cqpVjc1zSJDqwiXpD7
	2MiWdTHxKTIvwzOoVB0XmdcTctWO6Uhw8wpdWtrQuEJtQCyVXUDVjWdMPacqd3XJ/mTL+tlPswdb1
	zYqfAZyovfeTN2QcvrmL+9vETpdSz8f2i3Q96oLOGA1bAFdgC6PEbiQQ1S0vo/HAZtN3kywj/gy3n
	zQPXUqPA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzX-0006xO-15;
	Wed, 02 Sep 2026 14:22:59 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzW-0004kO-2l;
	Wed, 02 Sep 2026 14:22:58 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH 1/7] dt-bindings: leds: pca995x: describe reset-gpios property
Date: Wed,  2 Sep 2026 14:22:09 +0200
Message-ID: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)

The PCA995x has a reset pin. Allow describing it in the Device Tree.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
index ab8c90cbadb5c..201f32f1b8139 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
@@ -36,6 +36,9 @@ properties:
   "#size-cells":
     const: 0
 
+  reset-gpios:
+    maxItems: 1
+
 patternProperties:
   "^led@[0-9a-f]+$":
     type: object
@@ -54,6 +57,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/leds/common.h>
 
     i2c {
@@ -65,6 +69,7 @@ examples:
             reg = <0x01>;
             #address-cells = <1>;
             #size-cells = <0>;
+            reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
 
             led@0 {
                 reg = <0x0>;
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

