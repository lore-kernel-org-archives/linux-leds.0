Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273E5502545;
	Wed, 30 Sep 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778395; cv=none; b=bZTGrLdxKi1OHNA5FzBxkVTT5GznHspPUCiiFltfLk+TSlE1SfSxVzHNB7G4Zy+XcykfFAGNjzNQSnmixlPJMJzVYLt8TVYm20Q/YarG2nihcbiEB+/jcslxhCvNSkewYfA8Lbv0SMzb+Spm8LvqxInNnUMfmfJtmkiFv2366jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778395; c=relaxed/simple;
	bh=vJi86saIr1/40Et3dWwomOxIHMaM63R74DUM9jlg4H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZOkjW8qTEUXwtgeSwWJSvvYxFkGu2cVVqu6FRwQzd7XzrgRxOzT4LoCE686oVzPCpJztKmjuT4MrvVbNoQuqcclRXNKpsOOI6elweU1uYqQpV9jqcomvICaHlJMq2EMsn4KbYL0j5fmourVEvRaviJOqN2mhj9XzklAraLxGzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=b/vnS/yQ; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="b/vnS/yQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vhXDYtyGCDRT+cNiO1bVxa+AteKhhtDcHPRBs2AsmQk=; b=b/vnS/yQLoZ2Ix5rL2Bzjo/Veh
	5CfM23RPZ7uz0Hxk2Mw0lqJ+LRQ1KDhHnZrxjAQnzQnafycbyL0bewWLAvsv7tNDslC5wYgQ1wzpS
	oki3mUdKyf8YGO1gJFw1wDbmi+cBZxqQYX0WtV/dE4W+0lJiRZX1rAAHmz6WBavkL5Qbr+t8t8iOH
	ix+GeTY11phG+qE2jC0YFPw8D2XYbkYxsBdgoJO7U9xAnzt9xHABOFuawvBP7v1sss1PEucLS8ces
	THeixMJPjnOPG04avt0IXb4ho6wNQzkTdbabOjgG3ioz3AR6SGiJSdtNa/g806OmTo2WVWTUtf2nz
	/JFwLNxA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvG9-000Cod-0m;
	Wed, 30 Sep 2026 16:26:13 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvG8-000MAX-1z;
	Wed, 30 Sep 2026 16:26:12 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Isai Gaspar <isaiezequiel.gaspar@nxp.com>,
	Marek Vasut <marex@denx.de>,
	Pieterjan Camerlynck <pieterjanca@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux@ew.tq-group.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 01/10] dt-bindings: leds: pca995x: Describe reset-gpios property
Date: Wed, 30 Sep 2026 16:25:40 +0200
Message-ID: <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1790684839.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
References: <cover.1790684839.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28139/Wed Sep 30 08:24:18 2026)

The PCA9952/PCA9955B/PCA9956B have a reset pin. Allow describing it in
the Device Tree.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

