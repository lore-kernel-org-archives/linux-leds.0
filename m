Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B38381EBA
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632911; cv=none; b=Fx1m3oV8L3+NDrwYQqXzr0VOIUj08U5pzFA2GcpAi4zu/y7Zy0J7pHo2twil/lw1JeKIQEHsxNZ37ja6zRo+ZBHcVC+TAuam7CUrWMXlTNyTjDRrzOESShBksVEgL2oBybNsGt+EkuOrf7TNq6y4RRNdlA3XC71LWB6Nrf9UnrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632911; c=relaxed/simple;
	bh=kqwgEUYByWeKCt8A1G20ZW6yeKjOibdlAuv2gZFEVqg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFD8ACFOzvo7WIqaXNaJCd+XSz5JjsBxihN1C8G5Zy0u/LCLfkHCxa4Wc3SItpcXDGJRCaG83tYEXaVc+/p+m8Thp3UPHaPtl6n7hpFoErIWCl3SMJp6D0I0sOK+6uweuyNvjGCQD4yJBlWY9Lm8wMy9AWgGsI7mcS/gGeednn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCLOX5T8; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCLOX5T8"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4728c12ba97so5642688f8f.0
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 04:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784632907; x=1785237707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6g+koxDLN1Chjep218/XBMsTlfwQifOiOfABmvTzX4A=;
        b=WCLOX5T8gPpqqM9R5xlOrvVFEOCs872mEi27vbIk0bhnOhxNiouYUcAHcP7KxHsJ+3
         FYvySC9+prsa2xYmyozSF2N5/PBoKIyIlhqlC2qKehuBCacLdz+O7T6EQE/wi+qvZBBw
         oUURnrlGVduCvC9FYvUYO7nX6o4LWy/pyhy4E3znfRFjlBMa9uc/aH7HPpPnQAfR7ldy
         PMOxN7XnxbBLL589pyqoub9i1gFI3rcv6AwJSk1pZf6qJutvTRDBNt4kaQ8TrCIcMn/w
         1H1As+NGZskm1d99aMlerkmmoMB7I/2GWctdxu/CGIThVy7VxgzvqJ91jnFNzPdqW6JD
         lbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632907; x=1785237707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6g+koxDLN1Chjep218/XBMsTlfwQifOiOfABmvTzX4A=;
        b=gGl65kVrGUJ33lwGMZO5XDRr68g/sCQ6oD7BXRELHMYGVbNCmp0IwZGPLXgX/hQgDg
         xTMt2w4MgikVWn+pVRzpVuh0nn0JWkBpenMEzJUnF8I7V7uH5iqWo+0D2uWerFD+BWKo
         QclwWc3ldfODaA94xO1YkneE/GYJnJZf3wO5c6+vaUGrfnb400WYrZ7pX5LvF4EjUI6q
         2u/4yURIHRpT6iUtjsTt3/CKYdXQNWz7Hru8YqVJX9CGZ7lNYCAidjzZPpau3gUyzbVp
         xOZIpF5Ng0V+EZ35JydlV6xATPm9CX134wLliE3CIQmoZ68FImqB3/ovWZqLMgw7s8Xq
         i8vA==
X-Forwarded-Encrypted: i=1; AHgh+RrIkyDOKwM3Vff4TNMCg7rxMc+5+OzvH8MUGugCVllHciIU9FMTcOEaNvaAmyesNHsuQWjLeCfAEbqP@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6FAjt2uc7KPk33qb4zRVkYmy8Adk+gS5lYqCIkEemWul5dsZZ
	Rv06f9Ikwgo55mMZg4koLcru03xm8Bh7LCOsPj9E+eDSOAQtxrYafSRl
X-Gm-Gg: AR+sD12CjYNfJyxiVcnbttNib+ZkUCQHs2+SNjCFQjLx5f3J2Oq26Puec9IxoHdhiLG
	I9m1376KwiVHcUpJEROVy0KFx1YaIYzNlayZpAqcif0n5TqdN9UpBhb47Nx0+3yOm3/sYAufEUy
	KcOY3WQNbfDlxkcfe3tokALF1tNSmHIlJC72US364Fb59Op6YeTeXinAac8ZKAyeYiVYVT5d1kF
	kYqjTFLg81MnhB8LBDUxtH18OHtPqi0UuMi+IvbaRtI+9RM/5NLe5EGNxrk26KGXUdbaLo4Bq3g
	NP6r1iijwwQtvL0aQzIJSmwbeT59gQ6VfiGuWVDlT1ydkUqukDGfmlXghzVbkkONPIRNDUqgYV8
	uqO5IFs0C6j/dujyfIrXyhQrklpGvS0jb8pXO5Z13PtzfDvofsC1XrKiOL63ss0+XQHgq89Flh2
	w5FuwfYy2VmEvuctChClgSTWySSsV7rmCPBuogz8tnXfvnxWyxQux7+KE=
X-Received: by 2002:a05:6000:71a:b0:47f:48cb:ea5b with SMTP id ffacd0b85a97d-47f6233d615mr19569935f8f.43.1784632906622;
        Tue, 21 Jul 2026 04:21:46 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm40232416f8f.5.2026.07.21.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:21:46 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Mark Jackson <mpfj@newflow.co.uk>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] ARM: dts: ti: am335x-guardian: Drop unused isink-en property
Date: Tue, 21 Jul 2026 11:21:25 +0000
Message-ID: <20260721112133.70382-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721112133.70382-1-egbostina@gmail.com>
References: <20260721112133.70382-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'isink-en' property is not documented and not read by any driver,
so remove it from the TPS65217 backlight node.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
index 6ce3a2d029ee..d595e79d6b05 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
@@ -320,9 +320,6 @@ backlight {
 		isel = <1>;  /* 1 - ISET1, 2 ISET2 */
 		fdim = <500>; /* TPS65217_BL_FDIM_500HZ */
 		default-brightness = <50>;
-		/* 1(on) - enable current sink, while initialization */
-		/* 0(off) - disable current sink, while initialization */
-		isink-en = <1>;
 	};
 
 	regulators {
-- 
2.43.0

