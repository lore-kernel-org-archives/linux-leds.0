Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8514A12AAF1;
	Tue,  4 Aug 2026 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870739; cv=none; b=K1BYGQzD+Rwn/wTAKFYWTmWKonUW4+MiDBof0EUauWlnwhozZzN/TrgS2Ic4xB4WfhovCrq6em3OXu3muFQ2udF9dX9PjO5Jbc2Dfk638jzyi0oxgaH74gyTZxcXPyE58Fpd05nK/eeeOuIwGOPHe8YNrPtLJPpoMB0NVGgk9qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870739; c=relaxed/simple;
	bh=k8we7fJgXeEn8kex7suO4CfvPjZjt+ZkZ7i10vN/LKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qBa0TvLMDbudE4SfQVM1r/uA+ueTn6Jd5R7ulJEF47f0Crqy+GKDCRevoDuDsWGl9nnYg0a4aCpM+7+Ax0RfHRPR7xbpb1Z9Fd+gc2RVJmu2n5zj2Add4BXJogax8KyifJ/94zF2zEZshwGuzHkQiHN9uc00VlaF7OlyvvVNQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ci7yCKs7; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ci7yCKs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1785870734; x=1786475534; i=wahrenst@gmx.net;
	bh=b0MuA6NptOkmdRe3qnRHVS9FZXmrrIomPRuoEFfLELM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ci7yCKs7HuwoWQQJCpn14UIodz0lsmzgWG6DuiBz59w3Z9lauXsYsj9knXvqwDT6
	 S0gvSeiyPm6qR50nRWPac9ggRq3Q5rShMso3s+cV2ub88A2Cu6TsUHU2OPznkpHfD
	 gC0Davwwfj2EMagql1YxDcHXmWSkGzZWMK/Wpl9GE1UxrCex1L0+3JdUmgQZWXiI0
	 2Yl5bm6FOiQaQcCrKthHPF2NwCJAzRvb1Up1i9+1PvzEUDUSa+0EdG+UgtChIU+yx
	 7djrod02cgIPWwuEsqAHL5LN8Ba1nfhoWc28O1ntthoGAZTVA758i16ckFaLmkL8W
	 Pbyr1C3IQmPVHvfKmQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzQgC-1x4icA2KVE-013Bi5; Tue, 04
 Aug 2026 21:12:14 +0200
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
Subject: [PATCH V3] leds: rgb: leds-group-multicolor: Implement default-intensity
Date: Tue,  4 Aug 2026 21:11:58 +0200
Message-ID: <20260804191158.41976-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LBhSECiHnfhnNVNaNSyElPpd/ZCYrA9lOU0A0NazIsPCVNcywIC
 AKlfQvLSc1o8Dga0jwIoODI7HUb7noZAMG3GNrjrr3W/IYQwYypnJepzkgMHCU7iNcU+YGG
 sTYUPo4zBGRuak99nOa2HpGTxFdOQxiqgTn9+Ed7niwvH9j1uuJ+4Bow86TU939Swz41blN
 cx1d1DWPTn0HOgsY6Q+Rg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wm86lTnlHOo=;be19QVsgkqRApaH0GEAMr17Uufc
 AQJVzNlIjLaMjq8x3zwpfRzf83j43BBKX3XppV8ROGx+H0ndxjgRlmivMtklxfI/Lseoov0Hl
 6t2Q9C8+FQ1AJZS3xUnw2/oh0oSaN7CQMaQGly2unIQddkLNfFIfJ21CC3ocosqK/njDgEjfX
 Y/9dW0gnvz3U61Qv9Jq2fWDaJAa7KTgVumOHS66uGUk8sQ+ZmBo6B/8evDAFwmj78wydwsHpZ
 b+6H9w2FaYhOcizbLFGbRdDipWTi+0etfDZkP6l80cIdytqlOf33xdBr3sz1g6AXR2lF9JGot
 LbkXajy0clSdxdx9JccUYCwRn4fCir2ySLs7HLN4lILSG47iAWyfQBlsN9epKMaOplaKz8mZE
 ndCtDKpwnhRiAAsFPFP0+ERC/q1wN+ETYf5ZVSF4gukse26QaWExGLdy4zVZ5nIcq1ANf3jHv
 fr1dO0TmsPXufSkpQh0c0l+G5F1i9Pqwu/wW3vV/6+bgJoUhZAi/v2B5f/MXF+Mq2oqjZzkLz
 c2/sScdjhXA6ATtOrRjX6La0atHj8FzKXiZxBwKWS79jclRgkreUJQDv63jdneF3VLUW+o5W9
 bs/LtWcZBpshXJzftr8ZbUdbYDeAPds1sWYcyDXQ+8Uz9pkddPlCryAyj2aVuteHRrIsiob/I
 UewqBJoH9avuiz1Oiyi7SHWGDDbfYButYXTKF5IlRBT2mwJ4XsM7iEQM79lvd0fN0awm612Te
 S1Nxqyj1JO2B5EIPIbwj59uDUgB80jBKzLdIMOYx8inAC1ViH1HjOBeCR+hwYQIgOpY1EUHXe
 1Mx/7lRVKzU+JDNw6WPoHKa+8atePBuZRNwjsFoIo1dDfvc82Uq8mEREYp/pAwYXLfsZyRQFG
 tTtiWmitGBSnltLa+TWRDqKPkFjQdMkWxc+iW6UbdnAZevF1ouCEmrV/TmhFy470nZRAQ6171
 iy7rWY9QEM6e/lfnS+JzSBzgmGu54Q+O+TIvvsjtx03Fo5fUcCLZEpebh/lsRldFaSBbAunCe
 PDuyMKcO6Zp/o3jbrQAcZFVGkMS4JRe+ILa6kQLw5na4TrQ15AEEweNwE2JL5gOrmUjHpXnr8
 EnvwofvetRpiHOYN7jh+uqTChnCUa2dXknkjgL0OEZ8ifLrldNoYTYE1kLLBhpHBbhdTH+QGV
 wqL5d/8f0drtgiWdRWeioPrfxthA++ERtm0jcyoukmg7EiDaKpe21NEIThslwreDpXrqFWJ3l
 IMbxxbbaGlPmIYcl4snWtM0/cgi03no5lLHfHRlBYJwkzlseiFvNVeHUrxsXT/oGkGLnly6pq
 rtP9OfS8f416zLO6TrX0QQO8rIIF7pbVV1zLFppyTQGmir+hV4sXpwadDq+x1oqQyuyfYx19y
 E2TT+LbPMw6UxJaM8MHBJob/vstOEK4/q2WZMeAYPuJ86hHLmxRstheVk4WK+e4kA++jTtHb+
 Gou+YYBKFEjNLQXuCwfwcK15e85WEnvFQqxLZyGSBMFF40X4oEGvK93LCXFXVv3CuD9TJCmoC
 qRi9oalFHRCe7XAAiIX3qWyk0nmKB/9W3ePqADLPcs/E1yX5xCzlI7OA57SVxE6Z5COLzREwt
 nxtQZ73SsoLewHV9X7j0YPA1KuqwYCe9ZakNYH8jLg5vfTIQ1FPjIHYQFzR4BP6U3Kp71lOen
 yZDcUpCddGBroaAJqjzfX6FdkIP5vP6Q0gOyRZvi9l3s9z5ai6dY1uY2o4R+6cGpAIV45Whhi
 WDEsKOG0k8vuIAu46uj74VYJfOxfI49jnzzz80LbTOQn8s6gWmBumyjvEgBudSgtG67y9ydpW
 Gv1R6D3Rzec5Bya6tauNxkJCo+zygZP4jOCbQ8pWW13b+GPvm7FSx34+etfpajSxR0qf+vEE8
 KZiy7YL1cvgKj5Z6iYrzzAyahkD3R4Bnpxi/O8ePiXpPIynsoT5iydADnkV7g6rVhOk9u12sp
 UXoz2AYPjDeAmJY068cv3uyj6TuIeS51Wu/PrtHtRpWoEOOOxOk0j50qj1psPFh3QmTGWXF+y
 8QFyDKxmbpBO/XmwOvvV1Cc/dxi/uxq5nvfRMGyCTMTjc7MZKwQn/Pj/Yl9lmMPOlcCC3Xc8c
 9lK+qUl9Y0Rr27gJgfRTWqGleVgJyIWv0UQHJU/JHEnshIAGDKG28x23St0BXEJvTEHFD4o2y
 OpHVh+b6hOomb5z0NtVJRf2aCsGa7YRx6H+1FztQx/XwSlFEMHHfPuBm0yupEtGKnJkd0UzfO
 ZhJEeDKIW98+ff+OXKyfgaF+lmrvXVp3XJDvUDziHoHflK6zRWXBOEo5Zgv4mHPVYLQReY32i
 fvZ3G9afKBS98zKiyJzBZFpx7dl8BZpFyjRlAvbmxNYCeCK1iFtmyF+87WUVNq0dujqVPcnvJ
 HkRTDBIVo+07WLDJfusGR/SPz9f54ZtJzf97397KwQExhPc6c+D0NS7XRTPqZHdM3TwGy6q+B
 TVgTRXBXqPiC1NaN2InmkMqOqs2h+F9nHxaXCgC5Ac9PNPdU1oQi0PueQQWUBCjpjgK1NYccO
 fFjPwTbxrkbFVNFOtef41/8lIb0OXkYfBKKkuu2Y2bMNswJhoOr7/+hkyeDWnwU3Blx15fjkn
 RqI7DQq6tZSQkFAJT1mspMZUypJ+vHoq+XufaYNq17VtldXZ4m1ji07g6YO9M8k8YIxKzDa8u
 wNSumtPJf/lM4SwK93Nzk4YvxJhCh9TBVj7YRsxV5y+00/8GjwwLbW0KVgHyaMEcUxtQbsuds
 W3xOaeTMpkUYxDjds05BCcDExQdF+si9NuAXZOUMvXd9SbcgDlZjtez5FfQFmJS/dH0Oxxsmw
 AK14hsIaEVmuy8jw0yf7sKhR/mONonD32KFWQuJza9sKvP+UYbK66Hufihdix7ooBSbjOlrCo
 BQ7kfOrhGdMtde1GrKM5/nj19JO3gSaZgXSybu5URFmxQwyy1uQnRpT4lEfoxt5aae/ruwrsD
 k1bJPHx00/jcY2E3U3vWtkrVehqMX3Vxho/1E+sCVQZyZiTw8Smm/qKOe9lJx1M2i2i3vlp08
 8UaTEfuVyDYrlZfZCKfzLmFWVTr7PH+kYDKpwz1oZ05W2RM8mNKvm6cU+aBDdMFbtkBIIuBYO
 pxP5qQaPV7YGTXHRTffK/tQbk5xs2hefSl93kGIBtRsJ7WtzfYindlKJadcz7QkB+Nr9Ipweq
 UJJ7l+HcF9DwSWAyo5EnHy9JdUsIdp3bgR0m0FTvjSmyd+aoBH3yKvSyhBGm/3lY42knZbsYF
 x8CYtsqImHQhtc37B+yyma9s4oYu39FVw9gK6hn8gy1h8N2l2V1RTWVzzV3vYp/CwoJn0o1qk
 uTRJL8irLyEn/l1cSEJC96LMrzNcYZdR+k0Soo2N+SSUHyB20OqhTmcCwxe6p+1M/GLpFqul3
 BX1/IvQ2P+kxhb2I2a+mqRqJQ7CSOZ9vIKfu5l4SdDXfxaLdaILJbtpmWDmhQ5aosZ39ecprM
 6RlmQXbumYRphDIA56Syb2/NCdHyiTRtOiQsADO4c1owe69h6/y4XEOf0mlhAiTVPXRRy6HJa
 PqqpKcWh0blZlYM9h6k0gPO+xU6aZiYAdVYPRx4TAmNCRFj6PUMeZH3hPHU2M2sB13d42T8em
 GoZ4iBFPAHDKY+t+PQaOkovk3KDVnLJabtQ6AaR4/KolYpAn4DvVJk1/WVIrPO65AohL3k5v7
 MFCRYK/Uqvw1nugw+7vCmN8QER8ux3AWjs8O40wMmrrQj7kdvO/Ctar9o++07aaonUidNdM8C
 GAfxpk7S3J0rgG83EhF9eT7gcfH3tsdRKoY5Lggieki6qAvw973hIPlGw4R00F1yjBytJ1NZC
 sw5AJulW3X8ZNm3NOVlwFLtaW8WZ1E1DwF3Pz66A4W1qxvQuKz2H9zdJpt46vd1CfBPRZwAT+
 340Dt67KIxYOda1nFc5bxFndMjxWh4Kg2kpWgZSNLVYhFbV9MaDwgPBdu9M7i/DJokAZgmXEx
 MopnwgVY9cot8PjNbrc0TaanKDpxH58ruYueyYu9Qq73KrZQbwXrTn5wcL4SYO8O5loAUd0GI
 IHzG4T4h/lt5MnHUsY/7bz9wes1DL/Yl/q9L5/50DBqyOSWJhZYXj+fo7VY3oqSRb3E1AC7Lb
 v3/jXo/qeoc+o0vCtO4Ij6eHvHWK2zeV3etFQywaiXYEg3t59eEB6I/8QuSxN12waIyuzL/LO
 yYSwAUKN7sHuuLc1tUBWdnGsaI40x3iE6jAybfCIninFgQYTLzIrgl7kQvgrB3tjR8jhebk7m
 vX4ViQKOU3dXZ3u5C1tvjc6fu+Uh4thS8ioqsOL9cvK3qJ6GUS32hENBf+Us3WrzlGGHAcuTC
 2j9VOX5aiIM2ESf0bNlWB5s9P5NpFDkiGWNSgsoAPg1HaepnVFlUl5WnO3my2xAZm8NCY5uJU
 roU3EPunRYI9GhGqHO+mffccGURZOGVw8KG/TsaiBiY4d34w+p2MWXVIqEcvFg4iz8xl2ZzL/
 kVdZHnoddq4bHeU294zKj+ibgm0nGgiqR88UQAFWhXj4vlkgN0qflSmpeejGQC49zLxxvZQYO
 OFfPq0HMWp/7tx43wtsbVxgouHBRvV40TaOppwI1H9MCdEoLvqfaBjNBBtlOGFulDNtpBLXUd
 HEgdIJ1nWUlXXOsg970tMbiUUSmKbPrwlgBEtzcCZYXCK6nQSgHMvngSUdhhoP71Qr7mxL7KX
 CcBgu3mhe7aKXVNsmwOk234NWcIbStjCfOif0B+gKHRsv7LgaXWFsv8qHl6FBzbM8vhBYHS1i
 P7PcYeFrL462e/H97mHz+Ok8UPkhxHs554tHzl+gD1mzmQTwrhMplVVUZ+MrIz7kyC0QEbbKD
 72nCjh8p7prVAhoGVMtLMwzbBb9RxyJM6EspFeqEK8tcKXubAOKDG/ncbz+wa60oPIhvQ8Mop
 +aRfvGtvg2l54Z033eMlrG1iAU1IkzAc+zk50b4LpWau4YGbf87oTvNeWMF500U4lcMeST/qs
 9KrehfSMPSV1fChkkdnAu08QvqvPDDIRXH1/3gE5ZVTQGlacLQPEaf3bj7x2JJ2itmECrLqWR
 KAjT+Cp6sQbegFx0APzHpZzMPBjA5IlDqC7qcik8X/PSva02wrEc0DND0htVKdEW9voelqNKT
 mb2fA55k4eb9m9zv0EzGz1wy1PiQNPp+Qavfc4aL9MZbXiNef60Tq5h0QPnfecBU+ViTQkwgJ
 y8yz94kq6wpmyfVGOzYitV2smW1wFvKNfAxq6XyNlRvutynPWbvjF4NFJEv7jW4t4vEi1VCZp
 bVh5tUdlrfnzHR2GZ9aQ1AOjlEjPS2lQvJLmFK0FJOcelLnOsGfZiOObr4HD2yO8Hx7adMFZu
 IVsuJqlySCOdQF4CrTTWcrFp5UgBmtua7sl/ffuRqdAKdLsqadvi0X2F+PAbOGDz9eIYB0VaH
 NUNOEGWK3GEhllBvrA9H5lStV6S8CwDYdw6Ni4M7PnNS6Gpjjvty1KAN1d10iHIiMDuUE2Ged
 pOcqZXusLXdG+6zfep/YVWTvDykD0RA2t9AkkEzBYTjK3oSn4AZfKUovJQRinrSqyqDQwmimb
 c56Zu/sUSCdRo5UCMgQRf0YjaMmNFeWtCtQP/XJ7LL4J5b5NJKcw2LE9X0aPrMOtPEDdeIp4g
 8GyCVs6h3rqpgT1lYfSQ1VnEBDNJaGI++mgLCcrnMjCr5SMtLR2ERXxFl3hl80cGYl5eem5Xl
 Ed3PG5S2DsNyirSQDUHZ0/s5FlSQyC2hij4Wh/PekIX1/kNUrmYeEV5hH3t58RG8iuf8PCSPn
 4EsA1s7vWwK4YD5B1noIzToh3uRTC3rbQAcmIRH8pD7iRvNgrEbcrvu+Vp5pg8xaoWSzCBOdR
 qUlIJg75PGp7hrOaX9c4OsLQn3sa5ObFOtDMzxvPmmm/qDEJWz8WpqPdWth9AaIgFHuOBZVuW
 Xn4x3HbMumCGJvLidmxmmyhdwGX8RqZZy0a4YSJOxy+tvM=

Currently it's not possible to specify the initial color of a LED
multicolor group during boot. So implement the default-intensity property
similar to the leds-pwm-multicolor driver. In case the property is
missing, the old behavior is kept.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Jonas Rebmann <jre@pengutronix.de>
=2D--

Changes in V3:
- drop unnecessary patch for leds-group-multicolor.yaml
- add Jonas' RB

Changes in V2:
- adapt to approach (incl. error behavior) by Jonas Rebmann [2]
- address comments by Lee which still apply

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

