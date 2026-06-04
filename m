Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3040961A
	for <linux-leds@vger.kernel.org>; Thu,  4 Jun 2026 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571250; cv=none; b=n8ENsgECsd6lpoLvrr/Un0Cb56CjivYQnH1Kdxk+M1ZW3+wA8WJKM8Z46jrVknBvLMSEnZWv2x55RjNJxKTZs6NaYG8l8rDSZis0szzD7HOfUZUu78XarzTSmyhJeSjYrNs8ySjNLl/N6vPh9X/2DKYQfa+unswTQI3et+z1Sjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571250; c=relaxed/simple;
	bh=r61IsFZ3swYwz17mLPEb7M6IRDu0lmNu/FPvdX3aGJ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fcUfYeqWcchCNhWopPHet+KyS08aTmCYeTWcp9nG/rA2YQGTF7kVaQvwrvP/gKs32JTHvciMjtq9lbZDU5K96hBEyTAlqXSsNvDhB7Lzp0g8UhAuO6wFuiXN3Kru2k51JJaM4Rxf6U3PZQ43HTUqQJKnL0m9VtX2xoLJy4Qy9r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wV5v0-0000OO-HM; Thu, 04 Jun 2026 13:07:22 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH 0/2] leds: pwm-multicolor: Fix default-trigger by allowing
 default-intensity
Date: Thu, 04 Jun 2026 13:06:56 +0200
Message-Id: <20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFFcIWoC/yXMQQ6DIBRF0a2QP5YE0DroVowDhKf9jYoBbZoY9
 y7q8Azu3SkhMhK9xU4RP04c5gxdCHIfOw+Q7LPJKFOrWlVy2saVXRhDlB69zZJao+zgPNTLUg6
 XiJ7/97RpH6et+8Kt14mO4wSqqXbHdgAAAA==
X-Change-ID: 20260604-multicolor-default-11e3becde05a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=r61IsFZ3swYwz17mLPEb7M6IRDu0lmNu/FPvdX3aGJ4=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshSjMnIKFnkvsaU1+r6hbWG0a4nf68X3S6dKH9i9zR2f
 tHgr/ZLOkpZGMS4GGTFFFli1eQUhIz9r5tV2sXCzGFlAhnCwMUpABMp3M7I8N2Gp3uyO99C4TqV
 HwlLolbcuPtjwZTsR9f2tpixaX+1OMjwP+NQ+97pkU8VOPh+KFQv+6GawX1N+bd3TJyYqJBg3/1
 lXAA=
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Typically using linux,default-trigger allows turning LEDs on on initialization
or triggering on e.g. a kernel panic regardless of how early.

While supported in pwm-multicolor, this was not usable because the
individual color components multiplication factor (intensity), defaulted
all to 0 (black) and the LED remains off regardless of its overall
"brightness" value.

Allow setting defaults for each component's intensity to make the other
"default-" properties actually usable here.

Update binding documentation accordingly.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
Jonas Rebmann (2):
      dt-bindings: leds: Add default-intensity property
      leds: pwm-multicolor: Introduce default-intensity property

 Documentation/devicetree/bindings/leds/common.yaml             | 10 ++++++++++
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml          |  4 ++++
 drivers/leds/rgb/leds-pwm-multicolor.c                         |  2 ++
 3 files changed, 16 insertions(+)
---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260604-multicolor-default-11e3becde05a

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>

