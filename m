Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209934;
	b=ilixABYhbz3sppf9naIfUH81X1omVHBw/7LiPm0FtNPt2yUhs1piVNTjLXw04eio7juJ
	 K5G9ZqrhVjVrRUU/zf8TmlHTINuos+ua0UlNQSPSChwVydLJPKPldYl3EIUMbq42kSfW4
	 miFwrQRTLhQ2coluFLfBaIkDZoB4wq/dcC4PPcv01gwIG0CH4g9w6vbB/H/yjwwEy7r/t
	 nHdvw3PMOag8G0eJUd4lsGqjm36vwwLcrUu7GFTdBqG5lj5CpIiYrnVLYR8LBywvA303l
	 je/pbGDlJ1cmNp0Q8lCLFvSy3ts91uPq/mxzkuX7I1J4z3sowuA1vdrcCcmjgN0hVuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209934;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=TNPMFYgAwFN2NrARfx3WacETp012VuuTfzB5PFZwkmU=;
	b=nOiV9Wir3hVHVwe/B8WQ2WGEacxLyGqf+B7RGVgWp0lUQs0pFlJkjfubM57gnMXCE71a
	 HK5sh0koHCum7aqDWwqBenruuCjbiJd0KArUiZ6Y5dHXqnVRcLckbxaoLTUHn0dzAF/3M
	 endN2E/0kYQSdFajC1NEg5sW3hPLmX/2VAk3CDBKOk0uHH/3XFCOYcPJ00iD5xzrEnWks
	 FH4ZqcRlIYf9BAY4QJPV7LhscZqXTpRqte1PXRbevE3tHGZKbJr+2tP2vSbJidluHOeiG
	 hxZFot6/taHWCwpTSiSdmI1GORy7/pOV9uEvSaiCcQ4ASE6/5G3Tch7AyLz+QSH2VNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sh+TAl30;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F207D60A260F
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F207D60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=sh+TAl30
DKIM2-Signature:  i=1; m=1; t=1795209930;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:eCByocuMBUO7v9aAbEK3hX/kaNMg
   qoyZd0P37+PqyPm2HZA24oLw5re5SRu5g2T74t5aU7mbvPIXAfx9GOP+iS/JDlw4HbnR2hLgLMU
   RZogEsGav72fTXZNogfeGXtRwjfrrg04J4Q+GOkDqFw3XaKWQm10IsZ1L08+XeRkzZNMjOLdJfv
   TZDWVd78kRuLCO6PYdTNzRVgIi6UW/E+++HMspa8KS36aorjlv05uED7eXOiWVonEZZ4WUUHa0u
   Nd+GlRS4rxwPp31Tc+AsS0QmGUqlm1+R1vyD9Zw+lOFLkZGS/q8HXbrpUiEOhwCkgrHBIIIQ8iG
   R8OpFZwNoJs8VQ==;
Message-Instance:  m=1;
 h=sha256:
   YK5hzQCwNy/pnGPdYK0dNzUv3tZGXdXuGVdQqUq40hA=:
   zB1vefYU/huGeLfABVto+yL3GQvTRIu6nRtZC7XoK9o=,
  sha512:
   s5pHHqgbsny0V0xZyMdNZ2dZtukeoETS8Yg3dNk+hFj3dLwDPTiO9AKMvpQBBksTHXb8j/7O23jxCWyvHNjcEg==:
   fNa8FRApOTYZ6swOz9w5Yz7nQCH6kyj46/vItreKFwB1r4KnznrrFcvBnqyg9LAI2TqMOl9UziaqeJAP/sHkWA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209896; x=1795814696; i=w_armin@gmx.de;
	bh=TNPMFYgAwFN2NrARfx3WacETp012VuuTfzB5PFZwkmU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sh+TAl30gkYqhb6SAM7vcZZih5Zh5RhNbuuGcS1FZ9IUjjwVAyvsyxTc9bvVW3C+
	 sEPKdCo/MFdarTw24y7DJoNgk2V2J3l+s1xKdFMgXPi3E5Dva54TNBoCbdjBnGNra
	 jVSzrWYPC3PYMVplvAyDNPRZ1Eaq/oXax3aybJL/sPs7s5uKENcN4FJ1so1Y9AUXe
	 UetrElQF36wuyE1fTH7ZjEY0dxecec3XhjY73dlfz1TbaZEsj47TJtjmtxFUIafR4
	 ihf7n02UN4e2DSCf/SerR6dX3BeM7RB2icNVM34kRj/JRQkTSIOTVdK3DiiIkX0L6
	 sgS7BpEN8Lrmk+99yw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU0q-1y4gGR2dKW-00p4Mq; Fri, 20
 Nov 2026 22:24:55 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 10/11] leds: rgb: ktd202x: Initialize max_brightness before registering LED
Date: Fri, 20 Nov 2026 22:22:27 +0100
Message-ID: <20261120212431.152081-11-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120212431.152081-1-W_Armin@gmx.de>
References: <20261120212431.152081-1-W_Armin@gmx.de>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jh3nP2KFDTcit2m1gCTG2lp5UJRcWmowHtUEb/tkSgTSTvuEiiP
 ujZM0NHJV9YyZ0utY75lyIB4e4MZLS4MvgkfpYYFmJOsLww/O262+jrKIAxhTm9Pmj/EZJS
 une+TdNlPGIlVrJBm0u0W1vPsQdFaqaVQox+JbiRdla9/fn59gR7EZpxRvJ3ebp9DsPpVgJ
 z8Ilg1DXNySxLij9paISA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aVhg/vxbtWQ=;oOEjNt3t5ToYBHk8fOspVnqMJgK
 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
 8vNI2uLH15BU+aYXvJsyLLSUGXFg==

Initializing max_brightness after having already registered the LED
class device will overwrite any adjustments made via devicetree and
mess up the multicolor LED fallback path for multi_intensity_max.

Fix this by initializing max_brightness brefore registering the LED
class device.

Fixes: 0ebdb7210943 ("leds: Add ktd202x driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/rgb/leds-ktd202x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd20=
2x.c
index 143020945e23..2f5d0694c9c9 100644
=2D-- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -477,9 +477,11 @@ static int ktd202x_add_led(struct ktd202x *chip, stru=
ct fwnode_handle *fwnode, u
=20
 	if (color =3D=3D LED_COLOR_ID_RGB) {
 		cdev =3D &led->mcdev.led_cdev;
+		cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
 		ret =3D ktd202x_setup_led_rgb(chip, fwnode, led, &init_data);
 	} else {
 		cdev =3D &led->cdev;
+		cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
 		ret =3D ktd202x_setup_led_single(chip, fwnode, led, &init_data);
 	}
=20
@@ -488,8 +490,6 @@ static int ktd202x_add_led(struct ktd202x *chip, struc=
t fwnode_handle *fwnode, u
 		return ret;
 	}
=20
-	cdev->max_brightness =3D KTD202X_MAX_BRIGHTNESS;
-
 	return 0;
 }
=20
=2D-=20
2.56.1

