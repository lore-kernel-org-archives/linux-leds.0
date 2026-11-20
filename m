Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795209904;
	b=eLFYuAbXIppNCcV2KiWu23GV40e2H6GabAVjeHkxoIbbamshLpIdPJ0HMT5BSHU7UzQL
	 GczbtwDAPIDRPEzFM15k5dMnNuzqEraxFU0OJfjavfC4kepKX5Y+3t+Q3OvT26Gm4CgYc
	 fvGGzp8L6Qa4wKRhC2Eavc8pDtNfpe4owaRtmbIR2FtxHRmUwnvhQdMT3rvPrzORWpB/k
	 hA7OAl+H7WFDVeLkW5x/b/gXUwrkipvk1yjQcd/AkK2PfkR2GgzD+giZteSM1+KEytJG+
	 Gduv+qA+eYv19B3V7ihYOH2PdFV5gMvTJmKyGY2p8SdMWf4dFXcZojss7PqUwgk9fsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795209904;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Z/mcf2r6XtRS1Nt1hhXr+dDwqoKD/q46mEbDffj//MI=;
	b=zhiqoX/3J1x+xAUTEqVQZkzpSzrQCUe2BNtzdq4ErAE91EWIdzVxouygqi8+rvvEO91p
	 rrXH/OEPbQubQP44YsLuNZZ0RT3VZp9mFQZCQwzK8EScyD9wM8c+NOaCmmGXuWGw/szov
	 izOowR/SYj0sqXRKHPvEP7fCpVs0f/gF9+y7jSWZ5JhwAGvFSzuhHEbE3Kuxa9BfHAwZ6
	 19//2pOxl4HvkKYXEtqyO2BG2vCqWckxHncvhCqpD5b5k6rSEPm8jK4VZjwxQ92Dh8goU
	 XlwEUtyhWx6pqOR83dr9mQuRnyPsvQi9cfWAY4eQDP1kZI7kgXsR4BpbgN5/6OhEizw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=FuN6H35n;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF3060A2614
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 21:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AF3060A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=FuN6H35n
DKIM2-Signature:  i=1; m=1; t=1795209895;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:fqpp42Z1gJplcWy96LcGZ0Ga0HiX
   iU/xoSj+dn0o7QFmp0DH90ygNgIymhGFASws5HfVqdUGmAAD/YD5maDJKqg1LPy+z0ejQ8oJvRw
   X3iM7oKw15YWlvsUHgC51t1Mbhsvqb9b651opNWWKU7uDIkE68ENFAbLhV889qWvkYd3G61rmxp
   NAM9mj8DBnjSso0d7d5ql/vTba2BANLyLIUOqUzvYpuBqr2qkc003mxG4y72DDGESLX9TZnmnxW
   aOOLBVENHjtmbgnr5TML4ALf1QsWY4SfIJ9PEb1aPibHWjfmmkTnIDJl0G2YBCXIoH6N742lcxh
   +s9mGm0Nq60fWg==;
Message-Instance:  m=1;
 h=sha256:
   apeWle/ILD0YkxY7WM2M9P/UX0KpBys0kGnjMDagYp0=:
   7xtlHaqCFFLs5VNGLcvH3C8+T30gsEmEMGuiSLwL43A=,
  sha512:
   NfmQCKctlFm83B2fL+yF7LIPd2ZE4n0rELiIPKS7bZFPeHbwLhB9S5cRubb2qIi8WQsiP9GSA+EHc66r9xzefQ==:
   3iM7g1hbb3wjA6M6fwJ1WLbibTijqBzwN2ddWi0JSqN4oGW43a+R7hbppWUFL/i6D4kZ4qBM/xUjAlbHZehSBA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795209890; x=1795814690; i=w_armin@gmx.de;
	bh=Z/mcf2r6XtRS1Nt1hhXr+dDwqoKD/q46mEbDffj//MI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FuN6H35nNTsmc/G33d5gwN8hmcdLTB/QPSNo5mgIuQHel4XFGISO74HMLxtIW+DC
	 tyck0RYLd57nD/kVoUWmdWKH7QYcztNRYFnMWol0UOZwhJAKp1eE4T6k0dNk66J0c
	 u8wJkVGDLbeKkIB6yKpD3hY30w8TTGTvoGvum7RbqUG/sm690WuEkQxLulaOYbOyM
	 rnveBphD6vUO5VaQ9fv1DMpiWqvvK4GZ7uKVbZW7DxPtSaCtxSonh8xIV3EZkKK5a
	 +NH0vvGPyK88CyehzEsaUwaZ1e0Abg5r9f5Y2ixvozWTHfRFBwzNmtRPh8kpBldaG
	 HrwIwGUUveiWSehKJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5fMY-1xbde72Vi6-008fCh; Fri, 20
 Nov 2026 22:24:49 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: lee@kernel.org,
	pavel@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	i@rong.moe
Subject: [PATCH v3 07/11] leds: class: Use correct type for brightness_hw_changed field
Date: Fri, 20 Nov 2026 22:22:24 +0100
Message-ID: <20261120212431.152081-8-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:Hrvci+Hjt6j+f7sxfoUuubOT/fzw/ARc8H3ob3ZkPaZnShccwQ2
 T0oChrLi/8jF6dDuSfdFPLxhIUWvD5Ms5lT70SzL5U0wX6XrxIXM0vHMUViHrG7vdcfm+L8
 bG6P1qbrkZWPwcpkNJ3KuKIrP4qyXjivi/U57nNNkVsuzc22cxQYONzD0nwjFtPw2SNhLOv
 VhNhebBb8FczrVC0y9PSA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QwoeVqEgz9Q=;hWXQR/HVJ5Qeos5mDnENgZUAXEj
 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
 F9061B3CiFHJzOZo1TuW1EeL9W8g==

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

