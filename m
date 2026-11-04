Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802261;
	b=Xl/bq+ZuhAEV+t8hM6CqQkEZMApctLaBA5EdO8pzOAclp1w9T4xd2T53Y6G5tpU5s2Iq
	 C4J/ohJVD1oedhCOU0nwxygcKAfvQpPG+5OswEpBaXfgKM1cr6PrG9l1tMALWO+iN47il
	 M3vyKbpvzX4Df0CnM3UpDDB8frG+TyIaSEjAxp93RJgFFX8O7tCJZBsjL99f3jeKDHq/j
	 d91uAEfP2kxBOlVo/FoxYfEtRwqr8t7pVwNpfYiSZWP8CjMc0F/l6sfwExcOIXfRXK75w
	 GEATlJ7zUHANQaD4V6E1iVJ+RhV5N1/P1sGY29rXQyUd7Lk2v2vdoK/3u5m4ua2agtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802261;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1N1gYnlaZgxYcnPx7D4dYkTOaGCtR/Ql2lzdyAvqS2E=;
	b=D8t1VmhDjDSM1AYChRwUG2zATjHbtbCBmwSFJXJXIB73O62O8WZxawN/GbPbyOBkrbdG
	 JibIpbR2APvTIA4f9AYNltFrBOyNxe18c0kIBOGYMP0lw4Y3CDlinQn87In2DIERYGxQ3
	 o8FnfKiM17rqGPgCJuqw9Ql60QFgq5g7pHsHq1uYsVOu9CJ3a00MgZOJikdrEVAjXMI6z
	 UlTbaQrBy/QTAo/5Utma+OT+zJRleh2UCfwWPYAVHVp6LrmRQQbSqtWOfWh1EOYfWGjSR
	 3wXxD89J8j4+/O6guwClismBEzped6AFxHiQ6qkZ1uOPtKYDj/ad6larrB2MMVGMdXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RI6WrVwT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A56606A335;
	Wed,  4 Nov 2026 14:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RI6WrVwT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4091F0093A;
	Wed,  4 Nov 2026 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793802260;
	bh=1N1gYnlaZgxYcnPx7D4dYkTOaGCtR/Ql2lzdyAvqS2E=;
	h=From:To:Cc:Subject:Date;
	b=RI6WrVwTDnukcpAgSC8v2VGtXU2eM4N2F4CasQRH5Pjzl2t+WaCbxcp8tWRHDwtPm
	 XDTpeV2EDuKTQHODGXByjkfe5mQkGP/K+WxQ5jVwU/OR6UW+9LaXzR+UpYV+hfBqDQ
	 uwyvB32xe0F9sZ4utMMl4klZDtf3TnU/Q+wyULQq/BtPYBSNLGvbFJvGfW/O5AIzOK
	 VNP+9GO9X6QrjtBBQE0DbavPtla8eiGdbKzQ/Ay23/1aj8rjxyE2yjhUkQNG72SqQ+
	 o2kkawzo0eBYvlaoK5Wla19SL6fYIZNKYUlVwdEVtdVcAdJQY53bR4e88lz1sp4duk
	 I1nJYSf9d0YmA==
From: Arnd Bergmann <arnd@kernel.org>
To: Nam Tran <trannamatk@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Liang Haowen <nbg2974@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: asus-aura-scsi: add CONFIG_SCSI_DH dependency
Date: Wed,  4 Nov 2026 14:20:56 +0100
Message-ID: <20261104142415.676757-1-arnd@kernel.org>
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

From: Arnd Bergmann <arnd@arndb.de>

Without the device handler support, the driver fails to link:

ERROR: modpost: drivers/leds/rgb/leds-asus-aura-scsi.ko: symbol 'scsi_register_device_handler' undefined!

Add a Kconfig dependency to only show the symbol if it can
be enabled.

Fixes: 6173959c7d4d ("leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/rgb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 983f50b7ed2d..3f6786616a7d 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -4,7 +4,7 @@ if LEDS_CLASS_MULTICOLOR
 
 config LEDS_ASUS_AURA_SCSI
 	tristate "ASUS Aura RGB LEDs on ROG external NVMe enclosures"
-	depends on SCSI
+	depends on SCSI && SCSI_DH
 	help
 	  Say Y here if you want to control the RGB LEDs of ASUS ROG
 	  external NVMe enclosures such as the ROG STRIX Arion. The LEDs
-- 
2.53.0

