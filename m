Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733533;
	b=Ws5cfUVETfSyLKWLglJbs2H44Tgcux8VZThvDqGsPn+Gjb7uz2YsOuUHZLz49W+UNJKA
	 mUHLdVaFwg+QL5lJlHCUwnOIh3VvWcbCz8YTYtF9AmXWDND3PUT914hJl6OTvqswz5wbU
	 meEhh94AF5agYHXOoNqdo4qS4wCjAXlunnhIZMW9rfQYgi3GYcvYMEeJhtbeq35l/szxo
	 hicScIKfMpIqvqzkRKzY6FPBKjp8hxrrBIXBU/CB0tvxL0JXkc9fIT5KAcEnUc0uPX/O0
	 nAfM7cT4fOxGWW8MNHE2ztC0K9+Ezfnor0vcFdTESFYz6wMScmxTEzptCd6jhui/cqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
	b=XlVxK2OXzoAEt6U5KA9kHzPPrGPt2hlG+7K7gU9bj/3JoNqQCMq/9dUR+yNqGVZMO46O
	 /AbqX3EsEmAQkemX2CkD38F7YrKGph6RDRFm6hc7955WatMC8DRrcqDWlZmNbaqr2Qdj0
	 8VeJN9f1tAtvixMT5sB5GRUitbN7YqdYmwMvzGfuLZ9Z7/UQKO/aqQjUlph2LCmny5nZk
	 kLmAuYK0m/K15q6GfiJjEZUSy62RWCfqNaR3npSuXxytEtDpq3eSNDvBJEAc8uT1rdeoR
	 aar5cC202ZufgWzTlNQL9Eu1f0Wq20NnnkiolfKy982alHJVZZWy3Gk7dxAlCvGzppQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZEzl23J;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B8606A329
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 09:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F38B8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WZEzl23J
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50cc7540b7so48499166b.0
        for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 01:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794733531; x=1795338331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
        b=WZEzl23JKiuZ8TYYH80BBF0tEbF1rQKXBSe9ergk6FRLlwVUxhjaAu8Sd7fv1rI5Bu
         g1Jk/4uI2sfBGIHJ8bC345/3JtGxR0nxfSEjQBTV1eWTL21v7nZ7ELikOz9iuuKPONz3
         U8RBLhoizcLWzPrRTlXam38C7HdCSP41810emOm7SKRqwJMpWgG4Q466Wa3ASyLsX4Qk
         e8sHi+I2hF8xKBSacQBGS1HFrmERP/1eGDso2s2+Zfihb3XERt4PW6y8mlJzLj94udY7
         v56S+e2QyXgXPiPcfaj+QNqcTTVawANp7PC9RBNLTQtoZfZ4EIZhoSUnXjt64OYKfCAq
         xHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794733531; x=1795338331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZMg/nSjUq9iJR0S1fUdGtC09hfJyYX8pLkJgw5gz5Go=;
        b=sremuccBsYQf8SGknZFCHei0Rjs+orYN36e5RY1lqbZ0EsNh1wtpnldtH1vkwDjGOh
         n9/yFBy7TfE7o66i5qwD0WCTxwYvUEDIHONdPQC7zDagU5RGeWUI1uWRFNUp8SOPVJ5O
         dDuZYCGlRK7zFCbO9a0mxL44Mm1hG7h6NoMFCzT8zrzgd3VL9goLoApe2nNmE27qfuSC
         tzwchFiruqdpHKDCRr9K5AotTmhQin6YyacsjgyDnkc06a+zX60VmaYo7qb3BkZtkjIe
         9tqeIP9KQdoA9YRiSXzRd9aDogLjSV14unlmwOjXv5rFnZdmkdZBFzKaV1NsxTXROVVI
         Bx8g==
X-Forwarded-Encrypted: i=1; AL+hErEirJJcVjEywXKIQ0wDSLkLvE/gDmb51Tx9u6b980ONqZ99HYkPMFkZdGXjiSWkyIWQ7Hz8Au+ELOAW@vger.kernel.org
X-Gm-Message-State: APuU4Z/2n30Idi/PpFpjHsBjcZqHYYqwBiokXf6WtjcNNIMathVyLsES
	DLJKNpuK+WMG1y/t0pJtNMlaHpFFp6ls3derBBE8Jm7i5LjSBEEVDI9v
X-Gm-Gg: AYBFou2u5PdDXjz80d9fSbzaZMNpBPqMF+dmzVBYtInlAcc3stn/HBRXkpams1xL6We
	g3cp/jL6y2lnjb5j3o46D6gBvWPWYxRVNQy2qnLepV/AioFqgaxOczF03XgfVQPtaa+q6UudUmA
	+3XH4AfNEPYdn2MXxIODPa2T3djjk9ypDOHrdc0ntwqU+brBRNdPclPNRjz4mMZ6ZCuyDSNnjV1
	E011wLFocDxA5bsOqzqoicbIcKdkuW4Jq2EdjJcGN3FPRDRHBBa5EZCCQp0syBheS9doQqhDfvV
	RrA0e9/uytFyQPZ8gWqrajMYyQR2K94n28tzUvlkUxsdlJW5tAAYDMtvRl0ZTWQjGPA/ni8l5G0
	wuDI+QCZ5xKg+5f++oKpRUc6zs2vX340lgYvUGNZ23lvr2PZ9rttJzYHtOqw41/Gqpay5D1E5+u
	XVcP0wfrglvt0K6ackeTUUXDphXA01c9sdSZKNrViuMp5BYU86FpKv4tu9fPmOH3U1EVw+zS7WW
	DInGM5XpYcKlMMz7nKl6pEZbZlVCVxCwgSYmcqEDPkewvy9m/NmmTcfzkk0SPaFelOIsRonJ4pr
	LVtQAa1QcIgpzqUgP1NWImhY+9jF/Ycw+9UdlsHtNat9sSuzZxf0q1+DVrNA8w0yIAPkw87p7h7
	NqMpdtsCf9w==
X-Received: by 2002:a17:906:9fce:b0:c26:19de:9126 with SMTP id a640c23a62f3a-c5096342a7dmr672105166b.25.1794733531152;
        Sun, 15 Nov 2026 01:05:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm288103466b.1.2026.11.15.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 01:05:30 -0800 (PST)
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
Subject: [PATCH v6 0/3] leds: Add driver for MAX8907 LED cell
Date: Sun, 15 Nov 2026 11:05:17 +0200
Message-ID: <20261115090520.102216-1-clamor95@gmail.com>
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

Changes in v6:
- converted to devm_kzalloc_obj
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

