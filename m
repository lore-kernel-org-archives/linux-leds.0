Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733391;
	b=UnbQcuu9Wg5fEkcAtcpZggmm1pxy98L5KQBq2D/IBVGQe5TET9npI/gxjiaPGlqSxO0H
	 XOcBjGFVbhJy4G3zToo6+/vVhEjuhR+inX+8HhHa8d+5Vtea6tMbu3ZmC/KFSuTY+8hK3
	 QZDfiKXbfX21gRPK1MtizXeA7EoUgCf6uQrdprEXiwHKVYw0ieuPFN0GtzW+6bmBp/SYE
	 D2zs2Ivav83vLsJYsH2DLJcPCa2CiFcLMC18cS+tCiqZ30+h9AnPkpu2PlvyVtHz3FvW6
	 JrnpbGmErF+Dm6FLbwZ9SpO5AZF3WsesFKbOfCQztmWY18OEYYSWekTHRboQ+pHDlGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xyJq/jOKLtl184bmiQtmJ8rJpHBITnHFobbZIBTbajg=;
	b=GfFzBRk8iuWhmNIWm3oYYQbwSZ+HuqpeustDRCYtpA72KWJ8KPR5tUtPAt8gVi2Xaz1x
	 d04OHWmKzwPBLCRhUlmtBtlIy5OzcLlFswu4BYatr8XoMxJpvmnPAJLIIf/qXbj61rByj
	 XxjSonNsA46myzjMPEAyZA1Ul/YE+aNjreRsGB5D6P5HbExqXoeSz0Hd780t0g6O+jdzn
	 vu6VI3X6G6NezrTrZveE/qsA7b42DyZMpHm0dmcsiVeUTLr4FDumOujCgvp2XP32741JZ
	 T+YTpuS6Lnhw1PnLXs5n5zx7fF/rlTdCXQs8xwJ3nBdHvWAAfgUCoEZl0MALjXPpMNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G86S0wzi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C8B606A31A;
	Sun, 15 Nov 2026 09:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G86S0wzi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243721F000C4;
	Sun, 15 Nov 2026 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733391;
	bh=xyJq/jOKLtl184bmiQtmJ8rJpHBITnHFobbZIBTbajg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G86S0wziJVm9hwkLSiCM+3UgqSuLioBkavoDIgsbEfRtNncV98u7tktdvI0BtVYjg
	 K6LMZbJeGozW3CX8u3Nlh0DBh8Ll9Fn3LLkkzMcf/nC6aHxwdwrtDUW+lN+5YBiF3X
	 baETrIRqBphjHTETh4HhUwMgbNflfk1lFxSIgkNKKATebaG5OhRH1qJoiq7+UZdYY6
	 EDs0/KOI7qPZSbinGWgWJmpgdk3w9QGaABeu6nQAV69QdlKsxtcU/mBkN/EBzhtTmL
	 Uo20RqdEJnMPa7PkalCdnS0sb+1ekxnwN2zH5JqOP4O7n4ug/9Bt+2SMTzbZiuwfWS
	 iEc0j+7qZcc9Q==
Message-ID: <sashiko-outbox-215321@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] mfd: aat2870: Add support for VIN and IN-LDO
 power supplies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115085826.89641-5-clamor95@gmail.com>
References: <20261115085826.89641-1-clamor95@gmail.com>
 <20261115085826.89641-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:03:10 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The AAT2870 supports a dedicated main power supply input alongside parent
> power supply for its internal regulators.
>=20
> Add support for retrieving and managing these supply regulators
> (vin-supply and in-ldo-supply) using the regulator framework to ensure
> proper power supply dependencies and power-up sequencing.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115085826.8964=
1-1-clamor95@gmail.com?part=3D4

