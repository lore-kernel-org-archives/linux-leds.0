Received: from alistairbell.org (alistairbell.org [88.208.227.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F303AA1BB
	for <linux-leds@vger.kernel.org>; Sun, 12 Jul 2026 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.208.227.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783882215; cv=none; b=AZKbE2vN+yLELIRON7LlcFiBz9+EhkIDIlH1hYaqFAYQ71NGiuAhrR7GHSQeSnHgMRo4CqSuWNBSXE+FLooCtpTxkupp97G0TIEUqHGsxah3svnEvWmyM4wTpesbipABKrk+/hj56kfbW2eoYvfCVByeGjaFj5k4shsQZFrDHes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783882215; c=relaxed/simple;
	bh=vSUZxbFibZXfE6NkNGNWLUY89b06SuuQ3woPcjBFEZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DKckZqfRo54UlGBD5/xk9emNKnWkl4I+m0NeA1BZopcXH14u3lfxXwP/DhB/p0J9CBWnelBWYTEjeZcyGlFLn4PhPUnxzIKo87kMlRW/VtrIbvZta3IZ63obeTGnjXKSHy2XhVowP/pLC1reZMVblb0JE9rX0YNwT45oLkMLkd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alistairbell.org; spf=pass smtp.mailfrom=alistairbell.org; dkim=pass (2048-bit key) header.d=alistairbell.org header.i=@alistairbell.org header.b=pSRatjIY; arc=none smtp.client-ip=88.208.227.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=alistairbell.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alistairbell.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alistairbell.org header.i=@alistairbell.org header.b="pSRatjIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alistairbell.org;
	s=mail; t=1783881843;
	bh=vSUZxbFibZXfE6NkNGNWLUY89b06SuuQ3woPcjBFEZo=;
	h=From:To:Cc:Subject:Date:From;
	b=pSRatjIYPp3FmtqhxaKNa8qMbTAJ7FPa69mTu0tY8GDTEgRP/U6A8nyH+oqfTg97i
	 dainaADqn0MQOFEP0+bpk5+seDJdCV4cBh25BwRA/09F20NqzO3+jIYwaBcCYWK6nv
	 rAdEJhs5Mu4HxjURyS1cvHFvD3VLJVPpaq9Y7MU1t0/NIi9DzSd7ERjnU8PIshDLw2
	 ZUhB9tE65EuuuPHOVcEzhyZhl8jC86a9LN+r386Ad3HrPrEsJawX57bsaaXl2FWt0M
	 Ng/H2dcmnNIO4qEB9DAqkyCUaq0xZhcp5uyckRCTNI0zKvJL61SbQue/oZawmcqyBU
	 2qaWWMB/e4Hag==
Received: from localhost (host-78-150-86-125.as13285.net [78.150.86.125])
	by alistairbell.org (Postfix) with ESMTPSA id BBBEC4EBA;
	Sun, 12 Jul 2026 18:44:03 +0000 (UTC)
From: Alistair Bell <dev@alistairbell.org>
To: linux-leds@vger.kernel.org
Cc: lee@kernel.org,
	pavel@kernel.org,
	Alistair Bell <dev@alistairbell.org>
Subject: [PATCH 0/2] leds: Introduce Texas Instruments LP5816 LED driver
Date: Sun, 12 Jul 2026 19:43:16 +0100
Message-ID: <20260712184318.78852-1-dev@alistairbell.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch series adds support for the Texas Instruments LP5816
4-channel I2C interface RGBW LED driver.

Provides sysfs control of fade, fade duration, fade profile and
control of maximum output current.

Tested on: Qualcomm's QCS615 arm64 platform via a daughter board
display adapter.

Alistair Bell (2):
  leds: Texas Instruments LP5816 driver
  dt-bindings: leds: Add binding for ti,lp5816

 .../ABI/testing/sysfs-class-leds-lp5816       | 123 +++++
 .../devicetree/bindings/leds/ti,lp5816.yaml   |  45 ++
 MAINTAINERS                                   |  10 +
 drivers/leds/Kconfig                          |  12 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp5816.c                    | 443 ++++++++++++++++++
 6 files changed, 634 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-leds-lp5816
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5816.yaml
 create mode 100644 drivers/leds/leds-lp5816.c

-- 
2.54.0

