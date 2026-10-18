Received: from out-93wp-a12.jellyfish.systems (out-93wp-a12.jellyfish.systems [104.207.68.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B5F418A58
	for <linux-leds@vger.kernel.org>; Sun, 18 Oct 2026 20:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.207.68.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792355377; cv=none; b=cAh27Xb1s7XRx+s4EB+bOdSlhir8F5VBAv4fMdOhF2VhH9/4nUUWLVr0hoDVIUZkltkQjJ7zYG7+bXMFUPzhxZ4S9V/BQ1ViUeE52npMve5wyAC5xWEH+PaZQvzuQC/gGQP+GVb6niKZLP4zeVYgfRgpQ4eGccFjhKJeHL7JVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792355377; c=relaxed/simple;
	bh=K5tVx83eZko7Hl+sBbrVkmUzvN6AVp1ARz5pSHuClps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bY5XxyHpiSI24TSPUnKGeaar+WCvs9BdEf1/ru0ZiPtXei8NOtwpUg0aUr2xBceTmk472AwRz9pZSeiAavaW+zMs8wcjjhlAiwmcI6qf8aS1dRaWjReAOu4IdIChxkG+fHwFUr7Pum0kRwIh51ATD9hLT5VRON1Zb9PYSAJkZ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca; spf=pass smtp.mailfrom=r-sc.ca; dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b=PWEByqwy; arc=none smtp.client-ip=104.207.68.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=r-sc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=r-sc.ca header.i=@r-sc.ca header.b="PWEByqwy"
Received: from DESKTOP-290OH2S (d207-6-150-133.bchsia.telus.net [207.6.150.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j78Hm18rQz8sWR;
	Sun, 18 Oct 2026 19:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=r-sc.ca;
	s=spacemail; t=1792352630;
	bh=x1Jv6GO0wPuojhw9KPg5KMy9xKjoXPBBoSTMpj3/LZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWEByqwyOcIRB+puisOnF81Sa0mgfaAbahDN9ulzoYKHj5TwpCjam3fOmZ1Urecxq
	 am4a2L7VkuC+rpSKiPX3jlNWjm/wL5DcYofqlwEKLMJI3wMGlZ06CpqlBeD8IFgEkM
	 xrWxa/3GsCxFuhObAhm36HEAq8SCIsyVT+qUxjQgYfBoPDqghID3N1UB188Ul8HoQx
	 wTl7848eyDbt05VVfgT6ZW7O7X91H8dbOIpSc1f9vte1/4oTqsT6OIVmujBawVCe/c
	 ITCrtCVZJooqZ5twRfEEMUqrtU/PjWNRiWwOhrJncKBfrptrzx6xshFITvNn2c1Z9u
	 olZo/gYDBnCKQ==
From: Ross Cawston <ross@r-sc.ca>
To: lee@kernel.org,
	pavel@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chris.packham@alliedtelesis.co.nz,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ross Cawston <ross@r-sc.ca>
Subject: [PATCH 1/3] dt-bindings: leds: add Realtek RTL9301 port LEDs
Date: Sun, 18 Oct 2026 12:43:36 -0700
Message-ID: <20261018194339.132-2-ross@r-sc.ca>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261018194339.132-1-ross@r-sc.ca>
References: <20261018194339.132-1-ross@r-sc.ca>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: ross@r-sc.ca

Add a binding for RTL9300 switch port LEDs under software control. The
node is a child of the switch and gives the offset of the software LED
control registers; each LED child names its switch port and its place
among the port's LEDs.

Signed-off-by: Ross Cawston <ross@r-sc.ca>
---
 .../leds/realtek,rtl9301-port-leds.yaml       | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/realtek,rtl9301-port-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/realtek,rtl9301-port-leds.yaml b/Documentation/devicetree/bindings/leds/realtek,rtl9301-port-leds.yaml
new file mode 100644
index 00000000000..8d6b3552526
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/realtek,rtl9301-port-leds.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/realtek,rtl9301-port-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL9300 switch port LEDs under software control
+
+maintainers:
+  - Ross Cawston <ross@r-sc.ca>
+
+description: |
+  The RTL9300 switch drives up to four LEDs per port over its LED interface,
+  serial or scanned, each normally showing a hardware function chosen by the
+  LED set of the port. The LEDs listed here are taken over by software instead
+  and switched on and off as LED class devices, for port LEDs that have no
+  hardware function such as the PoE status LED of a PoE switch. The node is a
+  child of the switch, whose registers it uses.
+
+properties:
+  compatible:
+    const: realtek,rtl9301-port-leds
+
+  reg:
+    description: The software LED control registers, from SW_LED_LOAD to the
+      end of LED_PORT_SW_CTRL, as an offset into the switch registers.
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-9a-f]+,[0-3]$":
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        items:
+          - items:
+              - description: Switch port
+                maximum: 27
+              - description: LED of the port, numbered as in the port's
+                  LED set
+                maximum: 3
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    led-controller@cc48 {
+        compatible = "realtek,rtl9301-port-leds";
+        reg = <0xcc48 0x84>;
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        led@0,2 {
+            reg = <0 2>;
+            color = <LED_COLOR_ID_GREEN>;
+            function = "poe";
+            function-enumerator = <1>;
+        };
+
+        led@8,2 {
+            reg = <8 2>;
+            color = <LED_COLOR_ID_GREEN>;
+            function = "poe";
+            function-enumerator = <2>;
+        };
+    };
-- 
2.55.0.windows.5

