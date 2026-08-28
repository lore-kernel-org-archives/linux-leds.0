Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE039A4D8
	for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 09:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907617; cv=none; b=GEtHy5VnetI2hFER9A7BkcRhfFX9G8m9xwxMsy9oKL8Y9porAA6/6qECV88v6wECTrl1CC9yUcmpwpKuFPEdGoZQel1TD7s+e6QEIaH7pSwhn39zlWYxBw6SAN7jml7JlKQxCIxlO4WaVeNhS+KYsG51Lhk7eGwK0mPuE2Q1rJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907617; c=relaxed/simple;
	bh=QzTyrp5ZtI9h+7JIfZbJaZg9Ky9cEZndB4nrChNEIME=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=s+D0ZNTj6a7UOh3b3XtlfIRFNlKDGYZ47Umzy5F1LONXQ3LDimkvGYHOZi7YmeNLpDfR5isIQbqyAQrHX3H0F0kgmB9D4BBRAyV+aa/NgdnQdJJwDcMdE84tlELEY/LQCbgdg/CD9E9hn6KHt55idhtKTVBnNMufZ2OIf4jpEJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6pYYPSR; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6pYYPSR"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso615915a12.0
        for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 02:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907616; x=1788512416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GBj03YUyO42gKTg2Nn2xcgaGG+u4Z9YmWa87lQqvR2k=;
        b=d6pYYPSRQh+0vee8u3rX+6/Wf75KPcVD9VrKqQ1v/tUEWdQfA1Lv5GIf0yVfTE67kh
         /6gQO0JYtYxoMvtmfZ/4qK37tNIQMNOVAtNnaeq6Ul+V/bwV0ychMDzs8lpJHK2HDKGM
         xsKD0OuOrfO8BhhyJMUa2DTmbO0VJy1UmSq5Ad7zJP7+Qxv4cuWQ9Hic5e/2mJEsm7Qx
         wzwYPbEz941qOvp6GxphSIk3w0JNV9d3BHF+hP8Ko8hOVFNG5UZRIQr8+XxmO54vziC5
         Y4asjOYjZAIXTEOuJsHCsezUIyRPmluHnmzcS5YRfMAATaAqo/Vp17qiJ5ts2Avw5Tzp
         w8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907616; x=1788512416;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GBj03YUyO42gKTg2Nn2xcgaGG+u4Z9YmWa87lQqvR2k=;
        b=SuN5qhUrKZwZ9YtL9fnUojtwqiDJnXkSCP6Wa/NWagha69wOpsqSyBJjPl5J5ZBva6
         Xgi6itMpjNFJkpkySgVp0BmqYkLobasKB5Rai5KkGnsKzhGwTFo98mah5BHkpGkA0jbW
         BePZ17+KOShPRXO/vGDKrCF4mngKEkgsNlg4qDfY766SC2Lk24DTuSPnWq6vyUyQGQaj
         4v6auEmHnhHCqdQdOluR49dY9ufVxt3xk2lZWtXauPlC/eCIa9pcIhUL26iyER5miQgG
         pWWd4BtkdhQ32vg80eTU90iN3BnwV4g21W9S0lyEoDuqDy9pBR58Bt6wH9jcZx1GmVrF
         PevA==
X-Gm-Message-State: AFuF++kTQ6pJqrFenrC/eSY3/f49PXjSAHd9FJ+KWcBZL1Z7DDsx7vb+
	wIKWRUTKug79MHHIUvZ2ucDJGAoSb04XZbX8OaFPf4TEOGIoZ6Frmm1z
X-Gm-Gg: AR+sD12oHppHRSvbVqXkKPKX32Mp3GdWjmBNVfhjq62z2SCeay5T+rQsrhU5GAATba0
	PN1DVPnYUXZOfQRguoTwntzyjmoQSfPcIzz4hAIbE8xdlih5LXR/R6dqdbq1tJgZhsvdO+YSNKM
	bPZ36aLfV8/R8IEb78d3fBdMgegTrgoaao2vE2/A9c/8L6ksz3yVLRiN8yQ3GtmyhHkgIbJ9CQA
	zvhZLnSi3yjKYnwHFYQN2r69Al9odIfxjY6zdEX/1plDS3hgIH/Cga76H/MvqLWjmvFBKa3AbtZ
	ACCpbbvZfM7xXn3FoH8lRd4Y5b66GevXgZr6klhqmDnAfRBWpUsU8Ej0dB80woQwNNQof5r5/gm
	oB+IgP+pjD8p/7oZfixzPgACz4yhUfYJrFRnohg2erDc2gp+7jf/l1LKQwFhBwFEAI93rxk4qXG
	iBteBk9YzXhXTtWzG0MgdXN3Ncu2kLhoR5tF2G1hCBTjtB6kZCl1T5yILgLVWbqynLlN/L6/wHB
	9o1xFooSFdVRun+IHxtBFa5XpUdqFKUbmQUdZK25XUayDSRZPdngBBW0g==
X-Received: by 2002:a05:6a20:7faa:b0:3cc:3d08:da2b with SMTP id adf61e73a8af0-3d2684a3f6emr9285413637.15.1787907615195;
        Fri, 28 Aug 2026 02:00:15 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:ddde:713d:7785:c4a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm3987107c88.15.2026.08.28.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:00:14 -0700 (PDT)
Message-ID: <6a914e1e.7d702ed2.1273e8.2a52@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: cw00.choi@samsung.com, krzk@kernel.org, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dsankouski@gmail.com, sakari.ailus@linux.intel.com
Date: 28 Aug 2026 14:30:13 +0530
Subject: [PATCH v2] leds: max77705: use fwnode_for_each_child_node_scoped()
 in max77705_add_led()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rework the subled loop in max77705_add_led() around=0D=0Afwnode_f=
or_each_child_node_scoped() instead of adding a manual=0D=0Afwnod=
e_handle_put(child) before the early return on a=0D=0Amax77705_pa=
rse_subled() failure, so the reference on the current=0D=0Achild =
fwnode is released automatically on every exit path from the=0D=0A=
loop. child is never used outside the loop, so the now-unused out=
er=0D=0Achild declaration is dropped along with it.=0D=0A=0D=0ASu=
ggested-by: Krzysztof Kozlowski <krzk@kernel.org>=0D=0AFixes: 3b6=
eaa3db567 ("leds: Use fwnode_for_each_child_node() instead")=0D=0A=
Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>=0D=0A-=
--=0D=0Av2: Rework around fwnode_for_each_child_node_scoped() ins=
tead of the=0D=0A    manual fwnode_handle_put(child) from v1, per=
 Krzysztof=0D=0A    Kozlowski's review.=0D=0A---=0D=0A drivers/le=
ds/leds-max77705.c | 3 +--=0D=0A 1 file changed, 1 insertion(+), =
2 deletions(-)=0D=0A=0D=0Adiff --git a/drivers/leds/leds-max77705=
.c b/drivers/leds/leds-max77705.c=0D=0Aindex 1e2054c..4fd803c 100=
644=0D=0A--- a/drivers/leds/leds-max77705.c=0D=0A+++ b/drivers/le=
ds/leds-max77705.c=0D=0A@@ -160,7 +160,6 @@ static int max77705_a=
dd_led(struct device *dev, struct regmap *regmap, struct fw=0D=0A=
 	struct max77705_led *led;=0D=0A 	struct led_classdev *cdev;=0D=0A=
 	struct mc_subled *info;=0D=0A-	struct fwnode_handle *child;=0D=0A=
 	struct led_init_data init_data =3D {};=0D=0A=0D=0A 	led =3D dev=
m_kzalloc(dev, sizeof(*led), GFP_KERNEL);=0D=0A@@ -191,7 +190,7 @=
@ static int max77705_add_led(struct device *dev, struct regmap *=
regmap, struct fw=0D=0A 		cdev->brightness_set_blocking =3D max77=
705_led_brightness_set_multi;=0D=0A 		cdev->blink_set =3D max7770=
5_rgb_blink;=0D=0A=0D=0A-		fwnode_for_each_child_node(np, child) =
{=0D=0A+		fwnode_for_each_child_node_scoped(np, child) {=0D=0A 		=
	ret =3D max77705_parse_subled(dev, child, &info[i]);=0D=0A 			if=
 (ret < 0)=0D=0A 				return ret;=0D=0A--=0D=0A2.46.2.windows.1

