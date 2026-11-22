Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795333362;
	b=IffQBo1T1PHPfqyJZAAfSP/BsMa4V93z2AVxwvu2k1YNcOwEbkwMuesjr7J0OHEco7qu
	 3iSvZzqX3nRF0NQ4mfoaP47WHqMjxDxBLQKaZTCZ5vdseiwGUNhjyvudtQOaUbc/VXuR0
	 Rd56V4oMFmNPd/keyvx6I/0+mE5ep7YjtwyxSehMCkunwjnHqtRNetTT2C4T+4d6Bq6NE
	 Nin2t+kLbAiOll3Of6HygbzAjjzZAN17duduE8RIuVj0Q9aDzhJ5WSrmpaX4jE9MjlXNA
	 JS65pQFcZWhS9USh6sMmsh6R24e/G6XQI3Nx24i+BlNhXrCMJHhQiCWwHKfTlg62pnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795333362;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KPrqMcjL8dWd2PKI62Fjmg/2TJxHRqvl6km3B7Aohoo=;
	b=Ygs8lygfdLMDLHXPN1sMBFRckrcLNkv0ykHj4/mDoe9eJGoz8/8Aw+X2UkWuiBP9KBvJ
	 nzfDMtnRPQcyTVfAeWVXIRc6xlhAKV0Vr40MVanzvdhWGT9mdPht06hMpz7gKmx9R4WN1
	 K6zOD3KR7aEph9sWPVB4DSrKnn9JnSukkCrkdNJ1l9itZHYvFQnDW9kC7JqV1AmCMD2PQ
	 r293Ep8LpiGr3FET9Z+Q3veLXkmLV87AN8fjRMElS4bG5S3eZB8iClZRHalrv6PZEn/7U
	 x01hgc/14NTaYsevssJ05/wJ8cVkcl42cOnYLRZNCoRyKouVIBcUzfy53p8NHmfvBHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3kbDTk3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECF6606A320
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e3kbDTk3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A965F1F000CA;
	Sun, 22 Nov 2026 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795333361;
	bh=KPrqMcjL8dWd2PKI62Fjmg/2TJxHRqvl6km3B7Aohoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e3kbDTk3BT15BYClKHbFqLeqvPz87540Q9Ftyu3acOrpKiUUb0gsOnkN3s04++s9A
	 JDDqEX9n4HHAIljy+xTjTMlGORdUyZHc1HtSFipqbhuXNiOc+H8nR/bIyBJQhSv1u8
	 rdhFbESZQcbEL+T8rWyOZCI51mlke/21G7vnoAEKZnHOpyNUPeDGrTt0SO0FOP928s
	 /EKW46l08ZHC3FJrD/97Zqe44Wi72PzXsnx/Q5Na7RPardSd4QaF9E4x27amyks/Nh
	 RqCT3RPfPEm+kSNF1ISbSes48G8ISuA1RUbmNPzTNsFCjzY+kVmCTJKmKmdJ3w6osZ
	 WueEU+GHMNO1g==
Message-ID: <sashiko-outbox-227793@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] modernize and fix mc13xxx-led driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Kurz" <akurz@blala.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122073235.26707-1-akurz@blala.de>
References: <20261122073235.26707-1-akurz@blala.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 07:42:41 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 2-patch series:

- Patch 2: no issues found.
- Patch 1 ("leds: leds-mc13783: use unified device property API"): 2
  potential issues (1 Medium, 1 Low)

A detailed review has been sent as a separate reply to patch 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122073235.2670=
7-1-akurz@blala.de
