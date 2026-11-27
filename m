Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795763919;
	b=xCk8LShMrcLeBG8POGVCMqcyznwJRizr6OvWR6LArqFsisSsmCFUTR1kyeSWNiELRtHE
	 PLPQpS1BEV6uZ6nmTXY+EyeKnurrwP56zpwJ70xjVe2LO10nOqpVNu1e4CXNIaesuWRHI
	 w8U80+mqDknCuXm50RK4W/Qr46lfdjzMOKC3mlVYvRAiGQUi8ipHCxMGW6EJaDPhKvqzl
	 89V9idE7yii9oGH2oFxYQRxJsYpHk1pPJ3sSXPgRNe0wErV3vBAoByD/FT55cYixSsTLk
	 4dKv+cW0/pWw/nReaiRb5tD9T6oWgux2kk5RvnhuA4lxJGaOL/N/DREqOO2cgyPX3QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795763919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4aq30QWobXQ2txyzbMoYSdHGyuTaadPcHWj998/7oSY=;
	b=mxujVnZn56DAQVs8mI1DhT2fTmQTjpr5qMnzmy2flucJRPKqOgpy55m3HVq4PvZR5m2z
	 nLy46l/0G26VVGwhzXo3GHINBeKHMDjRzSwyXYSDSRfL/pNDzUPec9HTmQxIWptXz3NrE
	 20bFMvt2XjGNV5HACZQ6BP4Ax+SwVBz8SgFRyPdwIIQw09xLBq1X/sNe873yP6/n3fgQU
	 XkWUztctH4zqG8zpvcvqklxir2/IYZvIjRay0d2RwNOcDEfXXVrInthLHeNadLbCKiHy8
	 iYukbufc0UVPI3R7YJC3lZOhCy51iYLBSiW9D7fyLrIJM9ri3ZCLH1oodiBIlwSLvUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAcmMtP0;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D90606A31C
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 07:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yAcmMtP0
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b59dfe466bso59592c88.1
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 23:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763918; x=1796368718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4aq30QWobXQ2txyzbMoYSdHGyuTaadPcHWj998/7oSY=;
        b=yAcmMtP0mYoV3BZXmu4pqDeTMQvjtRv6Dddg/HkjvBB7KwR03pflT+rvM8zoWPSleP
         7UhWIKkEbYDj94B8mnvL1rl6+lmiEt46+dWAX4eyofPUvPGm8xOTZY9PlnUIyLAQRh+V
         v8I/8AaJnY0ZPxrxF3nP5XEkaulBn+ctkSku8jX5Tls8hzi9UTVP+ofjSWUhx0ZzbeMm
         8aS/wEtdX5GEbm3O5aFspkSwdbpncM7hT+5KG1Y7mj/R9ydHbFL7v948Rtpi63ReUvkG
         AlABBQGtM40+XQ78Tl2VVOirHRGXIvscnujJqaCPjN+VcIcYaizfaIUxgo4pOqEn57ea
         i5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763918; x=1796368718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aq30QWobXQ2txyzbMoYSdHGyuTaadPcHWj998/7oSY=;
        b=FGRZ0Ez77lH6VJcO0wFQC8mPid5jg3ot/kvLripLxNp7nxuFUgWhcsb2eX66T7sL+y
         zkvWYk4jHHYRlhjKiBu/p1+H5V9md9L2k5Z5ZsOVinnotepSTIXb1zZp0K2PtrAp6hR4
         g2OQXn02HDAEt5491QUdmcWO/P9fMTwYeYJINcEvrgum6vvLSGQ4R+D3+ogAvE4+i1Ds
         qSaDuM9eSzKIPJ6G7cc1WMGboiTRmrcxTJKUGm0vgwrpHNy06+Bp/osUONKorLC574Bv
         5MRrhfxWSzsEIdNPHWcdZLcdWi896XmMWFZ5nrQ4XOKtP3WAc/+yZbxugQAM4HNG5uwT
         WUNg==
X-Forwarded-Encrypted: i=1; AL+hErEAFuJXnDeNqUATK1ERKiLPp5ADRWRmfScEQEAiN+DHll81XwJ6GivoeS+JapGiecNF3JopaeHYN1Hd@vger.kernel.org
X-Gm-Message-State: APuU4Z9+JRpCACelTW9mAjF5w80v6WKaFGi32YobDdCOI7Jej+LqY2nw
	9gQwdZkLNYxfECnyQe/nkfYTDvzXyEmKE+UVfvzl7GbNTXcu6draPp9/
X-Gm-Gg: AZFdTZe9BusETLwNRoyG/5XkcuWMWLSP4zgSeSTWW4s9bi7t0M3vt5LfpT3pVtbuibb
	eK6AvwCKA/HKf35843CNb8tDW4YFLy47k+ZH0AM1RTHbfdYhNGeRJSXKfYO6GnpGSj/K6OmtSDf
	8eSV2lc7HgN5UR1xbfzgptfIIoh6GpH6IACfw/88ghH1wH3RMRMmAeWdJhc1O+oAWXsEzgUVUKw
	AqT9uGMjWmP1zqfRJlhXCT2iRW61stNatX+w6e/WMfxlBYEknEf0AwlVL12gfhY+cs+bI1jXDD/
	D3WPAEwq/YxZZQu1gTM/im7qVumR7Z9ZvmfcsHxp6dZ+PWyFbm+HSVsSLASws8Yr9uYSxU91XnY
	1Y1CQ9Yn3pFIZd3nlYzkN8cCD5xLVYmLhtlpiEGAaYK4k3LHOXDcXss4DMhwxPhedVYvaxJSkEc
	8aJpCPvXz9logsHUtu2ORF7g+pRgvuWyuvNPvyO1hSV1aKvDaxuQ9DNtNU1Lwkgg+4fmKDw5alc
	BgUvPRlWNwcyYVC457NExp9vHfjjZ3mNxndBcQHcBESE0ZZiGwPjw2K8kSr4HbcVUM9jMQ7du5u
	HyUEUVlTZ05Q8dOXTw6BvPCopMj3o+NxzDV1NZayPZAitdo=
X-Received: by 2002:a05:7022:906:b0:1a4:c892:b14f with SMTP id a92af1059eb24-1b556904c50mr30443195c88.29.1795763918073;
        Thu, 26 Nov 2026 23:18:38 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm53260893c88.15.2026.11.26.23.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:18:37 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	Markus Elfring <Markus.Elfring@web.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] leds: sgm3140: Put the child node reference on success
Date: Fri, 27 Nov 2026 14:18:31 +0700
Message-Id: <20261127071831.136694-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

sgm3140_probe() gets the LED child node with device_get_next_child_node(),
which returns it with its reference count raised. The error path puts the
reference, but a successful probe returns before reaching that code, so the
reference is never dropped. The v4l2 flash sub-device takes its own
reference on the node, and the LED class device only stores the pointer,
so nothing else needs the probe's reference after probe returns.

Remove the early return so that success also goes through the common
exit that puts the reference. ret is 0 on that path. The goto before the
label then jumps to the next statement, so drop it.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
Changes in v3:
- Drop the label rename. v2 did not build on the leds tree, where
  another goto err exists.
- Drop the redundant goto before the label.

Changes in v2:
- Use the common exit for the success path instead of a second
  fwnode_handle_put(), as suggested by Markus Elfring.

v1: https://lore.kernel.org/r/20261125134013.2692510-1-congnt264@gmail.com
v2: https://lore.kernel.org/r/20261126122516.1198461-1-congnt264@gmail.com
---
 drivers/leds/flash/leds-sgm3140.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index 107d02c3137f..14568ac21289 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -268,12 +268,8 @@ static int sgm3140_probe(struct platform_device *pdev)
 					   child_node,
 					   fled_cdev, NULL,
 					   &v4l2_sd_cfg);
-	if (IS_ERR(priv->v4l2_flash)) {
+	if (IS_ERR(priv->v4l2_flash))
 		ret = PTR_ERR(priv->v4l2_flash);
-		goto err;
-	}
-
-	return ret;
 
 err:
 	fwnode_handle_put(child_node);
-- 
2.25.1

