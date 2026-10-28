Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793209436;
	b=cdKcjnL9AwoZ2isZNQpDnsN67nc6wKnfU+0niAR6dTNlUB5k647ZLmOxpKLAo5rghKV3
	 QcMsb7oWxw2Lx1Fk+GKwQaBUirytDJ2lzTL9ZWh//sIx6cdkb9wdhQG/OR3w50GEc+N9g
	 ceflrcK4Lri2GI6yJFwnQEc69GGwSGVnkp8mosWn2l2a0+MMuRo0lfVe+FqTA04f7gnGE
	 feDXzg2+Ksl/yLqNjOvKpBQBimRGoWnwhufMgXN8Ky6EXLz6kB3JvbDlARMe/VcYHSBjG
	 bfRFZ8/SJsfMa+sERe0M07HlpvEB0etX5Pusmy02mzDcqJrhZ0KrFT/UZtwbjPWMF0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oPFymgk73onVjUCM4q3fxSx09nBLSQaE267hjL7WZOU=;
	b=ttIO7g1hNl9zuaeJLTOizMvdyoDuzDO8qQWIxOM9Lj50s8FrpuNw4RMWh/1snNWy9HSn
	 0y4qEefXXjonbYjdczIhtQ2TKTZsaeE7lRrmAfBWkx4nozhGt6zhP0zv0n3u+L/2HDQHm
	 +C66PSmgX8hrjR4Qhc1iqlNmyCzpzaJSyYlgC77zjexC6uTNhRyNJxmCa2K6cvTkAVteH
	 kbsjH1P4jzChnUaP2soYH6od16hpJQw1BZtVi4Uwo7fC5Cg793jeON07k3W4FmLb+IkOU
	 CZWBSHFjUseIiuUfWcdvpKd+tW4syuMkgzl1zuxk3SY52IvfY3YWX7wEfJgDl2jY5cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4rxpG9d;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F89606A325
	for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 17:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F89606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h4rxpG9d
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4af173320f9so925847b6e.2
        for <linux-leds@vger.kernel.org>; Wed, 28 Oct 2026 10:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793209435; x=1793814235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPFymgk73onVjUCM4q3fxSx09nBLSQaE267hjL7WZOU=;
        b=h4rxpG9d3Z5riR96UpKOEAj2hA7HwZwogJsse1nRDW3MrgAJ/nU4oqa+suvYLeTHrV
         IS9eDJQRzCGriXZfn0bCCwcj33eYtRtHvABBTda9lmu63Hpyp17s2/kKH3D9GINDUHyV
         pJ7wMaqdG+makIFIq6yAGioBf5EHBrcIajxOjz/tHFlYn8fMfSi7RBSY5V7wXuv0/0Zb
         ejItd/s8fVzLxO1PzKXYUwvrdohwlVTZEeQTgjS7xb9C9XkF54YOf7IVOA6yQeYV9ONs
         NOrEuc4Ry831cvuwfANhaKhrGv/mhJWH7SOuqsvADS8xOiu+F4pIUuLDMM/zrr5AU2UJ
         sDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793209435; x=1793814235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oPFymgk73onVjUCM4q3fxSx09nBLSQaE267hjL7WZOU=;
        b=fc2NLQMGEliDKvIX5Mc7LOy2XIvwGu84IuHOvLV5pxlhck1O3bFX++DZ/R9hPkfGGM
         /8F/fAZwsOsQbxk61Ud/xbSEb305ZejUNZq0yHb3Wvi9QTi04CuPcZsSb+swQWzRiMzF
         HgpEgdRrd/Ip5xgraqqcbcIypLgWLu2GvN30ATKXMKWi8p3HPhWOLjwy5vkQKfTqniUL
         q7PxYQZkTDHUa0gSzRrtuQIWEnkFlHtYg7HBF1cxrLB8kRktmfNJUxjxFROCcv3sWvG7
         KcULsocIHnaOxLRp63ujK0raffqdf2UiNXrn+R7AgwYPbi+J4M2uexPeREMTJOGJau+a
         D3nw==
X-Forwarded-Encrypted: i=1; AKwUvBzqf15+dcGZsu/tIE34bZIyvdAEsz2ycqXhB3IMQrNQ9osPUT5Sw+Sq291iMFSXMiR1Lv9uk4O9MH3Z@vger.kernel.org
X-Gm-Message-State: AFq9FYJNn0sEHz86BWk1nFDxt66Ch0QG6RTn2/b1mNA8z+YakRvZXGRh
	MCchjlET+eAKhESu68KBr9uhxpVne7/iHZE4n2BxFfPN6H6U8WIXNqu7
X-Gm-Gg: AYBFou3TKC1uJ3GO8zvwcN+SGYEd+XH3t0b/1FWL5/1eVKFOKo4zmcGDojFrfeEDiwU
	RUQVn2535oNp9pQPV8VRv1ovoOAoz4vhgXsNwS7nSH4QFr3eDAQ/QRp7y2xlIw6uoFDcFFgqisy
	4MJ41W1AGxvdW+0f3HiPrV+sImlZF3UdP6R3AtJIUz102EsbNOfpyXwLpMH8VAkIeUJPGdJx0Iw
	R+EUw1a1BtTCGGyNa8JCURrnwvM95sJznZ5jkxYqnFWkpcvxuIfbXYZNeZ1gGt/31e1RekdpHkc
	Wm16Lk7rqmZANGL+W6WrsKfb3ydswDuR2xcN9hxd8YyYY5i/M3nHZKPSjb2nGQ3Xst7OXa4iZ1R
	cKtwy6nfy9MruxZANzku7GgGQVwGe3FUrA5tIiNtvg9fMbm7eoY/N9evZiBqeIm/1LBe/SJKScR
	J6VZ/qe7NTHi0LKf+VSbQxZhBiyndHa4iWujWsWGJd8oc3I0pxLSpCRoVs3Ma8QiGoD/4c3wltG
	aaWFVl8cr3Pp2wd2xzMop2APSfHLcjoq3O8fqUVWopI2b9JbcFG9xMvyEaESdKBQSeN48uYSniY
	QgXLb7hFkQMpwO2YNli4tm0nuUUuHI9zRC+000f1sUprJ+km8U0N5mjN1UkwtD8ci+ZaK3o=
X-Received: by 2002:a05:6808:c40a:b0:4b9:e5fa:8905 with SMTP id 5614622812f47-56382681ba1mr2105457b6e.24.1793209434933;
        Wed, 28 Oct 2026 10:43:54 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c5a4d8b7sm1612114b6e.8.2026.10.28.10.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:43:54 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andrew Davis <afd@ti.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH v3 2/2] leds: tca6507: Turn the LEDs off on unbind
Date: Wed, 28 Oct 2026 12:43:48 -0500
Message-ID: <20261028174348.64014-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028174348.64014-1-danishkhateeb03@gmail.com>
References: <20261028174348.64014-1-danishkhateeb03@gmail.com>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unregistering an LED that is on turns it off, and the driver does that
from its work, which is queued from led_assign(). On unbind the work is
then cancelled by devres, so if it has not run yet the LED stays on after
the driver is gone.

Flush the work instead of cancelling it. By the time the devres action
runs, the LEDs and the GPIO chip have been unregistered, and the work
does not queue itself, so nothing can queue it again.

Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 drivers/leds/leds-tca6507.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 0f987e551f03..ffad476af625 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -71,7 +71,6 @@
  * not recognised when matching.
  */
 
-#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/leds.h>
@@ -712,6 +711,11 @@ static const struct of_device_id __maybe_unused of_tca6507_leds_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_tca6507_leds_match);
 
+static void tca6507_flush_work(void *work)
+{
+	flush_work(work);
+}
+
 static int tca6507_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -738,7 +742,8 @@ static int tca6507_probe(struct i2c_client *client)
 	tca->client = client;
 	spin_lock_init(&tca->lock);
 
-	err = devm_work_autocancel(dev, &tca->work, tca6507_work);
+	INIT_WORK(&tca->work, tca6507_work);
+	err = devm_add_action_or_reset(dev, tca6507_flush_work, &tca->work);
 	if (err)
 		return err;
 
-- 
2.56.0

