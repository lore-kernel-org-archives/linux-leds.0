Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794697169;
	b=XmO6+Mgqa7tW2l9ZHN/0a1DACvvW9oaAIvrSsexJinGqWg+i5vU6XZuM3mOU1WfHMurR
	 KVFvdCHlx9DWNYIUyA5DMaGkTVAT3kqkgXiGLzB9iqXzOUbe6xaF/bhYWUIDlkIiYeYJj
	 VbN0HoZbBYUgJxgjp3GpmFKOTxgnyDgCeL88X8a8Yf1NvxBKjQmog6mhE547o8B+GpSmm
	 cQ3FW+OJlhNE+2fPHCpIWuOJzv1rPEUOSPrexIalXL8WVel/qe13XLCGmzJ9HDfE0EhOk
	 c7dg3C32MW0+YdzOvVs4a3YrwxQfehbJoEEDA3M7V4PckNBnivEykvm8cooShoTdNuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794697169;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sAdPaRnex6UBZEvOuuz2nG5KqpJYwgzPqQDq3cYh4vo=;
	b=RAJ+lr1uY7NNw4LISLSi4fev3ny/muaxg6neO3LS7Iogquq1nvJXGEozxQ4xhyCVD6RG
	 fVkpPZaNbBa2xrYHLUTNf7z+PRNpNT9sGWNwLUlXEwOm0rh+5NOqhKtJu6lvVavOyYn42
	 BF9rS0gw7s+5Evxv3pyw+qh1ZeZlgNY+Kr0vpBQWrIag07sHAbQEN6wNyh82afTKozlhz
	 NqkU7vXpZ84BRnCD6/3Tw0UwwX342fFP3GRNclCvlCaOodNursUrPGFQxwdaljY2jJfV4
	 HJWtZEIvb8t94Pmdnps5MaFQuvX9MUSoS0TUizRZV+5WOkKojPZs5oHsbFs9hMf5nUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V+ceulTu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8A606A32E
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 22:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V+ceulTu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890881F000C4;
	Sat, 14 Nov 2026 22:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794697168;
	bh=sAdPaRnex6UBZEvOuuz2nG5KqpJYwgzPqQDq3cYh4vo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V+ceulTuNNHTTPUwm/qPZ4id/2HX9f7quS83VKLygFGw+AbVcstmEOtsnFvc6DPxZ
	 MIaGEnvCgfs/g6vbhct5dnPdKZpwj1yZ79OnEWI7OO6CrPBp6lmNUrMkXDNJmxQuUC
	 W3CezEdU09dS6XXlbjXP9hoeOQ18xSli/roPQNj1VXNIhEuhDXuIeRGstXkOAfJO1+
	 5pumHn7QrzdrbU6rM0nxXNAucZn2PcqB7OMcwFqnrDHsZqzrB43WcHFvnfLZ7bT29d
	 oh0BGzQ+9t5mbppkAghI8CuOPtuSuZwZLpQKOifh/aEpUZFUviIYAjOpGuXrLeyGE+
	 ASh2eTYfCx4/A==
Message-ID: <sashiko-outbox-215078@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/4] leds: aw2013: Use dev_err_probe
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Sajna" <sajattack@postmarketos.org>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261114-aw2013-aw20xx-rename-v7-2-ea5a3113a479@postmarketos.org>
References: <20261114-aw2013-aw20xx-rename-v7-0-ea5a3113a479@postmarketos.org>
 <20261114-aw2013-aw20xx-rename-v7-2-ea5a3113a479@postmarketos.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 14 Nov 2026 22:59:28 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Failure to use dev_err_probe() for regulator requests violates
> LED subsystem guidelines. (At least according to sashiko [1])
>=20
> The original driver didn't use it, but it's worth cleaning up
> while I'm here.
>=20
> [1]: https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts=
/kernel/subsystem/leds.md?plain=3D1#L71
>=20
> Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
>=20
> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114-aw2013-aw2=
0xx-rename-v7-0-ea5a3113a479@postmarketos.org?part=3D2

