Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2C3783C6
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 11:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784632908; cv=none; b=AWdTGU55K1x7J/bjafm5GV1mh5GLYpb4t5qAAqefYdqL7TrcRQsFooPxEq1534Rx4KkgEY7Fem+V2VcSo+qCySXYL0BAuyluoLUMnNYM5ECF39bmfs9vuJdZCg9NkUUdf4N2PKQGWtomb5u969B2Jb0aiab4Xc8kqYVusyDe1Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784632908; c=relaxed/simple;
	bh=LjMm0PBKh/Bx+amzkvhuyIeZuvgi3gtmnabaArRttWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWwnOHrh7hPdrGtmRNb2sP4P/rZXATSMRF64i2KO9GHg419lJF5T28cbim5oOGPfjSBh1FmmPGisJHca5p6ZPuJkHaRqNg8ggEtemeekXFXPk+lUKNQmh/ZAA0Ihb9XU+mVsPebvM0tjQvHhqPz8FKllaHoQbXmwOu7QsKASeQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuiw0QoH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuiw0QoH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso17235815e9.1
        for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 04:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784632905; x=1785237705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2+LKseJXzKxktbUWoc1WNBTZXl1F3xYy2w48c5tdQY=;
        b=kuiw0QoHi8Zx+wZjfBeqtNiwArvcCHxpM/BijsuDWkLzdkpqLsQxbrsG8rGlqhKTmK
         qkxxN4PXkd6GLz23JPBxmsmaDoFIUHsmndpfnTvgY/wTS+FA8XAWz3q6GylsEVvS75hc
         pvw7VpJ0Jz7rTwX05aU8SpA+pVLackhWi81/I69irt/rglgkeBYzSjsAtLwDa20lIZib
         48RvdYeZX4Cw2ZJNR5h9qQLHLAwt8ryixzfmO259CNHXF3XD5F1EgHQcQ4V5GT2cDso9
         IdGBiTNP0xavNjIRfV/uTBPz7k1lpXMe35NbjL3wSw9ODGLSHSHivyNa9AmZ5b67e4IF
         ShEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784632905; x=1785237705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2+LKseJXzKxktbUWoc1WNBTZXl1F3xYy2w48c5tdQY=;
        b=PUMFvMQlPH01cnBZnnuV/R753+nDtwCrMW1YSoWHM95k3bwwMUIEEoRkyO+h7IZZhM
         DXad9rpGxPylw2lcDTY6GkGCga7eLXspwphYv5S8ZkPSwIWlqlA6X2H97kCVMQxAlYv5
         lexPrvpS1hSj+IU4/KBMJI5t46lfKctz5ZQGeoTuwCj7wFEuBScgUi5j5Dnp00RCtrtG
         bcX6Atpu5fW081UjALoJWMxeYtiTLjwUwrUfwnGS4ll0F6uNivar4LkKxUuuAfX/tU6n
         43Dk/eflc7HLv6vEQ2UPrSVwgADsNCam9IRsJBl/xfE0EkbUpS+EkFk8gw7Nb4csOwTk
         omeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJf2Gpn1no6kP2vJoC/8F0HcmL/FX02nKihNCqvgzdaO59RiUq/1IyTdIiNY048f3a4/c7n8b3tuaP@vger.kernel.org
X-Gm-Message-State: AOJu0YzmGK5l8ksHyT7H//pdpR6BbkCnzcnKCapveX9LRXFHTJ2zTtTS
	R0muoZBDLU+RpiNpGQWO19vxHk8sz7tY2/f/wv/tsq/tGJkDcAX91YYk
X-Gm-Gg: AfdE7ckI5ToNPSkjiK0VCgEZZGmYO3nHloZYrTaMgJAd2QUiiyzKcP4sj+OCfLMHHmg
	L1r5ThHv1r5ctqCHM9t13gwvFrOlR5gsgDbvDLrUE6beW1qQ8Bh2lFsPQJG1CePm+DHQ1TD3Bfr
	tHgckwbXLvQsDncBJS53s6LV4gfsG8qGHKbBHWljSiUqH2l9P06FAT6Z3zakMFFQ/9TKXOp5Z/+
	vl5Sobv8GFm7iRVVzqkXT/7L08LLi0zPWBgutADRRS7a3qx4Sz4eH8QYr1gUMI0jAY5H1GvfjjG
	HNBQbqAlC4vdcObyL77Z/xBrluIDDrGDFoME94mGnAK4W6BvOA8iW/EVyzNmh6dbjkQJzNYJRBh
	hd2wt4XU5xOYuRsIung6YwEqZQTxPapcd3L7293odBddcnvZ4OKT8CDtQ/jMtE2nzYB7W82nYl0
	uHSW1CqWbXmThUQuQLQTlAwQFl6geux1vPqWUUtzj6iE5g
X-Received: by 2002:a05:600c:4504:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-4954a3d09c8mr194922355e9.3.1784632904451;
        Tue, 21 Jul 2026 04:21:44 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63e49ab8sm40232416f8f.5.2026.07.21.04.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:21:43 -0700 (PDT)
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
	m-chawdhry@ti.com
Subject: [PATCH v3 0/4] dt-bindings: Convert TI TPS65217 to DT schema
Date: Tue, 21 Jul 2026 11:21:24 +0000
Message-ID: <20260721112133.70382-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the Texas Instruments TPS65217 PMIC bindings to DT
schema.

Changes in v3:
- Added 'unevaluatedProperties' to the 'charger' and 'pwrbutton' nodes.
- Renamed the example node to 'pmic@24' and added the rest of the
  properties and nodes to it.
- Dropped 'regulator-compatible' from the schema. The property is
  deprecated, so the regulator nodes are now named after the strings the
  driver matches on and the DTS is updated accordingly.

Link to v2:
https://lore.kernel.org/all/20260718215632.3295049-1-egbostina@gmail.com/

Eduard Bostina (4):
  ARM: dts: ti: am335x-guardian: Drop unused isink-en property
  ARM: dts: Rename the TPS65217 regulator nodes
  dt-bindings: input: Convert TI TPS65217 power button to DT schema
  dt-bindings: leds: backlight: Convert TPS65217 to DT schema

 .../bindings/input/ti,tps65217-pwrbutton.yaml |  42 +++++
 .../bindings/input/tps65218-pwrbutton.txt     |  30 ----
 .../bindings/leds/backlight/ti,tps65217.yaml  | 170 ++++++++++++++++++
 .../leds/backlight/tps65217-backlight.txt     |  27 ---
 .../boot/dts/ti/omap/am335x-bone-common.dtsi  |  14 +-
 .../arm/boot/dts/ti/omap/am335x-chilisom.dtsi |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts |  17 +-
 arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  14 +-
 .../dts/ti/omap/am335x-osd335x-common.dtsi    |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts   |  14 +-
 arch/arm/boot/dts/ti/omap/am335x-shc.dts      |  31 +---
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts     |  14 +-
 arch/arm/boot/dts/tps65217.dtsi               |  31 +---
 13 files changed, 275 insertions(+), 157 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt

-- 
2.43.0

