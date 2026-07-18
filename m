Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130AD379EDA
	for <linux-leds@vger.kernel.org>; Sat, 18 Jul 2026 21:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784411816; cv=none; b=WHLEkMY8psk4afIovQnWZBuTZQPgcEaQKG9xv9Kh6pypmKK7731ZgTDhZ6HOWcSszeZNLsDo+FeIyOe10ibVNvFk79IES4gB6rKb43CfbO7TjxTRX1Y8WNswsktuvxv4yR9RCLjy2ww7ZAJPy9ng8vr8q1q6NHaLlf75XxSNoMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784411816; c=relaxed/simple;
	bh=rzwO6KWzTXHWycRBHAGWS0dbS7KaZgmt4k1yCVLlY8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dmqjZYAON2XdQ3ECcihTCGrQsEKLqkB0Rtm9W+DMzPfEwWyQpSZ1Rj5I/qBCRScSNLTtm3v/ysTF+bd6S6RfU1An2INZpVlkUTWqe/Wmrd0foANeeARz8ebrs18Ee14A3YrXoZ8WW1ubIQeL29ftxPqpStxUsWTk/61U1da9yTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frgKMBK3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frgKMBK3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954df200ddso6989755e9.0
        for <linux-leds@vger.kernel.org>; Sat, 18 Jul 2026 14:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784411812; x=1785016612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9u5KL9RtfMSzVJ4pDX8HPR4lAEE6w6qofkrh2nVYcFI=;
        b=frgKMBK3F4/h1Xe7+pQ0UdV4lS7KT3WDlcQMBN6ugZkmgXdqpk5wDnKbvPPIPW4G7d
         7SBxDX3vKRtfAOY2/nY4zMPivGZY/gH8KJXXKhbLfS5JvSH9873IyCGUrP6Q9JF63L6e
         CTHpIDgmls57LzMRRlhd5PyU9oyke4PiDBWcoW7+kyqbujLiO5r+UBtynViMdTlTlmgd
         X1QtZCefvnQRKhrZyD8YKCsp7veCHbxlecqC4D4/z6ERxkmT/0gAlzJ3LAWITE3a6lOZ
         k4fVRvY5qspALLAQnGrMSjBnA0Lhk9GBr9ndCqs+3h3EPsJDDf8KfP7Fk4/VPm8zmHyv
         LHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784411812; x=1785016612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9u5KL9RtfMSzVJ4pDX8HPR4lAEE6w6qofkrh2nVYcFI=;
        b=TOxrF3yHNlRV4EkmGIkz6M1x6QnpXHdUdC4UWj5VMCSwHSQQRarfKIcK0SH5R5FXnY
         uIN/IVGegeQvMc4UoUvT8nnAmCdKZWOYCOVMyNqBVPIrjBS8rwntTas3kcG+PQTm47kO
         fDe15Xza0xh9LqIhulbbjsoB2WFJQPfwvfICoY+/Lf932qKJKJcNiN6DgXgGHwZZ3by2
         CaNQ5F0jKQKph5ppEHhUspQWR6zkDEsvAojGEAkgwWvxSTFdPKCVHJrd8Aw9D29IXVUu
         TSXr4Fwl10fZXUV7ucUW68SIGP5BlMxA29BWIPvT1qtyk1Za45u0SX9HLFwAYvTSNXKy
         BcIA==
X-Forwarded-Encrypted: i=1; AHgh+RpUnKYMbz+1/e3EZYFNHYyxHtuqeUEpLJa1BxDZo++bPZy1Py4GU2cNlsj1RRhBvgZjDOylPPB8me00@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBwBLNIHnXNQFehAh3zy9F0gB75Ptx1JwWWiFLYq/SUUrZqcb
	zuzFL8X13YVP1qKXpd3yhNRwgIKWi5raAkNbLK4rbINGE982SwQBkRSB
X-Gm-Gg: AfdE7cnJjmGH79yb0DjoAh2v2VIf4aFX7VXlG8Qlp4Bk669g0Eo5buaF4pSTyUPizi+
	hyBnY40Rjq+8oo9mYQCZBITLuRCS7hAGvj5I+YVVdUicYpkOxI9188uglDvmMBdEkOEb1EXaajb
	BxBDsXP6/wnNDueVUfWi6V9S24NwZebGXrPyl2NHffchXdYQGjB+57jD6h7ULk+4rBo5vC21tGa
	zBXbXJ1rXIL7jberW14VjIwjgtm/pn/yTiubUYYCfgpjwwF7zdbGBeZgrjeMeEPzq9BU9rqf+F0
	Sf9VZy2ta+Lye0iNjrK5lZhGLIC6RcUVOA/PwZrRrqxVRkexobl+R2vRGz29qE8TD2mj7gCqZiX
	GFRru5G0unxvIoOSybsOrshL+hS2EZJkuPbzWQ0PYyBgh72x3v1eH6GpgTBUuR0t8g5kdynvYy7
	V6FUAr/MNNerfE+77JTcXkjlUNObhzYqU1p5TCy3PAR3DW
X-Received: by 2002:a05:600c:3b1b:b0:495:443b:1bbb with SMTP id 5b1f17b1804b1-4954a50c473mr78247845e9.25.1784411812179;
        Sat, 18 Jul 2026 14:56:52 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4954c0a81f7sm101199835e9.1.2026.07.18.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 14:56:51 -0700 (PDT)
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
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 0/3] dt-bindings: Convert TI TPS65217 to DT schema
Date: Sat, 18 Jul 2026 21:56:29 +0000
Message-ID: <20260718215632.3295049-1-egbostina@gmail.com>
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

Changes in v2:
- Set 'additionalProperties' to false and documented all child nodes
  ('regulators', 'charger', 'pwrbutton').
- Documented the 'interrupts', 'interrupt-controller', '#interrupt-cells'
  and 'ti,pmic-shutdown-controller' properties.
- Dropped 'isink-en' from the schema. It is not read by any driver, so it
  is now removed from am335x-guardian.dts instead.
- Added the power button conversion and referenced it from
  the leds schema.

Eduard Bostina (3):
  ARM: dts: ti: am335x-guardian: Drop unused isink-en property
  dt-bindings: input: Convert TI TPS65217 power button to DT schema
  dt-bindings: leds: backlight: Convert TPS65217 to DT schema

 .../bindings/input/ti,tps65217-pwrbutton.yaml |  42 ++++++
 .../bindings/input/tps65218-pwrbutton.txt     |  30 -----
 .../bindings/leds/backlight/ti,tps65217.yaml  | 123 ++++++++++++++++++
 .../leds/backlight/tps65217-backlight.txt     |  27 ----
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts |   3 -
 5 files changed, 165 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/ti,tps65217-pwrbutton.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/tps65218-pwrbutton.txt
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,tps65217.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/tps65217-backlight.txt

-- 
2.43.0

