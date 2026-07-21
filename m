Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135BC2DECCB
	for <linux-leds@vger.kernel.org>; Tue, 21 Jul 2026 05:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784612948; cv=none; b=LWBNr8f0mLCS/VENqrxnfmVsnyeKZJo+69L5bgPv11nFziAjVaJML6PXb9L6rcq78inUqWZoE4t+MeRY2hJ4nMVju34ovRPvOGTpHodLohFYN3T0tkp86VnVjeHKBWM7LGzeWMWtwJc6+y5drRbV57rZh8LLU0PFeFmc3+reECE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784612948; c=relaxed/simple;
	bh=eIpKjg/gUi1hTHDZxXbsMg4h3s6qbKjK69Fms+RTvqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K1xxSyxHeFmKcSsiYJECqfT8P+HDntPR6APnuRpq3tiYBtb8zd56PDxwA4pSRmjJHhbCgTIUEH7jm4wGu3VVYL1L/bevpivD1VaB7BHmkSXP3ESGJYhxLZYn3Nf3oOXB9D6P+TjCWIrAbpWkABrAqjTHjEh8y1AKWnGFDz2+2iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=npdfKf5A; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="npdfKf5A"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso7147834a12.1
        for <linux-leds@vger.kernel.org>; Mon, 20 Jul 2026 22:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784612946; x=1785217746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/bpjeZyPOvtNftTHSI6J6cAqDkjUGmert9CkfI5dv6Y=;
        b=npdfKf5AUcZgWML3nhxC1ZssZcnp7qdBWHISCi7WMl8ZEcaaLrdQGP2IMgu6YOjaWJ
         a4s6ET/d4pyqIMkhC5qvGYOUulxHkx1mSa1y1BoyRP0rfxVh5M7bqppA8duitsb1TBkw
         OUFTHDJ1a9kjyXeBtIl4Zts86Db89G8SF1yRnAY5FTindKD3zSk96QcezxBUDYkUuDch
         wZl6pBfw6Fpn9QucRZduD20UPJEF/ZmPmIZCxYLmL+G3Y3IkWMQcsqNI32/iYRBP3Mnb
         HJSGLuDJaoo0HUEm9AG+tlu60XZJwVeKIuj732R5L37KlFWqJaXeAy28UC8MWK9Ib0c0
         2jIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784612946; x=1785217746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bpjeZyPOvtNftTHSI6J6cAqDkjUGmert9CkfI5dv6Y=;
        b=mlLDisGr1GNNUPNfEwaPzUdujk71MNPzXrEg2lqSP6tdFfSAS7b62MgJfkvAwE2fc3
         N2z3VYPAC5O0UTZiJ2WYYuknejl/vtXWJ05xs4X5XBH8UCWBI6sagWmhB7r0DSGGXiW7
         0QdVjnjdkUmDmk+viKr+83KAqkerw+E8/Kh0c1JPPMoKXcwQ/iXBkQPwsaGj5lxHJLMd
         vUXl/ZAf7hJjfc4UPjadeGwPZjzTQb+yOI4f7WhtSIg6inVvV484UbVTjTP6Z5tzODb7
         KtPuGWVqidv0EdbWyus/OCKSM5oEFB+sdVD1QeNy1Il1CxsirisKsleW/CydpKfZv0JJ
         6q2g==
X-Forwarded-Encrypted: i=1; AHgh+RoO/jD651X562bQ7qMft+MijzLGhCSYREuTWgCZlpHV8LCPqfOAvkXq8B3npdmfP62fCQWv5PssZmCy@vger.kernel.org
X-Gm-Message-State: AOJu0YzXQBxx+uYXpW977gOgZ6tm0gnIsi/5om/H2y4ZXR+GoTz7yICx
	ysYRwynSc6ua97o4qm2XLi3NkosMBLEwiyOhJkfgxSXFHZngcyxyJ8A=
X-Gm-Gg: AfdE7cnSMmtFMqbY4YPwqg1W/PIgpx0eLJnyJGczrxwNcAVAOWaRnZdn/zt07b1JuZr
	WBLrv+XMB5WguYlwDJaSbgj//626kKiA0x23CbL5lsBX1gxd71K3+iHpBipN+8WvSwtga2o4wgI
	uVJBx6iTt3seSnXatP7YFbC8UOTYc33ZCbnWnrUJOkc1CXVHWE3JrB+zc8HhW9/llQSqlOnn2B4
	4DsrTm96jP8vqxk5KvGTy/Z6a07WF/lgNhwpzln0zo7h+Ks+B5HIirVs+UroU/QFcxQ+CjSE7Z/
	CB9nx8TT52hizGhk3xUgEGlWvqlBExTYv7SJ7I6fvt0aATwc3a4dks2w/mjdi2RjPDxNlgjaxzZ
	6ky33/jJk/6VpdI25o+mgXkbLrweDv455AZtRWplCWpbCOP5jTS7beuw5rJkI2md2upNrzul+FG
	lE9Kc1ZoIE3G3Hue7ehwVKnIAmBDo=
X-Received: by 2002:a05:6a20:9397:b0:3c3:83e8:c211 with SMTP id adf61e73a8af0-3c3ada1fe89mr18397915637.63.1784612946355;
        Mon, 20 Jul 2026 22:49:06 -0700 (PDT)
Received: from t-rex ([2401:4900:adc3:1a5d:adf7:50fc:93fc:9a82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm42172695eec.13.2026.07.20.22.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 22:49:05 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: kauschluss@disroot.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH 0/2] leds: s2m: wire up missing of_match_table in platform drivers
Date: Tue, 21 Jul 2026 11:18:44 +0530
Message-ID: <20260721054846.34318-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

Both the S2M RGB and flash LED platform drivers define an OF match table
and register it with MODULE_DEVICE_TABLE(of, ...) to generate modalias
entries for DT-based module auto-loading, but forget to assign the table
to the platform_driver's .driver.of_match_table field.

The consequence is two-fold:
 - The kernel will never match and probe the driver when a DT node with
   the corresponding compatible string is present.
 - The MODULE_DEVICE_TABLE(of, ...) entries become dead code - uevent
   modalias strings are generated but the driver can never be loaded by
   them.

Both patches wire the existing tables up into the platform_driver struct,
fixing DT-based probing and module auto-loading without any functional
change to the non-DT (platform ID) probing path.

surendra (2):
  leds: rgb: s2m: wire up of_match_table in platform driver
  leds: flash: s2m: wire up of_match_table in platform driver

 drivers/leds/flash/leds-s2m-flash.c | 1 +
 drivers/leds/rgb/leds-s2m-rgb.c     | 1 +
 2 files changed, 2 insertions(+)

-- 
2.55.0

