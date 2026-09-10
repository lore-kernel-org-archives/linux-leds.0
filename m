Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74CC37DEB6
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010492; cv=none; b=Qj2Tl33VAdphBMs/nw/vdyFbnV5rFM8N+VnV4vYOB99iyb9EgOUIeVB9YFFunXLy4zfaTbcX4cA/sLiRmzrnmKW7r2PeJ4hDSlMIeBqyALxuzfU7OpztT9AJVX0WepBK703KIkeq0mVF/TcHXfXw6tRpBoxDpKVr6Cd6drwOWSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010492; c=relaxed/simple;
	bh=RAnQLpzPku7/sBiN9IYfkstPCRnhG64DyTCe5z9u7y8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4t9FgphmsUSkC0UmSkwnMVRzgWGMQpmxGWaxoqRJKt7xa+xatiB5nz6J4ipahYODu/8YSbgTgLQ7apRgTnbz3HyH/tIiu6SrCP49v6TAnFgUvht2YoJvAeNst9ZPReaVPwv8KwCU/2XHZfUmPYRqVO5Ag4PUFJ6Jy8087pa8tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeZITH3U; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeZITH3U"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-7f4eb488690so409698a34.2
        for <linux-leds@vger.kernel.org>; Wed, 09 Sep 2026 20:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010490; x=1789615290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB3vWkzSWUGhUPGiwsOLzELGJs5tqcYbrEX4UJLtth4=;
        b=GeZITH3UzsOViFtkF6z9QYo26zh0ijQHzdUlyFucjrG/2B4z4X41RZyFl+LQNDvvc3
         wSb9v3TnoR5kfE/Itgu8KtyMjrtESObaGlsvjRnOYQX3yWFQBv3SjEJK33EFDgEIwFUk
         yIV2aG3ttc6+zqlgkm4XSviEL/zpGZEY724u2v6yzagXIA//L9hPlqKJ8eDPly1vJvVy
         0c5jXQCzxq7K4vQKkmKcNz5B5FZsja64eMwI8UReOPj+fa+fWGNDJOau8FrCTLA3zJ73
         ebPau1cHtliud5gAay/TQ+TOah4E3JkspJ1qwb7/TQKwquFdInzwb3QMxt///VesmHxv
         rJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010490; x=1789615290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uB3vWkzSWUGhUPGiwsOLzELGJs5tqcYbrEX4UJLtth4=;
        b=Mr2U1pZ6hk4V5TMf3/w4tc3bGDV3uarlVeP7lhYhi/qVaOLskshKa1V4gxnYjORgHU
         +GnWZdzkmyCchWMO5Mj8HufGktvRNAd6DQiSe4gJnwREBoDzfs908eMVsdV5TTP4Pn46
         xLBOQ5IKz73txlAp1NrI46RiboH74A6NJ5zmS5iSaN1nMEHfCfDltq+i0xeYXp4rmtIf
         Hj6rZoXLIXP5jampcNFpOaKcE2Vr1vSlgpxks3SvozMJY0SuuLu8VD1Z+2dzEjIYph5R
         b1+SIfAawxYkiBIgLTywcwYY9wocTDTaraFT7dArQbwDksXWcsPcDCAZByqsWQ3a4spN
         AEdw==
X-Forwarded-Encrypted: i=1; AKwUvBwYYxugWw76P5XlPUSFpgOd0k2mebtvc3tUXieqNVn/j/dQDBoe79rpULyWRnuXG8GpuYE5IjVOzZkX@vger.kernel.org
X-Gm-Message-State: AFuF++nHPTbo3828eyG+cpad0AxTpvjKoxkMuGeQZu2O//WGzFuUK7j9
	o+6aUM9+viB6yFIegePNpIVxqaWeYBFa+ukdKch8X3c9yb4P6t5ZBQVH
X-Gm-Gg: AYBFou3cHy1nohjeT7SP17qFsbErbBaqHAm+fXvFvpuMqvDRCgNDn7f+GFI4WGQNsJp
	COWa7d47shKnjUGGQttwtTAZvyirgTgqov3KY4neTW8HF95eoUHbKxTVIdOkHCVw0xUGjFp915x
	UJYCuRsvmpEga7Kt0AWDU7lFFklKR8R11x0mnGA3G7vDUoXk/eSLjc8QrDfdQD70Krsmt18fXul
	VaI4jT08t4HxSwrOQTD6kXpjQNqk4T8E4aXdFeMNr/9p9cYvHcxzyJo4EkYiwuKRuHdKaj98TcH
	lctxxwhZ9ZRvnp8fL1vwYI7E9nuyoim/bBMgHwSqu9v3D+2Kd9PJXUxcl5CmJnSRvXA/BaQARzL
	jzoEkETjFj3zBbChlyv7a8i27cnidpFuST1OlpGZYkgjQcn14WYyHn5Aex1JAsRVUkskYMV8UmT
	sgtN4NkUzLVylJ9xOn1NoyhDwlVvIUZUMnQPniWZVYP0JEVsHCcMvaahm95O+Nd7oFcaJgNfmUg
	Sb2MTguxPrM5rh0NXR004BThkaEbWDZDesB3Cp3EyBgj9F9EIbdnseICNDE9bh1ebM5
X-Received: by 2002:a05:6830:83aa:b0:7e3:f809:7984 with SMTP id 46e09a7af769-8027109f9aamr2270980a34.1.1789010489743;
        Wed, 09 Sep 2026 20:21:29 -0700 (PDT)
Received: from localhost ([76.187.192.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da9a49sm19758315a34.13.2026.09.09.20.21.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:21:29 -0700 (PDT)
From: Andrei Aldea <andrei1998@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH 02/15] HID: hid-oxp: validate input report lengths before decoding
Date: Wed,  9 Sep 2026 22:21:02 -0500
Message-ID: <20260910032115.28669-3-andrei1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910032115.28669-1-andrei1998@gmail.com>
References: <20260910032115.28669-1-andrei1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the short Gen2 status header before reading its command, and require
a complete RGB status report before reading either generation's fields.
Use the supplied input length for the debug dump as well, so a short
report cannot cause an out-of-bounds read while logging.

Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
Assisted-by: LLM
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
---
 drivers/hid/hid-oxp.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index 3f2be80..0c895bd 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -23,6 +23,7 @@
 #include "hid-ids.h"
 
 #define OXP_PACKET_SIZE 64
+#define OXP_STATUS_HEADER_SIZE 6
 
 #define GEN1_MESSAGE_ID	0xff
 #define GEN2_MESSAGE_ID	0x3f
@@ -318,6 +319,9 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
 	struct led_classdev_mc *led_mc = drvdata.led_mc;
 	struct oxp_gen_1_rgb_report *rgb_rep;
 
+	if (size < sizeof(*rgb_rep))
+		return 0;
+
 	if (data[1] != OXP_FID_GEN1_RGB_REPLY)
 		return 0;
 
@@ -391,6 +395,9 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
 	struct led_classdev_mc *led_mc = drvdata.led_mc;
 	struct oxp_gen_2_rgb_report *rgb_rep;
 
+	if (size < OXP_STATUS_HEADER_SIZE)
+		return 0;
+
 	if (data[0] != OXP_FID_GEN2_STATUS_EVENT)
 		return 0;
 
@@ -404,6 +411,8 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
 
 	if (data[3] != OXP_GET_PROPERTY)
 		return 0;
+	if (size < sizeof(*rgb_rep))
+		return 0;
 
 	rgb_rep = (struct oxp_gen_2_rgb_report *)data;
 	/* Ensure we save monocolor as the list value */
@@ -435,7 +444,7 @@ static int oxp_hid_raw_event(struct hid_device *hdev, struct hid_report *report,
 {
 	u16 up = get_usage_page(hdev);
 
-	dev_dbg(&hdev->dev, "raw event data: [%*ph]\n", OXP_PACKET_SIZE, data);
+	dev_dbg(&hdev->dev, "raw event data: [%*ph]\n", size, data);
 
 	switch (up) {
 	case GEN1_USAGE_PAGE:
