Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794150854;
	b=LLy4Atuc2mCEeyfyWSbAO0bxT7hggOjL242UNSWLB1XDHqObQVQ6i1V7YmDM4hpBKFyH
	 B3AI9eMDnyZHzbRenl+nLfWZXnHzEGvxwW6F5e2FKW8hdv8M74JkNMGra5sTVgrjaVgw/
	 4ap5B/kVLYE0JUDuHtdDxHxMH3ehLmA0GqqvWNbc39Gm4BfODDCOj5FapzHIQSoQaTU/F
	 VAJcRJK3JBRTdgH9ou6rAXYJdVtQfp5tWswFcsWJzv4ModVZJQg5DiEYf8GPq3QjwL9Xd
	 f3hKvsbmAAeQKwHnnAwTHup/IUe90wvpRV5FhBJrWwQP/oXRKQvTynddHasl1mRIFaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794150854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
	b=e9fzUVgoxSdzU/iTzKgp07SHdEOBFdnP9fW1kmiD6BsJEeGRvcHCmzEiDWxdbcDD+s3C
	 JQMJnvgPlUVa4m3ldUlwOdB4hmUkOtRU1S1oqC1+80Ski7FZMwbvG3klFy0+tSvHpGFAm
	 k8OFemjfXIzNmV0w00MUo8Ngcp/3s8oRO38R/Q0YkpDCZrn8lZGsOojNyXKw26lwDZMXg
	 Fd8vxoVamQOogSPwE3pvxH/ODAKw4Ifo+cuoJiXM10q373dEV71sBcp8PREnOnYD6INGb
	 UFq5XuxzY7vL/HWZHz7XE04aY2ljngzvcovUKHbRjNzAK2RlmDuVYCEixKz/biDTXZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+sw3vLY;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDE3606A321
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 15:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CDE3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k+sw3vLY
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d427836e9so16898166b.1
        for <linux-leds@vger.kernel.org>; Sun, 08 Nov 2026 07:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794150852; x=1794755652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
        b=k+sw3vLYGtsdgh44ewI3ONGEVRE5G9Yc4ViLK/9qvelJ6ZuQ1Zg+Wy3yLBQj9ROLgd
         xs8ytVyJZNi3KPl8VJPkuuuPV5Mi98hZ9s7lytBpov8P3Dv8sm57NzypUQ3ewuDNxN+P
         ZbpLJCKQVPQEjt3EhHdXCk2STdgMORsCuFRsHRuRCufEvM/x6D21MPgZqtrrs6V3+go3
         VEZLh48Mk2yewVFxSVZYCOkqtYhQ8IZD1a9M8FSj9/cp2wbLKUxxKePnXQWWRq7SyUUE
         Cy9ZSGSUe2N+Mqp7zISjkA2uIb+izKV0GLdxE4z6dai0ODMn8sIoREhE9KSjJ0yq4+u3
         dpmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794150852; x=1794755652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cq0cqQDrxxDheKf6OQcVpHWZ5KutleAsdIV+8QNjz4=;
        b=g2WmtZcRbPBBtNtzhvNFZ6yCMvEVYwn8RzO3JXUqQSaS8WugirvYFutz0JskbeDof+
         F7RV0ufwBdJsN6hvPiPxCh2OZXzfULdFLm1sB88rDd4UDJ6AAx8ek/C1EKBDKKDzlm9R
         z+6IL16YMzJ1qlv9N05OoPmgTJGs3D9sxL7Xlj3+B1/JkWhVvTr/IiDL+hHd901e2SJx
         XFtm1WfXzGuN6Bl3HkkTvpfDG3w1DtaaeYP3Xj/KFeW+xM8CYT7nQxiTOe7KPxwW68af
         hUogPRCN5t0Ez9m4agp9sOHg8falNqb92B5+4ETgmgxVT47seMING/I7wQ09EvSRKqJ7
         wGjA==
X-Forwarded-Encrypted: i=1; AKwUvBwLEpO+6AIafPtbJvnV5XkmUBPgJcwH/1+WqtYMr/FHr+y11fCg7U17LAagL7ah6wr4/thMX8mdqxCN@vger.kernel.org
X-Gm-Message-State: APuU4Z/IIQik5b90euMo/TM9ydcH2DkndLWiYhe4J8p3JnbV7v1G5x3y
	+751sU9gZdRCdixhChxmpXCUSq0l4NDHgSo4xeht3JrFrjc8B4x7ipxC
X-Gm-Gg: AYBFou0fDdLRfUyNg+YgRuGDhKNa0sG+F8oO6URubcYIuGXTGaT3oO8MksWX+zX8iJf
	QVnEG7leozqNhW/FrN4W6xE7OqCpYBqNvX7bW3kp/DvlARY2DgH1RsB0ygdg8GWSDQFB+b2VIcA
	QzXiPZhWTPewzm33E9adMpp/JNe9kfDpaqPGSUsKrLXlgkse61xsD+/qhtPPmCR/jQpGroWE9tI
	gaZ8JueUkg2rBSeTaceN5PdDztDj++mb1liJOfQ/t4nwztPsdu5jq1wMAQbKju5ljpVQb38OXoT
	eT+2YvNf3g4GMfuPFxKj08U11/5GMsg8JD8zyD1tJnR8z1nv6+VWOh23JZ+JL/iE9ch0XkHlMiZ
	llDszjFWpdH2MBNx6/OtejaR+hhIaEy5sHOOVIajhNQZmEIqo+h68cVX+Yk5XxD2H2jt2uRFzy8
	9RyDJPnLZ5zHo7NwTExz4jcYcHV7OkSUdAIdtxmFjxSAq/FYAdu5Q6VvaPEvfTptfmmrPQnw5Xb
	wRU0s9eJ8ydk0IImKFZch6h7jLsZm+B00/OOSjRQ53ZghVsF/BpLKeSSRAFYEsmUqrJXAPdN2ee
	K3eeLwcbDMtMyB9kQWq6Al2brpK9GOdWebbt3xlHGadqqpHc1vNdDfM5aMY2nra79ge/kOEJD+Z
	LoB1j/fsHzw==
X-Received: by 2002:a17:906:c150:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c4d6db81459mr108618266b.35.1794150850606;
        Sun, 08 Nov 2026 07:14:10 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a978892sm69689966b.58.2026.11.08.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:14:08 -0800 (PST)
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
Subject: [PATCH v5 0/3] leds: Add driver for MAX8907 LED cell
Date: Sun,  8 Nov 2026 17:13:45 +0200
Message-ID: <20261108151348.204182-1-clamor95@gmail.com>
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

Add a small driver to control the LED cell provided by the MAX8907 PMIC.
The LED does not require any specific configuration and is folded into the
PMIC's node.

Patch 1 of the series requires this patch:
("regulator: dt-bindings: maxim,max8907: Convert to DT schema")
https://lore.kernel.org/lkml/20261027114634.79706-2-clamor95@gmail.com/

---
Changes in v2:
- rebased so patch is now applicable to linux/next

Changes in v3:
- added check if led is off for get callback
- added dedicated MAX8907_REG_WLED_MODE_ON mask
- switched to devm_led_classdev_register_ext

Changes in v4:
- platform_set_drvdata dropped
- init_data.devicename dropped
- added MODULE_ALIAS

Changes in v5:
- add and document a dedicated node for LED
- split adding led cell to mfd into separate commit
- expand Kconfig description
- populate devicename and default_label of init_data
- unfold platform_driver->driver

---

Svyatoslav Ryhel (3):
  regulator: dt-bindings: maxim,max8907: Document LED support
  leds: Add driver for MAX8907 LED cell
  mfd: max8907: Add LED cell

 .../bindings/regulator/maxim,max8907.yaml     |  4 +
 drivers/leds/Kconfig                          | 10 ++
 drivers/leds/Makefile                         |  1 +
 drivers/leds/leds-max8907.c                   | 99 +++++++++++++++++++
 drivers/mfd/max8907.c                         |  1 +
 include/linux/mfd/max8907.h                   |  2 +-
 6 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 drivers/leds/leds-max8907.c

-- 
2.53.0

