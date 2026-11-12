Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467820;
	b=V7DRjhiMf+m15Fm6HEMCuyCNR3Rd3oA+9RTD44EzJ+NJX3Zm+N8ico5Wt11b61z415D/
	 T7pV95NfggDt84EGD90koyHh2Y2z8wywWirvaffyxX9vo40p47gzLEptqxyf8fseW1TX9
	 Yxz2vX0MNVX799U+Kb6UR6Gkz1h9zopYMF5fY90sPG+IbhAigd6f1WUH7Y0YbTwYalf6v
	 VjZ/ZMguZGi9cU6MQDZkm0Ub26c9qsoXIFrsuQ12+X7WICVMK6OMNNDbb/Rk/cEZTmoZu
	 pCSRpb3JYlEBjFs8cBdsWybFQtGvjvef6lA+osBFpkTFuXynIWD4IDY0KRS2UM7vqTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467820;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UWW/G6XMnNWfiSfYl2DhNX7J93Cu/t+gsJr2k3ANG74=;
	b=BEbJjHujEJsZ45+Buv3TlwxgpSOCbvTZvK4BjLvnn3JkdAGFriLDmlEHsfzdH1w+UHKp
	 d5pvgBk2gQcJ/SgTQe7PqG1ZeJ4Zrd4YiE6wGxp/qU2zszjeZaucXzhOKYwbZ8Xn7D3OU
	 1mU6anKlOTVbaXBDmvasajZ996VFLA5Q7NEYp84K+xCTGU8dwUkVfMa2b59LnPLY4lF9y
	 BKBS5TNe1RS4M8PcryzJ5N8bnjLYXLQBIsCGESv/fqQp3iVd8kn3tfLXny4XD2PTd3xl2
	 FD4PSd9NX5+eguzlpnaanQe1A5QvYB0LzGaG3H/stPmBMC/5RGKX1a13kP3Fu5y9E4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oY9Nbj3F;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CA5606A32D;
	Thu, 12 Nov 2026 07:16:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47CA5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=oY9Nbj3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=oY9Nbj3FCFnUjL/UU+WiwH0GNLAr0ijT3wasJeghGJtvNcUz8gjUW9gbGiGnZp45CotLS9fs3zUCE
	 7Y6IRTl/0e3six3jNrznAnRBO9+E63NOw+ugtdLPnFEm/qE5PBq/M8g+o2sFjfA9uVYUrMWJ7+eX93
	 J7zKAWgBe+SvzeiY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96af567e937a-e47d6;
	Thu, 12 Nov 2026 15:16:58 +0800 (CST)
X-RM-TRANSID:2ee96af567e937a-e47d6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af567e9a75-f6e09;
	Thu, 12 Nov 2026 15:16:57 +0800 (CST)
X-RM-TRANSID:2ee46af567e9a75-f6e09
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	griffin@kroah.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] leds: netxbig: Release the GPIO extension device after parsing
Date: Thu, 12 Nov 2026 15:16:56 +0800
Message-ID: <20261112071657.154479-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

netxbig_leds_get_of_pdata() gets a device reference with
of_find_device_by_node(). Error paths release it, but successful
parsing returns without putting the device. The parsed platform data
does not retain that device pointer.

Route successful parsing through the existing device cleanup label.

Fixes: 2976b1798909 ("leds: netxbig: add device tree binding")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/leds/leds-netxbig.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 6f59f91fac6c..7539389e4a29 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -593,8 +593,7 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 
 	pdata->leds = leds;
 	pdata->num_leds = num_leds;
-
-	return 0;
+	ret = 0;
 
 put_device:
 	put_device(gpio_ext_dev);
-- 
2.51.0



