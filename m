Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207405;
	b=d0N/bluZXXwCFA6zz42IsouRe7MO5KAQ+5AuEYUk/xuvagUEKpRN/u3pOZY1PyX/pLO0
	 i9IavE4Ibp9RTGOhPR7qDHQGcHTObzcShCTWvZxrNN6FlGvSECe99aT4iv2s0ZuUGQlJ1
	 5/jFBTSN4k5ZCUFrQIFvknH3HXy20DqMnH4WVXyKoBPDjjLeAra+UfCDEcPYiI615PLdz
	 2IpsieHYiAjZDelBDeGvuGv75ZXpVkNYbnj+xBZEVf2AH9SsbjR6JyYWsv/JG0LcurVR6
	 Y/udFTKtvF79YXi98KeHzPLVJz1Pa7OaTAfLCOt9e18od5oVQ8xqemjfFIq6z6MpbaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207405;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Z/mcf2r6XtRS1Nt1hhXr+dDwqoKD/q46mEbDffj//MI=;
	b=wLqtfZ0vH2T9eEmLBjc9Rja7s3bwCE/LMhJIMGrpXuQNDpn6fxNOgsCXMYVQsw8nenha
	 n8NYTqzXwnIgKoa039k0gXtVbozwoB9Mlw/XaoLpX2DGBjClNLil8cz02I+XeZByWbzxu
	 nuo8VlG9gvrBVu4SY6tpWtnNKoF+zYfXJfWADcax564ruwQPArT8DmCSDVEmGPIXf9YRq
	 J79ifZo1xhXKVZ5d5VO6+kqwwaXQiRoq1dxq82FsnhJ1jgptPcfHwYugmv+7glHk3uB1C
	 Yki4FbUdlBTLMujFhrsGhZYzpkdp+b6FGwtuiFAKWmV0RARHVfXqvfNlJK6W6W9d1Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="d/LFwEau";
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E421E606A69E
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 20:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E421E606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=d/LFwEau
DKIM2-Signature:  i=1; m=1; t=1795207394;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:TKWLU7rnybIzoX5Y+ajtIhIAaYfp
   Z3ejbVBnUo5VLR/+DAGE3r99f3fXlUJ9LzleMfgWgta2yB7ESE+aDq6zUNEGs0koerLhW29WR9c
   seMyFYv7zcJSxoVDX8WrLbWzOlRafA2MYahZBHbp4IpXNSSLdQ9d9aKNyNI8YWEaXXw4yLD0qud
   rqx3ZUqetkW2DjCLtNp6h8QqQXM2qeXg3H0KW1vxUowFwK05XJ+H0vnid1+NKzvItJSEySBsXsc
   aOq8A0bYaKHwyhYbRr1ui5WE6SbA3RKRiPkTeuMehXqEw5Vt5xzufX/MQB6b3iWNl/EwAPGaYVH
   Qfo0MYQe5AD5Eg==;
Message-Instance:  m=1;
 h=sha256:
   3q3nt5BXdlp029SWkoqOr1q4QRmPNcUEwM6pf10iW4Y=:
   7xtlHaqCFFLs5VNGLcvH3C8+T30gsEmEMGuiSLwL43A=,
  sha512:
   xKJkxNmN9nE0oB0PdsUL1OG64Q0joyIGcqwRgeuXRFLCNjcXkP5W6TizW56zq6VmNQQHznhuOpXUN+dR7Qe1jA==:
   3iM7g1hbb3wjA6M6fwJ1WLbibTijqBzwN2ddWi0JSqN4oGW43a+R7hbppWUFL/i6D4kZ4qBM/xUjAlbHZehSBA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795207386; x=1795812186; i=w_armin@gmx.de;
	bh=Z/mcf2r6XtRS1Nt1hhXr+dDwqoKD/q46mEbDffj//MI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=d/LFwEaucBpLCqeBj6Z/hEVFU7jQOxlm+SyenFJu6Ip/uR5rPTP3MHZWabVEVilA
	 SMDxkX3k1+LmeOiii768jMw6ehSj5WkBs/UZP3Z2999p/ElsWqOA/V2XpL0PdlAVq
	 TaUBpSB2Fo6viJUWUPNjFN10kE/+YLmKUKCTN8Vkirh79HgCfIuYfDsMMGbbL9NXb
	 ghmQDOLDgPi2Xt4bc8owypBF4JT+W6yBkb3/a7ucZbmopvevSvBURd4/QqLODp/kS
	 Zj3l1gRPsfXtoJ6y8Pwhh+0MaJWq629D6RDGRWbICc47HgFSCWAGCWiOc6cs9Dz2f
	 OksdMiAd3O/lO7D7Iw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMGRA-1xnpW80LSg-00OrYZ; Fri, 20
 Nov 2026 21:43:06 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v2 07/10] leds: class: Use correct type for brightness_hw_changed field
Date: Fri, 20 Nov 2026 21:35:19 +0100
Message-ID: <20261120204246.6645-8-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120204246.6645-1-W_Armin@gmx.de>
References: <20261120204246.6645-1-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:/LMlREN/Gyx/4aM3eQOOzG9aDUzkugb5TyCbX8Vd5ak7UNG9HgL
 DXPcHwUY7Vj2pBgNwedAri1suo6iPPEyxEPKN9leJHc6woP9e4V6hWvi4B3h/atdZAbUCQO
 pIdf6bCAp3SOUVVD+SfUCitzZXuaTbdarjDztKzUsJwkseKotxD1Efg5+XZqUO83Qk6tIkc
 TbfMY9ghBRbJTUJn8OqQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zVfRq1C6NDE=;u1+iz5ByH5f/BMlJXj4i0VNzcq1
 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
 O4q/yq

Device drivers can supply a unsigned integer using
led_classdev_notify_brightness_hw_changed(), but the associated
field can only store signed integers, leading to issues for very
large brightness values.

Fix this by using the correct type for the brightness_hw_changed
field.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 include/linux/leds.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/leds.h b/include/linux/leds.h
index beaf23993063..a2b5373460e2 100644
=2D-- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -236,7 +236,7 @@ struct led_classdev {
 #endif
=20
 #ifdef CONFIG_LEDS_BRIGHTNESS_HW_CHANGED
-	int			 brightness_hw_changed;
+	unsigned int		brightness_hw_changed;
 	struct kernfs_node	*brightness_hw_changed_kn;
 #endif
=20
=2D-=20
2.56.1

