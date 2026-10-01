Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7423BD02
	for <linux-leds@vger.kernel.org>; Thu,  1 Oct 2026 04:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790829877; cv=none; b=D+WNOqrb4SCN8RbiTXIPho3M22EHvkcsWxOWbHh5TcKf6yk7w55DT45qnk6DqLWF5+IAzZgsAYjQa88LbV8OjsEesYlWgyLaP7OkezDQyPjVYkjO/KF76SYqnqGE9i3GI3ET2St5+LwsPGbu8+MZO5B1iKsN0J8F+tT+/elibW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790829877; c=relaxed/simple;
	bh=/awFAOB9EowjTVZhOL3/F5xhbbP+2JuEo6KyhLYLxeE=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=XIo0i/rUkxtD2U8oxUJLO3Z3dOfjlzOBrERjGzIgc6kHpur22jAQf5wZXrU5OedWrPQbigXc91DrITAVuyfiR9ioURidxiyRMJnzGOKbsrbFfEfvinORyswBaRtaKtPr6tZBBtcW71BqKHIJKt1E+72OENt0ufjj8QCHrb77vXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMlREYmJ; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMlREYmJ"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e630052ebso6962646eec.0
        for <linux-leds@vger.kernel.org>; Wed, 30 Sep 2026 21:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790829875; x=1791434675; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGJ1ZqJ491OEn6KQwWNnkqv0mbXNXbfih09z/V4lzK8=;
        b=rMlREYmJERFK+YM347WGWO8EUU1DdfaFNSeinTOJs1r2uxn1hWKjioaaAeQQ2FpIHa
         EwGoIxjjzRQCRWf1EYq5T6UICAvXQCskBOEIljHm6RfKFuiOn3iwPaJXmruyUV+Q/kGW
         hmX9esEhj9fW+WQH1V33Sa5Y3x/PMjlWDbVboIAjlNA/YKq9EIodRu6+XOEYHydrYbtc
         3DqRCuvdymfxK06hGIFfT1+kZiWxWPqVRAWFEZNxDuhVVIZR89tFXDTJNeePB7wqscut
         bbMPHoXoAourpnkFt5sOlk8ZOfh8OHD5Yz3JXwFdfcQ01ucXgvsG7LiPkFgK8Ssuq9D4
         GlUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790829875; x=1791434675;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aGJ1ZqJ491OEn6KQwWNnkqv0mbXNXbfih09z/V4lzK8=;
        b=no7ZNeTzS73oKzW0vssA2EMiLrGSJ9qw+QNIlVEC1Ln0VYpp9KieR+pzEpqhySMEgN
         cy4i+kUpjN44adnrYAqLVkRYHCoLuSrIpUtdyYbMTEMYGpELHA1cBeiJsy/n9/QWbQ/r
         S4lQd/FkJiZ4YGP6JuDNlVVgM2981ArzlOPbUWGCox0BeqFpFXyrFZihtHGOVFI5W5UI
         fk19vOXXgIk6E+USL/WzUmOk83pEHo3+XkfSIPEbi0d9+qlEI2A1vmnDmViS5AV3dwKI
         5CvBJ97s0FXgTDUdij5+yHb//eLrxWR4yy5/Yts3r9GrvDG1/DRcYfmfZlTbtveVPZcF
         EWEg==
X-Forwarded-Encrypted: i=1; AKwUvBx+QjPtZV2fJSF8dl4EoRFv4cBPykwZTeUF1dZ1g7YWtQI1xQDMW87WayvYJE6hPPBcQLCoAQ5Yn1mQ@vger.kernel.org
X-Gm-Message-State: AFuF++k1fadtAjY4HSkJlTtRQS7N2wsgLGln73ejzPmOHZgDfgatTr3M
	qvT7lmcPQwWfzB6oyYc1YGBaLb2n0bWadCPjQfO47xRwsn8+yoWR872QpcsumQN2
X-Gm-Gg: AYBFou1+DcRC8PmHUVEUEXpCw2wK48HJqQocqKsnJyv7/UB6eiWLYOqPtU5U7u/aHHv
	+uGhjHoJJ3tifRUBU7VmoGEZYp38wYXxnVe6xERZxQVpZLJbpfFbGamhEeq/ZEykvs2YcVGZOIJ
	nw+yAHfqSejjI6RPzzkBIi+GFp29mVmu47CgOYHYGIrjzQbqYOnC9IrzJp18emN9VKi6qyorgNU
	TOxWHUoF48AqZcUmFMNxo085pU6lxNPx4Hy3YkHInpPjvdHTNJ1OYNNxiX38WMsWRYmPAdBotN7
	JQ3lsH4M4PJW83AqRCzMrlTANkqrYpO2WITG5Fd00l8g3mhz2P7HrPoaKUepU/bIQQRlNh5SJmu
	9EAi02VUkTqA6FZNpQlmjjwuFR473aUIN5WlDM1S84RLSsUTQKOYNux45G5mkjvpf5XWnwDHbcS
	qQW0Gk+Q63G2mxn1XmpbykC71hOIb+K/a/xo6OKwljowic6SVEh8y/DekCgj3+qasYa/c+8eEQa
	SbOEGi4ejs1haBivXgczJuhIiIjN6I/WdqStSC7yOeMTwrEyvXLOVcBKaUpXUX5Xic=
X-Received: by 2002:a05:7300:e9cd:10b0:33c:1fc9:3c17 with SMTP id 5a478bee46e88-34cdcbb2b62mr4371354eec.36.1790829875426;
        Wed, 30 Sep 2026 21:44:35 -0700 (PDT)
Received: from manush ([2406:7400:94:d560:7d67:fe9b:8596:b8ba])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34db3e331a8sm3307508eec.17.2026.09.30.21.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 21:44:35 -0700 (PDT)
Message-ID: <6abde533.1f5d5c08.1fd03.f4e7@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: lee@kernel.org, pavel@kernel.org
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Date: 1 Oct 2026 10:14:34 +0530
Subject: [PATCH] leds: lp50xx: use scoped loop to fix fwnode reference leak
 in lp50xx_probe_dt()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In lp50xx_probe_dt(), fwnode_for_each_child_node(child, led_node)=
 iterates=0D=0Aover each sub-LED child node. If fwnode_property_r=
ead_u32() for "reg" fails=0D=0Aor if multi_index >=3D LP50XX_LEDS=
_PER_MODULE, the function returns -EINVAL=0D=0Awithout dropping t=
he reference count of led_node, leaking the fwnode.=0D=0A=0D=0AUs=
e fwnode_for_each_child_node_scoped() to automatically release le=
d_node=0D=0Aon all exit paths, eliminating the refcount leak as w=
ell as the manual=0D=0Afwnode_handle_put(led_node) on the "color"=
 property failure path, and=0D=0Aremove the now unnecessary funct=
ion-scope led_node variable declaration.=0D=0A=0D=0AFixes: 193910=
c2c54e ("leds: lp50xx: Add the LP50XX family of the RGB LED drive=
r")=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555@gmail.co=
m>=0D=0A---=0D=0A drivers/leds/leds-lp50xx.c | 4 +---=0D=0A 1 fil=
e changed, 1 insertion(+), 3 deletions(-)=0D=0A=0D=0Adiff --git a=
/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c=0D=0Aind=
ex 20bfb315b..d542eedd4 100644=0D=0A--- a/drivers/leds/leds-lp50x=
x.c=0D=0A+++ b/drivers/leds/leds-lp50xx.c=0D=0A@@ -458,7 +458,6 @=
@ static int lp50xx_probe_leds(struct fwnode_handle *child, struc=
t lp50xx *priv,=0D=0A =0D=0A static int lp50xx_probe_dt(struct lp=
50xx *priv)=0D=0A {=0D=0A-	struct fwnode_handle *led_node =3D NUL=
L;=0D=0A 	struct led_init_data init_data =3D {};=0D=0A 	struct le=
d_classdev *led_cdev;=0D=0A 	struct mc_subled *mc_led_info;=0D=0A=
@@ -505,12 +504,11 @@ static int lp50xx_probe_dt(struct lp50xx *p=
riv)=0D=0A 		if (!mc_led_info)=0D=0A 			return -ENOMEM;=0D=0A =0D=0A=
-		fwnode_for_each_child_node(child, led_node) {=0D=0A+		fwnode_f=
or_each_child_node_scoped(child, led_node) {=0D=0A 			int multi_i=
ndex;=0D=0A 			ret =3D fwnode_property_read_u32(led_node, "color"=
,=0D=0A 						       &color_id);=0D=0A 			if (ret) {=0D=0A-				fw=
node_handle_put(led_node);=0D=0A 				dev_err(priv->dev, "Cannot r=
ead color\n");=0D=0A 				return ret;=0D=0A 			}=0D=0A-- =0D=0A2.4=
6.2.windows.1=0D=0A

