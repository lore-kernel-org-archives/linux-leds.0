Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC934A4830
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915504; cv=none; b=nPDhOjTSOMCL7io5cw3UaWqy2gFl2zOwQlUeo8SLX5juqu2wyBh6SoLDZvID444x3T2IGw6eywXcIAQR28B759b5/xLKDRQDNmSyz1/RkJynGvm0GLG7TAf4yNn67jYNhIxupISReO6TGPF6Z1tu2HiFkB27fHtIMwkrf7cyiKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915504; c=relaxed/simple;
	bh=8P8wMFD51eL/Z26XPFzVuRJ6ptZ4ugBGIA3pAZ7sK/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdz1rGxzaz4Aarr+f5/DHqDc8Smcb0Xx20zuYe4mBJnKYtzDHxCXJnF8AH/IWi+lUqgOLulFuNa9I8hbVooLVmY6xlXPo2MyR0ZY/3Ug5IlRCCvjXaZrXQWkVTV+yzAWB6HO7E7ECu/3NpemGAgid8rqdro6LfE65rNFXANbkdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsXi40xH; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsXi40xH"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b02a2359aso3090948f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 11:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915497; x=1792520297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPweYRO+AA51z02Botwdqdgd38/WeFQ6rWWhfhO+GPc=;
        b=SsXi40xHvzG8/XruY/yhZP51+L4CumK6Ohsc10c1BLaywh9/CmgDUNfehe5U4brPXe
         E8naqRZQ1O2qaFG8wtra3VlBaVmrbzeuB2RQfJRB8broMdNl+2/lgjyv4YhCd58kP1Az
         YNSQvNamn+fv4t60rVpEOav/jkpv/uC55VWay/8JN59cI5/VHr3XrHUiZeGDnIPMcSZV
         mPgExRIVAu1XOLWGmV+lRBn/uljcWLGLRiRQBaQdAT6+Y1xI3hX744nhhE4D+CGXCg5a
         N7NjR++FKoGbooLCyrzkdNtxlW4jyVOlC+QfN1eptmHkw5U78M/KD/qTZcKLFG1oEJTH
         U69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915497; x=1792520297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPweYRO+AA51z02Botwdqdgd38/WeFQ6rWWhfhO+GPc=;
        b=egpZbAKI5bmw6jT2E9baKqE/uir9bHErmuMV9U02hiUIQ/3WCVUo4toO/v0lWNaDFN
         FN4vGtwFifOU+Zn9XnDi78YFYA6fhemCdtWvz3/1ht3GqrC5pJVwEy5eUTfdw3+KNdfI
         juVPIRkM1fFq1TFvp7lbVoedCaEu7BTVPXs+soJxIlKgWo2zQKNgn7p7lt852Urw6Rx7
         qN3lB6bKY7Knh3i3guH0M2XyBvR3LwufyogUQKidhS8fzFyyilO0KRC9uViYq/JOn2AY
         rZcE+STjFtwO+WyE8/6FoIAB6Wsz1FU65FQVJZesJKNvz2KcDKN9tEb+JhckN8JUg64O
         0MOw==
X-Gm-Message-State: AFq9FYIJ4Ri6gYCTqh2VH1j71xPdI2OlOpxHZDOBeewGfcoc1ukyipE+
	+u6Lsk21jxUYhuugqsFVKCPkEk3LlX+PKyGwU4M/HjhYjvwpii2HYQlk
X-Gm-Gg: AYBFou0wWhrXN/UbGQVT/5rSJ0kxuvxXbqzM8Dv3wmqum2RIDTl9dT7BU63CgxmB7rF
	rgGHJmh/sTT+3j8lC+Y9E7X4+lvY7FPJscWKUAQjEjXWk1+vrFQO7EY1u9Uf4gtpEYyyehVW82O
	hqaTFgooioZriAj9uhJGUkIrYeKKY1xJuP03NWY+qCq7aHoXIHe2vcq3WgpdzwRZgjcz2rdwgGb
	TZEvZx/K03dPndzBOdYv7iE+/4mrMcaJvnfOZT1x9yZjHLlmrsQ+NzU6ON30eADM26vapLPUokv
	PUVl63PDbhvnlsDaeFZhof52WZuQKQkxrUu9jgJBxwDW3VoHurTCqUyRCz13vcWpOSsCC+UTCka
	qwPcXrsJqes0QYEbPzEteJk9FnbnCy3AFg7agXRofAMCngGrw1nBLAGsy2jZ89tFS/gktJm4zXR
	n4na+96PG/QTMLTm9ZXef7L7rJWpRWUG5gOaBxF3bE01Eq6DVcRs2YijAWhtYNVn50Mlf2BjgIG
	C6UhafCowMI1sZ99Fw=
X-Received: by 2002:a05:6000:4553:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48dbacf732cmr18793821f8f.23.1791915497390;
        Tue, 13 Oct 2026 11:18:17 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current Regulator for Flash LEDs
Date: Tue, 13 Oct 2026 21:18:01 +0300
Message-ID: <20261013181803.496627-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181803.496627-1-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT1270 Current Regulator for Flash LEDs has a similar configuration
to the AAT1290, but it uses a different programming model and requires a
separate compatible.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/skyworks,aat1290.yaml       | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index 65576dfdca110..7c26bb135c0a7 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: skyworks,aat1290
+    enum:
+      - skyworks,aat1290
+      - skyworks,aat1270
 
   enset-gpios:
     maxItems: 1
@@ -39,12 +41,13 @@ properties:
       flash-max-microamp:
         description: |
           Maximum flash LED supply current can be calculated using following
-          formula: I = 1A * 162 kOhm / Rset.
+          formula: I = 1A * 162 kOhm / Rset (for AAT1290) and
+          I = 1A * 81 kOhm / Rset (for AAT1270).
 
       flash-max-timeout-us:
         description: |
           Maximum flash timeout can be calculated using following formula:
-            T = 8.82 * 10^9 * Ct.
+          T = 8.82 * 10^9 * Ct (for AAT1290) and T = 21.5 * 10^9 * Ct (for AAT1270).
 
     required:
       - flash-max-microamp
-- 
2.53.0

