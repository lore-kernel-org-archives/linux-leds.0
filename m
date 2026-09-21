Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F203545FFA4
	for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 09:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982499; cv=none; b=gHqeGH7klDGQi1ltp/Yig/7OVciYHSA+Bg1zW3zWnbKMDbNDhzvy3Ey834kJTRKWWfcHCy0NPqpJVeEUjx0OK5BBRBBaYpjoaP8JpG3lNQRRsfL7Vgr4XayIfUZYewcWc0wYr+Skxh+7C6QdqQUNYwsJOtFXXbf3R2OETzrIqW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982499; c=relaxed/simple;
	bh=EVfwCsH4i0+Sw3TDZsdu4yC6TSzMm6fMy+HhAWEl9Zk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fDcMzVaCAkNe4TPaZ4+GsVwpE3UsT4jZaSlB/uctXxXEKgXK5cixR5012fqjUsweC7+6BKxhgeN8DvWbJw3RMLO8hYKi1p5WNouNzZWaiNpaLwqjxqc5IuT60hDo0fpm3J+2vX/aADO1g4L/ruVknjHch60WSGjJbNIubHOVgdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8OHbrTH; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8OHbrTH"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398b1e63c49so2761548a91.0
        for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 02:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789982497; x=1790587297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bs0kAyOUD2xFX0G95cOuQy2+oM0m4UkvlZ3Uv2YT+Us=;
        b=s8OHbrTHKZa9aHKDHAxky1gbl6a3GPaPZ3AskQ60VPgHlauZTtDZJEDd030ArYEEEk
         xUI9w9YtWlVnAs5sk5v72MhMsHFClIjA6O80ztR22RuPIcYzzq88C0MBMnmzZ2dhQX2m
         J8JW5Vs1X9G8IhSFjkiQWlPTnqFBYw4dyQy8/E9BxSGev8gg4E8awukbyoYY8vMHPMdD
         0V4GJ4WV1GFFzaU14nYRjGqCLpyh7eM9qRwYNIgOB25ZJA07STWx6JHWxl5Pfgh/EPWw
         qa+WrFJgtbNFS7V0zfJ3ZvqFIPX0Qh4TlaHY9YfoiwZV+tIU74iN953NJRn4/Bn3VPew
         ehkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982497; x=1790587297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bs0kAyOUD2xFX0G95cOuQy2+oM0m4UkvlZ3Uv2YT+Us=;
        b=qOzzuBWp3atLkkkrwAeJgTv7j2B9UAQPytHmMP19q39NY8gE3YPE5mmTGuHDlhQs2Z
         DOH4lOgEA8Hu/hctqTjN/t8AyR24Jf44zDEqMRcJty789hKGGVOzBfrgqZSKc3RCnqT6
         7W++UnxpaGu1Bpqk0KUQqAVk3ajGjBe/YS1C8E5ZKdFlgMSVDSnKV4U+f556UrdXhPaa
         GImTOZQphV/SC8zu2QOzeTnCxSmFs7OY7yRsp+hH59kZ3guCN70cRT5U1ArIryaeqD7x
         PSGDnW9OSpLpyi1jn/VebC+hCIH4MaAJPZQtiG58TcsQOEOMY2CNP9j+g+JYL+YuIEhI
         WiTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdzpdxz0NYRKCHBRYJ8Eb5Pq8P+WviMtOeGKfD3aNSonjMdHnjAJVj0ATU1QxsRTtz4HRd/cHLdm33@vger.kernel.org
X-Gm-Message-State: AFuF++mAMpOTwVqO+/D3LXxcp5PTH6zTjyB2GfOFogpVZ2SOcCBIQPPy
	4oflKs8fLSSwDG6wnEZdHr8MRJNtVUjIONvaSEiupQt3UW1jQeKE2Dsb
X-Gm-Gg: AYBFou0UMecJ27Fc/AnM4OztzCVLqUj0LHdKinY/w5puz7CF1BkvkzRI6mahc4CEqH6
	DgjKS0TGSRB1M6SxXdan3VpsojD0IgH9bW6uKVutYXb3tdHxY39sZ1KQ3+sojKrtckcUUS5+7Qq
	Gt/iAtvMKcEmOnAoHWmyM0fIY1YVDK4wA6aihW889Hcp+DYIUlLw5L4mq+8YBZgsQ+9XcrAwSB6
	lgnsBjAU/Ik4oYGKLI7KjNa/8FHUPwzHjvW3ayKIFBmlJ7+4qYnU/IhRlFhzcC8D1YBh1hRApKD
	mFLwDn0stuxjDpp3zYlhXhDlzVNzpUms8AIxe12jkyHJFp+umpbeEpdSHdw3ViUIwzMrJ63hGlP
	PDAa9UqtXX73TNAeBEpUIbyrnpdpxyaHzFdQ6owFGHj5w7ULLONkonIMIyiMaVnYh/WIG9JPf9q
	gxnopcoYdXuohtwu+69Oy4+LezMd9gXXjoX4v5UOY6hEXgOqoLcDkvwLgneeOW
X-Received: by 2002:a17:90a:ec8c:b0:37f:e5b1:ec4b with SMTP id 98e67ed59e1d1-39e35da0512mr19230570a91.5.1789982497217;
        Mon, 21 Sep 2026 02:21:37 -0700 (PDT)
Received: from lgs.. ([47.82.67.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331d55cfsm22540309eec.30.2026.09.21.02.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:21:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] leds: flash: sgm3140: fix child node reference leak
Date: Mon, 21 Sep 2026 17:21:28 +0800
Message-ID: <20260921092128.346375-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sgm3140_probe() obtains a reference to the LED child node with
device_get_next_child_node(), but the reference is not released after a
successful probe.

The child node is also passed to devm_led_classdev_flash_register_ext().
The LED class device stores the fwnode without taking a reference of its
own, so the reference obtained by sgm3140_probe() must remain valid until
the LED class device is unregistered.

Manage the child node reference with a devm action registered before the
LED class device. This ensures that the LED class device is unregistered
before the child node reference is dropped, while also handling probe
failure and device removal.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Keep the child node reference alive until the LED class device is
    unregistered, as pointed out by Laurent Pinchart.
  - Manage the reference with a devm action registered before the LED
    class device registration.

 drivers/leds/flash/leds-sgm3140.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index dc6840357370..973676b1dbb1 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -182,6 +182,11 @@ static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
 }
 #endif
 
+static void sgm3140_fwnode_put(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int sgm3140_probe(struct platform_device *pdev)
 {
 	struct sgm3140 *priv;
@@ -220,6 +225,10 @@ static int sgm3140_probe(struct platform_device *pdev)
 			"No fwnode child node found for connected LED.\n");
 		return -EINVAL;
 	}
+	ret = devm_add_action_or_reset(&pdev->dev, sgm3140_fwnode_put,
+				       child_node);
+	if (ret)
+		return ret;
 
 	ret = fwnode_property_read_u32(child_node, "flash-max-timeout-us",
 				       &priv->max_timeout);
@@ -276,7 +285,6 @@ static int sgm3140_probe(struct platform_device *pdev)
 	return ret;
 
 err:
-	fwnode_handle_put(child_node);
 	return ret;
 }
 
-- 
2.43.0

