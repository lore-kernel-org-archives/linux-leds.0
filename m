Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977DF48FF72;
	Mon,  5 Oct 2026 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791208483; cv=none; b=g1t0xNrqPUEgUvGL/tV9nGXj7EnA5jGfT5pSdL4iDSlS6f5BIs0Ve0+CH9/QKJTI3WFHwjfL/MFUHOTglirt8ldte/RLV9tQDErwipYRXvQr3D3a7BWA2ou7yW6OGCqUXk6FvBBrqsPkr+IWk6Xl3o+sZXAntyONhKp+F4/E/Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791208483; c=relaxed/simple;
	bh=vJi86saIr1/40Et3dWwomOxIHMaM63R74DUM9jlg4H4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BS6ttBxz4V9jgtasoKYzQkwszoW0HnFbN3dxM7qD+x/T+0MOMk9OfYZCISPjY4Grk3688pGBwWEiiAF6hirkAsJPYoA93dsqVzDro9vIrNNdCyJkg3O6isa6cSpBx5PSTaYVr+ypXYe/suKr+yfT26ov0YDPhWuDq7StsWPMKAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Wa/7GHZp; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Wa/7GHZp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=vhXDYtyGCDRT+cNiO1bVxa+AteKhhtDcHPRBs2AsmQk=; b=Wa/7GHZp5PdoI8qHReM29sTX76
	WJb9Jden/FGqyRj2p4HpW4OjYWeoh0GxvOpsv60C/QoPNBHeMhJsHjSNzJg6sM1Tcskv3XzGC7ek8
	RZvLnvPKPboViMhO/99IVwGohKObJvfHLEE0ruaBJYDSZHMF2O42KmSfgoNRfUwueiBWpudrL4/0G
	Wq2J5VbjpeX5zCik1BdJ/r3SWVyl59ZbAz1VseYCoitacfgzR9aRzBYl4O/k5TN3alFaN1uu0QyaT
	xX7Au/RMhU2wV7LZf3wDnMLZCayx+/OYioECAoksh5QMkFzYnKVzSfwhyk5B97Tm/yz2+u6KgrTtE
	ErEBolPQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9F-000Ox2-05;
	Mon, 05 Oct 2026 15:54:33 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xDj9E-000HEr-0C;
	Mon, 05 Oct 2026 15:54:32 +0200
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
Subject: [PATCH v5 01/11] dt-bindings: leds: pca995x: Describe reset-gpios property
Date: Mon,  5 Oct 2026 15:53:25 +0200
Message-ID: <3e6c859ffad2543243a9d55183e3bfbb9c5afe43.1791207391.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
References: <cover.1791207391.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28144/Mon Oct  5 08:24:24 2026)

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

