Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E4477983
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784627838; cv=none; b=Gv50OxkmWxmT+zeIi/M7YMDzceTZPwk5vD2D3GihceNzlG0czm4t8Oe1i7jN5TzYwCYj+HPEyOxXhPwU808kA0M8KHvYfpLo5DXk3bLduMzjwlKCGdHKy9kx05/1PnShcngR0hVFVScW8f64fO7EfzZ9r1tJ84itVL3DcRRWr0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784627838; c=relaxed/simple;
	bh=FvfwoSqBdrnoxs5BiXAqEZAAhFsqtQJDrQcSxsbO9xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DoXo6O5fDe7hTSoW74im2XdLQZPKfGD/ETN0rAv18gLmkA2Hrs3ceX0FmirTCTlZYb0ndGVWEnk4DGRx6oflxB7OGlT2L7prbY3FmUG0S/WaACvyPXVEtDobpjHnBsW24Q7vbC308Cgh7d9OFn/GKE0+Y6IHVY7+QJhkTPX/o38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rq54GAxx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rq54GAxx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49553515a8bso31637305e9.1
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 02:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784627834; x=1785232634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=at/d3WF+Zw9xKecGccpZLlU2r+Ygji0UehRFE3mgt/s=;
        b=rq54GAxxOIYegLPiDVffqle1elMP8uNrncbuduOpUKbc3leMN3nSjJqFhDuBGPYrF+
         dV8EnNl4dJ4zL1g82TldPVNNy427CoXgnfXNGKWgSu2mwP8DcZ2CcB6jsOptze+EIdwO
         vGWnjZkp9EeVg4zfltdlITF0pU9cHE0x+WriVmeQ8/jSMAQoLUQXZ99mmh87jaCPnTWl
         GMzc5pLfp3zm2a3EFb+O+DgBPvAhsJn5qedClqmpyGp5jixn/riuS3BmeMc/f2FZuPvv
         dBy2EIwVAw4SiaZskUxyUbjAS9/wOICSlo6jKL3NFYJA8QcWk7suwmUh5o1ze1WZNsLM
         AE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784627834; x=1785232634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=at/d3WF+Zw9xKecGccpZLlU2r+Ygji0UehRFE3mgt/s=;
        b=PzU3DNQDqFtrIbJdsNp8SrblD9HNzQXOIM7qJTfUkWC0+djPN24lGww3j9MSmGcV5v
         22lW+lhYI95Eax8PaQTDbf2JrTRpow6i4pXurKthafVfsi275CogcCqT7+6gZvShx+mc
         Gs3+F93ge8eRHmPtPndyOUbzrgF4NDH4Wov9fwLOCzSw/e63K+eJ9nFrVqtDrqgv7ByT
         ZY2yM8DalbtAkCZmNebkM2Dk0YsfM5oXT9lUfEj6PwpzLVYckIgnZTO1A/hdiouJETdV
         iO8xKrKJ+f5wLpsnZk9peH9PxRUov5Jl/nvgt32aCZw1VNh42n9hmtIxNYssxIjNsA7V
         0hJw==
X-Forwarded-Encrypted: i=1; AHgh+RpwkOu4thsmvK/ah5Twggr9w+EgybZTLd86rN5WcEz49tRkQ14Bv+UpjvblLQfoXb8VhxX32g6wC5IV@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtYNIzaKZQIRjVVEzefuL9S8dSrX5FbHctU8//kRZiyfH3TOW
	R6QWb0wGAz7+jWLeRqeD/o9wULG490eliEgdiHNwiEtpitoCPMN7LP38
X-Gm-Gg: AfdE7climwuLjIUyjsjKbmxNMo1mqqBoiHgJ3fNkvtT7y7BSzK7V3rlLTW7auP847ey
	5FvwXLiYaed4mUAkbqbyqhWFV8gA3Y4SXVrky3ULKwUEvusfbAPs+rvzclOVzTOEvU0gkq+eSgD
	CQXXqldYZT3BwwgixdR5jnk8Th4mmOJc4h5Pk3p7h1NN76PUg8talMHoEbT3o8SKHa9nMjgRFc0
	liQijxRwoQSSu2m1MOFmwVpAGLevCgWuX/lrqTDNoZ+HZcyyQm1VD3QRKm4yYybVgvb+f+2AIWI
	LOt/M82cyMD3/e/qz5AyiDAaQaTXQjORIDlfjR9Op3F67FM6nhNGcP59NKQsN18dyDmryPo/qCz
	bW5nx39DFG27C7WB55BCjHZChcdHAREEjedAZM3gbKhvdJ2xDjsnPx2H8crqwCS5GA2U2tk7b6o
	mfS526inW2qhoI1X+iHiGjNuE=
X-Received: by 2002:a05:600c:474e:b0:493:c773:c3f4 with SMTP id 5b1f17b1804b1-4954a403112mr221507855e9.22.1784627834246;
        Tue, 21 Jul 2026 02:57:14 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954995b78dsm227476185e9.0.2026.07.21.02.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 02:57:13 -0700 (PDT)
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
Subject: [PATCH v7 4/6] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Tue, 21 Jul 2026 12:56:51 +0300
Message-ID: <20260721095654.429346-5-clamor95@gmail.com>
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

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index 76705ea56805a..da7abe2ec9126 100644
--- a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
+++ b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: motorola,cpcap
-      - const: st,6556002
+    oneOf:
+      - enum:
+          - motorola,mapphone-cpcap
+          - motorola,mot-cpcap
+
+      - items:
+          - const: motorola,cpcap
+          - const: st,6556002
 
   reg:
     maxItems: 1
-- 
2.53.0

