Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23917451980
	for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752530; cv=none; b=A8yA+QkgU+xng36HtP+VBhXmNUtcdwu0hoRHmtD1HbJQyRLgGBJv2/qnZyKQpRN337CrH1JYYcqTeglfK34i9PcrOrlOacRR7Dr+meQcO3KWRVbJwixRaEiNUJBFn+oDBpseAqRkZgTuFr7aRnSgTfHbzuyjnr2lPTpCU0Dko8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752530; c=relaxed/simple;
	bh=9++OyGSJWEwT7/ctMO79NTROZZy/+9e80noaO28S9RA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RktJP3dvd8WzBQKfeu7Dz8R/h/Y/B6D7NnDDRRNyMtIQkKyg2VZNCIwJ8YXsXJM7gcOD5+UNtthZKHBV88oS/6lzOtrxYKyRg6RKJsxJcWMnVSyGFViJAaHdbRFZthHNz9HzvBb7+F4cexCp7ORIGfIIC9horkPCgPCp1h2YSTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO9Wd7u+; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO9Wd7u+"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso15188365e9.0
        for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 00:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790752524; x=1791357324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2prECYlfUYJhHJY0ODA9AKxpvoyiJexfpX9S3WhkkKk=;
        b=iO9Wd7u+iqFXWGwmmsFge8nvX5Dvm3a/mif3zcYO03V6O3bEOxLoC8OONh2/XPzK4z
         k2HqKqPfP6H4gltXcEw5xt2nkL4ffhFNFpwhrARCmgIlZSfEVC+DkMw1Fhil8AOkMrkH
         dh3Zjy6NzZv4ppdWKUA5MfiPAKiQ/Od2eA/sKqewVoOKyNdYsiuYO4LLjBhASMVa0cSK
         3GDFMZfaN5zz/vPMcYHbyVXtTJMlQ3U+fZEMykzwFtw9Fi/FuLMm4ncENuP0l/CQ2pvI
         Qb39/faltsngUCqBf2wbRvwxmuGHlOLOK1vJ5pt+a83YHM0Z+O7A5jgZTKvb372ENKsb
         83MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790752524; x=1791357324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2prECYlfUYJhHJY0ODA9AKxpvoyiJexfpX9S3WhkkKk=;
        b=OOYKzpUf12LcUMsdLI6FfOkeaEofuGZtDxOb1peANgfVdW+bx5rr2E1Bt26tn4/xZr
         tejE5dlozehzK4zqC2K4m/roITaxX4wIrrAv4O/+akBGIXbo1lNyumjrCfG9zHpCSC+a
         1UzFFS23FMyqRi65vscNWu9i2rVu3H5stBXWQyI+OKyAaFDdx3ASP64INtKc6M3YiVyZ
         FAcAiDLzcuS3Y5r7zWsnvEt10pa3Fxt9PESaLEd8aot5tVLRtfertuucvD3UF+Lwt2PY
         vajJvORXmz5wDfu1JKGB6Q1LgAIR6zOZYn0RO4lte8mpNoLLPN26aNzBy+rI7hZmFS8M
         xlBg==
X-Gm-Message-State: AFuF++kDSn3lez3SFOblzkCHxBYANznbTl/TjTcRmQndwUdqA84ycHLK
	ftpaRirqD6LHKVGL7Vfk5dfKSxr9e4Ah5CQ5TfJJKZeHTm4/OxtiVXxC
X-Gm-Gg: AYBFou0tiy3ej5b/Qh329QdH2tSmzLCo76kEWFYu/P72F9/bKRB3nmDcWKqyK/lHqaq
	t0BEBho2WgvgOyq900slFx0mPwo8Vdgdq+Tlbr4mvF0kNIHgMaNH6h5WH+TZ6BminyHp3ojMDWN
	JBaW7wuAoM4n4muy1/FgWbVowS63PIfQbOdLM2hk220wiPnWXzXxXA3uk9dy8iezamhLDNCFLNv
	oX7O0azrbhgFVWi7Dv3+xzGAG94BCxsFGMZxSxvAnlzHZRj5hsRNxr91T4gPhzkuMxXk1aUD+P8
	VN7ZQJDcCPp/+aLtycYLPqEkdeVGWm6sDJms+gwFqFIqSTNYAzhrnTuHY9VTqfDjRsgHVsfq0yB
	rT44nyFulu6BzdaGsuDtdZkCalzZxeL9yXZCFsL6oSvzXEhEhW0htJv34fDNUQumCFzhDQwryaN
	09Yc+5fhhlF1DtRe9mtWsSoEgDjsbUFiFqTw04nBITlGwGr+1QiHppRjCxf/pW4BIsUpSMNFdwq
	IBbAYXj0GMswgPB6twe
X-Received: by 2002:a05:600c:8b08:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a01b00226dmr7192805e9.33.1790752523915;
        Wed, 30 Sep 2026 00:15:23 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029be7e4sm1256979f8f.12.2026.09.30.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:15:23 -0700 (PDT)
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
Subject: [PATCH v1 0/3] mfd: aat2870: Convert to use OF bindings
Date: Wed, 30 Sep 2026 10:15:10 +0300
Message-ID: <20260930071513.54697-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (3):
  dt-bindings: mfd: Document Skyworks AAT2870
  mfd: aat2870: Convert to use OF bindings
  mfd: aat2870: Add support for VIN and IN-LDO power supplies

 .../bindings/leds/skyworks,aat2870.yaml       | 127 ++++++++++++++++++
 drivers/mfd/aat2870-core.c                    | 120 +++++------------
 drivers/regulator/aat2870-regulator.c         |  71 +++++++---
 drivers/video/backlight/aat2870_bl.c          |  54 ++++----
 include/linux/mfd/aat2870.h                   |  95 +------------
 5 files changed, 237 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/skyworks,aat2870.yaml

-- 
2.53.0

