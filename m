Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4F6451064
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627832; cv=none; b=Mg9OS53o9X3VdFSN31ZJi9doXRLGQx2lGr++pCP3Em7hIIv2t/9X49G0QeL5KOe7poErs3Jw74g4km+SnBrbnO71sNLjsmSFKpCWRTu9p4BeF1qoA9G78GigjVYICCbLl9UsXOLqN9263k9XmJs5PGrjG5OWxLB6QzGhoevsm+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627832; c=relaxed/simple;
	bh=EC9J2p+NWdZDh6qYGElGwH6uNYtFbFpKeCl/eqIzYmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=obTj9GeRS/UQzrTzVRiKbl4J0cjZTxXAsozDvsa0k3wNAXIs7Im+Ms38FtWalWRwZ+8/E//prhUU4uMdDzyQ2gRkOWMUyk86atiTD6ZWyNr/SZHLioCqgH1wXrsnmnKxetaS3SKTu+klWseod8MJwoPMtF5sZDVxexkkyAPV4QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xo/KaNlI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xo/KaNlI"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49558ce01afso20056145e9.1
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627829; x=1785232629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYy6S/jtdoMDjLal5OCIm5ySlpSkJxRegyQDC28P/fw=;
        b=Xo/KaNlI8nNPRqU3PJjLcJYq5veMq44xxwsQjdCRR39E52ZxElB7q1k+9mQEvatlCW
         LEgxtKFr4YFxX9C4JvbN2R4OC8/QwnnfMoy70U9MeWC2aSj4q+YzjklEPxDyfyF9DIsN
         gZEszJ4eZqyd2UjRlUehU8n5xlxWtEJfvUT3p+DbF/5Afb426NIz0hyswgnzVmNsfcfA
         95MS2pIiYX0ZS+O8jn3SjFMVtbKdw8etxoJqnkVcJ96XFxYeU5Gr3yXoXot5Lm1oByL1
         oOLMxZOsYJLuJgtbTmkq8ji5Jn7cNAw/1u+3mEXE2aEIe4pzkcqkD/9zrV6mlPj/uicz
         V0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627829; x=1785232629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYy6S/jtdoMDjLal5OCIm5ySlpSkJxRegyQDC28P/fw=;
        b=MtWeedx4izsCJ0xzjtKFlst7H28p9GE0d8uNEfFddxPRf0siNtnVDz/Dgsv0gm3Ltg
         +dh+t1Y4VKWnUDn9pOSFp3BpqlaVxmtYuzLkweOjwhA7BPMgknlS8oR9BR6xdJbZJ77C
         ExTyHI14vLyOWQxv6k6qqvluRnP+Ktf9z0W8rahjLjhsmsQNXjVSn6CGTWgQ7iBK5FH7
         9EYzeCA9vUivKqqpeyDFaoONVatjfs9uhtAEbunAfXaRCIuCoNBLbLU6TBHQ7rUp946+
         vYiVSBcONrSfoUqyLB8Yl8wMClkN1UAE5jV6TScgrZJs+H3VzB1+QWFlj0CmyFgC/kXm
         oWPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqsTbceM5xhuatX3d01bbRDxljDcrwVHhEP+W0lHTnqdwBM3PP9YgIdAGZQ54GMVejwiqOom5mpocWy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6RPwAEXf88OVCWjNhdvhS3trz7mRGhi+ZvZgW+gom88eduN+R
	0huu2iLHzNhF95gEy0Dhdimlz1TPU5bh/qKfOdyUyT1Sf+pJe/GGQI8R
X-Gm-Gg: AfdE7ckVM3U34AOhfzaqQIOAGJINIT1mvt/j9PcmU64o/ik1sDno34LsiB0E36SKyyw
	FpMvRDBgl6xtFOmuQeN+nKwRaxDinTD/gf9sGnM+i0ZWJ5YzEUne5aTcfFJK6Yrty5Z1UOJBTk8
	mxaO84YQELaNc1xYLDjcBjLB5V+CSMmjEc/rNWlFhpyFoIF+FO0RQM3lO7ldkmA5+tsrI2wThl9
	mJAR4gmKWD1fR39rk8r2Whh3XBlTVwLnOQvRxV0RxcvSKH7KjMBPz95w36YkGeXVLHb41NYg1Wu
	NkdPjGfmG75ZxWpcGxV3pYDOBbgvtZfKZoJCxoD0zWkxdjdW7xzkompwpYNmSDr8H9ZiFw1ykds
	SjzprpBJ956vMMf9gb9ifDIepun5l4HPd6FghpNqIScFkhckKV0wj9gxg3fOp5ABBnZXoN2DZRw
	S6y6ja8LJLKnyGO9VUchvFn6JKI2fenst4tg==
X-Received: by 2002:a05:600c:4e8d:b0:495:54e9:c080 with SMTP id 5b1f17b1804b1-49554e9c2bbmr59276625e9.31.1784627828522;
        Tue, 21 Jul 2026 02:57:08 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm227476185e9.0.2026.07.21.02.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:57:07 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v7 1/6] dt-bindings: leds: leds-cpcap: convert to DT schema
Date: Tue, 21 Jul 2026 12:56:48 +0300
Message-ID: <20260721095654.429346-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721095654.429346-1-clamor95@gmail.com>
References: <20260721095654.429346-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert LEDs devicetree bindings for the Motorola CPCAP MFD from TXT to
YAML format. This patch does not change any functionality; the bindings
remain the same.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/leds-cpcap.txt   | 29 -------------
 .../bindings/leds/motorola,cpcap-leds.yaml    | 42 +++++++++++++++++++
 2 files changed, 42 insertions(+), 29 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-cpcap.txt
 create mode 100644 Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-cpcap.txt b/Documentation/devicetree/bindings/leds/leds-cpcap.txt
deleted file mode 100644
index ebf7cdc7f70c2..0000000000000
--- a/Documentation/devicetree/bindings/leds/leds-cpcap.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-Motorola CPCAP PMIC LEDs
-------------------------
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-Requires node properties:
-- compatible: should be one of
-   * "motorola,cpcap-led-mdl"		(Main Display Lighting)
-   * "motorola,cpcap-led-kl"		(Keyboard Lighting)
-   * "motorola,cpcap-led-adl"		(Aux Display Lighting)
-   * "motorola,cpcap-led-red"		(Red Triode)
-   * "motorola,cpcap-led-green"		(Green Triode)
-   * "motorola,cpcap-led-blue"		(Blue Triode)
-   * "motorola,cpcap-led-cf"		(Camera Flash)
-   * "motorola,cpcap-led-bt"		(Bluetooth)
-   * "motorola,cpcap-led-cp"		(Camera Privacy LED)
-- label: see Documentation/devicetree/bindings/leds/common.txt
-- vdd-supply: A phandle to the regulator powering the LED
-
-Example:
-
-&cpcap {
-	cpcap_led_red: red-led {
-		compatible = "motorola,cpcap-led-red";
-		label = "cpcap:red";
-		vdd-supply = <&sw5>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
new file mode 100644
index 0000000000000..c8e7b88a05ccf
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/motorola,cpcap-leds.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/motorola,cpcap-leds.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC LEDs
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. LEDs are
+  represented as sub-nodes of the PMIC node on the device tree.
+
+allOf:
+  - $ref: /schemas/leds/common.yaml#
+
+properties:
+  compatible:
+    enum:
+      - motorola,cpcap-led-adl # Display Lighting
+      - motorola,cpcap-led-blue # Blue Triode
+      - motorola,cpcap-led-bt # Bluetooth
+      - motorola,cpcap-led-cf # Camera Flash
+      - motorola,cpcap-led-cp # Camera Privacy LED
+      - motorola,cpcap-led-green # Green Triode
+      - motorola,cpcap-led-kl # Keyboard Lighting
+      - motorola,cpcap-led-mdl # Main Display Lighting
+      - motorola,cpcap-led-red # Red Triode
+
+  vdd-supply: true
+
+required:
+  - compatible
+  - label
+  - vdd-supply
+
+unevaluatedProperties: false
+
+...
-- 
2.53.0

