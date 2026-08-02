Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5145369985;
	Sun,  2 Aug 2026 11:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785671873; cv=none; b=cA3AzbXC5T8JluUpjxq7sZaPGjg6oYdfGArEoRzKEJYLTegTu8uLb+uagA8SfWZiTX8WMG+1ZHAaftzuu96/YpaQpqSYcFuJiewi0XwJ7alzf9HbgpiHcKoJ1mJsWOaBjKQUH07qOrmzDVx+Hi1/tKsMUD0P1jS+Oyf+ezetfRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785671873; c=relaxed/simple;
	bh=exqhOx3s2FIQ5wA+6f4MDLhB3636/a7i4xUv8s9dpqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a7mOcHoySO68nyAJ2uDswORErDI93J51kOgbWKjkhWDCuHFiiVjJGD4A7nnrEXVOPvH0Ko2kvPZgBKZIy6BaZUjem6uoR3U/E8NwHR7bgbF5w+n628zceOd19tcQTcKiaHn9M7/p/WTiYlP66gAOcjpq0EdWlNI20n/tqMeB4KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=KXTGD5qK; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="KXTGD5qK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1785671867; x=1786276667; i=wahrenst@gmx.net;
	bh=8Z7Tq/tlS+wWR/v694/khMhMekhIx2Otq2KgNYHWFqE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KXTGD5qKPQFprwjp+U5l6S2tlMgnWEOVtfAcxpuGhUAG22A1MVa+DBrFiSNVUxy9
	 sWAffWcqWfNIL7wb3qYEYCB9VLf5beRZI+mmaJIvkfJfbpMVwJD07ceVJZhH0TTg1
	 +e9R6Rv+DuIaLy8USwNj/tSxBIw0uuBZkCK0yx1LbzT7A0CpXdWIsT9+ejRJ11NyP
	 n5eXcD2hqU00hPFsozh0yF1FPYjqLbe6Gnj5+H5SsxaCtAp4jC5zK4R8fsW8vb7Uz
	 2q0j3SNE1XXs5C70CNudwaOZHCeGzsANaS00nYmZ/SS/QsM+JCpn4EUWL/FtWvhGM
	 Dt9zAOPnSUJjSHxywA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKUv-1wUrEi1KT1-00STH2; Sun, 02
 Aug 2026 13:57:47 +0200
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
Subject: [PATCH V2 0/2] leds: rgb: leds-group-multicolor: Implement default-intensity
Date: Sun,  2 Aug 2026 13:57:25 +0200
Message-ID: <20260802115727.50411-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YilLDg+TxMovhwqSzCv9nXhbaSa1y9TLXJ7JVtmJxrrjieJeCHB
 LFI2CZUTQpOUd+C1DohPQi9CTclCRAWwi/bSaCJx4qLH1ucjIrwRJy8iWJ1WBPAZtoHMKYu
 xwKvjFrcDakybD2vjKz8EyDE2iFyFsPygnR3JlZ6SLaAgY1snSlQV8hNH6sNKhq5hcazwaW
 GeWAS/rWdoEwk24ULvDmw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5Hljuno94Vw=;UsjtIse+ayO4ibHfa43YzHIHnaQ
 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

Currently it's not possible to specify the initial color of a LED
multicolor group during boot. This series is the replacement
for the recent series "leds: rgb: leds-group-multicolor: Introduce
default-intensity" [1].

Changes in V2:
- adapt to approach (incl. error behavior) by Jonas Rebmann [2]
- address comments by Lee which still apply


[1] - https://lore.kernel.org/linux-leds/20260708224652.106632-1-wahrenst@=
gmx.net/
[2] - https://lore.kernel.org/linux-leds/20260605-multicolor-default-v2-0-=
ed07271df6b0@pengutronix.de/

Stefan Wahren (2):
  dt-bindings: leds-group-multicolor: Enable default-intensity
  leds: rgb: leds-group-multicolor: Implement default-intensity

 .../bindings/leds/leds-group-multicolor.yaml           |  2 ++
 drivers/leds/rgb/leds-group-multicolor.c               | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

=2D-=20
2.43.0

