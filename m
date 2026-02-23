Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C94534B68F
	for <linux-leds@vger.kernel.org>; Mon, 23 Feb 2026 06:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771828760; cv=none; b=uTX0jBUzwsV071mwYmkXjsdxm0muQFe9DgZ0Wl92eqcOm7u30cXjyO+e7IkHNoctpP6oKCkYmv7+2/+7R0VwmWV1a7+/Q3lzybeLKSbu4Fc5fnpyM5zqpWH6qiAHglco5ggipgVV8NxkvxzoX6ESar2AvwVTDQ2Ico507YaDc2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771828760; c=relaxed/simple;
	bh=qn/yoppFnHPkm/7wMIi4OZx3NpWnZmmaThF93Fmizvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZtIlJRwx0+UceJ4/MOGAGsg85Jy0xRKLICCTfNDwUsF+tGlBinJB9Y8fU8k+aL45jVYzaNYaHkq0t+8WDkcsgCsyz4hYoU6flU0OGVRGKACEGCA/DW9VXkPTMtpkjVE0W1yPuPhY9ySogvF/4oUDB30B3/hAdW5N8oTws/yYpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UW72BrgC; arc=none smtp.client-ip=209.85.167.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UW72BrgC"
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-59e60925251so4031893e87.3
        for <linux-leds@vger.kernel.org>; Sun, 22 Feb 2026 22:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771828757; x=1772433557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFYrOujfibvGrP3Q7JjlnOcmVI0rxGplc79nBkkyDuI=;
        b=UW72BrgCnJ12CdbRMvS/xHDXKYZHBOI++zoxD7FmupgbYT74oQJSiIHkf8nHJjBO5U
         sfLTNNuoo7bVKYSHQiMDHeet2kcpmjjtkxQuhrs0kmHHxq42H0tppESlzo2NnQbd7ze6
         Wx4hOobeaAeHqWc/qVhIMFyM3928xiyAakcXGb8HjHMp3NiQ5Ijmt4BDOS+B3pktfq1b
         WEJM+v0CkvRghPFp5yOD9qlx8DfjD8T/+lUWQvVkuOfl1BFb114zHaTdlnGBd8jJSZYQ
         jlFzZ0jMkdHMW0Kb3gifNQB3Gl0alTI0ZvRfyhZhhAJ89Q6qDGUONLcldyQhnqlpCQ8c
         PoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771828757; x=1772433557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eFYrOujfibvGrP3Q7JjlnOcmVI0rxGplc79nBkkyDuI=;
        b=YSwdAD80TTKs7gVkaQ5BlYx0EXMQ+oXtwynGxV50Nnd1UGjkBwlNve593J0y0wFi84
         2rsIWbcpLuL6SXiPfNAqqsq0yV+4i+0fBmpDWO/fMUGfv6KbdwkVocD5b+M+JpeJm68e
         /uTGN/Ktd7BNnqooyleU3uus2DfPYeYYTFL75sdbOQHu1R7LX0nptMtuy4+D8GofsYuR
         RnXeR2614UZW1d2zLhgws38SG6RGVugcjkyPUyTzQIDNje802v7els61F5/5+TidzaMS
         zPlxPQsxX5rGdqdCwm07VR+/b2omKe6cTu41cCiCNUd0xBI77sx91KM/hZcD3Z3OTsKE
         0cMQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9RgrLI1uyxJ0DS44sn3r0vja5bdK8isatT+FjKpx4AQqvA6I+89jhjWiRilZr4qp7Y6VCLEvi7DCC@vger.kernel.org
X-Gm-Message-State: AOJu0Yzct3DnrvFDlFSSMF9+ERdeZoHxwSoRnIqFJQTO55y+s+LUZQNz
	aVxgVojGaCjFmUIbelK8XSHYC36ycLFYSp3fTSD9mbkqfoXM8VVoDoUQ
X-Gm-Gg: AZuq6aJWxO1mkOsV20wwOG8uFxegKVEqgPM9ZG5d2PM5GcLry7eFuCsRfISNpucFOiP
	ZamLLz3r33LZq+RnFIRNbb3megasxnX0Ln2Oa+qRbieFowET/a4QCnpDJQNr+cyLonFnUvs1MsN
	HC/ipqs0rYxpNcI+O3SuQ91smIamcW0H96qJXMe62nJEFEhd3Cqvfa/MK99LD7zM+kQCF/0KOUT
	/hFBPgwnydx2kTp/p4vcAtaclrbtkWayLtJWG+FI/bTMKlJJwBpLtJzmTA/MUzkg013wDOomYXN
	Han9Qi68zHfDJF+CZzwO/vyPSyd3W5o53e1WYEQSA0+0jZ9waiGRaFz6gLMAytY8UxJOwgYzLyS
	9lo32E82FZCa9LC2IGfVBwaToXIyI3vntivaZwoG+csJyVISXYBvm0GGuXTjh5ux4zWxZ1jCOY1
	tL5F3Z5QhVZUQxg+MKJ/BdJ+I=
X-Received: by 2002:ac2:4e12:0:b0:59e:39af:a710 with SMTP id 2adb3069b0e04-5a0ed99e11emr2406522e87.34.1771828756677;
        Sun, 22 Feb 2026 22:39:16 -0800 (PST)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13abbsm1369626e87.23.2026.02.22.22.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:39:16 -0800 (PST)
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
Subject: [PATCH v3 7/9] dt-bindings: mfd: motorola-cpcap: document Mapphone and Mot CPCAP
Date: Mon, 23 Feb 2026 08:38:56 +0200
Message-ID: <20260223063858.12208-8-clamor95@gmail.com>
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

Add compatibles for Mapphone and Mot CPCAP subdevice compositions. Both
variations cannot use st,6556002 fallback since they may be based on
different controllers.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/mfd/motorola,cpcap.yaml       | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml b/Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
index eea5b2efa80c..487e5456864b 100644
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
2.51.0

