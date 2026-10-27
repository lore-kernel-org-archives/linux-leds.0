Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100774;
	b=IVGA7+nNOpm5Vth3SnAnSqJK0tsMDfMWEfwZ3YyRk+W2cyhCwtrBBjb4IFg6m2zVx3tB
	 8vdb2tEeePbQAWYzVQ/pwlmvD0uTyYxgRRATnlexKTds6yLKs/m9BxscZK4cl9wrYwrqN
	 u2Y8OtMBjLTYOA5YHJ0/CREZfqmmo/D2Ojw8sQBjKY6vcmdMBROpx9oQI17A0GVZZ3B5i
	 6/4hHLi/bIwMhJf50mDYXY2c3TUY1wg/2udAWtp+gG1NW2gRB194GtaK1N7cp5bbGytkt
	 fXM0ql5qlkvck8xaEF71TPfzNiJKUkMbIuKxTgZW+9JtG5b4OfWLY/SGBXM4AfxFULg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
	b=Aha8H3hEFqwWGOPtnec5lF/HcYBmKkemd/Kz+yUsSUgufcKC9O9Ma9ZYvqbzEshfqe+Z
	 4yoQxEpVOrQ0eVuE1S/GaqXeSCrSOj8fDGrfJd0n4RtkisVJ0Xwv2qDeKXIgNnv8+pmUi
	 Vra8Xx5GgHeAnj/RTLddG7eNV5ShSJ7dYH7l0lmurPPSAcRiWiF5koujztAr44eeEuv+q
	 YRB+oDCgrdUPAjPV2L7P3SXpz3bI/fU1bwnI6jXItBvMHoJlXIF3oPeDvn/pzkVpWnEQZ
	 g7OLZ/Q/8jLPqO/xlmNA2ho8YMONirGVZnceTcJ+0IYLn+3qR4Q6ftEQ9jW3I8PpVew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rtjbDRds;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B059B606A325
	for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 11:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B059B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rtjbDRds
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso350129a12.1
        for <linux-leds@vger.kernel.org>; Tue, 27 Oct 2026 04:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793100772; x=1793705572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
        b=rtjbDRdsa+4/69vIpPHLS8kfTWwktRQGDqe1KoMSE8nnsKH7mio/0L6cY2FmWHuGAB
         hznm6SUWdCgpdhf69MYg4Mjh5nO/xikxw/GdJVyYySrCnsAjyUEDlhOtlp72OpuzcZqP
         kKoDPsAVIcKa0jvSEAmGNicp9Llmf0awS8YRZGx5YFWVf1DgNXXcaebpGXMJ0ymIsQWL
         uxHkEKkb8yxbEVusPQtksOoSpgaycjK+vk7iiuqINGZ+HQW1sr4ugIjRWm1WPJf5f1Rh
         7DhZ4XZr3M5DjPCPkmGsXfCg5oR4sDUqFmg3BqGltiRJrNhmX9f78LmYBVySflYJtW3C
         KeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100772; x=1793705572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t4IJra9NQJkRGyVR4RCc/9Aohe97L8CkEFMWXcoToWo=;
        b=YDqxoCHX6DrLZy4+PFz/MkisZoV4EEloClOp7utmT5MM6Gjt+O+K07vvGRQ8G7dbdi
         kd3U9YHkgoUUP4xUkM22fBkyVWnUASSTlYV+LNAphaQopaUlaalyRykzXYE9paXtSO9j
         QqZx4LqoKnIg5qu5NN52dhWsf421UPg0oWGa7R6qMARvnAA/t4Qy8n/ZENNhhTwAIvvH
         p+g4D21AlnQYH73KVABk2N+HdQ6wd/RWXu0JbTBON5P2vxpMpmNGq15nn4qHWfzn5hty
         khHPOWU89lJRjEU4IsUMNpiI9YK5Bq+4382kDckWAe9Qe/eGGHFXlGKWZjP0ywOj5lvN
         5z0w==
X-Gm-Message-State: AFq9FYL1ZLeqLaP7RxPQfE+etX418Nk15xzghm8on+h+e6sG2vmwcbr5
	mCVjU1gJMLxPqqUoX2d7aq/aYHUbuqe98zgyJJ1EkzBDnE3kWXKF979R
X-Gm-Gg: AYBFou1AlTUQ1JwdrZfbHTKtEZe88TGCi0HG8Vwy2jjGjxSD/fjsgvInNtgDcKeNNoy
	19tGYmHjOHuTcLoLHLuTxXmlMDJeMXqD3ASme5eCERPYnxb6c+VwkY8FzUMbHSXsj5S46Kuh4/m
	WdE3OqACn1O0FUMBfClW5bycJV5rjo3J6ZXEKFcDhea+nG3v94lyD6wuf4WXZugNJzeBzeFSFIu
	v8us2itLOi5Vz/7vcqSlI7dhYm6+ClOfUkLOZtUPVVXhPVFRcMWeWq9l71r3RiWUKnHZ0ntiUTl
	6feyC4aI9D92NRYFafdHlAYDcW4yiS2lb1MJSJTOg5k22OK/RWYKY1B/kdL3buntuBiSQ8/cLs/
	M8y2JvBIiZe95WaQHozjACWmHYIgMSILAi88SNadk1xWOu4NvGTe7vzljgGYEHJqUAEbD6apTcm
	yVVPjSU0GpTDxxM4qqjoEVI163QI5tZeFEkK5m87yzaVSt4uBxkkd6h8Dv+MtY0T+JAg02qdPvc
	cTSY9uhdXcJS5EClVyhA0EHCzAl5esEGPwniT3mc7KohNy2P7UBRpWFbMq1VsWfPHF1bn7TsG4Y
X-Received: by 2002:a17:907:9307:b0:c29:4915:83cb with SMTP id a640c23a62f3a-c46bde93525mr1103423366b.39.1793100771899;
        Tue, 27 Oct 2026 04:32:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea608sm428920566b.21.2026.10.27.04.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:51 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/4] mfd: aat2870: Convert to use OF bindings
Date: Tue, 27 Oct 2026 13:32:26 +0200
Message-ID: <20261027113230.47538-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Document Skyworks AAT2870 into schema, convert existing driver to
use OF bindings and remove platform data, add support for
in-supplies.

---
Changes in v2:
- fixed led-max-microamp scaling
- fixed max_brightness parsing
- fixed regulator init_data and of_node passing
- of_platform_populate > devm_of_platform_populate

Changes in v3:
- removed max-brightness property
- switched from dedicated max_brightness property to dynamically
  calculating brightness steps
- update regulator registration to use mostly core regulator framework

Changes in v4:
- set max_brightness form aat2870_bl->max_current instead pdata->max_current
- switch gpiod_set_value() > gpiod_set_value_cansleep()
- constify aat2870_regulators
- max_current in bl switched from int to u32

Changes in v5:
- drop max_current from aat2870_bl_driver_data entirely
- remove legacy gpio and mfd core headers
- headers in aat2870 sorted alphabetically
---

Svyatoslav Ryhel (4):
  dt-bindings: leds: Document Skyworks AAT2870
  backlight: aat2870: Derive brightness steps from max current
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 124 ++++++++++++++
 drivers/mfd/aat2870-core.c                    | 133 ++++-----------
 drivers/regulator/aat2870-regulator.c         | 160 ++++++++----------
 drivers/video/backlight/aat2870_bl.c          |  78 ++++-----
 include/linux/mfd/aat2870.h                   |  95 +----------
 5 files changed, 264 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

