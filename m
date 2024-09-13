Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EEA1D86E3;
	Fri, 13 Sep 2024 12:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726230700; cv=none; b=dxrlUeNFqQ3GBb8qoUb6Ef1nO8ulI4JIIZDzXXq/4bNROEjmYnLyxQ7O02mcbBWksPfhohaJm+flhvq3ouu7nsBM3BDsICI4nYT5xr3qSWVDqyz8AKzjpbK+20mGFxe0kXFnA/EWZ/Tc16jKtoiUt/JKWp1oItRW85myc1bSGCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726230700; c=relaxed/simple;
	bh=z93xiTAMxlUviES4pfH+eJe8L643415tkjwDtltsdU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RJP+0wIc53ayZ4SG5767TQHgYXrcm6AakVsoDiNNNGsR/dHqPsIVZ0KERPVfNLJXyDO/NKRmOEGs0z4LNSncI2oImaJArqqipY2aGo9oLzbW9DgWzbnkwRaH7IrIIFhAy6XG0QnTYz29NPEJJOu1VFp8IiowZbo46RVaSqjuF/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4d87rWz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4d87rWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8DFC4CEC6;
	Fri, 13 Sep 2024 12:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726230700;
	bh=z93xiTAMxlUviES4pfH+eJe8L643415tkjwDtltsdU4=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4d87rWz9defTpFqRY2TK/3V8RB7SqF4kw0KuBe5JQf6Won8dt8W7oBWsGiaMLUGB
	 LPb70aB2LwrpCXz9mB7jUD1yQ4Kx/XHKQYoQuScGYOgfx8QcJ3omEMdxVDI0z6E23r
	 neAhTWwaYyk6d5wogIQKINUCM0/TPt15OktCSOuD0LXPqQ4GtaywhoD+2JN/4GoTXV
	 h4L30YTwy99jdq2QPxP+RrGc8jwJnNfI1HAk7uAI5kTVs1Macjp+E7B3w6TVEsAA94
	 SCUKlrbnTz/LK77/BAJ95SRlgPjuCSvMNY+BiFiiGFnatMZ5d55KUG/xUvC4spNkVW
	 Gbg08LDesN1OQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v3 08/11] leds: turris-omnia: Inform about missing LED gamma correction feature in the MCU driver
Date: Fri, 13 Sep 2024 14:31:00 +0200
Message-ID: <20240913123103.21226-9-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240913123103.21226-1-kabel@kernel.org>
References: <20240913123103.21226-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the LED gamma correction feature is missing in the MCU firmware,
inform about this in the MCU firmware probe function instead of LED
driver probe function, so that all the feature checks are in one place.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c               | 6 ------
 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index a87cdb58e476..570f7a69709c 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -429,12 +429,6 @@ static int omnia_leds_probe(struct i2c_client *client)
 	}
 
 	leds->has_gamma_correction = ret & OMNIA_FEAT_LED_GAMMA_CORRECTION;
-	if (!leds->has_gamma_correction) {
-		dev_info(dev,
-			 "Your board's MCU firmware does not support the LED gamma correction feature.\n");
-		dev_info(dev,
-			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
-	}
 
 	if (ret & OMNIA_FEAT_BRIGHTNESS_INT) {
 		ret = devm_request_any_context_irq(dev, client->irq,
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 3bb4a3cfdb29..770e680b96f9 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -259,6 +259,7 @@ static int omnia_mcu_read_features(struct omnia_mcu *mcu)
 		_DEF_FEAT(POWEROFF_WAKEUP,	"poweroff and wakeup"),
 		_DEF_FEAT(TRNG,			"true random number generator"),
 		_DEF_FEAT(BRIGHTNESS_INT,	"LED panel brightness change interrupt"),
+		_DEF_FEAT(LED_GAMMA_CORRECTION,	"LED gamma correction"),
 #undef _DEF_FEAT
 	};
 	struct i2c_client *client = mcu->client;
-- 
2.44.2

