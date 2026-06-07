Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914CE2D0C7B
	for <linux-leds@vger.kernel.org>; Sun,  7 Jun 2026 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845628; cv=none; b=SFShgeIyJi++qmZNJwyMaZcNcqrIh1UQ7MF3kT6glFIUMEOsB6IsdQTXcIhaxY4RS2o0p2lS663t7q33lY5aV9g7ltYIFr/ucr1hMpk0/auVigI4zrEdQTNayUZ532kVCf4wJSWyfssSpZE5YQTB5eggM3f0qmsqsjsZ8THlqqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845628; c=relaxed/simple;
	bh=tqRyoaZBs1tvjQrY9z9TFd/uxGf92frpQLPL1VyfqU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a+s7nVmyNMtUE3q7SB0ZLdMx1FQ7oDMxNwOKJ6HrBekX73D3nwo3yF1q2ju+O/KCdnl4bEgwWJo0+z+tF0cg8sUPBOFIiGhxCp73AQwgG1x6p2tG26nH1RqVsxmXCEdY86b2sXC0i0JSD8j9MyYJmUSRZw7oAV1sPuWdDKnnH64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hyqp46Oq; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hyqp46Oq"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so3070795a91.0
        for <linux-leds@vger.kernel.org>; Sun, 07 Jun 2026 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780845627; x=1781450427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=Hyqp46Oq8KWqJXrSwPUWUb3qxVpg3GcXChKeASFd/c4MoO/YA2KVjGhmXIXsugneVT
         2V8IN9ZhUAAnMAGWn2/hd1TWIxww2nW9e9uwMgrCegtOmKVudokQ2MdfLPcjFqO23wrX
         1wU1qo7up56vqjcrs48TUFnC6zAabKWNL6a9o3bhs9Y5FQPdHE7arH4l2usUvqbFZIYM
         DNfk0PMiAx14aAYk0HN/VvI8fFxUHX/PLn9I+Pd0oygrJX4dCfgKD/JQNdezv1CHXfWl
         JDS16dtqzzV6u7bKMBJrg4DAY0EPNHvEHb0eV2HMi4UlmoGkOqYtKpuuWCmGg1EgzdNc
         lxEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780845627; x=1781450427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qC2QIpvU6HmG8jsTK89YMedFfyyJiHf9gc9ctAYYQYk=;
        b=H/Sefe+ra57OEbE4nY5ORgM2H02OiEzA2ZICv5s7hphMOYFjNmogLCUSuYLeuT6UiR
         Y6x3qfMLGGihd8nkCuqNY63MzYLZ09Iu0+uMWq5srAbE0kGZPYqLB/pUHDGsFf/eQCcJ
         IeSjYBuBOlS93Mt5Loy6dukieQ9kSqJmgljRkbLdVqCVN9lPB09leqeGSNpdz7uy0kQm
         UUB79Ck266uKX+jAVMqzRJa60DA9o999JRlFoM6fkZOGcl8xp/jdH++gME6WhGje/usi
         ZHDzhZTo9txTd4T7C0W0SjW0jQ1NMbBhH79cL64UssvsbXZYsPjzdRXjvP69V5ZcOLAm
         Z8pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9W4bQtcR2UFTIt1UsWTnr7U+1AQPiYeDk+8qv4yWIaQIN5uF15VZ1SYqr0HQrohtTBafwkftlY8DbM@vger.kernel.org
X-Gm-Message-State: AOJu0Yxms6Ju5EaAKNKM64BB/iOHG7NGbKOizRHmY+D274TlohBJlUF0
	RwazTrZLn6jHUMX6ozBO+JrFFrbA311cA2T01tNaEMPsVy3OWox9gsoI
X-Gm-Gg: Acq92OGk51IuRFg+6a5mLiNoOLxW5HIyUJy78qbu7ud1vUhp6BNSw5Dz0C4t9TcBzHR
	YDqAJoy1/aQgkePtnGp0n7vKx28SIRF8CUCGuNCanTxCB00nXPLtGZHvKXYUwXHp0X8qM5ctJSU
	ow2U0lISX26gsM/kXDpR0/4+/NsfmLqvRbaNkvEEmuGukOPQzqIVZWlWPWn7Wx3cJPMHOit9hyT
	R1X3RBON5+DbMEnIclUjW7xYUmECS0GwVTyLq/0fZmU7UmS406/wl5FvVYa+SOkZE/criNZiM6U
	QiSjIsk+UWe07kZlssFtjS9z+Dg1rfsXh7oTiQQodUk185dxWCIqdEWfxvqxtSJVqLYrDNyOMMp
	DD2xDd1TeZGnAwTmuUR7Faw396FKmdnTS7KQ2YgVdmvvXpQmx1ZLx5b5PLyOUOp8j+oMPlJaggr
	iH2SZ5/n5zTI/DICgBsfu1DD5oHepWEODvCU/uKEVCyR23Qh5h57vh/UeMdhkD
X-Received: by 2002:a17:90b:58e7:b0:36b:936e:73c8 with SMTP id 98e67ed59e1d1-370f0e4ad33mr14187674a91.19.1780845626785;
        Sun, 07 Jun 2026 08:20:26 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a54:e741:3a5a:3245:d3dc:4b5d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37135861581sm4130659a91.2.2026.06.07.08.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 08:20:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	luccafachinetti@gmail.com,
	pzalewski@thegoodpenguin.co.uk,
	daniel@zonque.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v8 2/6] dt-bindings: leds: issi,is31fl32xx: add support for is31fl3236a
Date: Sun,  7 Jun 2026 23:19:58 +0800
Message-ID: <20260607152002.446617-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607152002.446617-1-jerrysteve1101@gmail.com>
References: <20260607152002.446617-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an additional and optional control property for setting
the output PWM frequency to 22kHz that exists on is31fl3236a.
The default is 3kHz and this option puts the operational frequency
outside of the audible range.

Co-developed-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/leds/issi,is31fl32xx.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
index 81f1e30e493d..5f22d8b77edd 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl32xx.yaml
@@ -21,6 +21,7 @@ description: |
     https://www.lumissil.com/assets/pdf/core/IS31FL3218_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3235_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3236_DS.pdf
+    https://www.lumissil.com/assets/pdf/core/IS31FL3236A_DS.pdf
     https://www.lumissil.com/assets/pdf/core/IS31FL3293_DS.pdf
 
 properties:
@@ -30,6 +31,7 @@ properties:
       - issi,is31fl3218
       - issi,is31fl3235
       - issi,is31fl3236
+      - issi,is31fl3236a
       - issi,is31fl3293
       - si-en,sn3216
       - si-en,sn3218
@@ -37,6 +39,12 @@ properties:
   reg:
     maxItems: 1
 
+  issi,22khz-pwm:
+    type: boolean
+    description:
+      When present, the chip's PWM will operate at ~22kHz as opposed
+      to ~3kHz to move the operating frequency out of the audible range.
+
   "#address-cells":
     const: 1
 
@@ -60,6 +68,22 @@ patternProperties:
       - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - issi,is31fl3216
+              - issi,is31fl3218
+              - issi,is31fl3235
+              - issi,is31fl3236
+              - issi,is31fl3293
+              - si-en,sn3216
+              - si-en,sn3218
+    then:
+      properties:
+        issi,22khz-pwm: false
+
   - if:
       properties:
         compatible:
-- 
2.54.0

