Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079E531618C;
	Tue, 13 Oct 2026 03:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862457; cv=none; b=DuI/BjDcm2n/FLd5GeCNa+PLGhhyyebhPhYeHcvXB0cg5RQmD7NtRHiu1wGQY5uoVWEJOUI9LTUVgnqMIljT2r7hutwsep8duFVUGEwA2UT5NL5TL3wwaisLZNyLiLfiCJJR8jClxYcjSpLlPd2OMag5a/yIlTaWZODJeqhapIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862457; c=relaxed/simple;
	bh=C3f/PU3q3e17UxXNeOIaXS+wMmxjkbvo+XRbZ6ndYcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tazNWRQLU1oJrL2zZ9FR3QmZgy/hss5BOR4x88xyg+voNwj7q9CpKMknaudVS2O1gh2IBlL1GuQPs9mfCBtT0BlXAf2jWh4UYGAagh4Ztt/eun3Rl5D8CAtyvipO8OmHd2SzLc8OWp2nWMQ0uEI6n3QzszOWsECfrXAnUhJSGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=o1HaVCT1; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="o1HaVCT1"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j3g1H2gKmzMljm;
	Tue, 13 Oct 2026 05:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791862451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JByn10oJi/4Szu73S8win3SzOhC2s6rQ+eLKXsUO9U=;
	b=o1HaVCT1/zFBziJRhMax8t24M2AH3JD+BrNDj/cCWNI+y0JyW6Yt7R9A1tbejp6+rwQ0cK
	L9nB77ZzsyLKYaKo16rR75wdXcLLPHQ/gPRccyX5k11K5wWRe1vgEZ0WT9/LiPdPPt+9LD
	I6Wb8pnLBBYBIroidJAQIBK3qpACUM+RDAbs9P420V5mtYzhZUtEn3yXat5d0kVt/9A1o7
	xadhVLszbVADm3jWxnONqgPas8IGDJ3Q+eUJse7KqMEu3MbGr8em+fLansPjdVvm5NuvKO
	wefAGX/AFeOnEf1VwAzwlY/g2j+hGhQIovn6B0n8XZZfmKNueVuG2okYy6l9Cg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Tue, 13 Oct 2026 00:33:15 -0300
Subject: [PATCH 2/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-add-is31fl3206-support-v1-2-08c066cc241d@amieiro.net>
References: <20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net>
In-Reply-To: <20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Flavio Amieiro <flavio@amieiro.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=C3f/PU3q3e17UxXNeOIaXS+wMmxjkbvo+XRbZ6ndYcQ=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFlnl02Z17Q11aO79sSM5KenClss3KcWmO1XuPQ+X/XJx
 4CwB60VHaUsDGJcDLJiiiwsZSxl3u0Hm3dPWy0JM4eVCWQIAxenAEzkkiUjwxyr0k5jz0tzprir
 LGPvS/pk9VHySrLOd8++Zcx8neHi/xj+cKc0S3v+btgf9luL97rSKz1ZbuFrAdqvr+bbq8nkbfn
 FBQA=
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4j3g1H2gKmzMljm

This is a 12 channel variant of the is31fl32xx led driver series.

Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
index 7082ed186dd9..06f85a1c6aaf 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -11,6 +11,7 @@ Required properties:
 	issi,is31fl3218
 	issi,is31fl3216
 	issi,is31fl3293
+	issi,is31fl3206
 	si-en,sn3218
 	si-en,sn3216
 - reg: I2C slave address

-- 
2.53.0

