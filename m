Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246424C6F1B;
	Wed, 30 Sep 2026 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778394; cv=none; b=LWa7iV2nr0ry13MuMREupa+z9nFy6t8auJ0xKw7ulfI2XfeJh6EvjVKjn4iOTvOEBG5L73oYpmMXem0cjGPGgZsHs0P0tt+yDTrLi4ivfZzFIEEtwS+3e0hNhRyHOJurNcfICLLn9QBk3j3l0HlH3E85W4uiA6XR7Bt/WO8xx+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778394; c=relaxed/simple;
	bh=dJQ/OjPO0d9VUJKeS9tCzL5uaO+w57R42kmzt6s02us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OIx/1MHgBcb4sxGwuzg9+F7CaI/aNr0gEhWPNZXzXCqyAIKkH9MruQVOjSHUMsh2PulBXQLmlGU0wJHN1+EFymgxqtlsNyhEWIw391saz5sXk/syV8Hvdf+WjxxpNNEQwS6a1ADHZCxUjnV+u9erlv5BWKNFTeXTDngIn5yrexc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KbxarMxe; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KbxarMxe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=i7k5IvRMGds1MAPqGTDkTv6/b7coFgJ33EfhbQAkbc4=; b=KbxarMxeBnV8OMS37wF6xt0rjU
	J8xRaA02kiJUxjnIa16E59zNmLWhV8CBFm4HmpG/wSuiQWrikY9htbub16bqeyPOLD6vrSlR44eq7
	JEVBPf3vumdZLdeB13ea6fl73e+W5faXAUqC+36wSI2plMwsPQKw7ZyJM4hE+HA5xgmzZM3rh3D8U
	/JzGs5J3x2m7d2sBKsz00OGLPhFK5DzSQb5GxrjWNOEhurk+yBhA1dulPUVQ8k0rAjjIPST531gyW
	clvtgKJfZexWoEW0652+FJeS+fFWVkO+qODJJc2NFsHP7rddWeKkOAYf2P1keAZKKvet8/O1TTK9O
	jJqFSxIw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvG9-000Coo-2h;
	Wed, 30 Sep 2026 16:26:13 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1xBvG9-000MAX-0r;
	Wed, 30 Sep 2026 16:26:13 +0200
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
Subject: [PATCH v4 02/10] dt-bindings: leds: pca995x: Describe nxp,output-gain property
Date: Wed, 30 Sep 2026 16:25:41 +0200
Message-ID: <fd684ef359fb96fd24371922eef64bb7685dbb6b.1790684839.git.nora.schiffer@ew.tq-group.com>
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

Allow configuring the output current to adjust for different hardware
designs.

The output gain relates the output current with an external resistor
connected to the LED driver. It does not directly correspond to a
meaningful physical unit of measurement, so we refer to the datasheet
for information on its calculation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---
 Documentation/devicetree/bindings/leds/nxp,pca995x.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
index 201f32f1b8139..372ecd18043e0 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca995x.yaml
@@ -39,6 +39,14 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  nxp,output-gain:
+    description:
+      Set the output gain controlling the LED current as described in the
+      PCA995x datasheets.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 127
+    maximum: 255
+
 patternProperties:
   "^led@[0-9a-f]+$":
     type: object
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

