Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0561773463;
	Sat, 11 Jul 2026 18:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783795240; cv=pass; b=gOOvVQ+HRjh5pu4A7z7uNt9lKFiOuTUgPcth2lz08wkC9u1ZW3fhIGCSg0mdnRF/nxUKoOYfw8EhunGKtyKOuIt2ZDYi6CJr5Cj4m3L54W4HGy2qvOyGQtyD9KICdP7D0XXZYAaiVaRDkg40ntax+uUo2aVE8XYiC3dwKmNc4eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783795240; c=relaxed/simple;
	bh=sGQ9p61YrbWYe+9YCJK5cYY1RnCSQu66sez6jchXO+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LmKhRKgOqSnJNUoHR5rnpqTd/XntyaozF7yj5KNmNyZExt906COzQUMB+EdyhMynAKgLddZcdVRDVdFoi+MpOkZenzStQXbgqe6qDzdUoVOnYeuzXfw6rcN2F5Nma+MI7dzR0tjDEROIJgyI7muL0ug8x5BlLoDErymaZNPiWK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=IRMEgKDh; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="IRMEgKDh"
ARC-Seal: i=1; a=rsa-sha256; t=1783795232; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iNWJ8HVRlIW1tawExOd1kV78+tYM/hgsfCVHOEKaOAZv+ZxEEgnUVQ0DK6IdgtEJb7U3896f5FhLLcyNs7pfzvOUa2f0nyJBRFF/ZVV1ppPNWT71LgC3ch7I7YA3cka6WwTBJ77bOV7UqrASpTPxLpFwR1jyCAFTytN0hLWOcEM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783795232; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GcXklQ0lgf0UgcbxZnTQL0RhyyVoRYzfyiaH3mD/edc=; 
	b=WBVNetYijSwH4wyYzOQpC5FnA9TSFnG8txyu/WZ04KniCT8zsdsbxPrU4N8eDsROXrxIzS89Ph/JG6LwhepZ6IyC5hG8KU4dD7jgmQI+JKkCZXZr47t2EK161957/2AXjjFq9ZUt4MoJCpXgXgsYx7cR8atsNuCmY0VGvKBCWeE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783795232;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=GcXklQ0lgf0UgcbxZnTQL0RhyyVoRYzfyiaH3mD/edc=;
	b=IRMEgKDhKrZZcA/rgyEvx6DhFmqHs7CsjQX3PAwqMg3QnmDudad5bYaKP9T0PGGN
	sHxBctnkEl6qsV7XBN/Kk63roTUZFGUm/PCRzwq5C7uG0E50SqfGSYXeYf3R2+AExKx
	H807lJOscjBtPi8UDG9Tl+lKPf8FCmQegwFEuhizBGvyDNoV64TAbKIvHb5Tg+RsYxM
	09Pk5plI8lqVsipBjftgddaDdcIpAaBkLe4L1fP6/Dea62ZOoYjDZ5kvaVPQeyORbKT
	PXnwIn6dqDVKQHEtEMW1oN93gpyJMR8TpE0rWe31tBRZ7xLq5LRn94qWMWIc8W/5y5y
	/pfl8sY0+Q==
Received: by mx.zohomail.com with SMTPS id 1783795229189176.0095386549159;
	Sat, 11 Jul 2026 11:40:29 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 12 Jul 2026 02:40:24 +0800
Subject: [PATCH] leds: core: Disable hardware control when writing
 brightness
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-leds-hw-control-brightness-set-v1-1-1de593b09d26@rong.moe>
X-B4-Tracking: v=1; b=H4sIABeOUmoC/yXNwQrCMAyA4VcZORtw4Ebnq4iHpUvXyGgl6XQw9
 u5WPX6X/9/BWIUNrs0Oyi8xyamiPTXg45hmRpmqIbhAvesHXHgyjG/0ORXNC5LKHEtiMzQuSK2
 jS+hGOg8ENfJUDrL9Brf737bSg335VuE4PuYkGyuCAAAA
X-Change-ID: f8fb6869-leds-hw-control-brightness-set-b18b4f5ab09b
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-4217c
X-ZohoMailClient: External

Since the Fixes: commit, the brightness attribute becomes write-only
when the LED is controlled fully by the hardware. A write-only attribute
is very confusing.

Moreover, the LED driver may disable hardware control upon brightness
set, but the hardware control trigger remains active, resulting in the
software and hardware being out of sync.

Fix it by disabling hardware control when the brightness attribute is
written.

This should also match the semantics of hardware control:

    When the LED is in hw control, no software blink is possible and
    doing so will effectively disable hw control.

Fixes: b819dc7d8fb2 ("leds: core: Report ENODATA for brightness of hardware controlled LED")
Signed-off-by: Rong Zhang <i@rong.moe>
---
Note: led_trigger_is_hw_controlled() currently returns true only for
private triggers, as there is no way for the LED core to know if a
public hardware control trigger is in hardware control mode.

More discussions at https://lore.kernel.org/all/a0c35498226b33eebacf7641aed126ffc8f99456.camel@rong.moe/
---
 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index a51b0ed53886..3e25e5fb63dc 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -72,7 +72,7 @@ static ssize_t brightness_store(struct device *dev,
 	if (ret)
 		goto unlock;
 
-	if (state == LED_OFF)
+	if (state == LED_OFF || led_trigger_is_hw_controlled(led_cdev))
 		led_trigger_remove(led_cdev);
 	led_set_brightness(led_cdev, state);
 

---
base-commit: cab9e339cfbc1a4e075e53e281dfb00391e1a6bb
change-id: f8fb6869-leds-hw-control-brightness-set-b18b4f5ab09b

Thanks,
Rong

