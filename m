Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150853;
	b=GrWfkZJ4Kwf5US4jK9xZiL5hL2HB8ZFCHWZ+Bkg/ub66A1TvBuEcuI1lNI7oELB0dR02
	 v5htuqiczcbWq/Cf9yFz/hzCN8k6t58FqN5SQ48zrOzOl42Z6kFoBgPJJu5B5aMrPiB3G
	 ZZukAvsT7FIEVs36MW95YGC8U0MynGnJZipaisPynMAzufYkDxJ4P55hnFBnnnxqbD0uF
	 5+sVUo2jhD0yUKhQPKNxw5IN0o6cChY0TmrPVGm10iwgVm458WFED+CfCqqzM2xD8vbK4
	 9xxsYF2cdUGBWXoaWcPDUC+pxsqJYezUmLv/HLvSkQEzHFZ6vexBihjHc3nQq+upAEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
	b=cJfCj6SAzdLQEJyAyCdRmH1+K3P0b2M5/RFRydlO8ZPN6BtXiN6IxgFXKpuN8XKt0ZKq
	 E8GEMl46SJi8vfu0NI3sbxX2xRVTai0FXVgEsB2rrjSPLGOsxlAOeknHv0FPtPNfQTS5U
	 TTQMyI6GVOaC1Ryiiy/vUipztJHoptSBxGmb073nxsNOZBgz39D7R7oj8LF0W85gqCzKc
	 2JhlRH6kN7GnMqiX7+CO0EA7KIl22/XxufuiA5DCAnjK4ehCyzxxQ2QKXHsqlK6bjXckb
	 K5bgJdycjKAZsDP0vsrh8yO6v237cfop8tuAgLPHGkzf+zzR4wFGzMx3GK7bt2okefQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ppgWgr/s";
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A61606A326
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79A61606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ppgWgr/s
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c45551fa84eso17093866b.3
        for <linux-leds@vger.kernel.org>; Sun, 08 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150852; x=1794755652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
        b=ppgWgr/s7DYE/0NT8hkbf4w3Avxhq2ynyyFr2FFsRzliUFC7ZzSCPTwzmYqQuQU5IA
         Rr/u2iEhEmoV6+YPhvsNFMWG2JnoVqJOfVIyrXG+1egKypY8gUDsKG9rMFt2psmA6kRA
         locbvJ4rWpF98TqxIZ0HUCdjb39PU7aBKl8bs+a3Qb6Y1+tEyrtf29iI0NM5QSNnhjTd
         k/oCMvK6n1IBgqLDmgUDoLaxVtB+7G7u+7n5Gmh/prURYwgCEUe8e7cAf1uUrSlmcKwk
         VKtDMTQnZXJgnJnuVzS4RtMOXVnzLfqjGjqE8Dxb27TlB2mgxOhN78fhgWYXFM80Te/1
         3cLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150852; x=1794755652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LbAzkumGqnEzf1rEq6hPish8MNa+ZRPJTInRkJT7xc=;
        b=hnmWsGB/+PO4TDIxwYm435urOUCVmWYf5maH5+7pxFTNakPndxJSPJCkOe1HF9pMkQ
         IqdKhWfEUZk1vljtjacj0wuw6m6ZtbwDJ/LSvUom0zSRNlFzNEzD0NUOYtSckTPO0GJw
         I7W62FbExhw91BW9nymQPHC/ZlldXSWd8jB2KnDjSF7j/Im1yS81BgdY5FKn6Il2ACYu
         HjveEffD+9Xojhf4varzqOULlARGXKJYgH7ohe5SfoqLF05qgvZFJP9rqVIjtBdmTSrC
         Ee2nf3Vf3Q2CK4kJFHMI+K8CSP2WMf1WFit3DqRFh15TApuQon/YxZnTjW1aGQiM9xP+
         hBDw==
X-Forwarded-Encrypted: i=1; AL+hErHqIOHJWnd/Hl8w30OdPl+QU/PdyQUkcI2Rg0CA8AWh3GM2SWJVrN3GBrt2JR+vVySTi9+XyeJAB3V8@vger.kernel.org
X-Gm-Message-State: APuU4Z+msaagCZ+WMk6UzzN4qCVuWj5ijmQSAyCe4/Jq/jaOOatDDHI/
	Zlrry5XbhYUueiY1patbtblUMRcidoAxwVLSlCTsrK9AwOh+AMRuxItE
X-Gm-Gg: AYBFou2Z5RrUktlZ+4ebqmSGVGFxz0POZBH99bulRPXo1ppgeVPMoWC3ATRMSCw9ag2
	+2Ff+Q5vzAXm0Rp2zdK+ioHTgiMdsEOyFZIrkci7JNd38GbWHVTlDAw3LJp3tsVaqzKtOHHJeF3
	AlqP+Ilyyh2GFohn7ozwKKynR5/RSIMr6MaYAE0pWy7Ae72Fuo4KSRFtYpP+j24Jl1HqaUeE/sh
	2S1oKEoDRFRsOXukTbF9pth8raPVJ6pk26y288K2FwwkIEJxZ3mAlXPL08BuAh6PJuqKvYx19WX
	a1SZZ6jehVNTFAWcDjrh92lUKousHJp+XMh7yg3bONNOSCLLan6mhe5whMorIOyeiC5eqP3e1bb
	xFMyxNHkk3P+tcFj3UBRHvziTOUPCs2QVFL+UEOveUI/wk6A58c/AHedivYyfZJ+AWH/7KFGclg
	A/v1yNsJ+BBUY6S52o+1QCYnGcRgHwsNqlO/5xQ+s7GSiBbpKfchwgChPS97KVo5p9Ems2vWZfu
	GCM9yurnZ+GdhY2fcVMLmDySi/N6WxPJ39iXq8ueRnFB8XoekKIhtlcvY9iyreATUOhXwSq91sf
	mYLJpZVpaMy78ulgSBmMRCggd7mkvQqD9XMV3jAJsS3Ij7vzNpGKGtbXFUWPZJw3sCX/x3ePp5G
	oQPibCW+qQA==
X-Received: by 2002:a17:907:9624:b0:c26:1648:a062 with SMTP id a640c23a62f3a-c4d6d79cd56mr106518466b.29.1794150851962;
        Sun, 08 Nov 2026 07:14:11 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v5 1/3] regulator: dt-bindings: maxim,max8907: Document LED support
Date: Sun,  8 Nov 2026 17:13:46 +0200
Message-ID: <20261108151348.204182-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108151348.204182-1-clamor95@gmail.com>
References: <20261108151348.204182-1-clamor95@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Maxim MAX8907 PMIC supports a single LED; document it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/regulator/maxim,max8907.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
index 6cf8e93867e1a..ee1a305d1c210 100644
--- a/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
+++ b/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
@@ -31,6 +31,10 @@ properties:
     description:
       The input supply for MBATT, BBAT, SDBY, VRTC.
 
+  led:
+    $ref: /schemas/leds/common.yaml#
+    unevaluatedProperties: false
+
   regulators:
     type: object
     additionalProperties: false
-- 
2.53.0

