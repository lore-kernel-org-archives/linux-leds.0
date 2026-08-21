Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B6C346A0C
	for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787301430; cv=none; b=D2WjK2yQRgNTQ7a8javVPWFrA2W7iFDglEc0wD9N1yOdoQ6thSNB2QmRPi2SCvyjX6/0MDvGh33Ym2JPzTOE4HbIaFItW3TywkqIDMxxw/WK7+bls4nzgdLHRcamWWaRa1t1uHUL/Cn6xZOBzONTUT0KfI0I4wlpZ4tY2otdPwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787301430; c=relaxed/simple;
	bh=ElQyopbNeTRk9DUTNjRjy95RO0fOvUxQVxAfUHkwi3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W38wkPC22r6Wb0C10IxGBuz4eu38EVgqvZglP21nsj9unTYP7YGYJnwCpsBIfVCt1Zre31BslSz0iXZ6AqulmGQiJRERBxtoa/kKq+EZM9bQLoEOlvVerOE7i0E/NLovCMdd78Sqik26aa35+BkEC6tcS/GNZRnLkt6jTMmaYvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC9YrWWA; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC9YrWWA"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-495437bb891so3780135e9.1
        for <linux-leds@vger.kernel.org>; Fri, 21 Aug 2026 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787301427; x=1787906227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9nwI0xzDY4nr1DcZdMJckNTgD8lfdKNXZB8XDkogvB8=;
        b=FC9YrWWAAsdxcpD+mqZpFOJNbz8hxirPpjnH/myIjjSrNUsAp8U/c2Ws4+AfBjHakR
         UF1WxPCGmQwWLIocaCBCuv7BfJDPOpFxwnnvR2Yr7h8pzmNr678XvIrRGBIc9U4YWG+/
         utmgrwFm+tB2NU+kwCvDL31XAO6w2NwuRo4vmWNHt7qeUiocplbl46pN6JmmTVRjIUyd
         z4RNv/Dfe2V111qhizm5xNS5BFUQiqNI0V4saZAdMl7tk/t9nT6YoqwYKwZc5v9vnmW2
         E+CuHkZ2+FnySzh+9MynDsv/WCVv4bOhroroPVXP/fIan82Mv9z+fMHlXkIsglARW9pM
         HJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787301427; x=1787906227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9nwI0xzDY4nr1DcZdMJckNTgD8lfdKNXZB8XDkogvB8=;
        b=nazX+mR41lGa9jVPIhc/0PljAJSY5CoC+33iypkQ/HdNpplixAqKJ5UjaXws2miUfA
         /BDKAnhQSaKlFuw5VFxBQDSzjGFxvM33nhp1TigJhBZl3BQbzskTegPvgtCYXmz4xkxB
         wF/gjv9r843VjbJu0tyr7VfifGrFr56tblRipEieNLUmnzuH7gteVeaSUatiHt4BWK9i
         h8G0/4KDr+kLda7ysbKuhhGYQm1y7lIdSIADq+5lzH021Ln7ASW6qtaZiwRZhbyAjv7Z
         AVebPsfS+i5e6nLjyKrFN9PRjjHVaahZIwNF2zR7IQpryuvUK8s8tHYJtKOvDKVeyo37
         9eEA==
X-Forwarded-Encrypted: i=1; AHgh+RpZ+zp+176jv0raCSKvP4mmrExRes+kS2teKGBt1SA4AsNTijIKKdNEJmpD5QmJs+Lgo+WohqwGETMg@vger.kernel.org
X-Gm-Message-State: AOJu0YyMLiV+ouYbFrLFSu7fEKMoyK23yS/C2hA/JtA71EP+N8dhtDJG
	KuV6LSGAH2sx/Yptk+bEsVOwfoH4sszaZkxZqKL9iVRzRlhV5jg60v9bW/6izeumYo4=
X-Gm-Gg: AR+sD12xVMOydIYmCWblYAGNyKvW88ROhr908jqGxwVVeYqH99Ll2QJ4KPiOUi4ZVXW
	ECrpjmM0HxhqgXSub3U/+bJnc0WL81yQ5r3YNBtI5zPFm4P7SkDe93OAzwAbazbqLvDEiHPgUd2
	Aa8WDMdeETkTxWufISRVpfU7JW/5Afwr6L/fq1S4DRv/nkMarMgJmvU5iIc1Ri/9f7XwuBPl89H
	BRDyat764PAuK+h36uyjCAed2RFyp/tAhLOrsq27GvzqapPjqS5oOPq+X2dMvPeVQCq0OPPyw4h
	yraL474YxwzrdeWAcZi5du8B985ThZrZvHt+9ygdITp0ipLieFowr6LsDe2VirGa7HhCsfd0Uk5
	OjbZcSaZvfltf105d0Sj8dePFZu/Hlb+1txjXXbcsnzREk8b0Hl5kq6PgGuHXQZTjYrw1q52GWa
	4LJK/6cG8g4pWdlElo2tvLzoJd5XG8ArZZuKbXzS7eLqOozvHyxMo4mZ+cUTdRkHR0L2R+oCmgl
	ccrlY9har/HbibcUqXuS19clhFq3hazFYM=
X-Received: by 2002:a05:600c:4688:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-499b91ad940mr34277465e9.7.1787301427490;
        Fri, 21 Aug 2026 01:37:07 -0700 (PDT)
Received: from rillian-arch.home ([2a00:23a8:8f4:6a01:5ffc:da36:c891:cd3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b911724bsm18546705e9.15.2026.08.21.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 01:37:05 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: lee@kernel.org,
	pavel@kernel.org,
	linux-leds@vger.kernel.org
Cc: Rillian Grant <rillian.grant@gmail.com>
Subject: [RFC PATCH 0/2] leds: flash: LM3643 dual LED flash driver
Date: Fri, 21 Aug 2026 09:36:04 +0100
Message-ID: <20260821083620.68324-1-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a flash LED driver for the Texas Instruments
LM3643. I wrote it to support the Windows Hello NIR illuminator on my
ThinkPad X9-15 Gen 1, which appears to have a single LED connected to
both current sources. All non-error code paths have been tested on my
device.

This device is enumerated by ACPI (HID TXNW3643) as an I2C client with
no _DSD. The driver, following the leds/flash convention, sees no LED
child nodes and fails to probe. For testing I have been using an SSDT
overlay.

On Windows, Lenovo distributes an LM3643 driver authored by Intel. Its
inf file matches on the HID alone and contains a default intensity for
each LED, 100% for LED1 and 60% for LED2, which suggests the driver
applies a static configuration to any enumerated LM3643.

I am sending this RFC to ask how best to supply this default static
configuration. The options I can see are:

1. A DMI-matched table, similar to touchscreen_dmi.c, that attaches
   LED child nodes on verified boards. I haven't found any existing
   examples of this being done for LED child nodes.
2. A generic fallback in the driver exposing both current sources as
   independent LEDs. However this would apply to all matches without
   a firmware description.

I'd appreciate any guidance on the preferred approach.

Rillian Grant (2):
  dt-bindings: leds: Document TI LM3643 dual LED flash driver
  leds: flash: Add support for the TI LM3643 dual LED flash driver

 .../devicetree/bindings/leds/ti,lm3643.yaml   | 126 +++
 MAINTAINERS                                   |   7 +
 drivers/leds/flash/Kconfig                    |  12 +
 drivers/leds/flash/Makefile                   |   1 +
 drivers/leds/flash/leds-lm3643.c              | 775 ++++++++++++++++++
 5 files changed, 921 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml
 create mode 100644 drivers/leds/flash/leds-lm3643.c


base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
-- 
2.55.0

