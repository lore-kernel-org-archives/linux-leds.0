Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BF634AAE2
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828758; cv=none; b=TNj2005T8VmJP6oOq0Cmx3vJScq1/tBviLUGhM2CPxfR8RuJ7lcVmjCHisicfM2xnF8lkzbx74uQrs9yANOTk18dPGFI5yke8ClR7RzDlQ3SZG9cIIQ/ZmAFMqsjbhKvWEzI5rg0IjteiI5Z2shOH3wi+dw4Vn7jm55UD5XW0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828758; c=relaxed/simple;
	bh=+xCYYkFGQ4JgB4ICZr6PyE2V+kBr+3lOCPplqVBjWes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bxJhP83jYdUsV/fO4ovU8HU2GZYZ7TogPcIqtQUdOME7hxtnqO8CVf2Kvs12bRRZDHspgQPex5DZxe5D9+XobzhXVFxIOcS16Cwk82VwcsDVMu/suMozzGzJu8FiHKbVeFyHkf/S05HFwzWkdNkuEMmOtvuqvUwTPd9pr0d3Jwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eo9QYRJ3; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eo9QYRJ3"
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-59e614b3dbcso3864321e87.2
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828754; x=1772433554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLyVcjdxnN/By9KBCrGjy5x8Jg9Sn7LCgXxWdazKspA=;
        b=Eo9QYRJ3oQ+cWNy1xyZ218YlS+X/rJmtiE9RBqrb/h7Vqwudy+DzlA+hPcrR3EZ/DW
         RgXkvfiUpPhqg6Fa36OFFhaOPSUHe3GtHSh/DtpGMAQRH8DAJKhig+jxGvue43afS75h
         LPTKhj4yZ6hI3IZrTzRnCrL8o45ywqCY73W5KSOGypAJQyqEEL9yBjBDSlmt3uoFNWsa
         eT4CgDunHFq2IJYZ+BL3qsFsGMNZ3sd9UXEKpZgbDZuew94Jn4CjG+sGZY3t28GOm/Sd
         icW0sUfUf9sw0h51U+0qFJ8v0Uv/cgkWF0yE1TNYvjVOU35OsNk7EuzzDGzzuY2dkRTp
         Pg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828754; x=1772433554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MLyVcjdxnN/By9KBCrGjy5x8Jg9Sn7LCgXxWdazKspA=;
        b=d1e5VTAMhlDN39GEj1LPw3yoxkZBfAmJVs4AoU7kL7VnEKins1RjX621fWpA+hqqsl
         on2K0rof+OCdCfLU6gROU63fZUH23SCRhfKz7BW5LWIsfdb/T85VPEwtTeHZgx7XCj7e
         ZnLOTBi5y/+D5ykbxiYofKt4WChfN+f9+iDJJwn3px8XugUA+fIZDDPdEavjXkZ1DP0p
         aHtxQPnYEFHg/SlfIKWdgrAbAMRiPb77aneLG+SxmuT9qiAawB9PS0hXJTvPmV6U7ToB
         Okh+Jgn1NZIUDUfFBbpVyH8KvSgqNWlIazb/m9DXqaPGUOFGaInwkf+qNqs+IEm70qof
         I01g==
X-Forwarded-Encrypted: i=1; AJvYcCU6/BkapZLlUgSSNP0sOviKaHJ8nGRbjzbcA80QUz1ICBgO2tRHTDjGvmc5uWUzNgd8IbE1xPhnvlTR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2R125LEDZ/w6asYJnjLvVg+vI7MURyUmZwgkRPECNC/NNvo4z
	wiPYKfpYpXF3+WIw34CjgftisAo5YSQEibxYiONpy9y76Dykpg2L14Tq
X-Gm-Gg: AZuq6aId7AjuRbnQ89g0JVpLQVxqEpYoK112tD3ep6KY52twHsdXJQBBSFmGjc0BVgB
	BvO6GFRUESLfiFsfyAzXOreLUv1/NoW6PyvdbUyv2mAAVa9sDOhj6UWZyc5CJRGy6tbpWqaMdfh
	VxJztnTvUigThUFjAWY8WsaFN/5T9UmvfuDOZghlQN85gxfyNLyjxqte2cRhN5FYRzi1iP658oU
	EOUmftci5Dws1e73qlecLfecNYr7eWdBZV9csuYsTycaRpGlxcXzDTrQ+dP3c41pcKY5u7Z0ZAw
	9awurJp/R+7tW/epwQ/rn4m/GTHD/YeCqA0dWauJUu9y7OsOoJNRMLK4x/0bwW3SSstg2Wd8qU7
	qIwR764TXHGcyGKU0lh6HHq3xnECC+ahQfiDF9C3V/vv1LlDi2XyNtMylEm0tgvdpgcBSmpBOeT
	S21RVc3zOVwbZxJHnyMGUkqZk=
X-Received: by 2002:ac2:4bc1:0:b0:59f:84ed:f1d with SMTP id 2adb3069b0e04-5a0ed87df5emr2535363e87.14.1771828754254;
        Sun, 22 Feb 2026 22:39:14 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1369626e87.23.2026.02.22.22.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:39:13 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v3 5/9] dt-bindings: input: cpcap-pwrbutton: convert to DT schema
Date: Mon, 23 Feb 2026 08:38:54 +0200
Message-ID: <20260223063858.12208-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223063858.12208-1-clamor95@gmail.com>
References: <20260223063858.12208-1-clamor95@gmail.com>
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

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
 .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml

diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
deleted file mode 100644
index 0dd0076daf71..000000000000
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
index 000000000000..77a3e5a47d1a
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
2.51.0

