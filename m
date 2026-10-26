Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044286;
	b=xhCg7gdfyF/fJ147jByqRpAjE2cmQej2RauH2EqqCP6+YZmmufZl2fMgr4cl4pnwVXU+
	 Vlukn4jQvXUkkVBbCWZc0Zyv8I6Y7dcj/a8N1ZbUsPPL1sq+7yIQiPYCxohLP98+oFnVO
	 TpeOKN/vf3BrjDufNCNeIHQrtlI6z3XAmZkGxkdhtIKzA5p1XqZROLSe4fI541kDGkMyl
	 iSnV/MowrEIb5hGKxc58q2H0qtpbHTGfbmxwqdd08Zh4Mj5mL9IhPuqdQRuiNszvXwaQT
	 UmjQQYgGwnkQhOKu6VL1m0QlAJdjFHVFiaxAZzqSDgzjr3WCOlh6snDvcThMQNsWSEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4b2ajp4FBPrDna2YeWMnx5O5XVNt9W3jkATtNW1wXKo=;
	b=PCVGCDjOMUojkfDvvXFE4nUSmTbalWiin8i5Lk3VNt/TJefeKc7qSRjEw/J4OV0698AM
	 sEwHFP/PoCCT/973YMdFc+gw74O0MczGmkWMv8dfGAs4MrQtfszQDPPbeVNmZ/2cmp3UK
	 UCL1gwQeQQ9UwfOGPrLPFlNxeBODqIbFBkWh+WhKT01iTWQBzCYb3mTI5IrbuLa5yxnMx
	 /f+pkrm5QycKJq8r+iPtEFDR3bE6PyCoXD9EAIVF6iL6Ls1Yl7zlIq5lNDlq96wkVXdkK
	 MzhNVHkTSp5QpT/CGHZerF/QTmW1Kc1C3zxMDJABCtwH+UQcw3XBB8CKDYqGzbs19kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=feYEH80F;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42469606A31F
	for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 19:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42469606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=feYEH80F
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so2564606f8f.3
        for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 12:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793044284; x=1793649084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4b2ajp4FBPrDna2YeWMnx5O5XVNt9W3jkATtNW1wXKo=;
        b=feYEH80FuTGX+mIFQCD8uHGEvbXlUSxByhEejpRyuyYMvBwvTKkmB4LKU/2Q1Dqxn1
         rYWTjYz66FLvEv1pfmg27AmldxWdkiAxR3O1SFimiZStr7xUn6PdYCaj+Hbv+XikVdFj
         VTknQCYldsZepXSHr7pp0srQrvhA3eurw+JQoWJ4au1n4XOlbJ+pJruBw4sDCnxExG1F
         8P/7jSRwzoUNjBfF6RbEwwgRfBtinYu+JXUyGzlsCdrA6yj20YrVZXSXab6v0Ch/mH4i
         x2FSuRADTowDXvsmjP6zwXY/6pEKpkH8ywOmrIJbHazptQKGEeUJVjTBqBk4qOUXKN/t
         OzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793044284; x=1793649084;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4b2ajp4FBPrDna2YeWMnx5O5XVNt9W3jkATtNW1wXKo=;
        b=OWArH7h6At5uBjMMKBkubXzfd34PHnb6qgW8ygF3bISnQt1eEs5wjnw0DSO7w51HMy
         Ae7mePeoFy0r9zin5cP0GjaTCZ5LxoCQNNhvoICv8aw9O0z5xkUSe1K+8AZ/OHBajFpa
         YpQcw8sW8AGI0kBW8ZxluoCYeF/NIPaKX0cAeUk3ysZ1GaQ58POd85L3YdGB8tA//+3S
         Hd5go/cQ55M9TBbYdvcs1M6/SrrrTo+lD/dVNLyHv22+fSdOF6/27TNScPPwxAN8VpDr
         wgZZvYZgMTZYDEdWQItGBWR8HCn3d1mZPIJriIObUq2Ocef7rk6NDkPe1vrm1WA7x6kn
         bYuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPSBcgWRSFHP3dCfF2g+U/bRM6iPnD2FG3Nu2OqrBQ94ZIdnH1nAssnaoJhfvrOWR4qCqEg+JkNEKg@vger.kernel.org
X-Gm-Message-State: AFq9FYL+wKaje8edYi4eWuZWO73QPnwnmj6naB2E+XKkg9y7lJAblI3S
	zYmCdf3MzAnSelP4WmNNIfg+rZt0B/pgN4uANFb5BY8XUPeT9zFA5ejH
X-Gm-Gg: AYBFou3YFeGvXa5vRnFDuKwqmnCdoMIXE917hwCOKsLl292Khihi5Xu8RRNUV51G4ca
	um68Fc7orqOetnPiFb6HRdLPvMmTPwQYIuO83IIcf7aXDb/iS17R5RBdeBwf45BANkyRFuUFlpB
	2a0sWOv3lc83oummu1etDdLbLL/Qm+kecIIXQr+3kPoLoAuHUhrTZUhqK4FfU2WDcWtq4fRA5Rs
	ZoD5fW4EsFctxcmhZAI3f8b3JrPzmBlB6/2o/HOw+aN6YLgJpYy7OUfytjheTumztASQS8xDuTx
	mK9kuFuHp4q/+kKGd8ASKdqdGxwcbklbLHHhr36ogx8NDwvFrLQtiQIMXP895pqPbUsTLAmEznH
	iUuyvpvrt9D0fV5GWa58wpEObwlF65VAiGCi9oeSK84V1S3JwJmtm1vV0ZkJTJ7XTEoAwSIbjF5
	7pVpJNRICbRmLuK7kyIXNUnJ0e/RCkD0aCPoi9F6QfoduIzr0M3dzJWUcTuMCY3Q3oha8PRxKml
	aOGhewc9y3iq8bn2pqsvSuj3y8RnZ5Q0FZItlil9MK4FmxAcnnvc3JYlfWrJMvHmxRssEmWnNkJ
	MmS73uxU1dy14wrCSPLvD7VfuY/Xt+DF8PFkFhgYCFK+BLC7Ql/26yNGAfam7m1KQgrK53l3aC+
	xh2hVikYqKF4vKy/Gg7+BNjPNO6klpHtWHwlEF6opSxzI0zKmFEmY5biUYf/9YtuWfX6d9Y7z/O
	v7kMZe
X-Received: by 2002:a5d:5e8d:0:b0:48d:ee35:b3fe with SMTP id ffacd0b85a97d-48e3eb3cbfamr12691780f8f.8.1793044284375;
        Mon, 26 Oct 2026 12:51:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm18877654f8f.9.2026.10.26.12.51.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 12:51:23 -0700 (PDT)
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
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] leds: Add support for CZ.NIC Turris 1.x LEDs
Date: Mon, 26 Oct 2026 20:51:18 +0100
Message-ID: <20261026195120.12759-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The CZ.NIC Turris 1.x routers have eight RGB LEDs driven by the CPLD.
turris1x.dts already describes the controller, but there is no driver.

Pali posted v1, v2 and a RESEND in 2022 [1][2][3]. I took the series
over with v3 [4] and kept Pali as the author.

The main change in v4 follows Marek's review. The five LAN LEDs share
one colour and can only be switched on and off, so rgb:lan-1 is now the
only multicolor LAN LED and its colour applies to all five. All five
have max_brightness 1.

Marek, I left out the symlinks. Linking a single attribute needs
compat_only_sysfs_link_entry_to_kobj(), which is meant for keeping old
paths working. Instead, the ABI says that rgb:lan-1 sets the colour of
all five. A link to the whole rgb:lan-1 directory can come on top if
you or Lee want it.

The global brightness moved from the Omnia ABI file to the Turris 1.x
one, because here it is a 0-255 CPLD level, not a percentage.

Based on leds/for-leds-next (59cf91cf87ab), because the driver uses
the hw_offloaded() callback queued there.

Tested on a Turris 1.1 with leds/for-leds-next plus this series, the
driver as a module and CONFIG_PROVE_LOCKING:
- the colour set through rgb:lan-1 shows on all LAN LEDs that are on,
  also while rgb:lan-1 is off or under a trigger
- brightness levels, triggers, unbind/bind and rmmod work as in v3
- no lockdep report from the driver
- after a reboot, the stock U-Boot (2015.04) finds the LEDs back under
  CPLD control, after sysrq-b they keep the Linux state (checked with
  v3, the shutdown code is the same)

W=1 and sparse on powerpc, COMPILE_TEST on x86_64 and arm64,
dt_binding_check, dtbs_check and get_abi.py show nothing new.
checkpatch --strict only asks about MAINTAINERS on 1/2 and warns about
a macro argument reuse on 2/2.

[1] https://lore.kernel.org/r/20220705000448.14337-1-pali@kernel.org/
[2] https://lore.kernel.org/r/20220705155929.25565-1-pali@kernel.org/
[3] https://lore.kernel.org/r/20221226123630.6515-1-pali@kernel.org/
[4] https://lore.kernel.org/r/20260928111907.72592-1-pepe.schlehofer@gmail.com/

Pali Rohár (2):
  dt-bindings: leds: Add CZ.NIC Turris 1.x LED controller
  leds: turris-1x: Add support for CZ.NIC Turris 1.x LEDs

 .../testing/sysfs-class-led-driver-turris1x   |  58 ++
 .../bindings/leds/cznic,turris1x-leds.yaml    | 132 ++++
 MAINTAINERS                                   |   9 +
 drivers/leds/Kconfig                          |  13 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-turris-1x.c                 | 624 ++++++++++++++++++
 6 files changed, 837 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-driver-turris1x
 create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
 create mode 100644 drivers/leds/leds-turris-1x.c


base-commit: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf
-- 
2.54.0 (Apple Git-157)

