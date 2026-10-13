Received: from mta0.migadu.com (out-50.mta0.migadu.com [91.218.175.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7BC418A46
	for <linux-leds@vger.kernel.org>; Tue, 13 Oct 2026 05:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791870066; cv=none; b=NOudpp9P1g10p7GYNAxTjowzz3Bkd9vKR9zXO7q49j7TFrd2JaUQinDDKcdXvXQa2MOWjCm9YbwKA+Jyso3xn7vOHHjpn/7zvd+1qQcM/UqI416RwFjmJFUTe+E3jq4RNFl5nBvX+4/8lnAcoq5m58tXJTs1u19a/CQXN1YvEmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791870066; c=relaxed/simple;
	bh=fJaaxpIDj/Lz/3gwE2o/A4O2SI6g7s8Vz+D/0y6FBJo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyShYcaFtONOoLBRWk/F545sjumzhrSs3aE+OsjIDUl12tqbcCir83oA31nkJofVQhxqANVfZPm7mrLht60Ih/mCQ0CTHblq5pwZ368y1NIutEPQ+TyJ8RHMSIZDKWC3Xoo2KAaHUj457mei3PZE4KzpgC1Qnu3GHWZO9cRi6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=OYIn2XPN; arc=none smtp.client-ip=91.218.175.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="OYIn2XPN"
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=fJaaxpIDj/Lz/3gwE2o/A4O2SI6g7s8Vz+D/0y6FBJo=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791870063; v=1; x=1792474863;
 b=OYIn2XPNrkuBRXcFtxEr5dyLSU99PxfIiGaobDiKbowIZmurhR61t89POCxqhGrKyqDbJcHW
 0zErxwD32LurtjwNSA0+1VVwjKbh1BsBzP+Gvpa3+WzLYWBonOIahXrHKXbJTzekSJxfNIpyo6T
 TAr2MlSnGagv+y3ErpZ5yyzj+/J0mEpIQiMndVrXIU1PwOxiNv+iNCWWbsoPczPYPlWdkrwEew7
 33uQqVQNWn/cWIY+2sn9JLGp2ZZDqEEblneYbRknCaBpAW6TVfXgpt5nMeNJ7E34FobkGNiSq8i
 UDSf8zJBRANmMjLeHidQGcezopzeG6i6JpZeKY54K7n1Q==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 55bab98a84577afa;
	Tue, 13 Oct 2026 05:41:03 +0000
X-Mizu-Trace-ID: 55bab98a84577afa
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Mon, 12 Oct 2026 22:39:59 -0700
Subject: [PATCH v3 5/6] leds: aw2013: Prevent writes to unpowered chip
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-aw2013-aw20xx-rename-v3-5-cab1fdd050b6@postmarketos.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791869999; l=2889;
 i=sajattack@postmarketos.org; s=20250413; h=from:subject:message-id;
 bh=fJaaxpIDj/Lz/3gwE2o/A4O2SI6g7s8Vz+D/0y6FBJo=;
 b=hDcGo8V5GHZ+VhRYVxLJSyvEsHqc1ciqiQ0fXwgEADupw1ChAb2/S45T5SAqLdYcHcdodkIar
 L8qRkCCWq7LBD6RESluBsDOzAjM966gBJycuEkDw8INUKXwpEg3SwDD
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=ZFE/UBqiz9Wr8b+zBL27opOjw5x5ket5JFqks/VQGeM=

Replace chip_in_use check with chip->enabled boolean in
aw20xx_brightness_set

During teardown, probe, or unregistration, the LED core initializes
cdev->brightness to 0 and queues a work to set the brightness to 0.
This can also be triggered by unprivileged user space via sysfs by
writing 0 to the brightness file when already 0.

When this occurs, aw2013_chip_in_use() evaluates to false and skips
enabling the regulators:

Because aw2013_chip_enable() is skipped, the driver then unconditionally
calls regmap_write() and regmap_update_bits(), which perform I2C
transactions to the unpowered chip.

To prevent writing gcr=0 when we couldn't power on the chip,
add aw2013_chip_poweroff()

To prevent turning the chip on/off unneccessarily, add a check for
writing brightness to 0.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 drivers/leds/leds-aw2013.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index 3b2be960c04d..6e661afd7775 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -193,15 +193,13 @@ static int aw2013_chip_init(struct aw2013 *chip)
 	return ret;
 }
 
-static void aw2013_chip_disable(struct aw2013 *chip)
+static void aw2013_chip_poweroff(struct aw2013 *chip)
 {
 	int ret;
 
 	if (!chip->enabled)
 		return;
 
-	regmap_write(chip->regmap, AW2013_GCR, 0);
-
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators),
 				     chip->regulators);
 	if (ret) {
@@ -213,6 +211,16 @@ static void aw2013_chip_disable(struct aw2013 *chip)
 	chip->enabled = false;
 }
 
+static void aw2013_chip_disable(struct aw2013 *chip)
+{
+	if (!chip->enabled)
+		return;
+
+	regmap_write(chip->regmap, AW2013_GCR, 0);
+
+	aw2013_chip_poweroff(chip);
+}
+
 static int aw2013_chip_enable(struct aw2013 *chip)
 {
 	int ret;
@@ -231,7 +239,7 @@ static int aw2013_chip_enable(struct aw2013 *chip)
 
 	ret = aw2013_chip_init(chip);
 	if (ret)
-		aw2013_chip_disable(chip);
+		aw2013_chip_poweroff(chip);
 
 	return ret;
 }
@@ -253,9 +261,12 @@ static int aw2013_brightness_set(struct led_classdev *cdev,
 	struct aw2013_led *led = container_of(cdev, struct aw2013_led, cdev);
 	int ret, num;
 
+	if (!led->chip->enabled && brightness == 0)
+		return 0;
+
 	mutex_lock(&led->chip->mutex);
 
-	if (aw2013_chip_in_use(led->chip)) {
+	if (!led->chip->enabled) {
 		ret = aw2013_chip_enable(led->chip);
 		if (ret)
 			goto error;
@@ -284,7 +295,12 @@ static int aw2013_brightness_set(struct led_classdev *cdev,
 	if (!aw2013_chip_in_use(led->chip))
 		aw2013_chip_disable(led->chip);
 
+	mutex_unlock(&led->chip->mutex);
+
+	return ret;
+
 error:
+	aw2013_chip_poweroff(led->chip);
 	mutex_unlock(&led->chip->mutex);
 
 	return ret;

-- 
2.55.0

