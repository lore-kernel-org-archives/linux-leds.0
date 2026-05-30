Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3C233934;
	Sat, 30 May 2026 01:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780103839; cv=none; b=SOiYujNe6bAW+gRVnV8yXi8nBfQvbVmHeA0WKclpBc7SohzNwuGrKmdTW0CLXZu+dF/AvcOKNrBvCcaJEqMoNxp52RKzSQNJgl4kbyPZq+MhhC6unhEVKzzE2XOjVdKqaN0afKDLxaqSLZeNSG/tL/uLhagSVPfxNxEOxUabSiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780103839; c=relaxed/simple;
	bh=44NA6rUhVair067G7uXMUjokLii9afZLzuTWi8578y8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GKepqf0/nDnd3jK4N4Mx3qFdML1k22BKl/sA3oqYlckMuT2/o8oIRsGRNa9qgLhgb8iutl6QKgBbwEqxM1VCYnpVdUPH3eDJ3rflI8n+mhN5LGapYHeSzpYZ6al2H3uYSXkOw1H9biVk8kptErDLZj5o5XR4/lhTgdgvbiqFrAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVXZ8CXS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVXZ8CXS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0797C2BCB8;
	Sat, 30 May 2026 01:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780103838;
	bh=44NA6rUhVair067G7uXMUjokLii9afZLzuTWi8578y8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iVXZ8CXS5fTQxYWC7V/U45CU/xdLNDBdWnA0wWh0z2V+QD1I3MyY2EjIePUhwWSR3
	 oJPgZgkw4NuxCDgTFwibFLMQOCr2AgSPIahGSyZzisiksKcyUNIiRml4CX5Yv6rcxZ
	 23eqAfTt97KcyjtvhVe4XbJPKQWeXEtBCq6rnQSdnbJW18nnxDdrNCIQIZCogv2ZOb
	 7+yz2txHyO7Uq6uHJauhEPiTCn/PHCx7Y2KZuXtfHJbysnk/JFsTcPkXxLIKu+POCn
	 hBjUc9qopus4FSHjc3PGU3EjG5le5xSlFSfXIkHpJgSD4gZLX5/VigNrcmYAeupz+1
	 hX/Ahv+CoXfYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C2D3CD6E52;
	Sat, 30 May 2026 01:17:18 +0000 (UTC)
From: Markus Probst via B4 Relay <devnull+markus.probst.posteo.de@kernel.org>
Date: Sat, 30 May 2026 03:17:11 +0200
Subject: [PATCH v13 1/2] dt-bindings: embedded-controller: Add synology
 microp devices
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-synology_microp_initial-v13-1-aa2bb9c56efc@posteo.de>
References: <20260530-synology_microp_initial-v13-0-aa2bb9c56efc@posteo.de>
In-Reply-To: <20260530-synology_microp_initial-v13-0-aa2bb9c56efc@posteo.de>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Markus Probst <markus.probst@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4079;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=alrwaULuLrijlaEQo59qC6IZr7fepf0GBhjIrFXTxGk=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqGjqcMpahqMRlzruQRKCgpppH4Tpux7t2xQMTC
 W/1mEG5YTCJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaho6nBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9Kbqw/+Oy7iSMDQDR7bkSnQAlMWSvPU293oLmj
 keubOVM1vygTA8V2Or3R5bCaucQRdQqITQ3nhC0V2WnbqSUbKNtLp+dY5Wo2AWYSU3hJz0udve7
 F6q6LNZIXABYVxZAVZ5hx0clJ+DxriLgm0c2BnJ+fZAzL8W24HVfbjC0XaZu+g6Cdvl5aDVUAss
 tWLsp2UEkcxThbEuYr992DuUHweSD0KHEGgudUSNOtENxAI78+Cj/2ZJqqx8dbgCPF5n/KL27Bh
 641q74lfoxF/E7AaZryg6naKmZXiTaWH7R+Vy3BZaZ2WfzhX+BRWjnRoWin4wMvfkV2AiaczFWa
 jETZkK/1IRuo/QYeVObDKIOLc4v2+beqX3EA7CK7e8gXZ8wSvD7Row5Vg5OqHkVERQ2ofMSoJNR
 AAUjRRtdrBPsWHD/QPqgW+ulGv6/c/4BFw/iFQcvM7iNkqJ4sQS1nhW0QlSlVcapY+VBuuy3942
 JQaCNAKFgdSCKoqEgbT+6F1opJUfyKc4OdRAwb1+GcjS7bXLfhqLBw8jz6e01fvxTY/PWILIqf2
 gf0EKLD2UC5ebogi7hdrpz6K57t987zTKekar2fbI/z1xTWctXJfruxdvJuTuVaTbvTtIdec8/Q
 2ABfrQIJ+mthN5TFmD9YzMyDb6M42TowxU7BXzGO6vcrFl0aelLA=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
X-Endpoint-Received: by B4 Relay for markus.probst@posteo.de/default with
 auth_id=680
X-Original-From: Markus Probst <markus.probst@posteo.de>
Reply-To: markus.probst@posteo.de

From: Markus Probst <markus.probst@posteo.de>

Add the Synology Microp devicetree bindings. Those devices are
microcontrollers found on Synology NAS devices. They are connected to a
serial port on the host device.

Those devices are used to control certain LEDs, fan speeds, a beeper, to
handle buttons, fan failures and to properly shutdown and reboot the
device.

The device has a different feature set depending on the Synology NAS
model, like having different number of fans, buttons and leds. Depending
on the architecture of the model, they also need a different system
shutdown behaviour.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 .../synology,ds918p-microp.yaml                    | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/synology,ds918p-microp.yaml b/Documentation/devicetree/bindings/embedded-controller/synology,ds918p-microp.yaml
new file mode 100644
index 000000000000..eb1c9d3fac07
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/synology,ds918p-microp.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/synology,ds918p-microp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synology NAS on-board Microcontroller
+
+maintainers:
+  - Markus Probst <markus.probst@posteo.de>
+
+description: |
+  Synology Microp is a microcontroller found in Synology NAS devices.
+  It is connected to a serial port on the host device.
+
+  It is necessary to properly shutdown and reboot the NAS device and
+  provides additional functionality such as led control, fan speed control,
+  a beeper and buttons on the NAS device.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - synology,ds1221rpp-microp
+              - synology,rs822p-microp
+              - synology,rs422p-microp
+          - const: synology,rs1221p-microp
+
+      - items:
+          - const: synology,ds1825p-microp
+          - const: synology,ds1823xsp-microp
+
+      - items:
+          - enum:
+              - synology,ds725p-microp
+              - synology,ds225p-microp
+              - synology,ds723p-microp
+              - synology,ds710p-microp
+          - const: synology,ds214play-microp
+
+      - items:
+          - enum:
+              - synology,ds425p-microp
+              - synology,ds1525p-microp
+              - synology,ds925p-microp
+              - synology,ds923p-microp
+              - synology,ds1522p-microp
+              - synology,ds1010p-microp
+              - synology,ds411p-microp
+          - const: synology,ds918p-microp
+
+      - items:
+          - enum:
+              - synology,ds124-microp
+              - synology,ds223j-microp
+              - synology,ds223-microp
+          - const: synology,ds118-microp
+
+      - enum:
+          - synology,ds118-microp
+          - synology,ds1823xsp-microp
+          - synology,rs1221p-microp
+          - synology,ds918p-microp
+          - synology,ds214play-microp
+
+  fan-failure-gpios:
+    description: GPIOs needed to determine which fans stopped working on a fan failure event.
+    minItems: 2
+    maxItems: 3
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - synology,ds918p-microp
+              - synology,rs422p-microp
+    then:
+      required:
+        - fan-failure-gpios
+    else:
+      properties:
+        fan-failure-gpios: false
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    embedded-controller {
+      compatible = "synology,ds923p-microp", "synology,ds918p-microp";
+
+      fan-failure-gpios = <&gpio 68 GPIO_ACTIVE_HIGH>, <&gpio 69 GPIO_ACTIVE_HIGH>;
+    };

-- 
2.53.0


