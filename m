Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36514A0F03
	for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 11:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594357; cv=none; b=XKQ7EEQLo0V5aV4oYjWSi4t759C3mAsRQr08bST3gYA1b34cEcwVtNP7oQB7FXw5ipG8XEM95NsPT7vDjdKjA0HK8ge4EuBVjUot4ZFr7p55TRPtaW7QZoE5oFqN/lrhKUc76DF7BWYDB+IRAMKeUdWkI2ivhL750E5mnLL61Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594357; c=relaxed/simple;
	bh=kO3ynIq/wB6ie8eo0zrTf/NB7cypH/DrpREYSikioVs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hNT0u8AgsVyrbECD0CCqmnUyV3DhxdqDMCA8pD4ufkLwEYoeyA+S0cVV1vABjwbDYyjk1RqHWRC02iRWVhMyafdNuzo75Bz3uYjrBh1SBTEGju8oDjJXpAHbiW9914X/MbYkoM/IeKPDSlSt9Mdgm6BocpThKP5He4Xpx/e3l9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkPMsord; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkPMsord"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b021dbso1025471f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 28 Sep 2026 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790594353; x=1791199153; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wc84nfWgNf4LDDPo4HpZtovz6WNxAg7/CHpGE5J6vyA=;
        b=QkPMsord9VJSackfuNx9kszICrztNypybkDjzQfhCx3uLQAzzisZ63FC1ij24rMPuz
         PQQWTCmlABDhdeSgaGhEISAGUtv9toayM0hbPsZSR5PEr436Kri5E5CY3PfZQMmDMn8c
         eHlxu9Dje2wpoYJ6TBT94q5XxUgK2NV6AhnJjb7vdBJbw3VncRjsOH7teYlHT1OIq4dd
         isH0Ce1hkpppqzI+DbgyrirnHMYTJ7kFfc/daHa5yvf21uKv02Y9l0/Ex6fAle3sMpA6
         W2jARPsqk7JMN3MV5g7PhkMexO3Ndnl+a0ZOkD6II/X3GChKi9PkptEcEs62Rkigtv3n
         EkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790594353; x=1791199153;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wc84nfWgNf4LDDPo4HpZtovz6WNxAg7/CHpGE5J6vyA=;
        b=ov4DCY3Ts/ibFqm5GHvEaFPatcXqvlrzJ3j9SIb3STgTtX/TByaTeD3E0TUDSoErrA
         l5RxSJQ/QSPdzIe1emQ3kcQDax17Rs8jEcNxRqpYk/nMYpnS3bTOkCEuFLUlUAnvt0X9
         0/7SJBmxyOZ1/iAxJXVwnMjh7e55mAKOtx8HRxm5kbDwEFzDkYysAeuS6o/CgswLcFRM
         z/4yX3VhXLH7/bywNV6H46hYhpl1z7Ou5tnasRrdpfOBWQa1XqXjq20ROXsaCdx6ImVM
         eSDm/8sV5/X/Qkx4TYRSkSLpTivAo7uXpTpoFS8T+DCgy+fIlMF8NmUnTCwGlCmWzUXJ
         v2ZQ==
X-Forwarded-Encrypted: i=1; AKwUvByxM72WEmCAoMmaE3Iz7zcbF+R9c+cVoZs1412BCWUpsgwZ3LHm7nn/ne6S0+WPBHCogfTstRtW8UrF@vger.kernel.org
X-Gm-Message-State: AFq9FYKPsmYUgMwmIAairRlgNpgjHRYSH8Xf9/Pku9s5x11ysUDRznCC
	yLdbXRhkumQ0KZIVOfjBUj9i9Yazw8ohWOKrKEahnE+nnnTc8K4a4QSP
X-Gm-Gg: AYBFou2WhofNpGwTijl7pNSzGV3oxSmUjVpEpLgKweFx4Rx9w5nbtyRQuQJk1enoagl
	gvKQyUnskDhYTNgd2gA7IwsW9BUFiDn8636Uux9xibkx1/INS4y/OxWn/sQ5ViX4FAvarBkhfKR
	UksilZlOOZUhnyhB1i3AmhSp/kvugyaG+Qepp9wS5vu237+KeatAmMVUVqazO0PDnwJQJSFHUuy
	QqK3GO/KMm74mO6l1O0oxKmg403hX9fIWha9M3+mSjrHdgEJmbEMkghcC2H2smYhkL/4p9g63qq
	cipiJ2hWaMAlWYnwlRkm/zcxmov/3d8cP0ljXGcOS6tx65fntQ3IPWyDY099ZBgO7T8kx1UKgr/
	UO1B41QJRTQnCisDqiLAC+cqnpkhWrU451Njr3JekP4uRmROIw5IhREwF9DcGnXWyatoB2M9HDz
	mWnOXSZVdd7oJWYHnlr6ZvEHxHJHwDvNy456k6wLCMXk19nsChaJHttudeaTVwJ4I0m6PL4EjaQ
	XiWWYJGU81zwsVPGO9c2eAIz6jvmY8/EndvgaT7NWPm1mn9ytaSXo2lc4X79MveGQMdXTFizgQN
	XsPV2dVJZwisecH4MAPwmWWowWpH09jqmv+WaGwHFxi+JjIwAWw=
X-Received: by 2002:a05:6000:4108:b0:488:7787:469d with SMTP id ffacd0b85a97d-4887787490dmr17106824f8f.25.1790594352582;
        Mon, 28 Sep 2026 04:19:12 -0700 (PDT)
Received: from localhost.localdomain (37-188-186-98.red.o2.cz. [37.188.186.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm26164969f8f.9.2026.09.28.04.19.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 28 Sep 2026 04:19:11 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Rong Zhang <i@rong.moe>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] leds: Add support for CZ.NIC Turris 1.x LEDs
Date: Mon, 28 Sep 2026 13:19:05 +0200
Message-ID: <20260928111907.72592-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CZ.NIC Turris 1.x routers have eight RGB LEDs on the front panel,
driven by the CZ.NIC CPLD firmware. arch/powerpc/boot/dts/turris1x.dts
already describes the LED controller, but there is no driver for it, so
Linux cannot control these LEDs.

Pali posted v1 and v2 in July 2022 [1][2] and a RESEND in December 2022
[3]. The RESEND did not address the review of v2, and Krzysztof NAKed
the binding [4] and objected to the driver [5] for that reason. Lee
asked Pavel whether he was happy with the user-space interface [6] and
later reviewed the driver [7]. Pali answered part of that review [8],
but no new version followed.

I am picking the series up. Most of the driver was reworked for v3;
authorship stays with Pali as the original author. The changelog of
each patch lists the changes and, for the review points that did not
lead to a change, the reason.

On the user-space interface: the global brightness follows the Turris
Omnia driver, which already has /sys/class/leds/<led>/device/brightness
[9]. The Turris 1.x uses the same attribute, documented in the same ABI
entry. Marek asked in the v1 review for the index of the selected level
[10], which is brightness_level, and Lee asked for one value per file
instead of the eight values in one brightness_values file [7], which
are now brightness_levels/<N>.

Marek, patch 2/2 extends the brightness entry in
Documentation/ABI/testing/sysfs-class-led-driver-turris-omnia and adds
that file to the new MAINTAINERS entry. Could you ack that part?

The series is based on leds/for-leds-next (05b4738b0078). The driver
implements hw_offloaded() for its private trigger and sets
hw_control_trigger, as the hardware control changes there require, so
it does not build on mainline yet.

Testing on a Turris 1.1:
- With OpenWrt's 6.18.44 kernel, the driver as it was before that
  adaptation, built as a module: colour and brightness, the brightness
  level attributes including invalid writes, the timer trigger, the
  turris1x-cpld hardware trigger, unbind and bind, and rmmod while
  triggers ran and a level file was held open, also watched at the
  panel. After a reboot, the CPLD registers read at the U-Boot prompt
  still had the WiFi LED's disable bit that the shutdown handler sets,
  and after sysrq-b, which skips the shutdown, the bit was clear. With
  linux,default-trigger set in the device tree, the driver took those
  LEDs over from the CPLD, and the turris1x-cpld trigger gave them back.
- With a kernel built from leds/for-leds-next and this series, the
  driver built in: the LEDs except the WiFi LED start under the
  turris1x-cpld trigger, which trigger_may_offload_to_hw reports as
  offloaded and under which reading brightness returns ENODATA. Writing
  a brightness drops the trigger, writing multi_intensity keeps it, the
  timer trigger works, and unbind and bind give the LEDs back to the
  CPLD. The WiFi LED has no trigger_may_offload_to_hw. The panel showed
  the same.
The lines were rewrapped at 100 columns after these runs, which changes
no object code (objdump -dr). Neither kernel had lock debugging.

dt_binding_check with dtschema 2026.9 is clean and rejects a bogus
property added to the example, dtbs_check reports no warning for the LED
controller in turris1x.dtb, and tools/docs/get_abi.py reports no new
warning. checkpatch --strict reports only the MAINTAINERS question on
1/2, answered in its changelog, and a macro argument reuse check on 2/2,
where the argument is always a literal. Built with W=1 and sparse on
leds/for-leds-next (05b4738b0078) for powerpc, as a module and built in
(vmlinux links), and with COMPILE_TEST for x86_64 and arm64 as a module.

[1] https://lore.kernel.org/r/20220705000448.14337-1-pali@kernel.org/
[2] https://lore.kernel.org/r/20220705155929.25565-1-pali@kernel.org/
[3] https://lore.kernel.org/r/20221226123630.6515-1-pali@kernel.org/
[4] https://lore.kernel.org/r/8b829332-5cd7-2910-88db-513716e0919a@kernel.org/
[5] https://lore.kernel.org/r/d8172c80-a3a0-07f6-97ea-9130c49fab18@kernel.org/
[6] https://lore.kernel.org/r/Y9Ozg2O41a2iijMc@google.com/
[7] https://lore.kernel.org/r/Y/iDVlodp9sBkX9D@google.com/
[8] https://lore.kernel.org/r/20230309203526.5hcfa2w47vqzmny6@pali/
[9] https://lore.kernel.org/r/20230202234653.ukwpjntws3roacty@pali/
[10] https://lore.kernel.org/r/20220705143001.7371a256@thinkpad/

Pali Rohár (2):
  dt-bindings: leds: Add CZ.NIC Turris 1.x LED controller
  leds: Add support for Turris 1.x LEDs

 .../sysfs-class-led-driver-turris-omnia       |  13 +-
 .../testing/sysfs-class-led-driver-turris1x   |  23 +
 .../bindings/leds/cznic,turris1x-leds.yaml    | 132 ++++
 MAINTAINERS                                   |  10 +
 drivers/leds/Kconfig                          |  13 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-1x.c                 | 609 ++++++++++++++++++
 7 files changed, 798 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris1x
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
 create mode 100644 drivers/leds/leds-turris-1x.c


base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
-- 
2.54.0 (Apple Git-157)

