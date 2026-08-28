Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B028B3E0C68
	for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906776; cv=none; b=G57O526/2jued2pvppJkmrze0D16pxj8LUsrQCTAw0KPfApiuDBFSH+Kzk/R4HI/KhP1BXKAc6TscKGm/00ruUlFDQomofgpR76nOHovIUtj6gcKgCHmrXBmk3J3qVyx+NkQawx/sqd2v61Re4IMJsfuRwfaQTZ6CY21PaYyxyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906776; c=relaxed/simple;
	bh=+3+CM583FG4ZzIsftx+jCX3nthFoFjWph9HX/ia5tXI=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=TeerxbGrR8tJtMjpeLpVpc/UNfJ2eEs/WFdDLvcfPRFEVu28zwVwVgmmpVpPyZouDcvWZH4263TkAyV6AApkXBCMblf/VA/IqwNdigdVCK21g0DjBAlm4x7Qhs4bAmNAhZFJPCXX2Wr+h5rSFAtn1boVIU30pTz4krh0HXorKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHGxXMtH; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHGxXMtH"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so613035a12.1
        for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 01:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906774; x=1788511574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+6qKW8jbCp6CLDtdCf0xBEJmto3LmtgiUcciH8T//Y=;
        b=CHGxXMtHmUd4qxdHK7PZekMNyaikzEMQ/n2TOMuXsmDu8H8Mjsxq7mN+jKDiqqJTtD
         DWiejpsjGV5VsZRf7ROEzPeKKEiSn6v76PBUNDFojjxfCTDmQVo2ysSAn88LcJBfrWbL
         OFiCMV8pM/14Wnpp+mut4b6G8a5a4UmejrsjwQ00yGmMjunVUy3wbes/G1boQqJINsls
         FcnSL8+rrfVKkrTTE6bpN4alcKEdBQjfSGLcDYiUO8pul3hX8chxepEg2/HrDZaqYFoG
         Dj8oaS/cvRuPmw0z0os0JTsDPzHkjAYlDR8YNHRiVXMlBmFyP7mUFLZnJ7HcV3vKdD89
         NKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906774; x=1788511574;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z+6qKW8jbCp6CLDtdCf0xBEJmto3LmtgiUcciH8T//Y=;
        b=TT7fyKAB0+H/ArKrnDvP2L9ASlp18d44vATn7uEPVNsg0RzU2+TJMy4D7c5ZaZnAWC
         014VXF6xgH0g/KJYS4MPoETfrDwc9kqxnzoQ0PH1SNGqw30j8183yATbQs7Wz9v5nJ7S
         DNTBXiFWHyC52Yq/riAcXoDIsTWsaLMESUja1nHYXu1qYacNG73SbuS5tmhtIDN6OsSY
         Shl4TCDhG2cZrjDOJexQsihnf/eN/RlRDqhkyGt674gQzpyZpx+FWnN+ldrvxu4c2uIk
         JIQgJU7w61YY1jdSeAapYMP2i2jOJ4RDYI+Fy2eWE742PHrujqJY1bD0MSq8K0LAYqzn
         4asA==
X-Gm-Message-State: AFuF++neMgKslfZScVwT5SNdw7YsN44GYldTEA7AexPAVR2Q5czVJ3R3
	whsfQK5u9YgrFMsH10jQ52QVDv9dzDRP2I2iR4CIvr9PBz2wyOdtZFt/
X-Gm-Gg: AR+sD11YPa2uo69ogHoSia8OlOIId52yZajiy2ohOOG7N0xj+wZuEkPJxIgx3P2oYMJ
	zJIJUArz4mpIH+YoSneu4j3lo9WrJJbhT12bUcwjT4sTJLV1fJqDIcKgjbO7G0U2j6vZTNP3a6v
	E/3Dcf7wyA/v7DCtUcxikz9kBlb2PtQ2IoZvFfLjp9Mv3eyjHpyP/bxDTZxYfBPFkJCq6DKgDfS
	hRIpnn+KHpZ8kBm82XgA4cZkSinu2fM6HknNFpH6xGGEVe2DVdHes4vaZ2xzl/OaTxM1w3PBknN
	BVTazwap3nMsk0lg83cAvrMlMuDFbUHevvlDBlGtGNwOXQU+pPWQYtF5PU+Xwjn1Ggg8LcKLFhG
	dbZSYMZ4yK1gK+eWyKTtpq2Ap8axk0sigtvJ9LFjCH56pEEWI/cRYd3LXWbGFsf6l4bWkWLH3RL
	cp1OMDMpBjx76o/M/uAMPIsGGlLziM7MhWjVXGW8TkOzFLICUQGq+hax+zukWbzv+gCPmpwqzwr
	skUbAUhrBcCKJFIaiR1oroI8S0Coyyj/Kd7mauJRcIq31xcByQAc73LzA==
X-Received: by 2002:a05:6a21:6e88:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3d2686a3247mr12224666637.11.1787906773923;
        Fri, 28 Aug 2026 01:46:13 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:ddde:713d:7785:c4a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm4241099eec.7.2026.08.28.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:46:13 -0700 (PDT)
Message-ID: <6a914ad5.1e1ac41d.2a3f62.4979@mx.google.com>
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
Date: 28 Aug 2026 14:16:12 +0530
Subject: [PATCH] leds: max77705: fix fwnode reference leak in
 max77705_add_led()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In the RGB LED path of max77705_add_led(), the=0D=0Afwnode_for_ea=
ch_child_node() loop over the subled child nodes=0D=0Areturns dir=
ectly on a max77705_parse_subled() failure without=0D=0Areleasing=
 the reference held on the current child, since=0D=0Afwnode_for_e=
ach_child_node() is not a scoped/cleanup-based=0D=0Aiterator and =
expects the caller to drop the reference itself on=0D=0Aany early=
 exit from the loop body.=0D=0A=0D=0ACall fwnode_handle_put() on =
the child fwnode before returning to=0D=0Afix the leak.=0D=0A=0D=0A=
Fixes: 3b6eaa3db567 ("leds: Use fwnode_for_each_child_node() inst=
ead")=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555@gmail.=
com>=0D=0A---=0D=0A drivers/leds/leds-max77705.c | 4 +++-=0D=0A 1=
 file changed, 3 insertions(+), 1 deletion(-)=0D=0A=0D=0Adiff --g=
it a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c=0D=0A=
index 1e2054c..a5030c3 100644=0D=0A--- a/drivers/leds/leds-max777=
05.c=0D=0A+++ b/drivers/leds/leds-max77705.c=0D=0A@@ -193,8 +193,=
10 @@ static int max77705_add_led(struct device *dev, struct regm=
ap *regmap, struct fw=0D=0A=0D=0A 		fwnode_for_each_child_node(np=
, child) {=0D=0A 			ret =3D max77705_parse_subled(dev, child, &in=
fo[i]);=0D=0A-			if (ret < 0)=0D=0A+			if (ret < 0) {=0D=0A+				f=
wnode_handle_put(child);=0D=0A 				return ret;=0D=0A+			}=0D=0A=0D=0A=
 			info[i].intensity =3D 0;=0D=0A 			i++;=0D=0A--=0D=0A2.46.2.wi=
ndows.1

