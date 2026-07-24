Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACDE3672AF
	for <linux-leds@vger.kernel.org>; Fri, 24 Jul 2026 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784916265; cv=none; b=jAoRL64DhxOARphdfg2XqEFzGAFdj9P20YifCjouTpm6qqOh/67cqwLyPwhZFlNPIaxwdjDswOgOif/tLj51vkU/wlHTgvgrWgp142WO6ILqj4djZ6x9FLXmKmVYpE77vCVO7jlDwKup3c93Rvyt2EnIPt7VRtweTnqV5HVS91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784916265; c=relaxed/simple;
	bh=gmMEA5lfdVh9rgjcPqUjzS/nd0BnITRKK/PqY9WreDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhYZU/N37cpJ7nnIJ5Yf76unHB7zhttbLAOK6Q53BUVRaSxbO3Ye0Zg2LyYxFXZN59mnz2+QIm8C54lPY0qwLUDF0ETbMoqYREEQDoUAX+QEvheiuASy4elyoWKifKYftiLfvftOQPPH0I916SPnTSurhGFVqJuN88RiliD6z8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hH5Ho7Zq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hH5Ho7Zq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784916262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rsRgORrUyFjAZPmEa6ZnKNicLGg7rpsxelwqsv54gy4=;
	b=hH5Ho7Zq1p20/QE10QpaEz4hvvc5N+yigIfIYR+QVtsUCxjs0gpgFDLV2NOOwDJ1VjqSuw
	AFpq6e1TDo49uROaTPI54Gk8Kai78sHvmOKV4vZE990obqbqILHNiYAlLdptaXcziNKWtb
	XDo8XowdXpTs8JqlXfbkfnd+axZ7fQw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-Y2kALGDgOJugxPSfprpAcA-1; Fri,
 24 Jul 2026 14:04:20 -0400
X-MC-Unique: Y2kALGDgOJugxPSfprpAcA-1
X-Mimecast-MFC-AGG-ID: Y2kALGDgOJugxPSfprpAcA_1784916259
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3DEDB180AEB5;
	Fri, 24 Jul 2026 18:04:19 +0000 (UTC)
Received: from firien.redhat.com (unknown [10.22.81.88])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AFE930002E2;
	Fri, 24 Jul 2026 18:04:17 +0000 (UTC)
From: Steve Dunnagan <sdunnaga@redhat.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: gpio: Clear error pointers for skipped LEDs
Date: Fri, 24 Jul 2026 14:04:12 -0400
Message-ID: <20260724180412.43150-1-sdunnaga@redhat.com>
In-Reply-To: <20260710150841.19669-1-sdunnaga@redhat.com>
References: <20260710150841.19669-1-sdunnaga@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

gpio_led_get_gpiod() returns an error pointer when a platform-data
LED's GPIO is unavailable. gpio_led_probe() skips registration in that
case, but leaves the error pointer in led_dat->gpiod.

The skipped entry remains included in priv->num_leds. During shutdown,
gpio_led_shutdown() walks those entries and passes the error pointer to
gpio_led_set(), producing:

  gpiod_set_value: invalid GPIO (errorpointer: -ENOENT)

Clear led_dat->gpiod before skipping the LED so skipped entries do not
retain error-valued descriptors.

Fixes: 45d4c6de4e49 ("leds: gpio: Try to lookup gpiod from device")
Suggested-by: Lee Jones <lee@kernel.org>
Assisted-by: ChatGPT:GPT-5.5-Thinking
Signed-off-by: Steve Dunnagan <sdunnaga@redhat.com>
---
Changes in v2:
- Clear led_dat->gpiod in the probe skip path instead of checking for
  error-valued descriptors during shutdown, as suggested by Lee.

Tested on an Orange Pi 5 Plus running Fedora 42 with a test platform
device containing an unavailable GPIO LED. Before the fix, reboot
logged:

  gpiod_set_value: invalid GPIO (errorpointer: -ENOENT)

After the fix, the LED was still skipped during probe, but reboot
completed without the invalid-GPIO warning.

 drivers/leds/leds-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 8ae71c2e91e0..8810fdcf2d77 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -277,6 +277,7 @@ static int gpio_led_probe(struct platform_device *pdev)
 			if (IS_ERR(led_dat->gpiod)) {
 				dev_info(dev, "Skipping unavailable LED gpio %d (%s)\n",
 					 template->gpio, template->name);
+				led_dat->gpiod = NULL;
 				continue;
 			}
 
-- 
2.55.0

