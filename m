Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D6D4E06E2;
	Tue, 13 Oct 2026 10:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885645; cv=none; b=QGtJsjznnC+JIj7mb55EIY+IhfVZVEr/jQz96pSZdT6pl8bVv5nLhkYKGaCtc0QMpO6ChM9L3BqP6yxtTYJE9c1Qqm15Xpy9L/PnUrhO2IgUoS3E1SXWH7k1VF1iX0+ftrC1iH2stNVOiKDyiabObv227dDzXuFJnSYvImcHjIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885645; c=relaxed/simple;
	bh=C3f/PU3q3e17UxXNeOIaXS+wMmxjkbvo+XRbZ6ndYcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Enf/sFo//ricft/bai0scxbxWbHHSitdbTsULn4girfZWLOmgeGrnHzFGKmvuq8fEINfl074acDjonMHjqp1Ec/gUqmifSwid8P+yWh6pxAMPAY/z4hnpLNXKZPUJpy1EAU0ztg+ReYcX6S4ErAP+1PAfHUHjzeL0WylphVdajo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=Cb/1V16o; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="Cb/1V16o"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j3qbC29t2z8v1s;
	Tue, 13 Oct 2026 12:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791885639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JByn10oJi/4Szu73S8win3SzOhC2s6rQ+eLKXsUO9U=;
	b=Cb/1V16oES6tfb65OMlqxaeW7IfF8SwHNXklr2KDbhhNWDMMSDVdGVP7BY9qYomsJOiMC1
	cfAdHu3UCnjgO08Lb0BfmOZHRYHXEuAIPxFXypQ7XPbYgygbmzPYYa8l5kKJ18SZZKyzwO
	cJB9B/+bK834jph9wqxYB/4S1+68tI+CyHF4Wu8YQJp7qGhVVOcwQvEr7qOhAHegZ5A66T
	6ei/3odXsvK4Fb8caFeFBzvmtzr0ExgdWBA0PhC4dJTr58v5ArzhfCl7VhZoCPbfpYS7NL
	nZD6vkzTo4S2pYKk7pRAQ0/VtHsfCmBgc48FsONAPpci3z9tKyjPjQMdH5pzZg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Tue, 13 Oct 2026 07:00:09 -0300
Subject: [PATCH v3 1/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-add-is31fl3206-support-v3-1-66a762a3c12f@amieiro.net>
References: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
In-Reply-To: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Flavio Amieiro <flavio@amieiro.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=C3f/PU3q3e17UxXNeOIaXS+wMmxjkbvo+XRbZ6ndYcQ=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFnnGPV47lekTA7rY5nva2mrzHP22XaGey23Zq2zOLz9+
 rTTftPedpSyMIhxMciKKbKwlLGUebcfbN49bbUkzBxWJpAhDFycAjARzXBGhvXmJeo8WXYbkmvm
 WWXKmi9tmbBktwDnnae3uY5N37rjSx8jw5YMxSUz1jzqP/f1xrHl3XlzC5+/zp8yQ6acSXSWxsY
 AERYA
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4j3qbC29t2z8v1s

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

