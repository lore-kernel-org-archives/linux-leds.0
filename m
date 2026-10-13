Received: from mta0.migadu.com (out-43.mta0.migadu.com [91.218.175.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E70418A46
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870060; cv=none; b=otLOXw11l03ytyu95euK6lCQcgwbPQMHQP7N3FklIHibYH1LZjWE4q0idt9krAUZXTFofVdfIHdPAevyPoIQKR4cTiEHGEO1Sq3ldqvCiS9BK7xIhfaD5G+Y6TPtS+VD7jEExV3M/+opn7dOYYA/U+rMSA/WR9/ZYr5ko1XaOJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870060; c=relaxed/simple;
	bh=C80cTf+dCKDizV9UuYEuHwvAXOBX4zvv6XB1nDpVYTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uL49pdlJOsnvu4qgPhStW+g0PsyA3dL9EIVcwtrEuKOyWW6eh9M3LxPg7T3BvExco1xTI3Rgkpcqex3wVStpX8WpJ1JdLDRMkECxIk+kOiDwgn7EEJ8bE0UK4blBdOrN/OwVE0ipaMnP4Ls2Ta1ul9YtRnyhbvOr/GHCKE8Pu44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=NtcN3NXC; arc=none smtp.client-ip=91.218.175.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="NtcN3NXC"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=C80cTf+dCKDizV9UuYEuHwvAXOBX4zvv6XB1nDpVYTU=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791870056; v=1; x=1792474856;
 b=NtcN3NXC3vTJk6VG4EdGocTsrS4bTgAKRbSZmT15g6R39zw6GcoYepEnTUb9ysPFtzyomCYD
 C9FUjYyqcE0bitgA+Xhgt4fl8ERNjI/c8ZSIQMg2Ae4pTLf0+MzF+PasqkliE+7FTALg5LJck3F
 kaWxfkbRS7OFeoDKsU8lZdfsrDtMykrJGXW5HTM2J34RcZzcxzNHVFQT2E3loGiZXz+z1bRO7eo
 Ki2ByrfCfaLHxia5wKm/Mu748rTlSPiEOnl1V+xI2DqCC1AVOgzIlmlEQc+Eb30mYeF+jcuK3YC
 3JdHTzGR7XfpZ0Uo1ffJp0ZCy/8PSYYVIgKJmrzphQy8g==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bc08eeca230aa8ce;
	Tue, 13 Oct 2026 05:40:56 +0000
X-Mizu-Trace-ID: bc08eeca230aa8ce
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 12 Oct 2026 22:39:58 -0700
Subject: [PATCH v3 4/6] leds: aw2013: Move assignment of chip->num_leds
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-aw2013-aw20xx-rename-v3-4-cab1fdd050b6@postmarketos.org>
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
In-Reply-To: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: Nikita Travkin <nikita@trvn.ru>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791869999; l=1195;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=C80cTf+dCKDizV9UuYEuHwvAXOBX4zvv6XB1nDpVYTU=;
 b=qXTD6wfpC+WFampZmfsp0U9qfjQoImEqIKcgSt7l/tvYgTKBb7Khk3I7AdmNuqiO9xT3Zzt9K
 W7/rBeGo8LxC0BiiiXqekAvpQEiXxubpSHM5aRMu6RNytgAbKcH2BH6
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=

devm_led_classdev_register_ext() executes default triggers
synchronously, which call aw20xx_brightness_set().
aw20xx_chip_in_use() silently returns false, skipping chip enablement and
causing unbalanced regulator disables while probe is still running.

Increment chip->num_leds inside the loop, so that each call gets the
correct value for it's default trigger.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 05d61f4e5804..3b2be960c04d 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -398,6 +398,8 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 		led->cdev.brightness_set_blocking = aw2013_brightness_set;
 		led->cdev.blink_set = aw2013_blink_set;
 
+		chip->num_leds = i + 1;
+
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
 		if (ret < 0)
@@ -409,8 +411,6 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 	if (!count)
 		return -EINVAL;
 
-	chip->num_leds = i;
-
 	return 0;
 }
 

-- 
2.55.0

