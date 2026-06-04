Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E91409615
	for <linux-leds@vger.kernel.org>; Thu,  4 Jun 2026 11:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780571251; cv=none; b=iRP21casdfkaGwD4+nQCQajjP8FnDRgP45xUWNYhH2tPJLFHDfP8sH9K8vE9LvH0EEfljKBN6jcO7HyKPXiN89xxcfAysima+bhgd/dmm9En+/59KG5N3xVRtzzD7EHIgt1DCr/WVY4WqhISzE05e6cY5rgnCi89J6IS4ovOeKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780571251; c=relaxed/simple;
	bh=m3EVhKuHhihMKDIb4q7QUoYR/Lso17Rn5p1IoK+IwW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=guXcPvomGGFbeRpBLIzUFxR/uo7CdyEyHlWesxe1hN31dC0F3q489Ze/9iaADHwAFM40qodqjF1S5VyH5r3JCFnEjUGMIJXx/jOejBTcw4Mz1zpAVv6cdae6BD/lJulGy3zBzWdTGvjUlZShxwnmb2YPK2AotinYabirn2DpeHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1wV5v0-0000OO-Lh; Thu, 04 Jun 2026 13:07:22 +0200
From: Jonas Rebmann <jre@pengutronix.de>
Date: Thu, 04 Jun 2026 13:06:58 +0200
Subject: [PATCH 2/2] leds: pwm-multicolor: Introduce default-intensity
 property
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-multicolor-default-v1-2-b07bff431537@pengutronix.de>
References: <20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de>
In-Reply-To: <20260604-multicolor-default-v1-0-b07bff431537@pengutronix.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Sven Schwermer <sven.schwermer@disruptive-technologies.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=m3EVhKuHhihMKDIb4q7QUoYR/Lso17Rn5p1IoK+IwW4=;
 b=owGbwMvMwCV2ZcYT3onnbjcwnlZLYshSjMmMfvFO23AT67WXwf7bvgUL/Knob5dwSD7d5nCBh
 5Eh3fNORykLgxgXg6yYIkusmpyCkLH/dbNKu1iYOaxMIEMYuDgFYCIc3gz/cxW+6xvEz33TeOX4
 IXbzUG5Zpk/n0zwFD5i+W+Dzs2WJPcM/m6w18r1iMxqZV63eaNve3Mgq7RzZw8+VtPyFDVeglwA
 bAA==
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org

Like all LED drivers, pwm-multicolor supports turning on an LED on boot
by setting linux,default-trigger, e.g. to "default-on". pwm-multicolor
however scales the brightness of the color-component sub-LEDs with their
individual intensity value. Since these intensities are
zero-initialized, on boot a trigger is invisible until colors are set
from userspace.

Fix linux,default-trigger for pwm-multicolor by allowing for nonzero
default-intensities but default to 0 for backwards-compatibility.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 drivers/leds/rgb/leds-pwm-multicolor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index e0d7d3c9215c..3e515df40583 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -95,6 +95,8 @@ static int iterate_subleds(struct device *dev, struct pwm_mc_led *priv,
 		}
 
 		subled[priv->mc_cdev.num_colors].color_index = color;
+		fwnode_property_read_u32(fwnode, "default-intensity",
+					 &subled[priv->mc_cdev.num_colors].intensity);
 		priv->mc_cdev.num_colors++;
 	}
 

-- 
2.54.0.129.g3edf2eeba9

