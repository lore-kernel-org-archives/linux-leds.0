Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353934;
	b=zBOMiz1dvoJ09+FMCERj6HKj3oUPkYD5+/CoyP4KkHB6FFmdv2Vyoq9MDAkJlzsYzIUB
	 bLx7Z70VU0021QP1nRnWvKlDiGjYw8Cb9Fz66WW/sHgQwDztgyjiCu20KO9TaqgF9y9CJ
	 +Ab54+sN5cTwV+OuMlnccv56WCUaUXv9+Ox6ryTSpaTV7pd+GZ5yTxAsoM2mMw6eypLRU
	 FtOQhymmDv0BzaCmrckFILlidiknOxHkawNkKkAurstspJDUZ2njjZUSuiPYNl6e8WVMN
	 qoae6Dt5OOBS+bjj5sgom0qMAji3yyMt6rRi87jLWtshtdhfF/h7xQRik4dXL3UFAPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353934;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ai8uX+XPywB0jhkVshtJyzDRX2UP44xBBLtQcGOz24o=;
	b=zUxv1MxNJKFpRy5d53ZtiV28QzwUSx5NGvWDqqElRs5YnYILpxBx6yswqkt5m8XEkaKp
	 uHIHNPWwApZiMAewr8LcjYrvmryRM7jsPiZEP/fkMBSUVAsINbZbMvA/w3DDmKUwk8orX
	 xpMqm76/zpjl3Xavybz7SEqcU0fIbS6+hviNIjAx2ElwhlJlq4A56w3/vv22lPWdxbBy+
	 lvsGWxcCmryiXS9BKUzvt3uiao6+WRPRKI91Z6q/ateMW00YLD5pr05uahqgePKPLFhpN
	 YOfVbHzgnrecw/pSn6xWCG+Y0rCMsCqSvK+ABkWOG7CZNJI3ax6xTFIRnsEE/bcd1Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hGK+OKsd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E8606A320
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 13:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hGK+OKsd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A471F000C6;
	Sun, 22 Nov 2026 13:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795353933;
	bh=ai8uX+XPywB0jhkVshtJyzDRX2UP44xBBLtQcGOz24o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGK+OKsdhwddxbU200HB/CBBs7upvIVxboMd54JTLrW4qSZ2q76CAiioW6uhC40De
	 Bx+ZquTEmzKClnQlinXQ+WbTkmcSI1KHgQpYRIUKIoWT+KrUC3r1uHqXu5SMK9X9VD
	 XJU0KznFYIJrJqqlv0d0WE79vgwF+wwpk86o3fxV2HLih6x654CpxeieAL3sKrcKV/
	 U0go3D5M2nMgljo0xArcVgpZcnVHgczuiAixAKHpavsGpEbhsUgHyHz5czx0tIDZ+r
	 2X374ROUVIjE4adBcw9D4uTQqLbNGSJoyMfj3jfaJMbZE2syOg2OzCwGoZaW7wPeXH
	 r0a/7swZfIa4A==
Message-ID: <sashiko-outbox-227966@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 0/3] net: phy: dap8211r: add LED control
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Artem Shimko" <a.shimko.dev@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 13:25:32 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122131900.2951=
586-1-a.shimko.dev@gmail.com
