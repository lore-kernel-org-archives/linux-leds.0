Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D09752ED3A;
	Tue, 13 Oct 2026 13:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897621; cv=none; b=C1ledxRhSW8j9C8lHuPrfe4/vh+UCG8uLu67LWNog6O+GPcH9F/WJO8hHTtQw8gYOzxru/v7BX3cL/waqWZ0TnXuTntinFbxC07LNR5jjI7OkwCE5S3VRuW4aPR5a8rAuFEElvruN8xEuE2dK2lg/LbGrfSEhzZpP01U6+idt4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897621; c=relaxed/simple;
	bh=6CdNCnWpy09BM7jE2pw0MaBViM/BpHicK7TfccNCRgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSFTWkxQbWfyKDy7SvvsQjIhLSt+eAEbFTxkDVpdnbwZx2xFFysQ4boTDdZV0Zpw/OJ7eHyx+KRvBLml52RSBOegtTqMYI1XFdxZmWzpTybgdJqqXpCZaAzbOMj+rvlqYBd6j++ZqaDwc0F9hxZZ3zr6qUOgo9/XfnI1nl8bDI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0mp0YJU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0mp0YJU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E511F00899;
	Tue, 13 Oct 2026 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791897620;
	bh=D7IY6Lisw7zZNJrVLV642q1jVkEHyhWNaxy4blO+12g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M0mp0YJUNiKyZwMTjiCJiez7j3Y2YuA5ncow1XuiTcgkh0b39hvbdhegQBJG8L+xo
	 uNChHLv9Fgz9GBMd+GSctt4yklTtgS/o65vV3mQE6BVgQ42s9b3nEz8AHCdMVutOFK
	 94TJJg88LP+MMvVedsUYUZeCQoPWprIAEgv1VfQk6bTQk1xhBEOC574wY/uBRMxJ1u
	 tc9NTv97o6SETvNXKjYBt8E4oPGj3SmqRQwn02aCi9n0gwQ3vcY0ojPQyEmTjQiF/M
	 8+wto/gHwlbs3ruj/O2Jx8X/TcjCoD382g2VSzCB84MRV9Kh9rOpfb686EoRXZtYJM
	 Zzav3DuzFBc5A==
From: Imre Kaloz <kaloz@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 53/53] MIPS: ip27_defconfig: enable the Fuel and Tezro front-panel LEDs
Date: Tue, 13 Oct 2026 15:17:13 +0200
Message-ID: <dbe0003e9622780813278f42fb422479820488ed.1791890466.git.kaloz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791890466.git.kaloz@kernel.org>
References: <cover.1791890466.git.kaloz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the LED class with its timer, heartbeat and default-on triggers,
and build the SGI Fuel and Tezro front-panel LED driver as a module.

Signed-off-by: Imre Kaloz <kaloz@kernel.org>
---
 arch/mips/configs/ip27_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/configs/ip27_defconfig b/arch/mips/configs/ip27_defconfig
index 2959615d656b..74f4a88f927a 100644
--- a/arch/mips/configs/ip27_defconfig
+++ b/arch/mips/configs/ip27_defconfig
@@ -133,6 +133,13 @@ CONFIG_USB=m
 CONFIG_USB_EHCI_HCD=m
 CONFIG_USB_OHCI_HCD=m
 CONFIG_USB_STORAGE=m
+CONFIG_NEW_LEDS=y
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_IP35=m
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_TIMER=m
+CONFIG_LEDS_TRIGGER_HEARTBEAT=m
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_M48T35=y
 CONFIG_UIO=y
-- 
2.47.3

