Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEB547D921;
	Wed,  2 Sep 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351785; cv=none; b=QM4DQwyTTZUhvJTvhLLCFb1btJe7uO2W/VvJol4nKk+c6Wh44J+bq9t81pFFV2AWWr50wWjB9Ssdn3hev08YbF76OrIMyCZnkBTLhicVswVoCbtZc9OlIYaWclg98agHtFx4E2dbtMaWXSkweISYJyDen1N0rlYV3x/U76Ub9uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351785; c=relaxed/simple;
	bh=zpp8Ug8gf+c1U+7lEVkN08JvuRPPeGMJZs3ojPpU2j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pYqmXODjOUYUmO5MlytmCGoBDzQ819+3eKx2vZGstGHJKZMkLFZG29qev3NMSTfBYEMoyfx9X+d31dobF9ULwiRALIRCMrvdhe9zNl9GJb/+mQB4qICZoWWS9YVDlCWBxjASNguiZz2KZVUmvdkAh0PTV7M0HPsyanjbP9VTOsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=f18bYAAW; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="f18bYAAW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=uiC1nScvl3iA6vnumFZUV7nhckCMS+GwWSo5Su2PsMU=; b=f18bYAAW3vuj8SIEPnIPnL7wqK
	3ow7ZMGTlDe31vG3DUZDfvc1Lo6OpwOrUYR0SLSfgWqx55KV4I3nM8qwEXWHG124QZc84gkcQDYO1
	ynuSDQBAjVq68eQiQSN2Pb2nhqwU3ZcDB3dI4Kri/B7+ehjEJ5kpFXo1jOjDjEcdr20s2LwCZb0yZ
	COy+p6rB0wBUYtvhOmT2PFUqk0aVatIc2AuI3uGrtG0EXZKNm2xEd7iwjwD0XksUarX3sVeOWUfQQ
	9Oa7kkSS9slZJjm9+I0+XHnKLfRK7ZJ7x4JsI04XL7otnLdDC/taD45sB2w57P4HTbZSX3kGpuUlJ
	OjFcUeSA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzX-0006xS-2B;
	Wed, 02 Sep 2026 14:22:59 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1x1jzX-0004kO-0e;
	Wed, 02 Sep 2026 14:22:59 +0200
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
Subject: [PATCH 2/7] dt-bindings: leds: pca995x: describe output-gain property
Date: Wed,  2 Sep 2026 14:22:10 +0200
Message-ID: <7f61e7e8781292450f920c49ef8853b802d76ecc.1788350618.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28111/Wed Sep  2 08:24:01 2026)

Allow configuring the output current to adjust for different hardware
designs.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
index 201f32f1b8139..7569e1b8a38fa 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
@@ -36,6 +36,14 @@ properties:
   "#size-cells":
     const: 0
 
+  output-gain:
+    description:
+      Set the output gain controlling the LED current as described in the
+      PCA995x datasheets.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 128
+    maximum: 255
+
   reset-gpios:
     maxItems: 1
 
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

