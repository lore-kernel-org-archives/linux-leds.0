Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39395A0AB9
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 19:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789069408; cv=none; b=GiF/OTDPBXZ/Eti+yt6SHVI+66F/QGXBGTsc8Tq6TokxYBeksvVCT6qj3kgX9KngC5T2zldZXtd/j/lLXJx1a9yVFpEmYsP3HfGSprikcmGzwBpZb/inE1a1t0EA77yaFBnkQ6U13PqxqIRV8wWG0Lw2akm6PjPoEWSobSBgKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789069408; c=relaxed/simple;
	bh=7PnO3Pq1c+iSovghwuQMRdjVQl88oMavnosLpWP8g9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TzXp53fwx2Fd1Yonyhd/WWVn+uI7iNx/7xnG5UDjAc5Z9Z24BQuvgMMBnajdcZdm6LoQBRfnJJgtxbSeBaYAfOtt75wOMXhZxvromZ7ho6aqsfwBV77MATdsnX3KmAOepy9we7SwE3eTe7i/xxwd7oRXd1WVItb/FVt+BGaj7AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jtr45QhC; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jtr45QhC"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc9b6e3so982956d6.1
        for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 12:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789069404; x=1789674204; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=snj9tC0bDqpe3dx1Fv5pWoog9eBWG9c9NpwY8U2j6YY=;
        b=Jtr45QhC2NWE32p5AI44mxyAK0/CxmK8vBXBA6xZ5l/JnDxOAVhmll48rdJGoHVwhP
         lsNIyzPp+e12G5ptU0KWp0r8EGded49ljaKSoM7oqz3kylXgvTMgllJ3B/zad5NX69zn
         Dl98EjKf9bZAuGRYn6PdbuuMZ+IfFrmIzSvFCGkVRGjD7kouhp+wUtW5c14H4zCFHkKf
         t9sdrycm5p3IL/aooSzPNgXRnp+BUA9i4D/mX4mou7amM6xWuAWvrG9Y+qVhGkpQ57P6
         LGgq9RRh4EpjVKzIxY5VOYwjBRecQCwFf2Ox6NpGo6Fffnpquem1st02JBQ6qMW08GDR
         +gdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789069404; x=1789674204;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=snj9tC0bDqpe3dx1Fv5pWoog9eBWG9c9NpwY8U2j6YY=;
        b=XXn9DPBjf7zuD9Cpv4E53uDh8CwKYrlMQlhoebc5VG4pKgBEqBVvJ6x826pe49bk8Z
         OmW+BOy+6V3UFNkm/p7YCjMu0+xto4DoKD7WGcSBB84B9cr3pKoVJNdYMwKILQT6/fUu
         7DGumW/i3TMLmlGHmUP113f0wPraljkTvvLb1XvTkIacD75eWSDIFKhCQlmjEseUu4Kl
         gW36RIAjduh8sttx6adoeCQBwvkGBA2VNb/HdtO2hGyJwocmeTa98Ae/xe0PVRHLZefd
         2CtFkffeI8IEEEIsXbQ2L0y/36oONEMioXJgMbx8/q7w2bATHtS6QL2iH+01jdh5/f8f
         Pf5A==
X-Forwarded-Encrypted: i=1; AKwUvBylMQ6On59mlqeJVLLDrtcZYUV5QdXslhv+ms9yi6+H2AILepmDV4cc/PSvo3xSTtu0/7WKELoMUTou@vger.kernel.org
X-Gm-Message-State: AFuF++lgJEGLT3HGRzscQaDE6Rr+GZcEQULFZkAcSYrp+xIzJCoUn2ws
	PYuW3m30NzalSStEuvq2Ms/5iLOqcylTvk4GABr4+r4LZiF56qvq2NQs
X-Gm-Gg: AYBFou36Ay2q2GiOmhd911bng+5EEM+ysn16JwHjzmt4pQq1ACB84K3C3MDmrHRT1QS
	7mP1s4a6BcX2M9vJ3/OWU2wxmvuZubJYIljF21r87ZNz+8Mh54D98a+pcz6PY2wyjdfEtCh6QhK
	8Oz5ZJYg9vB2HgYCAQlq8nzhdYiGehMKFeqb6YptX1hNaY1zOa9IU/1VlyQhU2sVOMFzy5g900V
	ne0u0vUGMC2TZz1bbbndGz0grH4e/1kzIsto+XJyC1bQVK48PI9t9BbmIzOt6bCucUt11e7YT1Z
	/PHH9MIBSyYo3QItPP+BFb/ALCWeNndC20wOnZ/e4TuBBQOLtp3IgQ554DN+6yTAehII2Td3NVl
	i2NTs6LGMN7EHHEm14NV21mwECyeb3/CdsLFGu9vuHRpgljcvxDPtEqhIHfOfvdAS2w1hV2Msc/
	TzipexjFHRCuIzwjlSDnKFnMplZQMFGpmGD47g76u8vhsH4gjA+Fh//OrZdYCRXhU/jNAQTWw5b
	fNaNFYPenTDUJAK3YWfv+5YlB2AL93vqKa2ee5ZrQ==
X-Received: by 2002:a05:6214:2463:b0:910:40d0:27e5 with SMTP id 6a1803df08f44-9121211d247mr4478526d6.31.1789069403991;
        Thu, 10 Sep 2026 12:43:23 -0700 (PDT)
Received: from [127.0.1.1] (static-68-235-46-14.cust.tzulo.com. [68.235.46.14])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d389esm3441266d6.42.2026.09.10.12.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:43:23 -0700 (PDT)
From: Miles Krause <mileskrause5200@gmail.com>
Date: Thu, 10 Sep 2026 15:43:20 -0400
Subject: [PATCH] leds: lp8860: fix device_node leak in lp8860_probe()
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-leds-lp8860-of-node-leak-v1-1-d333cff4345b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MywqEMAwAf0VyNpB2JT5+RTy421SD0koLIoj/b
 tnjDMzckCWpZBiqG5KcmjWGAqau4LfOYRFUVxgsWabeEO7iMu5H1zFh9Biik+LmDfnztdyS92w
 aKPmRxOv1X4/T87yu57ToagAAAA==
X-Change-ID: 20260910-leds-lp8860-of-node-leak-63b2670ff614
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miles Krause <mileskrause5200@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789069402; l=3259;
 i=mileskrause5200@gmail.com; s=20260906; h=from:subject:message-id;
 bh=7PnO3Pq1c+iSovghwuQMRdjVQl88oMavnosLpWP8g9w=;
 b=qpHo2twLLZEDq8BSL5+VQk6SylAgp9sfM63GEBU9yv/QLSu4oeI9G4nZYA+O/bNGBbJ8JmL69
 2KG96/OQJ5CAKc6Uxd446JCXFJMYyJ1NKoJFNeqEJR1pBG9tIq7ogxF
X-Developer-Key: i=mileskrause5200@gmail.com; a=ed25519;
 pk=zcIfq4TGtPwMRJUW6WsbE2zLHvOMwk6ZyT/CGd6XzyI=

lp8860_probe() looks up the driver's single LED child node with
of_get_next_available_child() and hands it to the LED core as
init_data.fwnode, but never drops the reference that lookup returned:

	child_node = of_get_next_available_child(np, NULL);
	if (!child_node)
		return -EINVAL;
	...
	init_data.fwnode = of_fwnode_handle(child_node);

of_get_next_available_child() returns the node with its refcount
incremented, and the LED core does not take a reference of its own:
led_classdev_register_ext() only reads properties out of
init_data.fwnode and then stores the bare pointer with
device_set_node().  The reference therefore stays owned by the driver
for as long as it holds the node.

Nothing in lp8860_probe() ever releases it, so it is leaked on every
error return taken after the lookup - the enable GPIO, the vled
regulator, devm_mutex_init(), the regmap allocation, the optional
EEPROM programming and the LED class registration - and on a fully
successful probe alike.  A device that binds and unbinds repeatedly
leaks one device_node reference per bind.

Sibling drivers already get this right: leds-lm3692x.c, from the same
TI LED family, calls fwnode_handle_put(init_data.fwnode) once after
devm_led_classdev_register_ext() to cover both outcomes, while
leds-ktd2692.c and leds-aat1290.c take the node with __free(device_node).

Use __free(device_node) here too.  Unlike a single of_node_put() at the
end of probe it also covers the intermediate error returns, and it keeps
the node alive for the whole function, which the LED core still needs
when it reads the child's properties during registration.

Fixes: 99ca0ea57309 ("leds: lp8860: Use generic support for composing LED names")
Signed-off-by: Miles Krause <mileskrause5200@gmail.com>
---
Found by auditing drivers that take a device_node/fwnode reference during
probe and hand it to a subsystem registration helper without releasing it.

Compile-tested only (x86_64, CONFIG_LEDS_LP8860=m, W=1 clean); I have no
LP8860 hardware.
---
 drivers/leds/leds-lp8860.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-lp8860.c b/drivers/leds/leds-lp8860.c
index 69f064781f69..f6e4227de903 100644
--- a/drivers/leds/leds-lp8860.c
+++ b/drivers/leds/leds-lp8860.c
@@ -7,6 +7,7 @@
  * Author: Dan Murphy <dmurphy@ti.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/leds.h>
@@ -274,7 +275,6 @@ static int lp8860_probe(struct i2c_client *client)
 	int ret;
 	struct lp8860_led *led;
 	struct device_node *np = dev_of_node(&client->dev);
-	struct device_node *child_node;
 	struct led_init_data init_data = {};
 	struct gpio_desc *enable_gpio;
 
@@ -282,7 +282,8 @@ static int lp8860_probe(struct i2c_client *client)
 	if (!led)
 		return -ENOMEM;
 
-	child_node = of_get_next_available_child(np, NULL);
+	struct device_node *child_node __free(device_node) =
+		of_get_next_available_child(np, NULL);
 	if (!child_node)
 		return -EINVAL;
 

---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260910-leds-lp8860-of-node-leak-63b2670ff614

Best regards,
-- 
Miles Krause <mileskrause5200@gmail.com>

