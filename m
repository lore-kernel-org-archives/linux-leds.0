Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A80429ACCD
	for <linux-leds@vger.kernel.org>; Sun, 23 Aug 2026 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787502913; cv=none; b=dYZO9Meu4Qioz0wn6zmk/bzpoHrgAmObEbIgDkAja/5plT5yz8va7WNqHBbKoPvCDCvhMhQTDhejT6X84JkjPOwCXoBU5E9Ts4Fdivea24lajEKf4fuWVqbjBpy2cv9sM6BdQFSjxzx0+v8koegdkPeD/duZ7t8kqYoY/lV/ucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787502913; c=relaxed/simple;
	bh=aUZfyDcyn/qUTYBYXPfu3IMeGSghp2a45vu5p4wcA0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyjDqJ8VCJssQd1cm+kyMN5LWAHihZ3ENMoDqbhRF0iXk6axr697MP9DhGZbhxx8ZiyKb+sB4+vXqoZ0G8iu7BxCo/5yxRJYSsRO7km8Xn91OG4ChVzY4z1o9ALV4SNtF4y8FP7v+y9o2/GTOvIXe/KfovSQuYAcip4L1bqQHtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q81wtnur; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q81wtnur"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84874b52eabso3547037b3a.0
        for <linux-leds@vger.kernel.org>; Sun, 23 Aug 2026 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787502911; x=1788107711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=prjAnP/SRTvGf+M2rK8PLCuJnba5+toLDCu/hcRcIQE=;
        b=Q81wtnurb79/4G/UHgTfA1+zWAzWuy1Ik55mMfa1dqiDmCGqVQinyenSOaDSE85s9B
         PhIwqoX79zonjIrM8/iYZH+SNiX4zPpE6JX6Dscmfpgu9C33ckuxrYfCUbUvG6b6f0J5
         Oc1oJeqLQTdPo/cK93qX9xnCMjvImynzoK9kHNdD4ftdVQaXnHc2vkAP8syeBwV8OdBM
         fgX+A5UPGRAX4Y4dlVjtsROcSgdtSWvmGZc0iOVGXx6WXbz0T8yCoDlM0jGkBq6RjJ+j
         8sfDmpU+fQ2DJta0duQk6xByoiPOtVyUJwovUOspEa3agZmTHyJw2hKtWfLVb6gmoeFC
         8JGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787502911; x=1788107711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=prjAnP/SRTvGf+M2rK8PLCuJnba5+toLDCu/hcRcIQE=;
        b=ppNPkEDcUZXgRRZCpsKQ6Zd5cwsLTG05QwfNoiTV/ZjdovAx36/fm+kzi2DaqX6ZGf
         wwS2w0qorO7zgwcwCkx2IATIFFVrh80ztR9NdLxpMvgwVHJv1RckUMxl/yxQW1R7eNye
         GuT4udKtXGsJiJAxCRQ+XDVoqJ07+cWu/e96Hmsz/rFGD7Ibhpw4RcWl65MmstqS2/Js
         DFiXdfdHHr4aGhz9++WHebDkLbSO6yrQ3XAEVE9AQAP+uJ7ZdO20HUtJQRhygMtyLqjv
         4maEst9em7JEx16zD2zatPoTLAjJiq286+GiN6A9tEt+vaUjfTDK5WkLyNte70Up61P6
         4oeA==
X-Forwarded-Encrypted: i=1; AHgh+RrvHA3tqYlm65m/X3y2kNzWeK6zflaklRhkLQh2wirNrB2iq5UKHgtvFSuLuNtBH/Yn9zqI0qDY38AH@vger.kernel.org
X-Gm-Message-State: AFuF++n203FuMo8mE3ZZkaD6rqVyyRgA57g3z00xaKm+I+p8u0p1oiLu
	SuhpmRecgItn92FqyWu0PzVwnKrNdoTncEmjC7ZNxVJoAnV5cP6fuv4t
X-Gm-Gg: AR+sD12nEhPifMwD5y4UOC/ceoBxSnnzK5cM8mzT3tS0zHKIhULm7hrEHFyYpPM0z+K
	JG+wc4xUZViYI09F37UMIUbJsqRmZ1VITgfpV70Hf9Xvnnf/MWqshiAYNTi0xZsdT7eTiw/5OnG
	m/zkYSevxqBhv74k4Be+mjrbnMSg3sogIlfr34lPAmEL+AkymBSXziXBMVkg8YyHBQr3fn3T+Y5
	UqpEj/+ypwQ06r4t0K/YrVlZ2JQbQkCDsDTtH8prYXg6EfpZrje3kfr0sAvVcUf7MF1LSFhYt9M
	M8CcIpSZR3JMIsAJqvOF8hiBI7mdgIkcb2QlsGmzboL3ALBSfZTlS6fW9Nwnib0LMSpLPc87qTq
	qbY8UEXj2TMlPLj4B/OYFg7Nl5896kqlQJ+Lt2mZevdpuwMMZo48/g7y2bi+nRiDZQsuzApWdWK
	cT06HId9NxnrWQ9QCJkzQMpZWBzkbOibo/IvBcSYu3bnWFOreLQfzf4tqNU7zN3pW7tPUaOr3vk
	REkwcBU7FuysaVvFFUhApHu+REbrAmlr1jxyS75j8nySN7YO+G5LxWZOTEaTzC2MV2trSu1E21G
	dC7+wmNO1XSW3QpKX9cj
X-Received: by 2002:a05:6a21:1786:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3cd2ffc3d9emr43809597637.9.1787502911459;
        Sun, 23 Aug 2026 09:35:11 -0700 (PDT)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f923615asm17514358eec.29.2026.08.23.09.35.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 23 Aug 2026 09:35:10 -0700 (PDT)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nam Tran <trannamatk@gmail.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ahmad Byagowi <ahmadexp@gmail.com>
Subject: [PATCH v7 0/2] leds: Add IS32FL3207 controller support
Date: Sun, 23 Aug 2026 09:35:07 -0700
Message-ID: <cover.1787502624.git.ahmadexp@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding and LED-class driver for the Lumissil IS32FL3207
18-channel constant-current LED controller. The driver supports individual
and multicolor LEDs, per-output current limits, an optional supply, and an
optional SDB GPIO.

This is the LED prerequisite split out of the Time Card series. The
dependent ptp_ocp board profiles will be resent to net-next after the LED
and I2C prerequisites land.

---

Changes since v6:
  - Restore the led-max-microamp schema minimum to 1 uA because the
    smallest representable nonzero current depends on the RISET value.
  - Document the RISET-dependent nonzero current-scaling requirement for
    individual and multicolor outputs.
  - Keep the driver patch unchanged.

Krzysztof's Reviewed-by from v3 is not carried because the binding changed
materially after that review. It now supports groups beginning at outputs
16 and 17 and documents the RISET/current-limit relationship.

Validation:
  - dt-doc-validate
  - dt-check-style --mode strict
  - yamllint
  - git diff --check
  - strict checkpatch
  - x86-64 Clang syntax check

v6: https://lore.kernel.org/r/cover.1787247467.git.ahmadexp@gmail.com/

Ahmad Byagowi (2):
  dt-bindings: leds: Add IS32FL3207 controller
  leds: is32fl3207: Add controller driver

 .../bindings/leds/issi,is32fl3207.yaml        | 285 +++++++
 MAINTAINERS                                   |   7 +
 drivers/leds/rgb/Kconfig                      |  11 +
 drivers/leds/rgb/Makefile                     |   1 +
 drivers/leds/rgb/leds-is32fl3207.c            | 736 ++++++++++++++++++
 5 files changed, 1040 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/issi,is32fl3207.yaml
 create mode 100644 drivers/leds/rgb/leds-is32fl3207.c


base-commit: f8cca63a0a4f3475199d9ab7f86782bdfeb0744d
-- 
2.50.1 (Apple Git-155)
