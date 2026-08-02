Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5B6380FD7;
	Sun,  2 Aug 2026 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785671873; cv=none; b=ryDVeaY11xpV7JXgOme+hgtzmmn6ZwYNuzf49VsoYZfI836a2CMSCtoNvV3GDtcYf1wyUN3LYS6UB76PTS3vTsysQbjhO/DKXcE0AhDObaR2Mr9BZw625RINotNqK69xLM9vWaDclHSBo5K9z4nwPanNt44egGitJ2SUSN9R/JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785671873; c=relaxed/simple;
	bh=WEdkygF0uWZMca8VE0v3vjk5YK/q6MKeKY4Jjw3QrtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DARJFrzP5MkueiHFEiWRT3ZhdU+SvVpBD+3kaeFKzUaH5NhcnB1ZAjy1j9x5d01OsWuob69P9mjWpHrrafsWz8K9nBmyrFZMxF5SEcP3PjziYpbCiHCQq706804ob+WcByRLeo6LmI54gm4Jby3SYL7F3y0YeCY5X4UP272NhhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=hoyBLBRO; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="hoyBLBRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1785671869; x=1786276669; i=wahrenst@gmx.net;
	bh=w/7p9RBrZnNA/ox4XRzQ5WfJp6ctONuitbqldJtCQlY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hoyBLBROXjcNDVPwBJ9zt3v5pS8tqvH4hi9AvEMYOuZBIYDUgU8Vej0Q/vw6whgA
	 Z/IPmZulH1mhGeeG8fgN3MKr5TWsm1JXP4fTYqiNuY0SvCaGDoY8NXcOd3m0Tv6Po
	 svmLs1a5kyEbVPb07k+gMmFKSLcpFnnwLaDJcuV9M1jf6pg+IDutgIYqpC80FQNNE
	 KF/HQe3zHhKnuM+ax/xcBfZFMnO4CnTFkIP66pHnH0MS4iYgVttm3QAd/wCb1cS1D
	 7veVE5JHR0jD7zQcrsIhfx1i13nZY431+APQFTbxmKAlukjLkWBbnl1+k5W0uNW0x
	 XgpCvTOsVONpDyuldg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M59GA-1wpOtV0ONI-00CJ4R; Sun, 02
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
Subject: [PATCH V2 1/2] dt-bindings: leds-group-multicolor: Enable default-intensity
Date: Sun,  2 Aug 2026 13:57:26 +0200
Message-ID: <20260802115727.50411-2-wahrenst@gmx.net>
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
X-Provags-ID: V03:K1:4tO0vgFpsiAauNccPmG5s7wlzYMFRB0K0Ygf9w7cy/ufZgdh1vy
 MevfXbLS4FXvEL/w/zZLsXLJObbJMXwYHTvhgXWq5szmGYY2OaLNuLegQBYRSji5GxYOhS4
 411JUiDHNnz7hNz0z3Srgrz1lHJO007uc88mCO4LjlFGuzwbN61ao+kR85T2rl9yVtb0nah
 XekfUzH5LBZ6r2EbUI2uA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SzXTQBksY1A=;y+tSwikK+2eLpHxxxTFGce9LtR5
 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

Since commit 2ebd1cb772b0 ("dt-bindings: leds: Add default-intensity
property") there is a property to specify the default color on
multicolor LEDs.

This is also helpful for leds-group-multicolor, so enable it.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 .../devicetree/bindings/leds/leds-group-multicolor.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-group-multicolor.=
yaml b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
index 5c9cfa39396b..1f308cdb71c8 100644
=2D-- a/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-group-multicolor.yaml
@@ -19,6 +19,8 @@ properties:
=20
   leds: true
=20
+  default-intensity: true
+
 required:
   - leds
=20
=2D-=20
2.43.0

