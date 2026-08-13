Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BB43E5EFD;
	Thu, 13 Aug 2026 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612483; cv=none; b=ACCRfcdZ/boWEtgHYJ5zvESqS9/MvfHcgjnFFS652iKoDBIVJpsp9XQTQT99U7l9iRGUYqMK9ftGD8WP7hbIEC0/vu2K8kHr3FYsf6A0p+kS4MgoC6c8kTPG7iWqM1VX+bLUh8kk80hthUbxDD1nSw4paCU+BrjNGoE4ywq23j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612483; c=relaxed/simple;
	bh=a6jnccpdoFsbAPwgiPcV/pLe4NhcmGmmFXtZgnUqGck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DrogJT2soJKu99zY5RoOqq/ppAe1bFD5L6AOInT29rI6ymLgFTcx75AdXlKfk0srLaG+AS6Dj+E7LgnGpVvatI2WFUhWBtjMo/ncZ74uS9MCoflb8TcQxDwZUjvkf89X4aUCU2sM5JOZ39ZKmdnB4phyHfhKGSoyoKeHsiNKsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=EBWv4LII; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="EBWv4LII"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1786612473; x=1787217273; i=wahrenst@gmx.net;
	bh=TK/rUUDWg1vTHN5ljFVrq0v8/te3JnboAjDizOYY3DQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EBWv4LII4t7ATCrdi9IFzrYMPc8JkwKHLGBCrgHgijZ1EbkBoZp2eXJJ7CNfhEdj
	 EruLFGbfDiZDrwTTCKzz/PMhcdl3yyVhNEP2bKC8x46PJLdLoEndeT1TOn8HcxTBL
	 kqPZ8klGlDb1Llp69vvYIKzyHgsL+5snZ5WyszqS/EsSzmiGaw9Mw0pFMaNONfZ9m
	 fq9mfPVVqY83iBiyaTpKg/MWaNZIrLdgOgGe9fjEgdyRYABnfdm0jwibDNO7DiaHB
	 9R/IgTrGHyjVNsMkNKD1RRgYJZjM12RelLC1P2hoSfJlWnREMvIkKle106ixeWd8r
	 2JHbGGVX3ZRgSifz6w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQTF-1xAbQS2Scn-016Qtl; Thu, 13
 Aug 2026 11:14:33 +0200
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
Subject: [PATCH V4] leds: rgb: leds-group-multicolor: Implement default-intensity
Date: Thu, 13 Aug 2026 11:14:28 +0200
Message-ID: <20260813091428.9072-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/5CiqvYD5HlkPdCgz+t4Wbf8JtTB2so4Lj4zG7aWrzXZ7BGWaUz
 c9QVvfb6DvyiAMcmiiJQ3Uo9QGkvn1E3VU/YiISsANsPGwcNo7G0NaMgSFzcdinnuDHhNyj
 X/nCsOTeqvZPf0rIZmc/zK9hanBWqmnu/ufrvwogJsQcZuONJbzKseYrK9LGJzcRX7Xgaxe
 b9gIS6GohjsDIxDn3cK2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SlSJXVlWoYY=;guX2yitjvkZ/Ci7o59rSgF+Ui47
 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
 Z275uYhr5+RxWYlQ==

Currently it's not possible to specify the initial color of a LED
multicolor group during boot. So implement the default-intensity property
similar to the leds-pwm-multicolor driver. In case the property is
missing, the old behavior is kept.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Jonas Rebmann <jre@pengutronix.de>
=2D--

Changes in V4:
- use device_property_read_u32 instead of fwnode_property_read_u32
- simplify if statement as suggested by Lee
- drop obvious comment

Changes in V3:
- drop unnecessary patch for leds-group-multicolor.yaml
- add Jonas' RB

Changes in V2:
- adapt to approach (incl. error behavior) by Jonas Rebmann [2]
- address comments by Lee which still apply

 drivers/leds/rgb/leds-group-multicolor.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/l=
eds-group-multicolor.c
index 548c7dd63ba1..f278d2a2bf5c 100644
=2D-- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -109,8 +109,10 @@ static int leds_gmc_probe(struct platform_device *pde=
v)
=20
 		subled[i].color_index =3D led_cdev->color;
=20
-		/* Configure the LED intensity to its maximum */
-		subled[i].intensity =3D max_brightness;
+		ret =3D device_property_read_u32(led_cdev->dev, "default-intensity",
+					       &subled[i].intensity);
+		if (ret || subled[i].intensity > max_brightness)
+			subled[i].intensity =3D max_brightness;
 	}
=20
 	/* Initialise the multicolor's LED class device */
=2D-=20
2.43.0

