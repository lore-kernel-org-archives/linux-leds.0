Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697127;
	b=vhtJvvDxOhPw1Py7lCONYoWBjknN3zOZlV/3QnjfdL0CNTZJ5uTfzRccgy1ijQOehsEH
	 1eUYir0o0MW+zUZSch8MteTn5PrSU/EGvGHhs8weaMDUNL7PkRtpjsrDFhmHwH4l1GtL0
	 iWxfLa/550wLUZcKC0Og34dx21JnV6GXxhKqrUI29p7WDFujU6zWs4dlGgyrHAnMMV0EU
	 PSkRKPPOwNHH9bMY7Nt8z5Bu7IMLNigYRM9xXiwm4ZcBcfqVse2Z9TRoVOmMrpoKSHf96
	 /HUp9GJtY4tgEmG6PVUWzKK7ZfWQFE4eUbjmFCrj8eAN1FyzDbaLdBBiMVkpckXQRug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697127;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZPJ/dlEOE7BzLG7VXgEB7Ch9G0riQGdXMpK0TY/LiU8=;
	b=vqjioj4sT2TMd//NM/lMY7k0D9wLSHx0ohzXQuR2fXog8lcCCHiyA6UOS2Q2qaHAgP//
	 yMlMaBMYbr2ITJ3mZ6SS2wcdqIUz/DQO+/7CElRu60GPzN956Afgt4wGBMjSenqzFRvbq
	 j4j2HSB3iX75IXI/Q2i2WgE55IkXuHriT0IF1UrOK4K/XkONpEK7yISMcuI/hFaTTk8SQ
	 7SUUePp9bnoikPVTv/nE0CTc3aq1Mcpsbgn1hBB1ddtnb05ihej/LbNs/VbyWRdGEe5JV
	 UUDOKmjJRrC3Hc9lNG0385aeOhINZymLuFQ3WlhTQD4AhG0GjMpbHxFc84USscYst2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBgizWu9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7F1606A323
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 22:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBgizWu9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6C41F000C4;
	Sat, 14 Nov 2026 22:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794697127;
	bh=ZPJ/dlEOE7BzLG7VXgEB7Ch9G0riQGdXMpK0TY/LiU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QBgizWu9U6TU0Zj5Vm/rcjA7Uknqsfbnd8H5Mg9to5NK/tRGC3/BrKCu5nUORrdfT
	 5yPj6Rn0954ZF+jhOq/kvY5zYO8SjelphFMrXnAVI/VV51+UPwM4PqpbvzqolnT63R
	 op5DZ/QbuZDX/ulyTJIPGKsMQKvugk16eT1mQ5zDL4TU7YVpo2J0TetsnEQa+ZK0jl
	 6EzYZIPPn6hSXPVeaKLbuAvyynhDsXE7UnLb6ndT7mFleYqxGW8/gcNmf9by2O2K+G
	 0ZISca2E8ikoqimTtnHsMHPM9jQVUbWp9T8iVfe/FaAFFJjLP6BkYNnJ2Q+IySDpN6
	 wxgxoIPYTbVGg==
Message-ID: <sashiko-outbox-215077@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/4] dt-bindings: leds: aw2013: Add awinic,aw2027
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-1-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
 <20261114-aw2013-aw20xx-rename-v7-1-ea5a3113a479@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 22:58:46 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The aw2027 is largely the same as the aw2013, with the
> exception of the way the max current is written to registers.
> This exception makes it different enough to not work without
> driver modifications, but similar enough to fall under the
> umbrella of the same driver.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-aw2013-aw2=
0xx-rename-v7-0-ea5a3113a479@postmarketos.org?part=3D1

