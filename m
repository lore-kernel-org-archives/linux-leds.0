Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97B447DF86
	for <linux-leds@vger.kernel.org>; Fri,  5 Jun 2026 07:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644481; cv=none; b=jzhc9/n9V/uN5OBBXq0YEAlY/Ee14bQYaMTn2lVZ53hYvsV6lc7ujEhB/lOs0UWxazxq6lT0DyLJAjQhdX6WdBicni//Qeahm9Rcm6qCSgHDdU1GYnSf8IMpUDgvCRumZZOyxwM9cEVX0Ig1R6L3U70Dl37pZq49MYlDor4Yt34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644481; c=relaxed/simple;
	bh=gjr+y9XBXD0UmNyCeEhwDcRMFPWKz/ylhkwDK2INU/w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gsANpS8FHhN6HhlCNp6PKa9Qa4bcUHh49Q2KAU8rfPiC2UKq2w+SHO2HumPAC9mNzadZKSJNa5umLb8FeSW6HHwwWyt14eBIr/3gpJZusAGUxpTuG021RbkjBLAtaAwepATIXW04d8RKsEV+8pBQSbLrpnW9kqDAqmDdZKAPePI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wVOy9-0007Tn-1G; Fri, 05 Jun 2026 09:27:53 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Subject: [PATCH v2 0/2] leds: pwm-multicolor: Fix default-trigger by
 allowing default-intensity
Date: Fri, 05 Jun 2026 09:27:46 +0200
Message-Id: <20260605-multicolor-default-v2-0-ed07271df6b0@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHJ6ImoC/32Nyw6DIBBFf8XMujTgM+mq/2FcCAw6jQUDaGyM/
 160+y5Pcu65OwT0hAEe2Q4eVwrkbIL8loEaezsgI50Ycp7XvOYley9TJOUm55lG0ydiQmAhUWn
 kVQ9pOHs0tF3RtvtxWOQLVTxLpzFSiM5/rtdVnN7fg1UwziRvpDFlIaqiec5ohyV6Z2m7a4TuO
 I4v4BfpBcsAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1852; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=gjr+y9XBXD0UmNyCeEhwDcRMFPWKz/ylhkwDK2INU/w=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshSqirhWPJr6pqXhxa0VCYmJZ3iDJA8PSO71+Ne7dzr6
 ROfTu3i6yhlYRDjYpAVU2SJVZNTEDL2v25WaRcLM4eVCWQIAxenAExk9zlGho3NGS+X7OaOfNps
 8lBrpw27zmUex8MCt+6UvjraE/NO/CEjw2avQKEn0v8O9n0J9/xstSJhhvckxqvSp4KVxeTjo7q
 DmQA=
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
Changes in v2:
- dt-bindings: Use correct property name in example
- dt-bindings: Add missing word in property description
- Link to v1: https://patch.msgid.link/20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
To: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Jonas Rebmann (2):
      dt-bindings: leds: Add default-intensity property
      leds: pwm-multicolor: Introduce default-intensity property

 Documentation/devicetree/bindings/leds/common.yaml            | 11 +++++++++++
 .../devicetree/bindings/leds/leds-pwm-multicolor.yaml         |  4 ++++
 drivers/leds/rgb/leds-pwm-multicolor.c                        |  2 ++
 3 files changed, 17 insertions(+)
---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20260604-multicolor-default-11e3becde05a

Best regards,
--  
Jonas Rebmann <jre@pengutronix.de>

