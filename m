Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B64C391E52;
	Sun,  2 Aug 2026 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785671874; cv=none; b=atXy/3U2DPAneDhXAMhLHEVkb0zGYE9OprwhM724hl7KxnMJfn2N5GqDf1DBHG1qRnK2UO3tc0zSXPRgQ76zSvhh9e5rqFhmTfwCkwEQKvl6DzDtlTBIlIN6odMw3hrIe7V1dgDT8xiGbJj0EMIFtzaZOXUtqJc8FwyZ/9BAqbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785671874; c=relaxed/simple;
	bh=7PtlHX7zh9c/QFV5IFKQ8j0tSQ+ZYNDpJWWoyXKicsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fDH+ufd2Ye38ADZojnY2nqRJEiZWEhKy2jS0tWxdxqJ4pHGLwAVH9k7M7Gf3hZHG683pRA1JUjMhTKmovpZFyVfSq42w7tuixOZIvboDvBMkR8DEN+ptjHVVuc0JjZXGE5+FMEzDOdh4kxrUhwR92n7xwr/4n5FqkOyO64AATtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=RAen23gg; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="RAen23gg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1785671869; x=1786276669; i=wahrenst@gmx.net;
	bh=0QshX7+fMyigEZibuySDKKyGI418QswzerEtU8tqSiI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RAen23ggL+bRmxIX7EmurlhXfbkQIqG2XcjZx5c0sMnJzGA76UX/g8pBbzMoQxSu
	 hielsnsMK7aGY6zBlZEa8TtEmJAdZQg9aP5lk7V1i7UbFP+MJZcSe+thLlzOcesOs
	 INCqM2FPpOWsksLyZRGfiJyMOtpuH9Z7boINhL4LT1KXxFaP+culsIZg7tStqaNvq
	 iayC5zw1PYO7+2ztJvMlhe+3PrdVEhIyPV6cq+OeXRrO4Rd5f+qDPN7rgQNh77gxk
	 FNwozRuAFbSPKv9F7/pWx6E2fRgwGdrQ07EQDOk8d2Bv4Un4S+hUVKiN5LTkwbgZg
	 KDJZh/jq4PaWUvk4rw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAOJV-1weeJS23Xn-00153A; Sun, 02
 Aug 2026 13:57:49 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Cc: Jonas Rebmann <jre@pengutronix.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 2/2] leds: rgb: leds-group-multicolor: Implement default-intensity
Date: Sun,  2 Aug 2026 13:57:27 +0200
Message-ID: <20260802115727.50411-3-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802115727.50411-1-wahrenst@gmx.net>
References: <20260802115727.50411-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fNDojxDzfQabBkNEsyrI1Q910UrAB1ZKR/WTYN4L57XdaYyTqai
 TvmQHsIPhlY9LU8JWNxWdg94S3EZa7ptxWo/lYEKBqj5/9PGLZIw0sgRTxenjK9OffnprTn
 Q5AfKEGd16z99Ss3eCm23ucj3MPadF7UJ0kteflIQaQ+j45B1Jw6KoqX1Enn9DnQ0UZKAfT
 hVHDStMzM8TNdzbzKC51Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5JjSwrvQMms=;/0kQ72nmZEauXTAQNsOwwsd3M6+
 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

Currently it's not possible to specify the initial color of a LED
multicolor group during boot. So implement the default-intensity property
similar to the leds-pwm-multicolor driver. In case the property is
missing, the old behavior is kept.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/leds/rgb/leds-group-multicolor.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/l=
eds-group-multicolor.c
index 548c7dd63ba1..69b203ec89fa 100644
=2D-- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -109,8 +109,14 @@ static int leds_gmc_probe(struct platform_device *pde=
v)
=20
 		subled[i].color_index =3D led_cdev->color;
=20
-		/* Configure the LED intensity to its maximum */
-		subled[i].intensity =3D max_brightness;
+		ret =3D fwnode_property_read_u32(led_cdev->dev->fwnode, "default-intens=
ity",
+					       &subled[i].intensity);
+
+		/* In case default-intensity is missing, fallback to maximum */
+		if (ret)
+			subled[i].intensity =3D max_brightness;
+		else if (subled[i].intensity > max_brightness)
+			subled[i].intensity =3D max_brightness;
 	}
=20
 	/* Initialise the multicolor's LED class device */
=2D-=20
2.43.0

