Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733118;
	b=XGxlXFyy0SKXPEy6awR3y238PCShrmSF/og9ENPvkTAjhxhKfep4KAGj2tVOeCm6XX5s
	 avPWCT62CKY4BzRwFEa4ORgmac9bPYqT5ivEfH3LJLAw3J68M9wueZz4/UKXaFnFWsV6Y
	 4hVASh4ntPxl52nmVPrPBoXaj/iyOAzBJkTtoyAx+SQUxvY4OLm2zocg3XSrunQaSxw8U
	 AmfoaL3+UtNLmd8e0rrtB4n7S60vcmgLJ9KkKg+XBCLrgn8sf/OfYp9fGR9VKROR5V6Kf
	 MJQbIFPq30zXZukpVhvGKo9iibM9Wyz8v85pxMVpZ7K1VuwNEMp6iYjf3WEfAeGaN6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
	b=r/4P0FQQHX80ioZUpFP91k/ll+TL+Sn1MJPF7FuhTVQZV6hLPg3m0/pZly3kL5afF5aZ
	 gwychJlVVzFqD+AMyeB6uXrW8t9na/DMuD+tLzwsDEWqWAkBf4mMSPuSZboOTBVfod9TZ
	 8iRUMsF/hENkmFk4LnhaA3KcPKe/4AZ8t80UW3brWv5LNJ1tV0gs1LXEbwodep5eR5zPw
	 IFjvZHOyRo4JRtGQNcViDtGQw2mwNuZf83hYul4D0vaKC2/pBfzACf0EG1fxP+/+Fa3Co
	 KGTc9Y5GptaciNP7WHntXS4rQnYyTy/vrXUWK1fFc/dEU0JKXlCaeZJ42I4hyPkluYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxDgOdPI;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6146F606A31F
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 08:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6146F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cxDgOdPI
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d427836e9so329270766b.1
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 00:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733117; x=1795337917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
        b=cxDgOdPIXVmH57Fd68NwsdJOuUZP8P8vdJ6d5BdqZUabe+Ute9wkApOR93dPGFzm54
         TyCDW/GZUTprEszT/0jdMNrLPbr7AU4aZgtO+07t7eykMSJSKemC19TNIVqoPM9rEXLC
         gn8ylbQm2QbrJUNsUwtL1lfFPvRliu8uarTjaHtoiuggbfwP01ziLWyIQp/KumpG2wJH
         +OLv6HnZB76Y7uBnDgVT8rMHUvGjPE57UXDrrWnPqK240DsCVAH9LdO48xRJkxxgQ8Iq
         SIgPAr6IdJMeddfYGaOsMGA5oxxy5pnE7+8fLwCqsQcLQyXlrq38AtinDEHaOJ8RMwoG
         qNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733117; x=1795337917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BfQ1qFkKsmGaWDuAf4U5BrZ/SIHnw5d+W2dmVSm0AgU=;
        b=V+A9XHkWL3y8/0EZYHyH7V1uRB28AyMUGESGC3IcYq5E0FUVv4bT4xO4hFTgK5Wefn
         S8bI0YQUmDfW2/0nY8XNi/GG32IToFzhtyfoe5BmnqyEpZm3I2fC74A5vq1WNI60dZ5d
         ZlL+1HVeYJq0UE0Y0P1D9tJjRMl8mQJjUimgADXtfJA/ESSWW/PIaEqFfSRVXQozDYtB
         oDP5W5wzKitcztDR8716NFK0+XkCJx+jD5Rej2YEzjYNGyb1rphN+YLYRfLrkmleEjc0
         et0iwkfd7RLw8LVK/CvEUiCszxImm2s+v2P0tnsJhVnHW6YsRjAmHj7PupR9Y+j5ygFX
         Qp6Q==
X-Gm-Message-State: APuU4Z/Pn4Fkmtu1V4ByoNTQ0TvwQn1N2PcutI4g1Q82aQVWfA/Qt7y0
	aGsrnc7V8NBC4Aysl4cQmsUmGNFoEA0xM9Z8hfuPXIhh22ra+AzI0TKWo99IJA==
X-Gm-Gg: AYBFou36l/a9YlneZ7LWjmtQ4LUk5cmeWOug/YK+1lBF+V+ZXE6XXGURC0xN1u001Iz
	4+1pEYs6zfzUL9d9fvmfOGKwlKLO0sAwoYrLE8pCDx+0jNploz9FCQ3yPGuv110ImTaQk6srO3g
	ZnKXuQB4UOeIg0V4Op1gX3+qxL71NjhXG5SETCpM+AVVwXauNQ2ArymTgkvrYvrHUtknDaaJgSh
	t9Z/kSlugFRM2/QZoZyv+b0AyfAERPaZPAIMpx/NTnVn8+1CDjTdwRifhC44QiQN4vGVqex+opO
	ZqckSe9+F4NfTqnnVjg5OEwojCunmrtVRQAGe9f+ZUImjoCSMfj5AZH5ya/gDYBQ/TX/EJXRSi0
	OsVk/wpgECECB2iGOjwKxtF+6TvNjk+nWsYHh1C4HtHuL6mYHuAjN2lzhniAVNoWyYQvQafNvKD
	Bxyz8K/KRjOzXx4FfrRteV9VgV4NW5WtiQUM99dOGoLs35IbTHG9+9giafCXutGXVbbSgXDTYum
	5ygAaxRHX6uRPgozNDklZ3Ok+/sAIWIUwjOJPLR32MgvNJU/vZrHycBNILqihCbAUP2cq8GMv7I
	GjzOZv0lDnmCBNL3DomdLp87a6XWhOudemtgW5zuhDB5PAVuqkMs8Zzjx6Xz3cp6kHmkaTvntkj
	h0h3D3Rcd2w==
X-Received: by 2002:a17:907:3ccc:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c509637e31dmr585009166b.22.1794733116617;
        Sun, 15 Nov 2026 00:58:36 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm287613266b.1.2026.11.15.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:58:35 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
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
Subject: [PATCH v7 0/4] mfd: aat2870: Convert to use OF bindings
Date: Sun, 15 Nov 2026 10:58:21 +0200
Message-ID: <20261115085826.89641-1-clamor95@gmail.com>
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

Changes in v6:
- led current set to default matching driver behavior
- max_current initialized with same default value as pre conversion

Changes in v7:
- rebased to be applicable on top of devm_kzalloc_obj conversion
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

