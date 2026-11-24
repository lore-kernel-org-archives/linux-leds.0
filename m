Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514057;
	b=FpBaxTfiwFGQxU03otTay8liy4lYq016OUtraGZK5cA6JLojQeIcgKijvvrV3fDgdZjp
	 6U4k5tIsiwnUOBDJ0ZpWMFLpAr4ang8TzkreQ9I1rie/eKMKiTCWTR1Cp/wH51NXj9Kyb
	 uguSTH3FBGnlsk2r5SGXVmfZ6IdSVCUMDjQiMXWQuC0GMBlGMQoERflritV5JcHA3xnv9
	 7/yeuzGj6GS4Lbvj+0KI23EGIWVy3P+qup1VPF/AbyD+ln04bjbW59nCiFGPHSzPJySP4
	 asKPiMOA5tQbMUHaBVi1DlumebGl/WnmH+ya+gmzhKbN2QYW9lCA/WJug7wMIIAlZfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Euo6hbNLPxr+ewFdkzYoCDKIbVjwOhwZnilSqnQiZzA=;
	b=hpANhy41o7zNJoRnc+gNSurDXPaNM9AgNcL8gGsMirj08+DoNYCxFX36lOidXtn1G2h2
	 bRPMYwmSrcuLKxa3M5FZxuEN3quwzPyYqcpFwsA9xdPwDVspIRjRSnXYKcOZIp+CsdnFu
	 fEQxdHNZvVc1z+XS4cdO8y1GyuQ7WIubt4rZGyrd0QXySxb/8Dsv+VRnUbdPEInoLOAc8
	 p7e+EmRHU5S6B6FPfBhHDqC8koZZr6K8FHyiqIQMKM/2rljYEUtakHp0Wj7PzyDreUho+
	 tOr2WkcoWgGYw+g/SMpbXexHXsyJZ57GpLejr+RLRAJzprCO27ZFW6yLdQez2sIp7lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW4MoJ7I;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF99606A321
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 09:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFF99606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BW4MoJ7I
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so2166562eec.0
        for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 01:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795514055; x=1796118855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Euo6hbNLPxr+ewFdkzYoCDKIbVjwOhwZnilSqnQiZzA=;
        b=BW4MoJ7IT25BW1Y3a07hNiL4hQRmru0iH8qvQIt5sPqqGxnINnl94hOPhVGxpWwY0D
         zjf4mKN+0d4LpetLtXL0qyasEO0mQXFET1WSXkToHAz1e85H0Ey5N3JOWDJ7VdO9HgVI
         SBD5I3R8zsdgXhtKfjC1F7rX+JS3U89AMbcsLenHIAQeGjnL9CPL9MT4yPzlY6QlDeYu
         NMpE6HgzKs0Qxdbaw/SJCmx8HvbSlqYHyv8fKSD2jJjK47GX/+0xe/EIIvJ7pu9PTmv2
         01x6PROW/MhpDeIXSmmggo+bw/GpAMl+VnuNkQpadNZ/wQDPUlX0uO0Tuoh9RXSp7O1g
         VbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795514055; x=1796118855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Euo6hbNLPxr+ewFdkzYoCDKIbVjwOhwZnilSqnQiZzA=;
        b=k5FYf1NmaMbncgKAC5qxjh72nS4UtodF+RrPo0aJHtYF8Ut+EcDNBbEtym/Ja1THlA
         PRCKe9B/Bzu94FWDJMtxrXXs2rabySQSP7rSpE0uvSsf3M2Lv1su+jHxjmcX8Qk12yuC
         fQWHR+eck90RjhVwG5a9X0W3EkUVV0zCYd4WV+OiYt35lj6LBuXfICcQViJfEePuECS2
         HTTLUjI7PHyyE6w2v5U4XyPL+5o2pnjf50gFPP4zgiWWzUZ+b44i2c2RrPMWRvd9dIl7
         SoSNcYgr+tD5Swli+QmvJzqg//ZCHClCuVXXEl9I4xKaxo6AIubs2ui5QS/2D4BYm7TY
         9YHw==
X-Forwarded-Encrypted: i=1; AL+hErGFjLnDicQfphOicSPwmm5ml+VChix36RC1E41bmI4AqhH6/N+BGRw0oKpFTvctHxCj1IT98rpD48R5@vger.kernel.org
X-Gm-Message-State: APuU4Z++dKdm5ejGUyOIaDr+7Z9ETjFT6JuL+abRxrZO127IzC4hjV55
	/VbVCHc+Mu4/g9Sz/skJVzxEO2m8hgcGyBQ5uOELAIGbjImMohzAtoX4ACbT9xIW
X-Gm-Gg: AZFdTZelDPhM//heCrQkkdh11C1JfX+JxXBFAHKjC7Add32ZQ7gksk8JRfd4Anyt46D
	JPhrMpnRbAHWNXXEF5ls/uALqg7W3ic2ZG3JvJWzjO2uOBIhrjDOX/KmwgLK3UUfvSNBrJmWPb2
	AZ/bspLogFXrl2LbjpFBB4Xr1vxh36ZPcaBVkPHHrEN8Qb93KBu8OYlEqDQMb8U39lFFySjcYQ+
	go8/MuzP41UVWgF3JPQ/UjOjIioIHx780LNJQ3gzEJC/uk7k7JnA64NoYS7PLSbeeroe+4QuNk0
	lUeYlt1Q80EiR2RId0TqU4AgraDCndHkrBgU4vm2Bp6FacEoT3ZYrMmEpNAc3T0y1OAzm8cmeXU
	+/zkc5qP0Jkp1gb46XXwRvkBE9eGSWUzkARZiCKYjJd5hs1snTiod1XSk8buKDNvCz+F6kIRja1
	jS5zqmTQHhnboO9t0YRqg+rEa85gS2rK3FM2jpHIWqTR5HzuxryIwREr4I3T9naieZQeRy2WI0/
	YJ/YOBOV6YvN2RcHSc/mjNFGuCt5Nn/bgcJJ5CV6eQuBjWPosPkE8n+KORyyF6xwzmzzQkWiFpP
	0mDezlnPm+YjK25Dz3a1IVBOfu8JFy5O+c3rvUjZMokn/prYysmAfBn3bjsYp4vb4sKu
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr12421220eec.2.1795514054686;
        Tue, 24 Nov 2026 01:54:14 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386992b404bsm32041395eec.1.2026.11.24.01.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:54:14 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Fenglin Wu <quic_fenglinw@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] leds: flash: qcom-flash: fix the v4l2 flash release loops
Date: Tue, 24 Nov 2026 16:54:07 +0700
Message-Id: <20261124095408.3842986-1-congnt264@gmail.com>
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

qcom_flash_v4l2_init() stores each LED's v4l2_flash in
v4l2_flash[leds_count], and probe increments leds_count after each LED.
So the valid entries are 0..leds_count - 1.

The release loops in the probe error path and in remove() start one past
the last stored entry and never reach index 0:

	while (v4l2_flash[leds_count] && leds_count)
		v4l2_flash_release(v4l2_flash[leds_count--]);

After a successful probe of N LEDs, remove() reads index N of an array
with N entries. When probe fails, that entry is NULL, so nothing is
released.

Release the entries from leds_count - 1 down to 0 instead.
v4l2_flash_release() ignores NULL.

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 96a2e242a5dc ("leds: flash: Add driver to support flash LED module in QCOM PMICs")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-qcom-flash.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/flash/leds-qcom-flash.c b/drivers/leds/flash/leds-qcom-flash.c
index 4e62a210cf98..1003ba060b42 100644
--- a/drivers/leds/flash/leds-qcom-flash.c
+++ b/drivers/leds/flash/leds-qcom-flash.c
@@ -953,8 +953,8 @@ static int qcom_flash_led_probe(struct platform_device *pdev)
 
 	return regmap_field_write(flash_data->r_fields[REG_TORCH_CLAMP], flash_data->torch_clamp);
 release:
-	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->leds_count)
-		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
+	while (flash_data->leds_count)
+		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
 	return rc;
 }
 
@@ -962,8 +962,8 @@ static void qcom_flash_led_remove(struct platform_device *pdev)
 {
 	struct qcom_flash_data *flash_data = platform_get_drvdata(pdev);
 
-	while (flash_data->v4l2_flash[flash_data->leds_count] && flash_data->leds_count)
-		v4l2_flash_release(flash_data->v4l2_flash[flash_data->leds_count--]);
+	while (flash_data->leds_count)
+		v4l2_flash_release(flash_data->v4l2_flash[--flash_data->leds_count]);
 
 	mutex_destroy(&flash_data->lock);
 }
-- 
2.25.1

