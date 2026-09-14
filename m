Received: from mail-pz2-f30.google.com (mail-pz2-f30.google.com [74.125.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDAA4756D3
	for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394877; cv=none; b=UHs4qV10f5VIurzQKstieTu/PlAi74nhE6mtSLccviH4YumdM5tACxwsxqXfixpX4dYf+UpNIZOrFtDD6Chhqv0LRUkkmsOCk/FyTVIsWENRgFKQAIaFJ+KbVqsQBzh1W84X8I889ax2ZVZUQwT3IKcniV917gTxMuwRTjQXqCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394877; c=relaxed/simple;
	bh=w3nbycRZy4N0v2pnsC5aQmqMbjC6uQsqsHNscNi2z2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtH0wi/TcQ+FZxD0F3yb/WDdbnwfJAy7KwN5xiyVGLoDosPuqArh0qrPeVJVbPuWGx712O+fV5b5mVxEF26J1opnAmFiRpQtUTXI05yP5vAkbYrLHLVpT8vjQ319Y9G7+UwZWpQGHGZ4qHJFcpxiG2DZ/u1FrKV5t9P9iHoHWyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MN2RFvrr; arc=none smtp.client-ip=74.125.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MN2RFvrr"
Received: by mail-pz2-f30.google.com with SMTP id 41be03b00d2f7-cc1cea50dc0so640838a12.2
        for <linux-leds@vger.kernel.org>; Mon, 14 Sep 2026 07:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394874; x=1789999674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YM0k3Nqm6YopFOe2WFYov7ptT49bk5DMlzEF9na4+KY=;
        b=MN2RFvrrXRc7giyk/ACrue2FsuQnAfJkEg68aWiTvwjGU39PgLnpP4ir0QK9t9HXJv
         b0Rw9xuMcQw6V3lXybJ+Sd3S+PZN4rP+xQC3/Kpz835Bj+2laJNkGlknV5lXcsGfh1AR
         zhqKRQmbaMXvCuMjbhsNfBgWedzuuV7K2+fFMWFWu+wWCqp2Sz9HjcZxPBJZKNd6TlMs
         mlZ+XTNlcCms+agCkMIP0AtneFITT11epBWyEWEunoznrABdlBvvjfZY1IcB7tyUTozW
         +W6fmdWvukWFM+IdC7H4S7YezwjjujV4Uadg/TvARoM3Ckugkj1pYaBPlPpRzPdtBgyT
         xXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394874; x=1789999674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YM0k3Nqm6YopFOe2WFYov7ptT49bk5DMlzEF9na4+KY=;
        b=axh9KZh1jiDyro5E2EsiWPVo5N6ohFxCXe8zX7VTC4srkE5xQje02wapi6hQRbNAfA
         +MmPQz62Ub0g3rcCHx5kaZlAJaKCM/PW0OIm2NUcAY80SpFLhMXuZaypFa0Zb3YzEP7o
         4jhVk/uEwowSPuDkrFI3UjPL3EsVh086trY1NGWRd4o23Bgj35m3vTb2SrHworsrioWB
         vIWnL+IPf1rMfcHNYLIkbBIrZKwU/vUNB7QtNnehcmtys5HNvNaZUW3jt0I9R9CDIM3Q
         0r43IbIjeIgcA4Kfu8dh3b22dEJBPMRa413PgPGy+3Msp1Hnc/7pOe5K6iF6LK9gSOa6
         twPA==
X-Forwarded-Encrypted: i=1; AKwUvBwIqMoRieFR08LcrJyjf6WAB2YA2RDp0xl+g7dmg76+Rn2D3Mc7VnSjS43FJ7mpVy+qv9M3op6NtPP1@vger.kernel.org
X-Gm-Message-State: AFuF++lLdNhBE32epaoqVwLxg4rkz8l58qpXYFUX75rMAuH7j/HywTjV
	Mk6LUgYtinaxAz33ny/2sE5QsO933UrLK2h5d+XCWRSA7o4sgQGncRCv
X-Gm-Gg: AYBFou1hbmt40sHFnlr2ecosSzRGVRNn2p86WP0TX2xOdIT6QZqdQmG4swXZMAt5NZ1
	2n+YXXWG7jqWzs1REzUTvTY/hMGRRlNSVixzFdA6z5DhkPBD4Qh7TmVhSL9/wP4pJC913mOy1gu
	Sx2Ij0N/wHNx8LpXocGnoiBWH7sNDaOf8p/tP8ejZf1ve8ySJ1x17zbljyPK/rbAN13SBXv+45R
	DEDHGwRgpN6P522yE3Oba+7oDnPki1ExA3etBt8jXtCEjSMVPEj12gYIYUbf9zyr8Xxxl10gPGx
	1a3SP1MCCmkELSxPHyvEh4nkc1OKbly6fBDoN5PlcGq4M91EIOlxK7h4tKKVMt2SF50Kle/TM8L
	DMmB3XhnZGXdJQsvqP04Q6OOynN5bQnWS8EFG24+kj9k6AGbVwhksZdpBY3jd8GQhhPetXNf2ZF
	XBE6UILYUT/M3DFif0zsKfeG8pMHTsq2At2sqY8ONzRfctlbrQYiuFmg==
X-Received: by 2002:a05:6a21:648a:b0:3d3:ad3c:49aa with SMTP id adf61e73a8af0-3db4066205dmr5987851637.24.1789394874230;
        Mon, 14 Sep 2026 07:07:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c65a8120sm5210341a12.30.2026.09.14.07.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:07:53 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Abdel Alkuor <alkuor@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] leds: ncp5623: release multi-led fwnode on remove
Date: Mon, 14 Sep 2026 22:07:42 +0800
Message-ID: <20260914140742.1743052-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ncp5623_probe() obtains a reference to the multi-led firmware node with
device_get_named_child_node(). This reference must remain valid after
probe because led_classdev_register_ext() associates the node with the
LED class device using device_set_node(), which does not acquire an
additional reference.

The probe error paths correctly release mc_node, while the successful
path intentionally keeps the reference alive for the lifetime of the
registered LED device. However, ncp5623_remove() unregisters the LED
class device without subsequently dropping that reference, leaking the
firmware node on driver unbind.

Save the firmware node pointer before unregistering the LED device and
drop its reference afterwards, when the LED device can no longer use
it.

This issue was found by manual code inspection.

Fixes: 7b7e50f8f5e0 ("leds: Add NCP5623 multi-led driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/leds/rgb/leds-ncp5623.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/rgb/leds-ncp5623.c b/drivers/leds/rgb/leds-ncp5623.c
index f2528f06507d..f96f15b7e9a1 100644
--- a/drivers/leds/rgb/leds-ncp5623.c
+++ b/drivers/leds/rgb/leds-ncp5623.c
@@ -227,6 +227,8 @@ static int ncp5623_probe(struct i2c_client *client)
 static void ncp5623_remove(struct i2c_client *client)
 {
 	struct ncp5623 *ncp = i2c_get_clientdata(client);
+	struct fwnode_handle *mc_node =
+		dev_fwnode(ncp->mc_dev.led_cdev.dev);
 
 	mutex_lock(&ncp->lock);
 	ncp->delay = 0;
@@ -234,6 +236,7 @@ static void ncp5623_remove(struct i2c_client *client)
 
 	ncp5623_write(client, NCP5623_DIMMING_TIME_REG, 0);
 	led_classdev_multicolor_unregister(&ncp->mc_dev);
+	fwnode_handle_put(mc_node);
 	mutex_destroy(&ncp->lock);
 }
 
-- 
2.43.0

