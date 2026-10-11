Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D5399350
	for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 19:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791745847; cv=none; b=q9BYgpHXhiqX+7toJpR7rFp/fcjP0XevhgVMSUyjvY3Am5dNwv5RqPSUn9Zq5U4csk28vDCtyUE2EG0VyyX1IPOzYGgf3yRHBb597mAe0d6gEy8cf0/wIepbYJNUIII5CmM1Or4hrjZxggBZ2vdSvwGta1qI2RmyAPRCpJLMbe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791745847; c=relaxed/simple;
	bh=FQpo8sL4METOgekKA8In8MB/4q7eCT3gYeGZAlDgndQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RrXOECik24hEqwnObOJgYjW1LXIAqrBNegeMuwJrcyyaeaNwN+nUaoXvrBIsCYZJcML9jN876IA7HK/Ry/BtXTOU3ze3Zp+UjebdmTFRITVlRkokBPjEE6GTlq1YtFzYVi7wOD4f9E/nbbMVAquwQ7kQoPsp8hG363cjnzAhj1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUuQbj7i; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUuQbj7i"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4956869750eso9876205e9.2
        for <linux-leds@vger.kernel.org>; Sun, 11 Oct 2026 12:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791745844; x=1792350644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GmhGFE2ooIB1nHkCJeJhIMAuZpyyC5xWSFp5d59d0HA=;
        b=OUuQbj7ieFVmzh7/YEmK3rN5LbcG7yWR963sqXYwL638NPRNrGCJlDQNj3m/jiufxp
         gXC1BBAuXqamG8yI8rpnWmYmgTmcBqH6plgDiD3fdS3hvPfAJf/Yb7I7SmRKW7umtIYa
         8BNzpsELu2n3C8m9BnXi7HR+XrH/dnM/5+f1aG90Kqj0aJXMEE//Y5+QiME4XLCvoso6
         QxTi4iZC37SsSnL7T0FqJHInbanAtUk7TVXE4B4RK6TuFDWYqx2XhIq6ccMV2jpGxDAr
         Y5q3Vlp2eYMbJybFYGC+rVgwaKcHy8Vyk1a5uRw+7EC4bgQhQ//OrN3nesIUWMg587Zm
         SokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791745844; x=1792350644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GmhGFE2ooIB1nHkCJeJhIMAuZpyyC5xWSFp5d59d0HA=;
        b=ayoBAsiPWJn7kpAtQKpRQDyUyx0DMMgFtDSzuLD3dM+AVxOd37AxXguJukk8Tiecj2
         8244okKFoClCAPdA1nq9S+eogMpxG1Vokv4zvKK7o9GdsTTRkKClLcAN3uv+3WCXzHIz
         dkz5eIeglq6V1cyZ+kwHoMHLe8Rmzl5TPKieqGic5zp4Kmt2LnHtfC/WI22pxrZmUlZ+
         yuYi+DYf8rzCaRVNIs7lL+HEwPVbuqalqYdv8kdxGuZykxeRd41ExQ75zt7DNOQPbUNA
         4SSrW4/C+pTRix+sNdhqg4zMY/4+S2xIli3oiNJQwTniWAdmnersBWZGSaf4nKghL2xT
         H0tw==
X-Forwarded-Encrypted: i=1; AKwUvBzYAq9efdis/HfgumRhy5ZKjJCWZ7jeNzlIt1yUalQ4vVonSzQbW9RjBZ6NVYFM6jUk1BK6Tf/cnc0v@vger.kernel.org
X-Gm-Message-State: AFq9FYLqx/xyksZ3GoSvoaJqRIyptJvdk//NsrFZA+FAiCFgj8+EHmO0
	1CpzFXD1kXXVBzN+P6QmvQZ9iuXrlyo96NI0s85e4/OWRTuNzSRVk04J
X-Gm-Gg: AYBFou2QsZQ9YnllKtVe1swl/tTYlmg8CWllgnZGc4GV+7LIHod9ad1DuZsRYENnIeN
	m010FbOZc/R3f+G44UqgTN8wZHuNGDBd5woIvoNhSqWcirOnaLbs99pP/bNHj6inYsx7iudzcYr
	qvSRP35Gi3Uj2V/cUzxT1SO2Zeo6wVq7FH7BoaM6TACAM8Gkf9eHbLqkHyBAxllpUQcHhh696YQ
	+yXE6YwqC+GA1Z6yjimeIhSmIYt2MhI3QH/lKxKHUhhUC/FYHYnkFQKpeYQWyVMNjqoVzAecfkr
	oS9Rd7BOxATLm31w4ZsWTpRt74P0TEZOQ6BQgb9LWU6eBJd8DcVJvHp32luH3q0omLTnyMhQe17
	h5wuDuhOCe4FE7vYPnhPeUrMCug7no2LJhzpViSffmSOgQSvx+Wyx+7chGeBhk7wxnlZX/lBuqE
	zm4dU4zHEBBIA1JMdHZTjRgs2DW04TArlCkWOx2XHr3VvKSO2DNWDgvRElzGuUnTKoLsOcc47VB
	9P3kmHcfKSiwUaMXInEtZ1kxaXc/YhAnbI=
X-Received: by 2002:a05:600c:1908:b0:49f:ce73:5e94 with SMTP id 5b1f17b1804b1-4a18e4dd018mr144049015e9.34.1791745844160;
        Sun, 11 Oct 2026 12:10:44 -0700 (PDT)
Received: from rillian-arch ([90.244.147.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf15691sm225209795e9.6.2026.10.11.12.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:10:43 -0700 (PDT)
From: Rillian Grant <rillian.grant@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ruslan Koreev <koreev.r@gmail.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rillian Grant <rillian.grant@gmail.com>
Subject: [PATCH v3 0/4] leds: flash: LM3643 dual LED flash driver
Date: Sun, 11 Oct 2026 20:09:42 +0100
Message-ID: <20261011191026.149338-1-rillian.grant@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a flash LED driver for the Texas Instruments
LM3643. I wrote it to support the Windows Hello NIR illuminator on my
ThinkPad X9-15 Gen 1, which has a single LED connected to both current
sources. The driver has also been tested by Ruslan Koreev on a ThinkPad
X1 Carbon Gen 14.

On both ThinkPad models the chip is described by ACPI but has no _DSD.
The original RFC asked how to supply the missing child nodes. This
series includes DMI-matched software nodes for both laptop models.

1/4 DT binding
2/4 driver
3/4 DMI match table and values for the X1 Carbon
4/4 DMI entry for the X9-15 Gen 1

Changes in v3:
- dt-bindings: document the enable-gpios (HWEN), flash-gpios (STROBE)
  and vin-supply (IN) connections (Krzysztof Kozlowski)
- dt-bindings: drop redundant minimum: 0, use led-controller as the node
  name in the example and tidy formatting (Krzysztof Kozlowski)
- driver: enable the optional vin-supply and drive the optional HWEN
  GPIO high at probe
- driver: reject an out-of-range max-brightness rather than clamping after
  registration (previously LED core applied max-brightness exposing sysfs
  before the clamp)
- driver: allow a torch output to be switched off while the device is
  flashing (previously returned -EBUSY)
- driver: take the chip lock when claiming current outputs
- driver: fix indentation in lm3643_torch_get_brightness()
- 3/4, 4/4: use DMI_EXACT_MATCH for the DMI entries
- 3/4: log use of the DMI description with dev_dbg() instead of
  dev_info()

Changes in v2:
- Rebased onto leds/for-leds-next
- dt-bindings: make flash-max-microamp, led-max-microamp and
  flash-max-timeout-us required
- driver: return device to standby state when the last output is
  switched off (squashed fix provided by Ruslan Koreev)
- New 3/4: DMI mechanism and entry for the X1 Carbon developed by
  Ruslan. Plus a minor update to provide a reg property for consistency
  with the DT bindings.
- New 4/4: DMI entry for the X9-15 Gen 1 and update struct names to be
  model-specific.

v2: https://lore.kernel.org/all/20260928094302.86966-1-rillian.grant@gmail.com/
v1: https://lore.kernel.org/all/20260821083620.68324-1-rillian.grant@gmail.com/

Rillian Grant (3):
  dt-bindings: leds: Document TI LM3643 dual LED flash driver
  leds: flash: Add support for the TI LM3643 dual LED flash driver
  leds: flash: lm3643: Describe the LED on the Lenovo ThinkPad X9-15 Gen
    1

Ruslan Koreev (1):
  leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes

 .../devicetree/bindings/leds/ti,lm3643.yaml   | 143 +++
 MAINTAINERS                                   |   7 +
 drivers/leds/flash/Kconfig                    |  12 +
 drivers/leds/flash/Makefile                   |   1 +
 drivers/leds/flash/leds-lm3643.c              | 929 ++++++++++++++++++
 5 files changed, 1092 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3643.yaml
 create mode 100644 drivers/leds/flash/leds-lm3643.c


base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
-- 
2.56.0

