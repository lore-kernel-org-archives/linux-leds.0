Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C693BA237
	for <linux-leds@vger.kernel.org>; Sun,  4 Oct 2026 16:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132102; cv=none; b=qZNbBey+R+V7Okws/mZwCD1vCQzPTWjZReunyQq0lVT/EIe6N5ObdjgYWkua3oM8zrGi9Diq2elOouDXYUwPrjlHeDUcFYxxx/AMRSVTNe2p4pI35OrL+J5EbuCZQ9V5VlrPfo0XrGgpdhEEStW2paj+pcfc+JReA7+nZmVB9rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132102; c=relaxed/simple;
	bh=3k9GVNmC9fpGnUpd0cb5oMJrSKHcYAq6Yd3jt5gP8YY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DzunsGiWjQN6SRfAwWK95BJAIMVngPOSJpOOg9SG+frklreSZTczE85PcE7M0wprEjUalPBuKHk/EOx3TDNCACQIY/ECoQ2ifiguRc6AFeDw+NRRd3V3MBi1QdilcnwXitGqBY5wTnALf6e6SRvw6rz2hXOl3XYu2Ny8kKAtfWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ5GX68l; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ5GX68l"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so746482f8f.2
        for <linux-leds@vger.kernel.org>; Sun, 04 Oct 2026 09:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132099; x=1791736899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hI0d17TUb2l8DVdqo6tZX+Y2V30OOpneqbxvA1IJE7k=;
        b=CZ5GX68lEqvB8JeijUcxxXpb/7Id2eHZgl4SQt5IpN8MejXpe0Cn7JTLSGgC3uRZZ3
         nXF6/rx9aDtxsuRgUltPg5mDYHLWxymEUEYWmpFPNmH8xKlfIMPFmCc9KlVs+VVsx6uJ
         KrSVs8pDI2/sFL5n6GWHq6slhEf5XCtNXHfjXPYH1Mgm8juCdJijarVy/VlGGA1aSzp6
         76Gl4y32SKmgUZ3mlxKdDcoPHKXO5qnnvya1R9qPzrqiJVt5SC9qPz53MX55hUDtJZss
         sbI9pLrwEkkyZMc7N8/mQ2b8/C4zZXfzklJPDRnZ/JjWd4r1fiRYlEa78EXSu6pm8hwX
         qjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132099; x=1791736899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hI0d17TUb2l8DVdqo6tZX+Y2V30OOpneqbxvA1IJE7k=;
        b=dwBCJZFUpnifKdUBGyoMLJkhnnqUSAtpneszJ+UKwfkfd7vNf1wgDglnMcigW1lpeL
         RxWnZFoKjBTjyU4iwdp7pBxwj5hMsoMH4eq6FjGD4vTDlgkxtnsBd2IEsSkg/9PbUBCa
         OXLNDR9Os/uzjAIja9DG9tRwsDJhBe9tnuL7UHOIOruJn2D78xEe4PAtkcLg57sfRqA4
         qW5dIs71HBLUapdv/s3qc1GmoAvdPgYQlNSBL2toP/1i9X2kaIAvtqZRMOd105x0hNFe
         pnAZCmnzOMgkCfx3Xy+Wd84sxFqn18XdeHwr/Phya6KniP3cFm/46AaZlBuQQlHbgM65
         e+Lg==
X-Gm-Message-State: AFq9FYIvq60m2+xVs9lUhDeiPELu+K+Y9yTVcrCpNsT+Sg61PAki115V
	lMHWG4Mz47ERg2NCDrxQCF7RG+UTBN8HmIOiMv5LPXkY9NaghcYaxh9u
X-Gm-Gg: AYBFou1YFIsRrwyKRJXFGTfjR+ksZpStkIEPwY2HMlsEy4E2ftZgirnMmc6+exrMUhK
	v6f4Sdwr0IgzVWTVr7c4C3BRpehLudGhKz0Tw/TEF7EQPaaLiqhanLPgk/m5qwK8SDIUHffkl0K
	TKZXByFAvrC34vucTakM6UUC4Lj9jD1+I2RJDTR0H/CVoc40gDRKckw59i2NgD+lMF20IKu4nyz
	bpheHqwMyKXqsszfE+NPSNOTD2JTsa3M31GH4YQ1ps1Gy0GfsLf9UgddCO0iL0et6MiFsJwi6o5
	gIeyGEMqyZTwhLPchDMmrblNeNFiq4WB3EJCMGDy9WIuVElEjHjVnQs7JNp6njAVMwcv000vfsc
	glgI3tGOKOFwf0jaDSuVuAXtrdI5YMp0kRQUk7ojd2g6H2l88EwhQYK6zz4uxZk5TsBlO/BoKMX
	e3ZR0c4erprEaWrlryH1N6gQOiKK7X+tb1YJkULc7AJvBJyKfyioj3Fla6mDhVbgGKsmIjbMbji
	ChuQHCDTn5p1Z8DA+A=
X-Received: by 2002:a05:6000:40ce:b0:487:27f9:835 with SMTP id ffacd0b85a97d-48b1271ad90mr13914155f8f.42.1791132099009;
        Sun, 04 Oct 2026 09:41:39 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f07cdsm18765185f8f.10.2026.10.04.09.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:41:38 -0700 (PDT)
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
Subject: [PATCH v2 0/3] mfd: aat2870: Convert to use OF bindings
Date: Sun,  4 Oct 2026 19:41:18 +0300
Message-ID: <20261004164121.193514-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
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
---

Svyatoslav Ryhel (3):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 +++++------------
 drivers/regulator/aat2870-regulator.c         |  77 ++++++++---
 drivers/video/backlight/aat2870_bl.c          |  55 ++++----
 include/linux/mfd/aat2870.h                   |  95 +------------
 5 files changed, 244 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

