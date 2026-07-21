Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB19451064
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627835; cv=none; b=SctsZoyh4uadqLTWPe5NM3Jo1hWDVkYQQKdyEXAoIi+FqBXO0+96Ce3AXHstkUqmK8GiVcys4Wc11NgHF1UXBQAqq4+R9JCGZnY7j3jSmC66n6CtcgdQoXfwGBq98AgCmC7bFQq/moQlmsk9iMf1PO8K5JN4SXUxIHl4NTMnc68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627835; c=relaxed/simple;
	bh=RBDHYLiiGGp3BaQ8/XtDl9OWbQotU9JbN3S+l/s0tUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WxYGjodqD4mmWhTLkBOLfkj7+/kbqyvszbLdy6pwtM0XVZkAOpbCvXkpxeGSO1LFbc0Zdqdm+VrAbDqnWK5U5+mq5n05N8pas4iq94WstNJ4SJ+SVM0wzh4fyGLLi8JVccpkqEen2SX2NUCCfTaQ+kmX5Hgp/ttBCR9wYjeTIa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwxNAxRn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwxNAxRn"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f633e6058so3657880f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 02:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627831; x=1785232631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQ1n8qBbrRCl6/QmqbC+EltxCalkkOGHUFrRH2C/N8I=;
        b=UwxNAxRnLMDLNFc2iGRELsDv3XCzrgvLKW87DAPZPO4ItUi6lFROh6q7nA1ZSGWAH7
         1YMUApgVzLsfTid2oTNUO4PsqFNpcz06yxQi7EbOtDDKzyt3uZ0cy7dNWYPNDWBOnQPE
         1M/qoM6TmMePbZWO/ZRCsGzjgmNg55kCRctwg3t7WlrEotqsSoT4HT0QXn3VVzGpO7Lj
         hSYAkJPEHOk6S0ZRCffApDbnhWHkLsYi7C0JoVOb0Mv84hUCVZewO1C9bsccDzC78IxI
         Smxj9fsbKgb/IeduTaLhkulNcYjBqmfBE4k+1NSyJ/yEyHQE2xJ5pmPv5fcNhh65qeWs
         VYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627831; x=1785232631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qQ1n8qBbrRCl6/QmqbC+EltxCalkkOGHUFrRH2C/N8I=;
        b=qQek0eiu+YW0QuwfHOzBMwuIDpaunvCFeafGSUmMXAgKWlWAN4zFr4twnwfG+fXZni
         BxDHJofQ2AxBKw/Mf+7bT8Ny6VvdHTNk2gkWFVzxSgQqdDNzW0+5Of14UlxUAJ1rRfhX
         wIpIA9MRMpg1oG7vmXiVx3jNz3cKk1WuPwKpbwnI9vBaaMWz3L1G2zGj/maolLfxk/wl
         lNwHLWqfPxHhVQP/neY9wBo8dsUZA80YDQ2lwQeW4hWpixSiUMeeA20SILre8zfUUyDb
         GcfppCAghZ6HGs0VS+u6RXCOkg0KjeV9eW+AIchf5rGWvGFj+uUw2rHkVpD/kECcO6l/
         rHlg==
X-Forwarded-Encrypted: i=1; AHgh+RpDhHVUzhlXzkWKsiOCC7MjzddXK/r1W/dA4FtFro2JtD1pRaZuUy3EcxV+9I49mydgJL9Eiz4SJfqL@vger.kernel.org
X-Gm-Message-State: AOJu0YyeW8IV5fpeHwfr6l81xBM3mL59+VzteHWYAH8RKMdJQRMNWqoj
	JuPfL+8Or2WCgG9I5GCAcoPBX+APnObGmxFZCHpzeIEaeh6Eu/KV1mvm
X-Gm-Gg: AfdE7clNRLEgfU5RQ1neRtfwFeF3csJS2rAtNC9a/9A61l5K9bfwhXe0k5a5VSTWpwc
	GjP05zcR1K9Gfqb8lDWWt5q09vL5+Po+N5l/8P0TrR8Vf0DsBY2Zv+TOxlcOvpkodFyD6X6GIef
	T52IkRAgcq26z10kjHTUzLrr5PgXzSZujl1OhUOzPC/zGGfVs+YvDW6TVUNnHdFT6YYBmH7Tg+l
	8NKuHx3tuz5wiaGpbQq0PU5kkStKkErR/wCPLNjF82L05uLAj3Gy5kBJ7CzKcVbQ7fW1xMevnfn
	KsKclXrN3oEVCkz/tcEL/7TxpKjE2hmMpOuJ+rkJUYY99jX1I4ujNqqQccS+UKSMOXVo8m+fo2c
	2HciS41qACS5RXLqCTluqhWsx/V8pbV8aCIppQp78G3cdRLymSNQKi7eCxr/zM9eP64+f+E8H0q
	lgl5KW7+WHcwYZEd25li+0DGw=
X-Received: by 2002:a05:600c:1f8e:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-4954a513f80mr185203615e9.39.1784627831197;
        Tue, 21 Jul 2026 02:57:11 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm227476185e9.0.2026.07.21.02.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:57:10 -0700 (PDT)
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
Subject: [PATCH v7 2/6] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Tue, 21 Jul 2026 12:56:49 +0300
Message-ID: <20260721095654.429346-3-clamor95@gmail.com>
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

Convert power button devicetree bindings for the Motorola CPCAP MFD from
TXT to YAML format. This patch does not change any functionality; the
bindings remain the same.

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
 .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml

diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
deleted file mode 100644
index 0dd0076daf71f..0000000000000
--- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-Motorola CPCAP on key
-
-This module is part of the CPCAP. For more details about the whole
-chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
-
-This module provides a simple power button event via an Interrupt.
-
-Required properties:
-- compatible: should be one of the following
-   - "motorola,cpcap-pwrbutton"
-- interrupts: irq specifier for CPCAP's ON IRQ
-
-Example:
-
-&cpcap {
-	cpcap_pwrbutton: pwrbutton {
-		compatible = "motorola,cpcap-pwrbutton";
-		interrupts = <23 IRQ_TYPE_NONE>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
new file mode 100644
index 0000000000000..77a3e5a47d1ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Motorola CPCAP PMIC power key
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  This module is part of the Motorola CPCAP MFD device. For more details
+  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
+  power key is represented as a sub-node of the PMIC node on the device
+  tree.
+
+properties:
+  compatible:
+    const: motorola,cpcap-pwrbutton
+
+  interrupts:
+    items:
+      - description: CPCAP's ON interrupt
+
+required:
+  - compatible
+  - interrupts
+
+additionalProperties: false
+
+...
-- 
2.53.0

