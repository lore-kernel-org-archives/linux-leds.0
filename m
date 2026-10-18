Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB954C754C;
	Sun, 18 Oct 2026 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792331652; cv=none; b=gMDSOWm94+G4TYKZkqNsX/udTRDv87bDUQGhr5GpIiufIz424694TJsMWmQrMu6pU8llKsehBNsbZjavMTCvMCz6WCgUqR9H9hpknCWTmNydewYr8K3BylKvj578d0/DojmvoM+u09VibBhuWaS2zrbjYlINBasjurkLfxYyIVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792331652; c=relaxed/simple;
	bh=f6opV0eHfxfaBzl0B2bzUaLCN4zX8I9P/lHJI87UWTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sY8QFuHKH8kR084sF3K8ADy43L8vr5+Vee1FBjLjTp8Ix/C3Uf8/tQNPEz8JerJE7XMeJDnd46foR+Dc7+x/qpOPaOz80oUFCIXvP+z3I4o4Mtup/eRZFztYQaDMVxh0WIKSHLuWzrCe11ie7ZtfhEZVBOqtV6xZ9Km1BN20g60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MuXyM/Hc; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MuXyM/Hc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1792331641; x=1792936441; i=w_armin@gmx.de;
	bh=LubjHhVyWM3Gw2RakXx1NlHXBv/jcTGmpenxgOy0L1Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MuXyM/Hc+E3rBP0Yv+I5SuheMW2M0mHNGFT6gSd4PN7OJ8hF9Xa4csJyxRrQfJZG
	 XjOvx595Jbxeoq/fWOsUMdUFLTdrEXBh/CnFPxLPRtfnqIcPG830GGXO1No6GRXdN
	 42falMBBCNTyjTg+Vsdf9UXxXt3dke6hRjk5drGIvTI0RFH2zuItaG5Z1UCsb+O5J
	 L+viz5RJt6QFKeBUe+pTTYkTgy3g9vIQEN5xBDt9GaKj1aAObulxxk8InwMrdoChb
	 6i5fVNYELkJswa2BT2+VbwD6gpKrEnbK1MqNy9hZ9pLAYCmZu7vk0GOC2SqOdxdBy
	 P7zbxh12nrm1XykE+Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MjS9C-1wug5r0zVq-00iy1m; Sun, 18
 Oct 2026 15:54:01 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] leds: multicolor: Adjust maximum subled intensity during initialization
Date: Sun, 18 Oct 2026 15:46:29 +0200
Message-ID: <20261018135339.1109271-11-W_Armin@gmx.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018135339.1109271-1-W_Armin@gmx.de>
References: <20261018135339.1109271-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:K+BF/SNYQWd52H/7J81dF/ICoNWlRk5TcfDdKylrH394DCuwNcJ
 xTIYTyL6bqW41w0CXpeObpQnnqghIiOS4xYgFo/PfbdXA3ErDyjuN67TIzyOvMbJwFUSCpA
 wgz7OrLW6TGQtr1IBJz3rutG4Aj2Deu+P7q+daRRP+UTftb5H6h7lQLv0NQWER8a4Qw3voq
 FYxvYRYecuFG3i6uUfSbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wUNTaL0nKuw=;EOtuwWqW9HVqT4XrEXyfwl2BJ1a
 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
 Pb8bV8C6mKM=

The maximum brightness of a LED device is fixed after having called
led_classdev_init(), so performing the adjustment during runtime is
no longer necessary.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/leds/led-class-multicolor.c | 40 ++++++++++++-----------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-=
multicolor.c
index 9b8c37f7bdf4..875c615c33fc 100644
=2D-- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -14,24 +14,6 @@
 #include <linux/uaccess.h>
 #include "leds.h"
=20
-static unsigned int led_mc_get_max_intensity(struct led_classdev_mc *mcle=
d_cdev, size_t index)
-{
-	unsigned int max_intensity;
-
-	/*
-	 * The maximum global brightness value might still be changed by
-	 * led_classdev_register_ext() using devicetree properties. This
-	 * prevents us from changing subled_info[X].max_intensity when
-	 * registering a multicolor LED class device, so we have to do
-	 * this during runtime.
-	 */
-	max_intensity =3D mcled_cdev->subled_info[index].max_intensity;
-	if (max_intensity)
-		return max_intensity;
-
-	return mcled_cdev->led_cdev.max_brightness;
-}
-
 int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
 				 enum led_brightness brightness)
 {
@@ -53,12 +35,10 @@ static ssize_t multi_max_intensity_show(struct device =
*dev,
 {
 	struct led_classdev *led_cdev =3D dev_get_drvdata(dev);
 	struct led_classdev_mc *mcled_cdev =3D lcdev_to_mccdev(led_cdev);
-	unsigned int max_intensity;
 	int len =3D 0;
=20
-	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
-		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
-		len +=3D sysfs_emit_at(buf, len, "%u", max_intensity);
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		len +=3D sysfs_emit_at(buf, len, "%u", mcled_cdev->subled_info[i].max_i=
ntensity);
 		if (i < mcled_cdev->num_colors - 1)
 			len +=3D sprintf(buf + len, " ");
 	}
@@ -98,8 +78,8 @@ static ssize_t multi_intensity_store(struct device *dev,
 		goto err_out;
 	}
=20
-	for (int i =3D 0; i < mcled_cdev->num_colors; i++) {
-		max_intensity =3D led_mc_get_max_intensity(mcled_cdev, i);
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++) {
+		max_intensity =3D mcled_cdev->subled_info[i].max_intensity;
 		mcled_cdev->subled_info[i].intensity =3D min(intensity_value[i], max_in=
tensity);
 	}
=20
@@ -187,6 +167,18 @@ int led_classdev_multicolor_register_ext(struct devic=
e *parent,
 	if (ret < 0)
 		return ret;
=20
+	/*
+	 * The maximum global brightness value might still be changed by
+	 * led_classdev_init() using devicetree properties. Because of this
+	 * we can only adjust subled_info[X].max_intensity after said function
+	 * was called.
+	 */
+	for (unsigned int i =3D 0; i < mcled_cdev->num_colors; i++)
+	{
+		if (!mcled_cdev->subled_info[i].max_intensity)
+			mcled_cdev->subled_info[i].max_intensity =3D led_cdev->max_brightness;
+	}
+
 	led_cdev->dev->type =3D &led_multicolor_device_type;
 	ret =3D led_classdev_add(led_cdev);
 	if (ret < 0)
=2D-=20
2.56.0

